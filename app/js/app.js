document.addEventListener("DOMContentLoaded", function(event) {

    console.log(Chat);

    Chat.sendMessage("Hello world!");


    // Events

    Chat.UserRegister().then(function(event) {

        console.log("New user: ", event.args.nickname);
        Chat.sendMessage("Hello world!");
    });


    Chat.NotRegistered().then(function(event) {

        if(event.args.from == web3.eth.accounts[0]) {
            console.log("Sorry your nickname is empty. Please register!");
            console.log(event)
        } else {
            console.log("this isn't message for you, ignore...");
        }

        Chat.register("Steamrunner");
    });

    Chat.SendMessage().then(function(event) {
        console.log("Message", event.args.message);
    });
});