// create element selectors
const button_myEvents = document.querySelector('#my-events')
const button_eventsJoined = document.querySelector('#events-joined')
const dashboardEvents = document.querySelectorAll('.dashboardEvent')
const cards = document.querySelectorAll('.event-card')

dashboardEvents.forEach(item => {
  console.log(item.dataset.eventid)
})


cards.forEach(card => {
  card.addEventListener('click', (event) => {
    console.log('you clicked on a card')
    console.log(card)
    updateDasboardWithCard(card)
  })
})


button_myEvents.addEventListener('click', (event) => {
  console.log('you clicked on my events button')
  toggleVisibleCardsMyEvents(cards);
})

button_eventsJoined.addEventListener('click', (event) => {
  console.log('you clicked on joined events button')
  toggleVisibleCardsOtherEvents(cards);
})

function toggleVisibleCardsMyEvents(cards) {
  console.log('function triggered');
  cards.forEach(card => {
    if (card.dataset.myevent == "true") {
      console.log('this card is yours')
      card.style.display = "block";
    } else {
      console.log("this card isn't yours");
      card.style.display = "none";
    }
  }
)
}

function toggleVisibleCardsOtherEvents(cards) {
  console.log('function triggered');
  cards.forEach(card => {
    if (card.dataset.myevent == "true") {
      console.log('this card is yours')
      card.style.display = "none";
    } else {
      console.log("this card isn't yours");
      card.style.display = "block";
    }
  }
)
}

function updateDasboardWithCard(card) {
  // extract the event id from the card
  console.log('the event id of this card is')
  console.log(card.dataset.eventid)
  // go find/select the event id in the dashboard column with the same event id

  // set that event id to normal display and to none for all the others.
}




