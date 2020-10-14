import { Controller } from "stimulus"
import { rebuildMap } from "plugins/init_mapbox"

export default class extends Controller {
  static targets = [ "events" ]

  connect() {

  }
  filter(event) {
    console.log(event);
    const target = event.currentTarget
    const gameType = target.dataset.gameType
    filterEventCards(gameType)
    filterMapEvents(gameType)
  }
}

const filterEventCards = (gameType) => {
  const events = document.querySelectorAll('.event-card');
  events.forEach((eventCard) => {
    const cardGameType = eventCard.dataset.gameType
    if (cardGameType == gameType) {
      eventCard.style.display = 'block'
    } else {
      eventCard.style.display = 'none'
    }
  })
}

const filterMapEvents = (gameType) => {
  const mapElement = document.getElementById('map');
  const markers = JSON.parse(mapElement.dataset.markers)
  const newMarkers = []
  markers.forEach((marker) => {
    if (marker.gameType == gameType) {
      newMarkers.push(marker)
    }
  })
  rebuildMap(newMarkers)
}
