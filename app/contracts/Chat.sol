pragma solidity ^0.4.2;

contract Chat {
	address owner;
	/*mapping(address => Voter) voters;*/

	event SendMessage(address from, address to, string message);

	function Chat() {
		owner = msg.sender;
	}

	function sendMessage(address to, string message) {
		SendMessage(msg.sender, to, message);
	}
}
