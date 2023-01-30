<template>
  <div id="chat-list">
    <!-- 侧边栏 -->
    <div class="sidebar">
      <section>
        <header id="info">
          <img
            @click="showUserInfo"
            :src=" (user.avatar === '' || user.avatar == null) ? require('@/assets/images/profile.jpg') :  user.avatar"
            class="avatar"
          />
          <!-- 展示用户信息 -->
          <div class="userInfo" @click="hideUserInfo" v-show="isShowUserInfo">
            <img :src=" (user.avatar === '' || user.avatar == null) ? require('@/assets/images/profile.jpg') :  user.avatar" class="avatar" />
            <div class="detail">
              <div>
                <span>{{ user.username }}</span>
                <i></i>
              </div>
              <div style="color: #9e9e9e">
                昵称:&nbsp;&nbsp;{{ user.nickName }}
              </div>
              <div style="color: #9e9e9e">地区:&nbsp;{{ user.area }}</div>
            </div>
          </div>
        </header>

        <nav>
          <router-link
            to="/chat-list"
            class="icon iconfont icon-msg"
            active-class="active"
          ></router-link>
          <router-link
            to="/chat-friends"
            class="icon iconfont icon-friend"
            active-class="active"
          ></router-link>
          <!-- <router-link
            to="/chat-moments"
            class="icon iconfont icon-collection"
            active-class="active"
          ></router-link> -->
        </nav>

        <footer>
          <i @click="logout" class="icon iconfont icon-more"></i>
        </footer>
      </section>
    </div>
    <div class="main">
      <!-- 聊天窗口 -->
      <div class="container">
        <keep-alive>
          <router-view />
        </keep-alive>
      </div>
    </div>
  </div>
</template>

<script>
import { mapMutations, mapState } from "vuex";

import { logout } from "../api/login";
import { removeToken } from "@/utils/auth";
import { getFriends } from "@/api/user";

export default {
  name: "Layout",
  data() {
    return {
      isShowUserInfo: false,
    };
  },
  async created() {
    this.LOAD_RECENT_FRIENDS();
    const { data } = await getFriends();
    this.SET_FRIENDS(data);
    this.$store.dispatch("Connect");
    this.timer = setInterval(() => {
      this.$store.dispatch("Connect");
    }, 10000);
    console.log("定时器已开启");
  },
  methods: {
    ...mapMutations(["LOAD_RECENT_FRIENDS", "SET_FRIENDS"]),
    // 登出
    logout() {
      this.$confirm("是否退出当前用户?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          logout().then(() => {
            removeToken();
            this.$router.push("/login").catch(() => {});
          });
          this.$message({
            type: "success",
            message: "退出成功!",
          });
        })
        .catch(() => {});
    },
    showUserInfo() {
      this.isShowUserInfo = true;
    },
    hideUserInfo() {
      this.isShowUserInfo = false;
    },
  },
  computed: {
    ...mapState(["user"]),
  },
  beforeDestroy() {
    this.$store.dispatch("Disconnect");
    if (this.timer) {
      clearInterval(this.timer);
      console.log("定时器已关闭");
    }
  },
};
</script>

<style scoped lang="less">
.userInfo {
  position: absolute;
  width: 259px;
  height: 116px;
  padding: 17px;
  box-sizing: border-box;
  background-color: #fff;
  transform: translate(10%, -13%);
  z-index: 9999;
  box-shadow: 5px 5px 5px 2px #bdbdbd;
  border-radius: 5px;
  img {
    float: left;
  }
}
.detail {
  margin-left: 80px;
  div {
    margin-bottom: 10px;
  }
}

#chat-list {
  display: flex;
  border-radius: 50px;
  margin: 100px auto;
  width: 860px;
  height: 600px;
  background-color: #fff;
  .main {
    flex: 1;
    height: 600px;
    background: #f5f5f5;
  }
  .sidebar {
    width: 60px;
    height: 600px;
    background: #2b2c2f;
    .icon {
      display: inline-block;
      font-size: 26px;
      margin-top: 28px;
      padding: 0 16px;
      box-sizing: border-box;
      color: #adaeaf;
      opacity: 0.8;
      cursor: pointer;
    }
    .icon.active {
      color: #00dc41;
    }
    .icon:hover {
      opacity: 1;
    }

    section {
      position: relative;
      width: 100%;
      height: 100%;
      .avatar {
        width: 36px;
        height: 36px;
        margin: 36px 12px 0 12px;
        border-radius: 2px;
      }
      nav {
        width: 100%;
        text-align: center;
        .icon-msg {
          font-size: 22px;
        }
        .icon-msg {
          padding: 0 19px;
        }
      }
    }
    footer {
      position: absolute;
      bottom: 20px;
      width: 100%;
      text-align: center;
      .icon-more {
        font-size: 22px;
      }
    }
  }
}
</style>
