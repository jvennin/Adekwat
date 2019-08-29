import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

import { autoscroll } from "../components/autoscroll";

import { initAutocomplete } from "../plugins/init_autocomplete";
import { initMapbox } from '../plugins/init_mapbox';



initAutocomplete();
initMapbox();






if (document.getElementById('ans-one')) {
  autoscroll();
};
