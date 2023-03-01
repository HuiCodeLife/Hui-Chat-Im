<template>
  <div class="login-container">
    <div class="login-main">
      <el-form
          :model="loginForm"
          :rules="rules"
          ref="ruleForm"
          label-width="100px"
      >
        <h3 class="loginTitle">欢迎登入🥝HuiChat通讯系统</h3>
        <el-form-item label="用户名:" prop="username">
          <el-input
              type="text"
              v-model="loginForm.username"
              auto-complete="off"
              placeholder="请输入用户名"
              style="width:80%"
          ></el-input>
        </el-form-item>
        <el-form-item label="密码:" prop="password">
          <el-input
              type="password"
              v-model="loginForm.password"
              auto-complete="off"
              placeholder="请输入密码"
              style="width:80%"
              @keyup.enter.native="login"
          ></el-input>
        </el-form-item>
        <Verify
            @success="capctchaCheckSuccess"
            :mode="'pop'"
            :captchaType="'blockPuzzle'"
            :imgSize="{ width: '330px', height: '155px' }"
            ref="verify"
        ></Verify>

        <div style="text-align: center">
          <el-button
              :loading="loading"
              type="primary"
              style="width: 30%"
              @keyup.enter.native="login"
              @click="login"
          >
            <span v-if="!loading">登 录</span>
            <span v-else>登 录 中...</span>
          </el-button>
          <el-button
              type="success"
              style="width: 30%"
              @click="centerDialogVisible = true;"
          >
            <span>注 册</span>
          </el-button>
        </div>
      </el-form>
    </div>
    <el-dialog
        title="欢迎注册🥝HuiChat"
        :visible.sync="centerDialogVisible"
        width="30%"
        :close-on-click-modal="false"
        center
    >
      <el-form
          :model="registerForm"
          :rules="registerRules"
          ref="registerRuleForm"
          label-width="100px"
      >
        <el-form-item label="用户名:" prop="username">
          <el-input
              type="text"
              v-model="registerForm.username"
              auto-complete="off"
              placeholder="请输入用户名"
          ></el-input>
        </el-form-item>
        <el-form-item label="密码:" prop="password">
          <el-input
              type="password"
              v-model="registerForm.password"
              auto-complete="off"
              placeholder="请输入密码"
          ></el-input>
        </el-form-item>
        <el-form-item label="确认密码:" prop="confirmPassword">
          <el-input
              type="password"
              v-model="registerForm.confirmPassword"
              auto-complete="off"
              placeholder="请再次输入密码"
          ></el-input>
        </el-form-item>
        <el-form-item label="邮箱:" prop="email">
          <el-input
              v-model="registerForm.email"
              auto-complete="off"
              placeholder="请输入邮箱地址"
          ></el-input>
          <el-button
              type="success"
              @click="getEmailCode"
              :disabled="disable"
              size="mini"
          >{{ buttonName }}
          </el-button
          >
        </el-form-item>
        <el-form-item label="邮箱验证码" prop="code">
          <el-input
              v-model="registerForm.code"
              auto-complete="off"
              placeholder="邮箱验证码"
          >
          </el-input>
          <div class="register-code">
            <img :src="codeUrl" class="register-code-img"/>
          </div>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="centerDialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="registerUser"
        >注 册</el-button
        >
      </span>
    </el-dialog>
  </div>
</template>

<script>
import Verify from "@/components/Verifition/Verify";
import {sendCode,register} from "@/api/login"

