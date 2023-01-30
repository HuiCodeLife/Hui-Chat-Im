import Cookies from "js-cookie";

const FriendList = "FriendList";

export function getFriendList(userId) {
  return Cookies.get(FriendList+userId);
}

export function setFriendList(userId,friendList) {
  return Cookies.set(FriendList + userId, friendList);
}
export function removeFriendList(userId) {
  return Cookies.remove(FriendList+userId);
}

const RecentFriends = "RecentFriends";

export function getRecentFriends(userId) {
  return Cookies.get(RecentFriends+userId);
}

export function setRecentFriends(userId,recentFriends) {
  return Cookies.set(RecentFriends + userId, recentFriends);
}
export function removeRecentFriendst(userId) {
  return Cookies.remove(RecentFriends+userId);
}

