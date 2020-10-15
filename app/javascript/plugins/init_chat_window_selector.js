const initChatWindowSelector = () => {
  const eventCards = document.querySelectorAll('.event-card');
  const eventChatWindows = document.querySelectorAll('.chat-container');
  window.chatShow = false

  eventCards.forEach(card => {
    card.addEventListener('click', (event) => {
      eventChatWindows.forEach(chatWindow => {
        if (event.currentTarget.dataset.eventid == chatWindow.dataset.eventid && window.chatShow) {
          chatWindow.classList.remove("hidden-chat");
          chatWindow.classList.add("not-hidden-chat");
        } else {
          chatWindow.classList.remove("not-hidden-chat");
          chatWindow.classList.add("hidden-chat");
        }
      })
    })
  });
};

const initInfoWindows = () => {
  window.infoShow = true
  const eventCards = document.querySelectorAll('.event-card');
  const eventChatWindows = document.querySelectorAll('.chat-container');

  eventCards.forEach(card => {
    card.addEventListener('click', (event) => {
      window.eventId = event.currentTarget.dataset.eventid
      console.log(window.infoShow)
      $(".event-info-2").addClass("d-none")
      if(window.infoShow) {
        $("#event-info-"+event.currentTarget.dataset.eventid).removeClass("d-none")
      }
    })
  });
}
const initButtons = () => {
  const chatButton = document.querySelector("#chat")
  console.log(chatButton)
  const infoButton = document.querySelector("#moreinfo")
  chatButton.addEventListener("click", (event) => {
    window.infoShow = false
    window.chatShow = true
    $("div.chat-container[data-eventid = '"+window.eventId+"']").removeClass("hidden-chat").addClass("not-hidden-chat")
    $("#event-info-"+window.eventId).addClass("d-none")
  })
   infoButton.addEventListener("click", (event) => {
    window.infoShow = true
    window.chatShow = false
    $("div.chat-container[data-eventid = '"+window.eventId+"']").addClass("hidden-chat").removeClass("not-hidden-chat")
    $("#event-info-"+window.eventId).removeClass("d-none")
  })
}
export { initChatWindowSelector, initInfoWindows, initButtons };
