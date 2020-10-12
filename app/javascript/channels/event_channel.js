import consumer from "./consumer";
import import '../app/assets/stylesheets/application.scss';

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

scrollContents(chatLog[0]);
export { initEventMessages }
