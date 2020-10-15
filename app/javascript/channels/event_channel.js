import consumer from "./consumer";

const initEventMessages = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.eventId;
    console.log('hi dag')

    consumer.subscriptions.create({ channel: "EventChannel", id: id }, {
      received(data) {
        console.log('hello, John', data, messageContainer);
        messagesContainer.insertAdjacentHTML('beforeend', data); // called when data is broadcast in the cable
      }
    });
  }
};

export { initEventMessages }
