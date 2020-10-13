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
  switchbuttonsOne();
})

button_eventsJoined.addEventListener('click', (event) => {
  toggleVisibleCardsOtherEvents(cards);
  switchbuttonsTwo();
})

function toggleVisibleCardsMyEvents(cards) {
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


function switchbuttonsOne() {
  // identify the button that has just been clicked
  button_myEvents.classList.remove("inactive-myEvents");
  button_myEvents.classList.add("active-myEvents");
  button_eventsJoined.classList.remove("active-myEvents");
  button_eventsJoined.classList.add("inactive-myEvents");
}

function switchbuttonsTwo() {
  // identify the button that has just been clicked

  button_myEvents.classList.remove("active-myEvents");
  button_myEvents.classList.add("inactive-myEvents");
  button_eventsJoined.classList.remove("inactive-myEvents");
  button_eventsJoined.classList.add("active-myEvents");
}

