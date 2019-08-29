import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

import { initAutocomplete } from "../plugins/init_autocomplete";
import { initMapbox } from '../plugins/init_mapbox';
import { slider } from "../components/slider";
import { escalator } from "../components/escalator";

initAutocomplete();
initMapbox();

if (document.getElementById('walkingDurationID')) {
  slider();
};
