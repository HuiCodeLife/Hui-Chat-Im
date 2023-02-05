import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);
import {getToken, setToken, removeToken} from "@/utils/auth";
import {login, logout, getInfo} from "@/api/login";
import {pullUnreadMessage} from "@/api/user";
import {Notification} from "element-ui";

import SockJS from "sockjs-client";
import Stomp from "stompjs";
import newMsg from "@/assets/audio/newMsg.mp3";

const state = {
    token: getToken(),
    // 当前登录的用户信息
    user: JSON.parse(localStorage.getItem("user")) || {},
    // 最近聊天的好友
    recentFriends: [],
    friendList: [],
    // 表情数据
    emojis: [
        {file: "100.gif", title: "微笑"},
        {file: "101.gif", title: "伤心" },
        {file: "102.gif", title: "美女"},
        {file: "103.gif", title: "发呆"},
        {file: "104.gif", title: "墨镜"},
        {file: "105.gif", title: "哭" },
        {file: "106.gif", title: "羞" },
        {file: "107.gif", title: "哑"},
        {file: "108.gif", title: "睡" },
        {file: "109.gif", title: "哭"},
        {file: "110.gif", title: "囧"},
        {file: "111.gif", title: "怒" },
        {file: "112.gif", title: "调皮"},
        {file: "113.gif", title: "笑"},
        {file: "114.gif", title: "惊讶"},
        {file: "115.gif", title: "难过"},
        {file: "116.gif", title: "酷"},
        {file: "117.gif", title: "汗"},
        {file: "118.gif", title: "抓狂"},
        {file: "119.gif", title: "吐"},
        {file: "120.gif", title: "笑"},
        {file: "121.gif", title: "快乐"},
        {file: "122.gif", title: "奇"},
        {file: "123.gif", title: "傲"},
        {file: "124.gif", title: "饿"},
        {file: "125.gif",title: "累"},
        {file: "126.gif", title: "吓"},
        {file: "127.gif", title: "汗"},
        {file: "128.gif", title: "高兴"},
        {file: "129.gif", title: "闲"},
        {file: "130.gif", title: "努力"},
        {file: "131.gif", title: "骂"},
        {file: "133.gif", title: "秘密"},
        {file: "134.gif", title: "乱"},
        {file: "135.gif", title: "疯"},
        {file: "136.gif",title: "哀"},
        {file: "137.gif", title: "鬼"},
        {file: "138.gif", title: "打击"},
        {file: "139.gif",title: "bye"},
        {file: "142.gif", title: "鼓掌"},
        {file: "145.gif", title: "什么"},
        {file: "147.gif", title: "累"},
        {file: "153.gif", title: "吓"},
        {file: "155.gif", title: "刀"},
        {file: "156.gif", title: "水果"},
        {file: "157.gif", title: "酒"},
        {file: "158.gif", title: "篮球"},
        {file: "159.gif", title: "乒乓"},
    ],
    stomp: null,
};


