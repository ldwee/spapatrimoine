import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
    map.fitBounds(bounds, {
      padding: 70,
      maxZoom: 25,
      duration: 0
    });
  };

  if (mapElement) { // only build a map if there's a div#map to inject into

    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });

    const cloudinaryLink = window._rails_env;
    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      let popup;
      if (marker.image != '') {
        popup =
        `<a href=\"/patrimoines/${marker.id}\">
          <img class="mapbox-images" src=\'https://res.cloudinary.com/${cloudinaryLink}/image/upload/c_fill/v1/spapatrimoine/${marker.image}\'/>
        </a>`
      } else {
        popup =
        `<a href=\"/patrimoines/${marker.id}\"><h2>${marker.name}</h2></a>`
      }


      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .setPopup(new mapboxgl.Popup({offset: 25}) // add popups
        .setHTML(popup))
        .addTo(map);
    });

    fitMapToMarkers(map, markers);
  }
};

export { initMapbox };
