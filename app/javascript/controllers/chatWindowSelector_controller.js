console.log('checking if this JS file is loading');
console.log('Going to create html selectors for each of the cards being displayed...');
const eventCards = document.querySelectorAll('.event-card');
console.log(eventCards)
console.log('Trying to print out the id of each event...');
eventCards.forEach(card => console.log(card.dataset.eventid));
console.log('Trying to create html selectors for each chat window...');
const eventChatWindows = document.querySelectorAll('.chat-container');
console.log('Trying to print out the event ID from each of the chat window html elements...');
eventChatWindows.forEach(window => console.log(window.dataset.eventid));
console.log('trying to create the logic of identifying every time someone clicks on a card...');


eventCards.forEach(card => {
  card.addEventListener('click', (event) => {
    console.log(event.currentTarget.dataset.eventid);
    eventChatWindows.forEach(window => {
      console.log(window.dataset.eventid)
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

