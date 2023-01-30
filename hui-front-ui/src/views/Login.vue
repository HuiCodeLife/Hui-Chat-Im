<template>
  <div class="login-container">
    <div class="login-main">
      <el-form
        :model="loginForm"
        :rules="rules"
        ref="ruleForm"
        label-width="100px"
      >
        <h3 class="loginTitle">🥝HuiChat</h3>
        <el-form-item label="用户名:" prop="username">
          <el-input
            type="text"
            v-model="loginForm.username"
            auto-complete="off"
            placeholder="请输入用户名"
          ></el-input>
        </el-form-item>
        <el-form-item label="密码:" prop="password">
          <el-input
            type="password"
            v-model="loginForm.password"
            auto-complete="off"
            placeholder="请输入密码"
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
        <!-- <el-form-item label="验证码:" prop="code">
          <el-input
            type="text"
            v-model="loginForm.code"
            auto-complete="off"
            placeholder="请输入验证码"
            style="width: 60%; vertical-align: middle"
            @keyup.enter.native="login"

          ></el-input>
          <img
            style="
              width: 35%;
              margin-left: 5%;
              height: 40px;
              vertical-align: middle;
            "
            :src="codeUrl"
            @click="getCode()"
            title="点击切换验证码"
          />
        </el-form-item> -->
        <div style="text-align: center">
          <el-button
            :loading="loading"
            type="primary"
            style="width: 45%"
            @keyup.enter.native="login"
            @click="login"
          >
            <span v-if="!loading">登 录</span>
            <span v-else>登 录 中...</span>
          </el-button>
        </div>
      </el-form>
    </div>
  </div>
</template>

<script>
// import { getCodeImg } from "@/api/login";
import Verify from "@/components/Verifition/Verify";

export default {
  name: "Login",
  components: { Verify },
  data() {
    return {
      loginForm: {
        username: "admin",
        password: "admin123",
        uuid: "",
        code: "",
      },
      loading: false,

      codeUrl: "",
      rules: {
        username: [
          { required: true, message: "请输入用户名", trigger: "blur" },
          {
            min: 2,
            max: 16,
            message: "长度在 2 到 16 个字符",
            trigger: "blur",
          },
        ],
        password: [
          { required: true, message: "请输入密码", trigger: "blur" },
          {
            min: 4,
            max: 20,
            message: "长度在 4 到 20 个字符",
            trigger: "blur",
          },
        ],
        // code: [
        //   { required: true, message: "请输入验证码", trigger: "blur" },
        //   { min: 4, max: 4, message: "请输入正确的验证码", trigger: "blur" },
        // ],
      },
    };
  },
  created() {
    // this.getCode();
  },
  methods: {
    // getCode() {
    //   getCodeImg().then((res) => {
    //     this.codeUrl = "data:image/gif;base64," + res.img;
    //     this.loginForm.uuid = res.uuid;
    //   });
    // },
    capctchaCheckSuccess(params) {
      this.loginForm.code = params.captchaVerification;
      this.loading = true;
      this.$store.dispatch("Login", this.loginForm).then(() => {
          this.$router.push({ path: this.redirect || "/" }).catch(() => {});
        }).catch(() => {
          this.loading = false;
        });
    },
    login() {
      this.$refs.ruleForm.validate((valid) => {
        if (valid) {
          this.$refs.verify.show();
          // this.loading = true;
          // this.$store
          //   .dispatch("Login", this.loginForm)
          //   .then(() => {
          //     console.log(11);
          //     this.$store.dispatch("GetInfo").then(()=>{
          //       this.$router.push("/chat-list").catch(() => {});
          //     })
          //   })
          //   .catch((err) => {
          //     console.log(err);
          //     this.loading = false;
          //     this.loginForm.code = ''
          //     this.getCode();
          //   });
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
  color: 8a8a8a;
}
</style>
