import consumer from "./consumer";

document.addEventListener('turbolinks:load', () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;

    consumer.subscriptions.create({ channel: "EventChannel", id: id }, {
      received(data) {
        messagesContainer.insertAdjacentHTML('beforeend', data); // called when data is broadcast in the cable
      }
    });
  }
});
