import consumer from "./consumer";

const initEventMessages = () => {
  const messagesContainers = document.querySelectorAll('.chat-container');
  if (messagesContainers) {
    messagesContainers.forEach((container) => {
      const eventId = container.dataset.eventid
      consumer.subscriptions.create(
        { channel: "EventChannel", id: eventId },
        {
          // called when data is broadcast in the cable
          received(data) {
            const currentUserId = $(".chat-container").first().attr('data-my-user-id');
            const currentUserMessages = document.querySelectorAll("div[data-message-userid=\""+currentUserId+"\"]");

            currentUserMessages.forEach(message => {
              moveChatLogRight(message);
            })
            // Clear chat message in input
            container.querySelector(".chat-input-area__input")
              .value = ""
            // Append new chat message
            container.querySelector('.messages')
              .insertAdjacentHTML("beforeend", data)
            // scroll to chat end
            container.scrollTo(0, container.scrollHeight)
          },
        }
      )
    })
  }
};


function moveChatLogRight(message) {
  message.classList.add("my-messages");
}

export { initEventMessages }
