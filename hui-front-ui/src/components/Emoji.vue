<template>
  <div class="emoji">
    <i class="icon iconfont icon-look" @click="changeShow(!isShow)"></i>
    <div class="emojiBox" v-show="isShow">
      <li v-for="emoji in emojis" :key="emoji.code" @click="handleEmoji(emoji.code)">
        <img
          :src="'/images/emoji/' + emoji.file"
          :data="emoji.code"
          :title="emoji.title"
        />
      </li>
    </div>
  </div>
</template>

<script>
import { mapState } from 'vuex';
export default {
  name: "Emoji",
  props: ["isShow"],
  data() {
    return {
   
    };
  },
  computed:{
    ...mapState(['emojis'])
  },

  methods: {

    changeShow(isShow) {
      this.$emit("changeShow", isShow);
    },
    handleEmoji(code){
      this.$emit("onClickEmoji",code)
    }
  },
};
</script>

<style scoped>
.emoji {
  position: relative;
  width: 100%;
  height: 27px;
  line-height: 35px;
  font-size: 12px;
  padding: 0 10px;
  box-sizing: border-box;
  color: #7c7c7c;
  display: inline;
}
.emoji .icon-look {
  cursor: pointer;
}
.emoji .icon-look:hover {
  color: #1aad19;
}
.emoji .emojiBox {
  position: absolute;
  display: flex;
  flex-wrap: wrap;
  top: -210px;
  left: -100px;
  width: 300px;
  height: 200px;
  padding: 5px;
  background-color: #fff;
  border: 1px solid #d1d1d1;
  border-radius: 2px;
  box-shadow: 0 1px 2px 1px #d1d1d1;
}
.emoji .emojiBox.showbox-enter-active,
.emoji .emojiBox.showbox-leave-active {
  transition: all 0.5s;
}
.emoji .emojiBox.showbox-enter,
.emoji .emojiBox.showbox-leave-active {
  opacity: 0;
}
</style>
