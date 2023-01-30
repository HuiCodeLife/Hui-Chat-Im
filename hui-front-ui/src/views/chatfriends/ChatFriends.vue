<template>
  <div class="container">
    <!-- 好友列表 -->
    <div class="friend-wrapper">
      <!-- 搜索框 -->
      <Search @clear="handleClear" @search="handleSearch" />
      <!-- 好友列表 -->
      <div class="friend-list">
        <ul>
          <li class="friend-item">
            <div class="list-title">通讯录管理</div>
            <div class="addr-manage" @click="table = true">
              <div class="addr-box">
                <div class="remark">
                  <i class="icon iconfont icon-friend"></i>&nbsp;通讯录管理
                </div>
              </div>
            </div>
          </li>
          <li class="friend-item">
            <div class="list-title">
              新的朋友
              <el-badge
                :value="newRequestCount"
                :max="99"
                style="margin-bottom: 10px"
              >
              </el-badge>
            </div>
            <div
              class="friend-info"
              @click="selectId = 0"
              :class="{ active: selectId == 0 }"
            >
              <img
                width="36"
                height="36"
                src="/images/newfriend.jpg"
                class="avatar"
              />
              <div class="remark">新的朋友</div>
            </div>
          </li>
          <li
            v-for="(item, index) in searchList"
            :key="index"
            class="friend-item"
          >
            <div class="list-title">{{ item.letter }}</div>
            <div
              v-for="user in item.users"
              :key="user.userid"
              @click="selectId = user.userId"
              :class="{ active: selectId == user.userId }"
              class="friend-info"
            >
              <img
                width="36"
                height="36"
                :src="user.avatar"
                class="avatar"
              />
              <div class="remark">{{ user?.nickName }}</div>
            </div>
          </li>
        </ul>
      </div>
    </div>
    <div class="friend-info">
      <!-- 好友详情 -->
      <div class="info-wrapper" v-show="currentUser">
        <div class="friend-info">
          <div class="es-info">
            <div class="left">
              <div class="people">
                <div class="nickname">{{ currentUser?.nickName }}</div>
                <div class="gender-male"></div>
              </div>
              <div class="signature">{{ currentUser?.remark }}</div>
            </div>
            <div class="right">
              <img
                class="avatar"
                width="60"
                height="60"
                :src="
                  currentUser?.avatar
                    ? currentUser?.avatar
                    : '/images/face/default.jpg'
                "
              />
            </div>
          </div>
          <div class="detInfo">
            <div class="area">
              <span>地&nbsp;&nbsp;&nbsp;区</span>{{ currentUser?.area }}
            </div>
            <div class="wxid"><span>邮箱</span>{{ currentUser?.email }}</div>
          </div>
          <div class="send" @click="handleSend">
            <span>发消息</span>
          </div>
        </div>
      </div>
      <div v-show="!currentUser" style="height: 600px; overflow: auto">
        <el-descriptions
          v-for="f in friendRequest"
          :key="f.id"
          style="margin: 50px"
          :column="3"
          size="mini"
          border
        >
          <template slot="extra">
            <el-button
              type="success"
              v-show="f.status === '0'"
              size="small"
              @click="doHandle(f.requestId, 1)"
              >同意</el-button
            >
            <el-button
              type="info"
              v-show="f.status === '0'"
              size="small"
              @click="doHandle(f.requestId, 3)"
              >忽略</el-button
            >
            <el-button
              type="danger"
              v-show="f.status === '0'"
              size="small"
              @click="doHandle(f.requestId, 2)"
              >拒绝</el-button
            >
          </template>
          <el-descriptions-item>
            <template slot="label">
              <i class="el-icon-user"></i>
              用户名
            </template>
            {{ f.username }}
          </el-descriptions-item>
          <el-descriptions-item>
            <template slot="label">
              <i class="el-icon-mobile-phone"></i>
              邮箱
            </template>
            {{ f.email }}
          </el-descriptions-item>
          <el-descriptions-item>
            <template slot="label">
              <i class="el-icon-location-outline"></i>
              地址
            </template>
            {{ f.area }}
          </el-descriptions-item>
          <el-descriptions-item>
            <template slot="label">
              <i class="el-icon-tickets"></i>
              性别
            </template>
            <el-tag v-show="f.sex === '0'" size="small">男</el-tag>
            <el-tag v-show="f.sex === '1'" size="small">女</el-tag>
          </el-descriptions-item>
          <el-descriptions-item>
            <template slot="label">
              <i class="el-icon-office-building"></i>
              头像
            </template>
            <img width="50px" :src="f.avatar" alt="" />
          </el-descriptions-item>
          <el-descriptions-item>
            <template slot="label">
              <i class="el-icon-office-building"></i>
              请求状态
            </template>
            <el-tag v-show="f.status === '0'" size="small">未处理</el-tag>
            <el-tag v-show="f.status === '1'" size="small">已同意</el-tag>
            <el-tag v-show="f.status === '2'" size="small">已拒绝</el-tag>
            <el-tag v-show="f.status === '3'" size="small">已忽略</el-tag>
          </el-descriptions-item>
          <el-descriptions-item>
            <template slot="label">
              <i class="el-icon-office-building"></i>
              昵称
            </template>
            {{ f.nickName }}
          </el-descriptions-item>
          <el-descriptions-item>
            <template slot="label">
              <i class="el-icon-office-building"></i>
              时间
            </template>
            {{ f.requestDataTime.substring(0, 10) }}
          </el-descriptions-item>
        </el-descriptions>
        <el-empty
          v-show="friendRequest.length === 0"
          description="无新的好友请求"
        ></el-empty>
      </div>
    </div>

    <el-drawer title="通讯录管理" :visible.sync="table" size="50%">
      <el-table
        :data="
          friendList.filter(
            (data) =>
              !search ||
              data.nickName.toLowerCase().includes(search.toLowerCase())
          )
        "
        style="width: 100%; margin-left: 10px"
      >
        <el-table-column label="昵称" prop="nickName"> </el-table-column>
        <el-table-column label="头像" width="100">
          <template slot-scope="scope">
            <img
              class="avatar"
              width="60"
              height="60"
              :src="scope.row.avatar"
            />
          </template>
        </el-table-column>
        <el-table-column align="right">
          <template slot="header" slot-scope="scope">
            <el-input
              v-model="search"
              size="mini"
              placeholder="输入关键字搜索"
            />
          </template>
          <template slot-scope="scope">
            <!-- <el-button
          size="mini"
          @click="handleEdit(scope.$index, scope.row)">查看</el-button> -->
            <el-button
              size="mini"
              type="danger"
              @click="handleDelete(scope.$index, scope.row)"
              >删除好友</el-button
            >
          </template>
        </el-table-column>
      </el-table>
    </el-drawer>
  </div>
