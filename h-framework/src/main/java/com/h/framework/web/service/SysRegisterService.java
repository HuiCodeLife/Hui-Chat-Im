package com.h.framework.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;
import com.h.common.constant.CacheConstants;
import com.h.common.constant.Constants;
import com.h.common.constant.UserConstants;
import com.h.common.core.domain.entity.SysUser;
import com.h.common.core.domain.model.RegisterBody;
import com.h.common.core.redis.RedisCache;
import com.h.common.exception.user.CaptchaException;
import com.h.common.exception.user.CaptchaExpireException;
import com.h.common.utils.MessageUtils;
import com.h.common.utils.SecurityUtils;
import com.h.common.utils.StringUtils;
import com.h.framework.manager.AsyncManager;
import com.h.framework.manager.factory.AsyncFactory;
import com.h.system.service.ISysConfigService;
import com.h.system.service.ISysUserService;

/**
 * 注册校验方法
 *
 * @author ruoyi
 */
@Component
public class SysRegisterService
{
    @Autowired
    private ISysUserService userService;

    @Autowired
    private ISysConfigService configService;

    @Autowired
    private RedisCache redisCache;

    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    /**
     * 注册
     */
    public String register(RegisterBody registerBody)
    {
        String msg = "", username = registerBody.getUsername(), password = registerBody.getPassword(), email = registerBody.getEmail();
        SysUser sysUser = new SysUser();
        sysUser.setUserName(username);

        // 校验邮箱验证码
        validateCode(registerBody.getCode(),registerBody.getEmail());

        if (StringUtils.isEmpty(username))
        {
            msg = "用户名不能为空";
        }

        if (StringUtils.isEmpty(email))
        {
            msg = "邮箱不能为空";
        }
        else if (StringUtils.isEmpty(password))
        {
            msg = "用户密码不能为空";
        }
        else if (username.length() < UserConstants.USERNAME_MIN_LENGTH
                || username.length() > UserConstants.USERNAME_MAX_LENGTH)
        {
            msg = "账户长度必须在2到20个字符之间";
        }
        else if (password.length() < UserConstants.PASSWORD_MIN_LENGTH
                || password.length() > UserConstants.PASSWORD_MAX_LENGTH)
        {
            msg = "密码长度必须在5到20个字符之间";
        }
        else if (UserConstants.NOT_UNIQUE.equals(userService.checkUserNameUnique(sysUser)))
        {
            msg = "保存用户'" + username + "'失败，注册账号已存在";
        }
        else
        {
            sysUser.setNickName(username);
            sysUser.setPassword(SecurityUtils.encryptPassword(password));
            sysUser.setEmail(registerBody.getEmail());
            boolean regFlag = userService.registerUser(sysUser);
            if (!regFlag)
            {
                msg = "注册失败,请联系系统管理人员";
            }
            else
            {
                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.REGISTER, MessageUtils.message("user.register.success")));
            }
        }
        return msg;
    }

    /**
     * 获取邮箱验证码
     * @param code
     * @param email
     */
    private void validateCode( String code, String email) {
        String verifyKey = CacheConstants.REGISTER_CODE_KEY + StringUtils.nvl(email, "");
        String captcha = stringRedisTemplate.opsForValue().get(verifyKey);
        redisCache.deleteObject(verifyKey);
        if (captcha == null)
        {
            throw new CaptchaExpireException();
        }
        if (!code.equalsIgnoreCase(captcha))
        {
            throw new CaptchaException();
        }

    }

    /**
     * 校验验证码
     *
     * @param username 用户名
     * @param code 验证码
     * @param uuid 唯一标识
     * @return 结果
     */
    public void validateCaptcha(String username, String code, String uuid)
    {
        String verifyKey = CacheConstants.CAPTCHA_CODE_KEY + StringUtils.nvl(uuid, "");
        String captcha = redisCache.getCacheObject(verifyKey);
        redisCache.deleteObject(verifyKey);
        if (captcha == null)
        {
            throw new CaptchaExpireException();
        }
        if (!code.equalsIgnoreCase(captcha))
        {
            throw new CaptchaException();
        }
    }
}
