const button_myEvents = document.querySelector('#my-events')
const button_eventsJoined = document.querySelector('#events-joined')

console.log('this js file that john is writing actually works')


const cards = document.querySelectorAll('.event-card')


console.log(cards[0].dataset.myevent)



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







