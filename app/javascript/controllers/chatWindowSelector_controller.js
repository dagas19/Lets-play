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
console.log('trying to create the log of identifying every time someone clicks on a card...');

