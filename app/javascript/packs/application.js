import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

import { autoscroll } from "../components/autoscroll";
import { footerscroll } from "../components/footerscroll";


import { initAutocomplete } from "../plugins/init_autocomplete";
import { initMapbox } from '../plugins/init_mapbox';
import { geolocalizeMe } from '../plugins/init_geoloc';


initAutocomplete();
initMapbox();

const routes = document.querySelectorAll('.results-itineraries-container');
routes.forEach((route) => {
  route.addEventListener('click', (event) => {
    const markers = event.currentTarget.dataset.markers
    const lines = event.currentTarget.dataset.lines
    initMapbox(markers, lines);
    console.log(event.currentTarget.dataset.markers);
    console.log(event.currentTarget.dataset.lines);
  });
});


if (document.getElementById('ans-one')) {
  autoscroll();
};

if (document.getElementById('foot-one')) {
  footerscroll();
};
