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
        {file: "100.gif", code: "/::)", title: "微笑", reg: /\/::\)/g},
        {file: "101.gif", code: "/::~", title: "伤心", reg: /\/::~/g},
        {file: "102.gif", code: "/::B", title: "美女", reg: /\/::B/g},
        {file: "103.gif", code: "/::|", title: "发呆", reg: /\/::\|/g},
        {file: "104.gif", code: "/:8-)", title: "墨镜", reg: /\/:8-\)/g},
        {file: "105.gif", code: "/::<", title: "哭", reg: /\/::</g},
        {file: "106.gif", code: "/::$", title: "羞", reg: /\/::\$/g},
        {file: "107.gif", code: "/::X", title: "哑", reg: /\/::X/g},
        {file: "108.gif", code: "/::Z", title: "睡", reg: /\/::Z/g},
        {file: "109.gif", code: "/::'(", title: "哭", reg: /\/::'\(/g},
        {file: "110.gif", code: "/::-|", title: "囧", reg: /\/::-\|/g},
        {file: "111.gif", code: "/::@", title: "怒", reg: /\/::@/g},
        {file: "112.gif", code: "/::P", title: "调皮", reg: /\/::P/g},
        {file: "113.gif", code: "/::D", title: "笑", reg: /\/::D/g},
        {file: "114.gif", code: "/::O", title: "惊讶", reg: /\/::O/g},
        {file: "115.gif", code: "/::(", title: "难过", reg: /\/::\(/g},
        {file: "116.gif", code: "/::+", title: "酷", reg: /\/::\+/g},
        {file: "117.gif", code: "/:--b", title: "汗", reg: /\/:--b/g},
        {file: "118.gif", code: "/::Q", title: "抓狂", reg: /\/::Q/g},
        {file: "119.gif", code: "/::T", title: "吐", reg: /\/::T/g},
        {file: "120.gif", code: "/:,@P", title: "笑", reg: /\/:,@P/g},
        {file: "121.gif", code: "/:,@-D", title: "快乐", reg: /\/:,@-D/g},
        {file: "122.gif", code: "/::d", title: "奇", reg: /\/::d/g},
        {file: "123.gif", code: "/:,@o", title: "傲", reg: /\/:,@o/g},
        {file: "124.gif", code: "/::g", title: "饿", reg: /\/::g/g},
        {file: "125.gif", code: "/:|-)", title: "累", reg: /\/:\|-\)/g},
        {file: "126.gif", code: "/::!", title: "吓", reg: /\/::!/g},
        {file: "127.gif", code: "/::L", title: "汗", reg: /\/::L/g},
        {file: "128.gif", code: "/::>", title: "高兴", reg: /\/::>/g},
        {file: "129.gif", code: "/::,@", title: "闲", reg: /\/::,@/g},
        {file: "130.gif", code: "/:,@f", title: "努力", reg: /\/:,@f/g},
        {file: "131.gif", code: "/::-S", title: "骂", reg: /\/::-S/g},
        {file: "133.gif", code: "/:,@x", title: "秘密", reg: /\/:,@x/g},
        {file: "134.gif", code: "/:,@@", title: "乱", reg: /\/:,@@/g},
        {file: "135.gif", code: "/::8", title: "疯", reg: /\/::8/g},
        {file: "136.gif", code: "/:,@!", title: "哀", reg: /\/:,@!/g},
        {file: "137.gif", code: "/:!!!", title: "鬼", reg: /\/:!!!/g},
        {file: "138.gif", code: "/:xx", title: "打击", reg: /\/:xx/g},
        {file: "139.gif", code: "/:bye", title: "bye", reg: /\/:bye/g},
        {file: "142.gif", code: "/:handclap", title: "鼓掌", reg: /\/:handclap/g},
        {file: "145.gif", code: "/:<@", title: "什么", reg: /\/:<@/g},
        {file: "147.gif", code: "/::-O", title: "累", reg: /\/::-O/g},
        {file: "153.gif", code: "/:@x", title: "吓", reg: /\/:@x/g},
        {file: "155.gif", code: "/:pd", title: "刀", reg: /\/:pd/g},
        {file: "156.gif", code: "/:<W>", title: "水果", reg: /\/:<W>/g},
        {file: "157.gif", code: "/:beer", title: "酒", reg: /\/:beer/g},
        {file: "158.gif", code: "/:basketb", title: "篮球", reg: /\/:basketb/g},
        {file: "159.gif", code: "/:oo", title: "乒乓", reg: /\/:oo/g},
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