export default {
  name: "Login",
  components: {Verify},
  data() {
    const equalToPassword = (rule, value, callback) => {
      if (this.registerForm.password !== value) {
        callback(new Error("两次输入的密码不一致"));
      } else {
        callback();
      }
    };
    return {
      loginForm: {
        username: "admin",
        password: "admin123",
        uuid: "",
        code: "",
      },
      buttonName: "获取验证码",
      count: 120,
      disable: false,
      registerForm: {
        username: "",
        password: "",
        confirmPassword: "",
        email: "",
        code: "",
      },
      loading: false,
      centerDialogVisible: false,
      codeUrl: "",
      rules: {
        username: [
          {required: true, message: "请输入用户名", trigger: "blur"},
          {
            min: 2,
            max: 16,
            message: "长度在 2 到 16 个字符",
            trigger: "blur",
          },
        ],
        password: [
          {required: true, message: "请输入密码", trigger: "blur"},
          {
            min: 4,
            max: 20,
            message: "长度在 4 到 20 个字符",
            trigger: "blur",
          },
        ]
      },
      registerRules: {
        username: [
          {required: true, trigger: "blur", message: "请输入您的账号"},
          {
            min: 2,
            max: 20,
            message: "用户账号长度必须介于 2 和 20 之间",
            trigger: "blur",
          },
        ],
        password: [
          {required: true, trigger: "blur", message: "请输入您的密码"},
          {
            min: 5,
            max: 20,
            message: "用户密码长度必须介于 5 和 20 之间",
            trigger: "blur",
          },
        ],
        confirmPassword: [
          {required: true, trigger: "blur", message: "请再次输入您的密码"},
          {required: true, validator: equalToPassword, trigger: "blur"},
        ],
        email: [
          {required: true, message: "请输入邮箱地址", trigger: "blur"},
          {
            type: "email",
            message: "请输入正确的邮箱地址",
            trigger: ["blur", "change"],
          },
        ],
        code: [{required: true, trigger: "change", message: "请输入验证码"}],
      },
    };
  },
  methods: {
    getEmailCode() {
      //需要单独验证的字段名email
      this.$refs.registerRuleForm.validateField("email", (val) => {
        if (!val) {
          sendCode(this.registerForm.email).then(() => {
            let timeout = setInterval(() => {
              if (this.count < 1) {
                this.disable = false;
                this.buttonName = "获取验证码";
                this.count = 120;
                clearInterval(timeout);
              } else {
                this.disable = true;
                this.buttonName = this.count-- + "s后重发";
              }
            }, 1000);
            this.$message({
              message: '验证码发送成功，注意查收',
              type: 'success'
            });
          })
        }
      });
    },

    capctchaCheckSuccess(params) {
      this.loginForm.code = params.captchaVerification;
      this.loading = true;
      this.$store
          .dispatch("Login", this.loginForm)
          .then(() => {
            this.$router.push({path: this.redirect || "/"}).catch(() => {
            });
            this.$notify({
              title: '欢迎',
              message: '欢迎回来！',
              position: 'top-left',
              type: 'success'
            });
          })
          .catch(() => {
            this.loading = false;
          });
    },
    login() {
      this.$refs.ruleForm.validate((valid) => {
        if (valid) {
          this.$refs.verify.show();
        } else {
          console.log("error submit!!");
          return false;
        }
      });
    },
    registerUser() {
      this.$refs.registerRuleForm.validate((valid) => {
        if (valid) {
          register(this.registerForm).then(()=>{
            this.centerDialogVisible = false
            this.$message({
              message: '注册成功',
              type: 'success'
            });
          })
        } else {
          console.log("error submit!!");
          return false;
        }
      });
    },
  },
};
</script>

<style scoped>
.login-container {
  height: 100%;
  background-color: #ccc;
}

.login-main {
  width: 400px;
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  /* margin: 100px auto; */
  border-radius: 15px;
  border: 1px solid #eaeaea;
  background: #fff;
  /*添加阴影 h-shadow(水平阴影位置)，v-shadow(垂直阴影位置)，blur(阴影大小)，color(颜色)*/
  box-shadow: 10px 10px 35px #cac6c6;
  padding: 25px 30px 25px 30px;
}

.loginTitle {
  margin: 10px auto 30px auto;
  text-align: center;
  color: #8a8a8a;
}
</style>
