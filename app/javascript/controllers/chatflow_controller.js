const currentUserMessages = document.querySelectorAll("div[data-mymessage='true']");
currentUserMessages.forEach(message => {
  moveChatLogRight(message);
})

const chatInputField = document.querySelector(".chat-input-area__input");

chatInputField.addEventListener('submit', (event) => {
  const currentUserMessages = document.querySelectorAll("div[data-mymessage='true']");

  currentUserMessages.forEach(message => {
  moveChatLogRight(message);
})
})







function moveChatLogRight(message) {
  message.classList.add("my-messages");
}


