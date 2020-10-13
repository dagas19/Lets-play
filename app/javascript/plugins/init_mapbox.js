import mapboxgl from 'mapbox-gl';

let map;
let mapMarkers = [];

// build the map
const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
  return map
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

    const m = new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
    mapMarkers.push(m)
  });
}

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 2 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) {
    buildMap(mapElement)
    rebuildMap(JSON.parse(mapElement.dataset.markers), true)
  }
};

const clearMarkers = () => {
  mapMarkers.forEach(marker => marker.remove())
}

const rebuildMap = (markers, init = false) => {
  clearMarkers();
  addMarkersToMap(map, markers);
  if (init) {
    fitMapToMarkers(map, markers);
  }
}

export { initMapbox, rebuildMap };
