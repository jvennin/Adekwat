import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

import { initAutocomplete } from "../plugins/init_autocomplete";
import { slider } from "../components/slide";
import { initMapbox } from '../plugins/init_mapbox';

initAutocomplete();
initMapbox();

if (document.getElementById('walkingDurationID')) {
  slider();
};
