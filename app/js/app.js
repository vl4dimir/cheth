document.addEventListener("DOMContentLoaded", function(event) {

    console.log(Chat);

    Chat.sendMessage("Hello world!");


    Chat.SendMessage().then(function(event) { 
        console.log("Message");
        console.log(event) 
    });
});