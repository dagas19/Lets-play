// create element selectors
const button_myEvents = document.querySelector('#my-events')
const button_eventsJoined = document.querySelector('#events-joined')
const dashboardEvents = document.querySelectorAll('.dashboardEvent')
const cards = document.querySelectorAll('.event-card')

cards.forEach(card => {
  card.addEventListener('click', (event) => {
    updateDasboardWithCard(card)
  })
})

button_myEvents.addEventListener('click', (event) => {
  toggleVisibleCardsMyEvents(cards);
})

button_eventsJoined.addEventListener('click', (event) => {
  toggleVisibleCardsOtherEvents(cards);
})

function toggleVisibleCardsMyEvents(cards) {
  console.log('function triggered');
  cards.forEach(card => {
    if (card.dataset.myevent == "true") {
      card.style.display = "block";
    } else {
      card.style.display = "none";
    }
  }
)
}

function toggleVisibleCardsOtherEvents(cards) {
  cards.forEach(card => {
    if (card.dataset.myevent == "true") {
      card.style.display = "none";
    } else {
      card.style.display = "block";
    }
  }
)
}

function updateDasboardWithCard(card) {
  dashboardEvents.forEach(event => {
    if (event.dataset.eventid == card.dataset.eventid) {
      event.style.display = "block";
    } else {
      event.style.display = "none";
    }
  })
}