</template>

<script>
import { changeRequestStatus, deleteFriend } from "@/api/user";
import Search from "@/components/Search";
import { mapMutations, mapState } from "vuex";
import {
  getFriends,
  searchFriends,
  addUserByUserId,
  friendsRequest,
} from "@/api/user";
import { pinyin } from "pinyin-pro";
import { Message } from "element-ui";
export default {
  name: "ChatFriends",
  components: {
    Search,
  },
  data() {
    return {
      friends: [],
      selectId: 0,
      searchValue: "",
      friendsUsername: "",
      hasSearchUser: true,
      searchUser: null,
      friendRequest: [],
      table: false,
      search: "",
      newRequestCount: 0,
      dialogVisible: false,
    };
  },
  created() {
    this.getFriends();
    this.getRequestFriends();
  },
  methods: {
    ...mapMutations(["ADD_RECENT_FRIEND", "SET_FRIENDS"]),
    handleSend() {
      const cuser = this.currentUser;
      console.log(cuser)
      this.ADD_RECENT_FRIEND({
        user: {
          nickName: cuser.nickName,
          avatar: cuser.avatar,
          userId: cuser.userId,
          userName: cuser.userName,
          robot: cuser.userName === "robot",
        },
        messages: [],
      });
      this.$router.push("/chat-list");
    },
    getRequestFriends() {
      friendsRequest().then((res) => {
        this.friendRequest = res.data;
        this.newRequestCount = res.newRequestCount;
      });
    },
    getFriends() {
      getFriends().then((res) => {

        let data = res.data;
        this.SET_FRIENDS(data);
        localStorage.setItem(
          "friendList:" + this.user.userId,
          JSON.stringify(data)
        );
        let f = new Array();
        f = data;
        const set = new Set();
        f.forEach((u) => {
          let letter = pinyin(u.nickName, {
            pattern: "first",
            toneType: "none",
            type: "array",
          })[0].toUpperCase();
          set.add(letter);
        });
        let result = new Array();
        set.forEach((l) => {
          let letterObj = {
            letter: l,
            users: [],
          };
          f.forEach((u) => {
            if (
              l ===
              pinyin(u.nickName, {
                pattern: "first",
                toneType: "none",
                type: "array",
              })[0].toUpperCase()
            ) {
              letterObj.users.push(u);
            }
          });
          result.push(letterObj);
        });
        this.friends = result;
      });
      this.selectId = this.friends[0]?.users[0].userId || 0;
    },
    // 搜索功能
    handleSearch(v) {
      this.searchValue = v;
    },
    handleClear() {
      this.searchValue = "";
    },
    handleAdd() {
      addUserByUserId(this.searchUser.userId).then(() => {
        Message({ message: "发送好友请求成功!", type: "success" });
      });
    },
    async doHandle(requestId, status) {
      await changeRequestStatus(requestId, status)
      this.getRequestFriends();
      this.getFriends()
    },
    handleDelete(index, row) {
      console.log(index, row);
      this.$confirm(`确定删除该好友?`, "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          deleteFriend(row.userId).then(() => {
            getFriends().then((res) => {
              this.SET_FRIENDS(res.data);
              this.$message({
                type: "success",
                message: "删除成功!",
              });
            });
            this.getFriends()
          });
        })
        .catch(() => {});
    },
  },
  computed: {
    ...mapState(["friendList", "user"]),
    currentUser() {
      // 根据userId返回用户信息
      let user = null;
      for (let i = 0; i < this.friends.length; i++) {
        const friend = this.friends[i];
        user = friend.users.find((u) => {
          return u.userId === this.selectId;
        });
        if (user) {
          break;
        }
      }
      return user;
    },

    searchList() {
      const friends = [];
      for (let i = 0; i < this.friends.length; i++) {
        const friend = this.friends[i];

        let users = friend.users.filter((u) => {
          return u.nickName.startsWith(this.searchValue);
        });

        if (users.length > 0) {
          friends.push({
            letter: friend.letter,
            users: users,
          });
        }
      }
      if (friends.length > 0) {
        this.selectId = friends[0].users[0]?.id || 0;
      }
      return friends;
    },
  },
  watch: {
    friendsUsername(newValue) {
      if (newValue.trim().length === 0) {
        return;
      }
      searchFriends(this.friendsUsername).then((res) => {
        if (res.data) {
          this.searchUser = res.data;
          this.hasSearchUser = false;
        } else {
          this.hasSearchUser = true;
        }
      });
    },
  },
};
</script>

