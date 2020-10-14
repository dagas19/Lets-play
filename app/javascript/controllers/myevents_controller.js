import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "myevents" ]

  connect() {
    console.log("hellokk")
  }
  filter(event) {
    console.log(event);
    const target = event.currentTarget
    const category = target.dataset.category
    const events = document.querySelectorAll('.event-card');
    if (category == "joining") {
      showJoining(events)
    }
    else {
      showHosting(events)
    }
  }
}
const showHosting = (events) => {
  events.forEach((eventCard) => {
  const cardHosting = eventCard.dataset.hosting
    if (cardHosting) {
      eventCard.style.display = 'block'
    } else {
      eventCard.style.display = 'none'
    }
  })
}

const showJoining = (events) => {
  events.forEach((eventCard) => {
  const cardHosting = eventCard.dataset.hosting
    if (!cardHosting) {
      eventCard.style.display = 'block'
    } else {
      eventCard.style.display = 'none'
    }
  })
}

