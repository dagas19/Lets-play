const initChatWindowSelector = () => {
  const eventCards = document.querySelectorAll('.event-card');
  const eventChatWindows = document.querySelectorAll('.chat-container');
  window.chatShow = false
  const eventChatWindowTitles = document.querySelectorAll('.chat-title');
  console.log(eventChatWindowTitles);


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
      eventChatWindowTitles.forEach(title => {
        if (event.currentTarget.dataset.eventid == title.dataset.eventid) {
          title.classList.remove("hidden-chat");
          title.classList.add("not-hidden-chat");
        } else {
          title.classList.remove("not-hidden-chat");
          title.classList.add("hidden-chat");
        }
      })
    })
  });
};

const initInfoWindows = () => {
  window.infoShow = true
  const eventCards = document.querySelectorAll('.event-card');
  const eventChatWindows = document.querySelectorAll('.chat-container');
  // eventChatWindows.forEach(chatbox => {
  //   $("div.chat-container").scrollTop($("div.chat-container")[0].scrollHeight);
  // });



//$("div.chat-container[data-eventid='1']").scrollTop($("div.chat-container[data-eventid='1']")[0].scrollHeight);


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
  if (chatButton) {
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
}
export { initChatWindowSelector, initInfoWindows, initButtons };
