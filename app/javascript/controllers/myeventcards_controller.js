const button_myEvents = document.querySelector('#my-events')
const button_eventsJoined = document.querySelector('#events-joined')

console.log('this js file that john is writing actually works')


const cards = document.querySelectorAll('.event-card')


console.log(cards[0].dataset.myevent)






button_myEvents.addEventListener('click', (event) => {
  console.log('you clicked on my events button')
})

button_eventsJoined.addEventListener('click', (event) => {
  console.log('you clicked on joined events button')
})
