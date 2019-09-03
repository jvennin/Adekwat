import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const initMapbox = (clicked_markers, clicked_lines, clicked_color) => {

  const mapElement = document.getElementById('map');

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  };

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });

    let markers = JSON.parse(mapElement.dataset.markers);
    let lines = JSON.parse(mapElement.dataset.lines);

    if (clicked_markers) {
      markers = JSON.parse(clicked_markers);
    }

    if (clicked_lines) {
      lines = JSON.parse(clicked_lines);
    }

    markers.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(map);
    });
    map.on('load', function () {
      let color = mapElement.dataset.color;
      if (clicked_color) {
        color = clicked_color;
      }
      map.addLayer({
        "id": "route",
        "type": "line",
        "source": {
          "type": "geojson",
          "data": {
            "type": "Feature",
            "properties": {},
            "geometry": {
            "type": "LineString",
            "coordinates": lines
            }
          }
        },
        "layout": {
        "line-join": "round",
        "line-cap": "round"
        },
        "paint": {
        "line-color": color,
        "line-width": 8
        }
      });
    });
    fitMapToMarkers(map, markers);
    //map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken, marker: true, }));
  };

  const addMarkersToMap = (map, markers) => {

    markers.forEach((marker) => {

      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

      // Create a HTML element for your custom marker
      const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '25px';
      element.style.height = '25px';

      // Pass the element as an argument to the new marker
      new mapboxgl.Marker(element)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(map);
    });

  };
};

export { initMapbox };