<style scoped lang="less">
.container {
  display: flex;
  width: 800px;

  .friend-wrapper {
    width: 250px;
    background: rgb(230, 230, 230);

    // 搜索框
    .wrapper {
      padding: 22px 12px 12px 12px;
      background: #f7f7f7;
      .search-wrapper {
        position: relative;
        display: flex;
        box-sizing: border-box;
        height: 26px;
        width: 100%;
        background-color: #e5e3e2;
        border: 1px solid #d9d7d6;
        border-radius: 2px;
        .searchInput {
          flex: 1;
          font-size: 12px;
          padding: 6px;
          background-color: #e5e3e2;
          outline: none;
          &:focus {
            background-color: #f2efee;
          }
        }
        .icon-search {
          display: inline-block;
          width: 24px;
          height: 24px;
          font-size: 14px;
          line-height: 24px;
          text-align: center;
        }
        .searchInput-delete {
          display: block;
          position: absolute;
          outline: none;
          top: 0;
          right: 0;
          width: 24px;
          height: 100%;
          background-image: url(../../../public/images/delete.png);
          background-size: 26px;
          background-position: center;
          background-repeat: no-repeat;
          cursor: pointer;
        }
      }
    }
    // 好友列表
    .friend-list {
      height: 540px;
      overflow-y: auto;
      .friend-item {
        border-top: 1px solid #dadada;
        &:first-child,
        &.no-border {
          border-top: none;
        }
        .list-title {
          box-sizing: border-box;
          width: 100%;
          font-size: 12px;
          padding: 15px 0 3px 12px;
          color: #999;
        }

        .addr-manage {
          display: flex;
          padding: 12px;
          transition: background-color 0.1s;
          font-size: 0;
          margin: 0 auto;
          .addr-box {
            width: 280px;
            height: 45px;
            background-color: #fff;
          }
          .remark {
            font-size: 14px;
            line-height: 45px;
            text-align: center;
          }
        }

        .friend-info {
          display: flex;
          padding: 12px;
          transition: background-color 0.1s;
          font-size: 0;
          &:hover {
            background-color: rgb(220, 220, 220);
          }
          &.active {
            background-color: #c4c4c4;
          }
          .avatar {
            border-radius: 2px;
            margin-right: 12px;
          }
          .remark {
            font-size: 14px;
            line-height: 36px;
          }
        }
      }
    }
  }

  .friend-info {
    flex: 1;
    .new-friend {
      height: 60px;
      padding: 28px 0 0 30px;
      box-sizing: border-box;
      border-bottom: 1px solid #e7e7e7;
      .nickname {
        font-size: 18px;
      }
    }
    .friend-info {
      padding: 0 90px;
      .es-info {
        display: flex;
        align-items: center;
        padding: 100px 0 45px 0;
        .left {
          flex: 1;
          .people {
            .nickname {
              display: inline-block;
              font-size: 20px;
              margin-bottom: 16px;
            }
            .gender-male,
            .gender-female {
              display: inline-block;
              width: 18px;
              height: 18px;
              vertical-align: top;
              margin-top: 2px;
            }
            .gender-male {
              background-image: url(../../../public/images/man.png);
              background-size: cover;
            }
            .gender-female {
              background-image: url(../../../public/images/woman.png);
              background-size: cover;
            }
          }
          .signature {
            font-size: 14px;
            color: rgba(153, 153, 153, 0.8);
          }
        }
        .right {
          .avatar {
            border-radius: 3px;
          }
        }
      }
      .detInfo {
        padding: 40px 0;
        border-top: 1px solid #e7e7e7;
        border-bottom: 1px solid #e7e7e7;
        .remark,
        .area,
        .wxid {
          font-size: 14px;
          margin-top: 20px;
          span {
            font-size: 14px;
            color: rgba(153, 153, 153, 0.8);
            margin-right: 40px;
          }
        }
        .remark {
          margin-top: 0;
        }
      }
      .send {
        position: relative;
        text-align: center;
        width: 140px;
        height: 36px;
        left: 115px;
        top: 50px;
        line-height: 36px;
        font-size: 14px;
        color: #fff;
        background-color: #1aad19;
        cursor: pointer;
        border-radius: 2px;
        &:hover {
          background: rgb(18, 150, 17);
        }
      }
    }
  }
}
</style>
