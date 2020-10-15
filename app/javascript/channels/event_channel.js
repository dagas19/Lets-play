import consumer from "./consumer";

const initEventMessages = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.eventId;

    consumer.subscriptions.create({ channel: "EventChannel", id: id }, {
      received(data) {
        messagesContainer.insertAdjacentHTML('beforeend', data);
         // called when data is broadcast in the cable
        const currentUserId = $(".chat-container").first().attr('data-my-user-id');
        const currentUserMessages = document.querySelectorAll("div[data-message-userid=\""+currentUserId+"\"]");

        currentUserMessages.forEach(message => {
          moveChatLogRight(message);
        })
      }
    });
  }
};


function moveChatLogRight(message) {
  message.classList.add("my-messages");
}

export { initEventMessages }
