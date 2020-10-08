import consumer from "./consumer";

const initEventMessages = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.eventId;

    consumer.subscriptions.create({ channel: "EventChannel", id: id }, {
      received(data) {
        messagesContainer.insertAdjacentHTML('beforeend', data); // called when data is broadcast in the cable
      }
    });
  }
};

export { initEventMessages }
