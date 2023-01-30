<template>
  <div class="wrapper">
    <div class="search-wrapper">
      <i v-if="!searchValue" class="icon iconfont icon-search"></i>
      <div v-else class="searchInput-delete" @click="handleClear"></div>
      <input
        ref="searchInput"
        @keyup.enter="handleEnter"
        type="text"
        @input="handleSearch"
        v-model="searchValue"
        class="searchInput"
        placeholder="搜索"
      />
    </div>
    <div class="search-wrapper-add" @click="dialogFormVisible = true">
      <svg
        t="1673607822220"
        class="icon"
        viewBox="0 0 1024 1024"
        version="1.1"
        xmlns="http://www.w3.org/2000/svg"
        p-id="3651"
        width="16"
        height="16"
      >
        <path
          d="M512 512V170.666667h42.666667v341.333333h341.333333v42.666667h-341.333333v341.333333h-42.666667v-341.333333H170.666667v-42.666667h341.333333z"
          fill="#444444"
          p-id="3652"
        ></path>
      </svg>
    </div>

    <el-dialog title="添加新好友" :visible.sync="dialogFormVisible" width="30%">
      <el-form :model="form">
        <el-form-item label="好友账号" :label-width="formLabelWidth">
          <el-input v-model="form.username" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <el-result
        v-if="showResult"
        :title="serachUserInfo?.username"
        :subTitle="serachUserInfo?.nickName"
      >
        <template slot="icon">
          <el-image :src="serachUserInfo.avatar"></el-image>
        </template>

        <template slot="extra">
          <el-button type="primary" size="medium" @click="addNewFriendsRequest"
            >添加好友</el-button
          >
        </template>
      </el-result>

      <el-empty
        v-show="!showResult"
        description="未查询到用户，请检查用户名是否正确"
      ></el-empty>

      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="handleSerach">查 找</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { Notification } from "element-ui";

import { searchFriends, addUserByUserId } from "@/api/user";
export default {
  data() {
    return {
      searchValue: "",
      dialogFormVisible: false,
      form: {
        username: "",
      },
      formLabelWidth: "100px",
      showResult: false,
      serachUserInfo: {},
    };
  },
  methods: {
    handleSearch() {
      this.$emit("search", this.searchValue);
    },
    handleClear() {
      this.searchValue = "";
      this.$refs.searchInput.focus();
      this.$emit("clear");
    },
    handleEnter() {
      this.$emit("enter");
    },

    handleSerach() {
      searchFriends(this.form.username).then((res) => {
        console.log(res);
        this.serachUserInfo = res.data;
        console.log(res.data);
        if (res.data) {
          console.log("查询到数据");
          this.showResult = true;
        } else {
          console.log("未查询到数据");
          this.showResult = false;
        }
      });
    },
    addNewFriendsRequest() {
      addUserByUserId(this.serachUserInfo.userId).then(() => {
        Notification.success({
          title: "请求已发送,请耐心等待对方同意",
          position: "top-right",
        });
      });
    },
  },

  watch: {
    "form.username": {
      deep: true,
      handler(newValue) {
        if (newValue.trim().length === 0) {
          return;
        }
        searchFriends(this.form.username).then((res) => {
          console.log(res);
          this.serachUserInfo = res.data;
          console.log(res.data);
          if (res.data) {
            console.log("查询到数据");
            this.showResult = true;
          } else {
            console.log("未查询到数据");
            this.showResult = false;
          }
        });
      },
    },
  },
};
</script>

<style scoped lang="less">
.wrapper {
  padding: 22px 12px 12px 12px;
  display: flex;
}
.wrapper .search-wrapper {
  float: left;
  position: relative;
  display: flex;
  box-sizing: border-box;
  height: 26px;
  width: 90%;
  background-color: #e5e3e2;
  border: 1px solid #d9d7d6;
  border-radius: 6px;
}

.wrapper .search-wrapper-add {
  float: right;
  margin-left: 10px;
  padding-left: 3px;
  box-sizing: border-box;
  height: 26px;
  width: 26px;
  background-color: #e5e3e2;
  border: 1px solid #d9d7d6;
  border-radius: 6px;
  line-height: 26px;
}
.wrapper .search-wrapper .searchInput {
  flex: 1;
  font-size: 12px;
  padding: 6px;
  background-color: #e5e3e2;
  width: 100%;

  outline: none;
}
.wrapper .search-wrapper .searchInput:focus {
  background-color: #f2efee;
}
.wrapper .search-wrapper .icon-search {
  display: inline-block;
  width: 24px;
  height: 24px;
  font-size: 14px;
  line-height: 24px;
  text-align: center;
}
.wrapper .search-wrapper .searchInput-delete {
  display: block;
  position: absolute;
  outline: none;
  top: 0;
  right: 0;
  width: 24px;
  height: 100%;
  background-image: url(../../public/images/delete.png);
  background-size: 26px;
  background-position: center;
  background-repeat: no-repeat;
  cursor: pointer;
}
</style>
