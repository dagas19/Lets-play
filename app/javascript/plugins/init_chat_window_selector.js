const initChatWindowSelector = () => {
  const eventCards = document.querySelectorAll('.event-card');
  const eventChatWindows = document.querySelectorAll('.chat-container');
  const eventChatWindowTitles = document.querySelectorAll('.chat-title');
  console.log(eventChatWindowTitles);

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
      eventChatWindowTitles.forEach(title => {
        if (event.currentTarget.dataset.eventid == title.dataset.eventid) {
          title.classList.remove("hidden-chat");
          title.classList.add("not-hidden-chat");
        } else {
          title.classList.remove("not-hidden-chat");
          title.classList.add("hidden-chat");
        }
      })
    })
  });
};


export { initChatWindowSelector };
