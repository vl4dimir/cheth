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
	event NotRegistered(address from);
	event UserRegister(address from, string nickname);
	event UserJoin(address from, string nickname);
	event UserLeave(address from, string nickname);

	function Chat() {
		owner = msg.sender;
	}

	function register(string nickname) {
		users[msg.sender].nickname = nickname;

		UserRegister(msg.sender, nickname);
	}

	function join() {
		onlineUsers.push(msg.sender);

		// Index will be off-by-one intentionally, see comment for onlineIndex
		users[msg.sender].onlineIndex = onlineUsers.length;

		UserJoin(msg.sender, users[msg.sender].nickname);
	}

	function leave() {
		uint index = users[msg.sender].onlineIndex;
		if (index > 0) {
			delete onlineUsers[index - 1];
			users[msg.sender].onlineIndex = 0;
		}

		UserLeave(msg.sender, users[msg.sender].nickname);
	}

	function sendMessage(string message) {
		if (bytes(users[msg.sender].nickname).length == 0) {
			NotRegistered(msg.sender);
			return;
		}

		SendMessage(msg.sender, users[msg.sender].nickname, message);
	}
}
