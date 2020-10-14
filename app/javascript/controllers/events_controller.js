import { Controller } from "stimulus"
import { rebuildMap } from "plugins/init_mapbox"

export default class extends Controller {
  static targets = [ "events", "tomorrow", "today", "weekend" ]

  connect() {

  }
  filterGameType(event) {
    const target = event.currentTarget
    const gameType = target.dataset.gameType
    const gameTypeFilters = this.gameTypeFilter
    if (gameTypeFilters.includes(gameType)) {
      gameTypeFilters.splice(gameTypeFilters.indexOf(gameType), 1)
    } else {
      gameTypeFilters.push(gameType)
    }
    this.gameTypeFilter = gameTypeFilters.join('|')
    this.applyFilters();
  }

  get gameTypeFilter() {
    return this.data.get('gameTypeFilter').split('|')
      .filter(word => word.length > 0)
  }

  set gameTypeFilter(filter) {
    this.data.set('gameTypeFilter', filter)
  }

  applyFilters() {
    const timeTypes = this.timeTypeFilter
    const gameTypes = this.gameTypeFilter
    filterEventCards(gameTypes, timeTypes);
    filterMapEvents(gameTypes, timeTypes);

  }

  filterTimeType(event) {
    const target = event.currentTarget
    const timeType = target.dataset.timeType
    const timeTypeFilters = this.timeTypeFilter
    if (timeTypeFilters.includes(timeType)) {
      timeTypeFilters.splice(timeTypeFilters.indexOf(timeType), 1)
    } else {
      timeTypeFilters.push(timeType)
      if (timeType == 'week') {
        this.todayTarget.checked = true;
        this.tomorrowTarget.checked = true;
        this.weekendTarget.checked = true;
        timeTypeFilters.splice(0, 4)
        timeTypeFilters.push('today')
        timeTypeFilters.push('tomorrow')
        timeTypeFilters.push('weekend')
        timeTypeFilters.push('week')
      }
    }
    this.timeTypeFilter = timeTypeFilters.join('|')
    this.applyFilters();
  }

  get timeTypeFilter() {
    return this.data.get('timeTypeFilter').split('|')
      .filter(word => word.length > 0)
  }

  set timeTypeFilter(filter) {
    this.data.set('timeTypeFilter', filter)
  }
}

const shouldShow = (gameType, gameTypeFilter, timeType, timeTypeFilter) => {
  const hasGameTypes = gameTypeFilter.length > 0
  const hasTimeTypes = timeTypeFilter.length > 0
  if (!hasGameTypes && !hasTimeTypes) {
    return true
  }
  if (hasGameTypes && gameTypeFilter.includes(gameType)) {
    return !hasTimeTypes || timeTypeFilter.includes(timeType)
  }
  if (hasTimeTypes && timeTypeFilter.includes(timeType)) {
    return !hasGameTypes || gameTypeFilter.includes(gameType)
  }
}


const filterEventCards = (gameTypes, timeTypes) => {
  const events = document.querySelectorAll('.event-card');
  events.forEach((eventCard) => {
    const cardGameType = eventCard.dataset.gameType
    const cardTimeType = eventCard.dataset.timeType
    if (shouldShow(cardGameType, gameTypes, cardTimeType, timeTypes)) {
      eventCard.style.display = 'block'
    } else {
      eventCard.style.display = 'none'
    }
  })
}

const filterMapEvents = (gameTypes, timeTypes) => {
  const mapElement = document.getElementById('map');
  const markers = JSON.parse(mapElement.dataset.markers)
  const newMarkers = []
  markers.forEach((marker) => {
    if (shouldShow(marker.gameType, gameTypes, marker.timeType, timeTypes)){
    // if (gameTypes.includes(marker.gameTypes) || gameTypes.length == 0) {
      newMarkers.push(marker)
    }
  })
  rebuildMap(newMarkers)
}
