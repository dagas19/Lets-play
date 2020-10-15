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
      hideAll(events)
      showJoining(events)
    }
    else if (category == "hosting") {
      hideAll(events)
      showHosting(events)
    }
    else {
      showHosting(events)
      showJoining(events)
    }
  }
}
const hideAll = (events) => {
  events.forEach((eventCard) => {
    eventCard.style.display = 'none'
  })
}
const showHosting = (events) => {
  events.forEach((eventCard) => {
    const cardHosting = eventCard.dataset.hosting
    if (cardHosting == "true") {
      eventCard.style.display = 'block'
    }
  })
}

const showJoining = (events) => {
  events.forEach((eventCard) => {
    const cardHosting = eventCard.dataset.hosting
    if (cardHosting == "false") {
      eventCard.style.display = 'block'
    }
  })
}
// document.querySelectorAll("h2").forEach((h2) => {
//   h2.addEventListener("click", (event) => {
//     event.currentTarget.classList.add("activeee").siblings().removeClass("activeee");
//   });
// });

var btns = document.querySelectorAll(".b");
   Array.from(btns).forEach(item => {
      item.addEventListener("click", () => {
         var selected = document.getElementsByClassName("activeee");
         selected[0].className = selected[0].className.replace(" activeee", "");
         item.className += " activeee";
      });
   });
