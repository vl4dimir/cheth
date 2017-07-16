pragma solidity ^0.4.2;

contract Chat {
	struct User {
		string nickname;

		// An off-by-one index of this user in the onlineUsers map. If it's zero, the user is not
		// online. When calculating the actual index, one is subtracted from the current value.
		uint onlineIndex;
	}

	address owner;
	mapping(address => User) users;
	address[] onlineUsers;

	event SendMessage(address from, string nickname, string message);

	function Chat() {
		owner = msg.sender;
	}

	function register(string nickname) {
		users[msg.sender].nickname = nickname;
	}

	function join() {
		onlineUsers.push(msg.sender);

		// Index will be off-by-one intentionally, see comment for onlineIndex
		users[msg.sender].onlineIndex = onlineUsers.length;
	}

	function leave() {
		uint index = users[msg.sender].onlineIndex;
		if (index > 0) {
			delete onlineUsers[index - 1];
			users[msg.sender].onlineIndex = 0;
		}
	}

	function sendMessage(string message) {
		SendMessage(msg.sender, users[msg.sender].nickname, message);
	}
}
