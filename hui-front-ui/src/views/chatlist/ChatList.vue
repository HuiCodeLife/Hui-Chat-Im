<template>
  <div class="container">
    <div class="user-list">
      <!-- 搜索框 -->
      <Search @clear="handleClear" @search="handleSearch"/>
      <!-- 聊天用户列表 -->
      <div class="msg-list">
        <ul>
          <li
              v-for="(friend, index) in searchList"
              :key="friend.userId"
              @click="handleClickFriend(index)"
              :class="{ active: selectIndex === index }"
              class="session-list"
          >
            <div class="list-left">
              <img
                  width="42"
                  height="42"
                  :alt="friend.user.nickName"
                  :src="friend.user.avatar"
                  class="avatar"
              />
            </div>
            <div class="list-right">
              <p class="name">{{ friend.user.nickName }}</p>
              <span class="time">{{ getLastTime(friend) }}</span>
              <span class="time2" @click="handleCloseSession(friend)">
                <svg t="1674042971075" class="icon" viewBox="0 0 1024 1024" version="1.1"
                     xmlns="http://www.w3.org/2000/svg" p-id="3893" width="16" height="16"><path
                    d="M872.802928 755.99406 872.864326 755.99406 872.864326 755.624646Z" fill="#272536"
                    p-id="3894"></path><path
                    d="M927.846568 511.997953c0-229.315756-186.567139-415.839917-415.838893-415.839917-229.329059 0-415.85322 186.524161-415.85322 415.839917 0 229.300406 186.524161 415.84094 415.85322 415.84094C741.278405 927.838893 927.846568 741.29836 927.846568 511.997953M512.007675 868.171955c-196.375529 0-356.172979-159.827125-356.172979-356.174002 0-196.374506 159.797449-356.157629 356.172979-356.157629 196.34483 0 356.144326 159.783123 356.144326 356.157629C868.152001 708.34483 708.352505 868.171955 512.007675 868.171955"
                    fill="#272536" p-id="3895"></path><path
                    d="M682.378947 642.227993 553.797453 513.264806 682.261267 386.229528c11.661597-11.514241 11.749602-30.332842 0.234337-41.995463-11.514241-11.676947-30.362518-11.765975-42.026162-0.222057L511.888971 471.195665 385.223107 344.130711c-11.602246-11.603269-30.393217-11.661597-42.025139-0.059352-11.603269 11.618619-11.603269 30.407544-0.059352 42.011836l126.518508 126.887922L342.137823 639.104863c-11.662621 11.543917-11.780301 30.305213-0.23536 41.96988 5.830799 5.89015 13.429871 8.833179 21.086248 8.833179 7.53972 0 15.136745-2.8847 20.910239-8.569166l127.695311-126.311801L640.293433 684.195827c5.802146 5.8001 13.428847 8.717546 21.056572 8.717546 7.599072 0 15.165398-2.917446 20.968567-8.659217C693.922864 672.681586 693.950494 653.889591 682.378947 642.227993"
                    fill="#272536" p-id="3896"></path></svg>
              </span>

              <p class="last-msg" v-html="getLastMsg(friend)"></p>

            </div>
          </li>
        </ul>
      </div>
    </div>
    <div class="chat-list" v-show="currentChatFriend">
      <!-- 聊天内容区域 -->
      <div class="message">
        <!-- 聊天框头部 -->
        <header class="header">
          <div class="friendname">
            <!-- 当前聊天用户名 -->
            <span>{{ currentChatFriend?.user.nickName }}</span>
            <!-- 查看更多信息 -->
            <span @click="handleMore" style="float: right;margin-right: 20px; line-height: 20px;">
              <svg t="1673607415459" class="icon" viewBox="0 0 1024 1024" version="1.1"
                   xmlns="http://www.w3.org/2000/svg" p-id="1777" width="20" height="20"><path
                  d="M221 592c-44.183 0-80-35.817-80-80s35.817-80 80-80 80 35.817 80 80-35.817 80-80 80z m291 0c-44.183 0-80-35.817-80-80s35.817-80 80-80 80 35.817 80 80-35.817 80-80 80z m291 0c-44.183 0-80-35.817-80-80s35.817-80 80-80 80 35.817 80 80-35.817 80-80 80z"
                  fill="#000000" p-id="1778"></path></svg>
            </span>
          </div>

        </header>
        <div class="message-wrapper" ref="chatBox">
          <ul>
            <li
                v-for="(msg, index) in currentChatFriend?.messages"
                :key="index"
                class="message-item"
            >
              <div class="time">
                <span>{{ getTime(msg.time) }}</span>
              </div>
              <!-- <div class="time" v-show="!isSameTime(getTime(msg.time))"><span>{{ getTime(msg.time) }}</span></div> -->

              <div :class="{ self: msg.self }" class="message-main">
                <img
                    width="36"
                    height="36"
                    :src="
                    msg.self
                      ? user.avatar
                      : currentChatFriend.user.avatar
                  "
                    class="avatar"
                />

                <div class="msg">
                  <div class="text">
                    <span v-html="replaceEmoji(msg.msg)"></span>
                  </div>
                </div>
              </div>
            </li>
          </ul>
        </div>
      </div>
      <!-- 消息发送区 -->
      <div class="send-text">
        <div>
          <!-- emoji -->
          <Emoji
              :isShow="isShow"
              @changeShow="showHandle"
              @onClickEmoji="handleEmojiToContent"
          />
          <!--选择文件-->
          <el-upload
              action="http://localhost:8080/common/upload"
              :headers="headers"
              :show-file-list="false"
              :on-success="handleSuccess"
              :before-upload="beforeUpload"
              style="display: inline-block">
            <slot>
              <i class="el-icon-files"></i>
            </slot>
          </el-upload>
        </div>

        <textarea ref="msgtextarea"
                  @keydown.enter.prevent="handleSendMsg"
                  @click="isShow = false"
                  v-model="msg"
        >
        </textarea>
        <div class="send" @click="handleSendMsg">
          <span>发送(Enter)</span>
        </div>
        <div class="warn" v-show="showTip">
          <div class="description">不能发送空白信息</div>
        </div>
      </div>
    </div>
    <div class="chat-list" v-show="!currentChatFriend">
      <el-empty style="margin-top: 100px"
                description="当前无新内容"
      ></el-empty>
    </div>
  </div>
