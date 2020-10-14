const eventCards = document.querySelectorAll('.event-card');
const eventChatWindows = document.querySelectorAll('.chat-container');

eventCards.forEach(card => {
  card.addEventListener('click', (event) => {
    eventChatWindows.forEach(window => {
      if (event.currentTarget.dataset.eventid == window.dataset.eventid) {
        window.classList.remove("hidden-chat");
        window.classList.add("not-hidden-chat");
      } else {
        window.classList.remove("not-hidden-chat");
        window.classList.add("hidden-chat");
      }
    })
  })
});