const actions = {
    // 登录
    Login({commit}, userInfo) {
        const username = userInfo.username.trim();
        const password = userInfo.password;
        const code = userInfo.code;
        const uuid = userInfo.uuid;
        return new Promise((resolve, reject) => {
            login(username, password, code, uuid)
                .then((res) => {
                    setToken(res.token);
                    commit("SET_TOKEN", res.token);
                    resolve();
                })
                .catch((error) => {
                    reject(error);
                });
        });
    },
    // 获取用户信息
    GetInfo({commit}) {
        return new Promise((resolve, reject) => {
            getInfo()
                .then((res) => {
                    const user = res.user;
                    commit("SET_USER", user);
                    localStorage.setItem("user", JSON.stringify(user));
                    resolve(res);
                })
                .catch((error) => {
                    reject(error);
                });
        });
    },
    // 退出系统
    LogOut({commit, state}) {
        return new Promise((resolve, reject) => {
            logout(state.token)
                .then(() => {
                    commit("SET_TOKEN", "");
                    removeToken();
                    localStorage.removeItem("user");
                    resolve();
                })
                .catch((error) => {
                    reject(error);
                });
        });
    },

    Connect({commit, state}) {
        if (state.stomp == null || !state.stomp.connected) {
            console.log("当前处于断开状态,尝试链接");
            //连接成功后，主动拉取未读消息
            pullUnreadMessage("/topic/reply").then((res) => {
                let unReadMsgArr = res.data;
                for (let i = 0; i < unReadMsgArr.length; i++) {
                    let receiveMsg = JSON.parse(unReadMsgArr[i]);
                    let receiverChatFriend = state.friendList.find((f) => {
                        return f.userName === receiveMsg.from;
                    });
                    let data = {
                        user: {
                            nickName: receiverChatFriend.nickName,
                            avatar: receiverChatFriend.avatar,
                            userId: receiverChatFriend.userId,
                            userName: receiverChatFriend.userName,
                            robot: receiverChatFriend.userName === "robot",
                        },
                        messages: [],
                    };
                    commit("ADD_RECENT_FRIEND", data);
                    let receiverChatFriend2 = state.recentFriends.find((f) => {
                        return f.user.userName === receiveMsg.from;
                    });
                    receiverChatFriend2.messages.push({
                        time: receiveMsg.createTime,
                        msg: receiveMsg.content,
                        self: false,
                    });
                    localStorage.setItem(
                        "recentFriends:" + state.user.userId,
                        JSON.stringify(state.recentFriends)
                    );
                }
                if (unReadMsgArr.length > 0) {
                    let player = new Audio(newMsg);
                    player.play();
                    Notification.success({
                        title: "提示",
                        message: "您有新的消息",
                        position: "top-right",
                    });
                }
            });
            state.stomp = Stomp.over(new SockJS("http://localhost:8080/ws/ep"));
            state.stomp.connect({Authorization: state.token}, () => {
                // 订阅私人聊天消息
                state.stomp.subscribe("/user/queue/chat", (msg) => {
                    handlerMsg(msg, state, commit);
                });

                // 订阅聊天机器人聊天消息
                state.stomp.subscribe("/user/queue/robot", (msg) => {
                    handlerMsg(msg, state, commit);
                });

            }),
                () => {
                    Notification.error({
                        title: "系统消息",
                        message: "无法与服务端建立连接，请尝试重新登陆系统~",
                        position: "top-right",
                    });
                }
        } else {
            console.info("当前处于链接状态");
        }
    },

    Disconnect({state}) {
        if (state.stomp != null) {
            state.stomp.disconnect();
            console.log("关闭连接~");
        }
    },
};
const mutations = {

    SET_TOKEN: (state, token) => {
        state.token = token;
    },
    ADD_RECENT_FRIEND(state, data) {
        const index = state.recentFriends.findIndex((v) => {
            return v.user.userName === data.user.userName;
        });
        console.log(index);
        if (index < 0) {
            state.recentFriends.unshift(data);
        } else {
            const tmp = state.recentFriends.splice(index, 1);
            state.recentFriends.unshift(tmp[0]);
        }
        localStorage.setItem(
            "recentFriends:" + state.user.userId,
            JSON.stringify(state.recentFriends)
        );
    },

    REMOVE_RECENT_FRIEND(state, data) {
        const index = state.recentFriends.findIndex((v) => {
            return v.user.userName === data.user.userName;
        });
        state.recentFriends.splice(index, 1);
        localStorage.setItem(
            "recentFriends:" + state.user.userId,
            JSON.stringify(state.recentFriends)
        );
    },

    LOAD_RECENT_FRIENDS(state) {
        state.recentFriends = JSON.parse(
            localStorage.getItem("recentFriends:" + state.user.userId) || "[]"
        );
    },

    SET_FRIENDS: (state, friendList) => {
        state.friendList = friendList;
        console.log("好友信息载入完成");
    },
    SET_USER: (state, user) => {
        state.user = user;
    },
    SET_AVATAR: (state, avatar) => {
        state.user.avatar = avatar;
    },
};

export default new Vuex.Store({
    state,
    actions,
    mutations,
});
function handlerMsg(msg, state, commit) {
    let res = JSON.parse(msg.body);
    if (res.code !== 2000) {
        alert("不是好友,消息发送失败!");

        return;
    }
    let receiveMsg = res.data;
    // 新消息通知
    Notification.success({
        title: "【" + receiveMsg.fromNickName + "】发来一条消息",
        message:
            receiveMsg.content.length < 8
                ? receiveMsg.content
                : receiveMsg.content.substring(0, 8) + "...",
        position: "top-right",
    });
    let player = new Audio(newMsg);
    player.play();
    let receiverChatFriend = state.friendList.find((f) => {
        return f.userName === receiveMsg.from;
    });
    let data = {
        user: {
            nickName: receiverChatFriend.nickName,
            avatar: receiverChatFriend.avatar,
            userId: receiverChatFriend.userId,
            userName: receiverChatFriend.userName,
            robot: receiverChatFriend.userName === "robot",
        },
        messages: [],
    };
    commit("ADD_RECENT_FRIEND", data);
    let receiverChatFriend2 = state.recentFriends.find((f) => {
        return f.user.userName === receiveMsg.from;
    });
    receiverChatFriend2.messages.push({
        time: receiveMsg.createTime,
        msg: receiveMsg.content,
        self: false,
    });
    localStorage.setItem(
        "recentFriends:" + state.user.userId,
        JSON.stringify(state.recentFriends)
    );
}