</template>

<script>
import {mapState} from "vuex";
import Search from "@/components/Search";
import Emoji from "@/components/Emoji.vue";
import dayjs from "dayjs";
import {mapMutations} from "vuex";
import {Message} from "element-ui";
import {getToken} from '@/utils/auth'

export default {
  name: "ChatList",
  components: {
    Search,
    Emoji,
  },
  data() {
    return {
      isShow: false,
      msg: "",
      showTip: false,
      selectIndex: 0,
      searchValue: "",
      timer: null,
      headers: {
        'Authorization': "Bearer " + getToken(),
      },

    };
  },
  created() {
  },
  methods: {
    ...mapMutations(["ADD_RECENT_FRIEND", "REMOVE_RECENT_FRIEND"]),
    //点击更多
    handleMore() {
      Message({message: "该功能尚未实现", type: "info"});
    },
    showHandle(value) {
      this.isShow = value;
    },
    //获取最后一条消息时间
    getLastTime(f) {
      const time = f.messages[f.messages.length - 1]?.time;
      return time ? this.getTime(time) : "";
    },
    //获取最后一条消息
    getLastMsg(f) {
      return f.messages[f.messages.length - 1]?.msg;
    },
    //获取时间
    getTime(time) {
      if (dayjs(time).format("YYYY-MM-DD") === dayjs(new Date()).format("YYYY-MM-DD")) {
        return dayjs(time).format("HH:mm");
      } else {
        return dayjs(time).format("YYYY-MM-DD HH:mm");

      }
    },
    //发送消息
    handleSendMsg() {
      // 不允许发送空数据
      if (this.msg.trim().length === 0) {
        this.showTip = true;
        setTimeout(() => {
          this.showTip = false;
        }, 2000);
        this.msg = "";
        return;
      }
      // 判断是否选择聊天对象
      if (!this.currentChatFriend) {
        Message({message: "请选择联系人", type: "info"});
        return;
      }

      // 本地发送
      this.currentChatFriend.messages.push({
        time: Date.now(),
        msg: this.msg,
        self: true,
      });
      let chatMsg = {
        content: this.msg,
        to: this.currentChatFriend.user.username,
        acceptUserId: this.currentChatFriend.user.userId,
      };
      if (this.currentChatFriend.user.robot) {
        // 与机器人聊天
        this.$store.state.stomp.send("/ws/robot", {}, JSON.stringify(chatMsg));
      } else {
        // 与好友聊天
        this.$store.state.stomp.send("/ws/chat", {}, JSON.stringify(chatMsg));
      }
      this.msg = "";
      this.ADD_RECENT_FRIEND(this.currentChatFriend);
      this.selectIndex = 0;
      localStorage.setItem(
          "recentFriends:" + this.user.userId,
          JSON.stringify(this.recentFriends)
      );
    },
    //点击好友聊天窗口
    handleClickFriend(index) {
      this.selectIndex = index;
      //选中聊天对象时刷新窗口至底部
      this.$nextTick(() => {
        this.$refs.chatBox.scrollTop = this.$refs.chatBox.scrollHeight;
      });
      //切换聊天窗口 清空聊天框
      this.msg = ""
    },
    // 搜索功能
    handleSearch(v) {
      this.searchValue = v;
    },
    // 清空搜索框
    handleClear() {
      this.searchValue = "";
    },
    //替换为gif表情
    replaceEmoji(content) {
      if (content.includes("[")) {
        this.emojis.forEach((e) => {
          content = content.replace(
              "[" + e.title + "]",
              '<img src="/images/emoji/' +
              e.file +
              '"  alt="" style="vertical-align: middle; width: 24px; height: 24px;" />'
          );
        });
      }
      return content;
    },
    // 选中表情替换为[微笑]格式显示到文本框
    handleEmojiToContent(code) {
      let emoji = this.emojis.find((e) => {
        return e.code === code;
      });
      this.$nextTick(() => {
        this.$refs.msgtextarea.focus();
      })
      this.msg += "[" + emoji.title + "]";
      this.isShow = false;
    },
    //图片发送成功回调函数
    handleSuccess(response) {
      let img = `<img   width="300px"  src="${response.url}"/>`
      // 判断是否选择聊天对象
      if (!this.currentChatFriend) {
        Message({message: "请选择联系人", type: "info"});
        return;
      }
      // 本地发送
      this.currentChatFriend.messages.push({
        time: Date.now(),
        msg: img,
        self: true,
      });
      let chatMsg = {
        content: img,
        to: this.currentChatFriend.user.username,
        acceptUserId: this.currentChatFriend.user.userId,
      };
      if (this.currentChatFriend.user.robot) {
        // 与机器人聊天
        this.$store.state.stomp.send("/ws/robot", {}, JSON.stringify(chatMsg));
      } else {
        // 与好友聊天
        this.$store.state.stomp.send("/ws/chat", {}, JSON.stringify(chatMsg));
      }
      this.msg = "";
      this.ADD_RECENT_FRIEND(this.currentChatFriend);
      this.selectIndex = 0;

      localStorage.setItem(
          "recentFriends:" + this.user.userId,
          JSON.stringify(this.recentFriends)
      );
      this.$nextTick(() => {
        this.$refs.chatBox.scrollTop = this.$refs.chatBox.scrollHeight;
      });

    },
    //图片上传之前钩子函数
    beforeUpload(file) {
      //限制类型
      const fileName = file.name;   //取文件名字
      const fileType = fileName.substring(fileName.lastIndexOf("."));//去文件后缀
      // jpeg,.png,.jpg,
      if (fileType === ".jpg" || fileType === ".png" || fileType === ".jpeg") {
        // 不处理
      } else {
        Message({message: "文件格式错误，请上传图片类型,如：JPG，PNG后缀的文件", type: "error"});
        return false;
      }
      //限制大小.
      if (file.size / 1024 / 1024 > 5) {
        Message({message: "上传图片过大，请重新上传！", type: "error"});
        return false;
      }
    },
    // 删除当前好友聊天会话框
    handleCloseSession(friend) {
      this.$confirm(`删除后，将清空该聊天的聊天记录`, "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
          .then(() => {
            console.log(friend);
            this.REMOVE_RECENT_FRIEND(friend);
          })
          .catch(() => {
          });
    }
  },
  computed: {
    ...mapState(["token", "recentFriends", "user", "friendList", "emojis"]),
    currentChatFriend() {
      return this.recentFriends[this.selectIndex];
    },
    searchList() {
      return this.recentFriends.filter((item) => {
        return item.user.nickName.startsWith(this.searchValue);
      });
    },
  },
  watch: {
    currentChatFriend: {
      immediate: true,
      deep: true,
      handler() {
        this.$nextTick(() => {
          this.$refs.chatBox.scrollTop = this.$refs.chatBox.scrollHeight;
        });
      },
    },
  },
  //组件激活时触发
  activated() {
    this.$refs.chatBox.scrollTop = this.$refs.chatBox.scrollHeight;
  },
  //组件销毁时触发
  beforeDestroy() {
    if (this.timer) {
      clearInterval(this.timer);
      console.log("定时器已关闭");
    }
  },
};
</script>

<style scoped lang="less">
.container {
  display: flex;
  width: 800px;

  .user-list {
    width: 250px;
    background: #e6e6e6;

    .wrapper {
      padding: 22px 12px 12px 12px;
      background: #f7f7f7;
    }

    .msg-list {
      height: 540px;
      overflow-y: auto;

      .session-list {
        display: flex;
        padding: 12px;
        transition: background-color 0.1s;
        font-size: 0;

        .avatar {
          border-radius: 5px;
          margin-right: 12px;
        }

        .list-right {
          position: relative;
          flex: 1;
          margin-top: 4px;

          .name {
            display: inline-block;
            vertical-align: top;
            font-size: 14px;
          }

          .time {
            float: right;
            color: #999;
            font-size: 10px;
            vertical-align: top;
          }

          .time2 {
            display: none;
            float: right;
            color: red;
            font-size: 10px;
            vertical-align: top;
          }

          .last-msg {
            position: absolute;
            font-size: 12px;
            width: 130px;
            height: 15px;
            line-height: 15px;
            color: #999;
            bottom: 4px;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
          }
        }
      }

      .session-list:hover {
        background-color: #dcdcdc;

        .list-right {
          .time {
            display: none;
          }

          .time2 {
            display: block;
          }
        }
      }

      .session-list.active {
        background-color: #c4c4c4;
      }
    }
  }

  .chat-list {
    flex: 1;

    .message {
      width: 100%;
      height: 450px;

      header {
        height: 60px;
        padding: 28px 0 0 30px;
        box-sizing: border-box;
        border-bottom: 1px solid #e7e7e7;

        .friendname {
          font-size: 18px;
        }
      }

      .message-wrapper {
        min-height: 390px;
        max-height: 390px;
        padding: 10px 15px;
        box-sizing: border-box;
        overflow-y: auto;
        border-bottom: 1px solid #e7e7e7;

        .message-item {
          margin-top: 10px;
        }

        .message {
          margin-bottom: 15px;
        }

        .time {
          width: 100%;
          font-size: 12px;
          margin: 7px auto;
          text-align: center;

          span {
            display: inline-block;
            padding: 4px 6px;
            color: #fff;
            border-radius: 3px;
            background-color: #dcdcdc;
          }
        }

        .message-main {
          .avatar {
            float: left;
            margin-left: 15px;
            border-radius: 3px;
          }

          .msg {
            display: inline-block;
            margin-left: 10px;
            position: relative;
            padding: 6px 10px;
            max-width: 330px;
            min-height: 36px;
            line-height: 24px;
            box-sizing: border-box;
            font-size: 14px;
            text-align: left;
            word-break: break-all;
            background-color: #fafafa;
            border-radius: 4px;
          }

          .msg:before {
            msg: " ";
            position: absolute;
            top: 12px;
            right: 100%;
            border: 6px solid transparent;
            border-right-color: #fafafa;
          }
        }

        .self {
          text-align: right;

          .avatar {
            float: right;
            margin: 0 15px;
          }

          .msg {
            background-color: #b2e281;
          }

          .msg:before {
            right: -12px;
            vertical-align: middle;
            border-right-color: transparent;
            border-left-color: #b2e281;
          }
        }
      }
    }

    .send-text {
      position: relative;
      height: 150px;
      background: #fff;


      textarea {
        box-sizing: border-box;
        padding: 0 30px;
        height: 110px;
        width: 100%;
        border: none;
        outline: none;
        font-family: "Micrsofot Yahei";
        resize: none;
      }

      .send {
        position: absolute;
        bottom: 10px;
        right: 30px;
        width: 90px;
        height: 28px;
        line-height: 28px;
        box-sizing: border-box;
        text-align: center;
        border: 1px solid #e5e5e5;
        border-radius: 3px;
        background: #f5f5f5;
        font-size: 14px;
        color: #7c7c7c;
      }

      .send:hover {
        background: #129611;
        color: #fff;
      }

      .warn {
        position: absolute;
        bottom: 50px;
        right: 10px;
        width: 110px;
        height: 30px;
        line-height: 30px;
        font-size: 12px;
        text-align: center;
        border: 1px solid #bdbdbd;
        border-radius: 4px;
        box-shadow: 0 1px 5px 1px #bdbdbd;
      }

      .warn.appear-enter-active,
      .warn.appear-leave-active {
        transition: all 1s;
      }

      .warn.appear-enter,
      .warn.appear-leave-active {
        opacity: 0;
      }

      .warn:before {
        msg: " ";
        position: absolute;
        top: 100%;
        right: 20px;
        border: 7px solid transparent;
        border-top-color: #fff;
        filter: drop-shadow(1px 3px 2px #bdbdbd);
      }
    }
  }
}
</style>
