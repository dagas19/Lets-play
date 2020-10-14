const currentUserId = $(".chat-container").first().attr('data-my-user-id');
const currentUserMessages = document.querySelectorAll("div[data-message-userid=\""+currentUserId+"\"]");

currentUserMessages.forEach(message => {
  moveChatLogRight(message);
})

function moveChatLogRight(message) {
  message.classList.add("my-messages");
}


