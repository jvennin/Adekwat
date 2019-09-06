import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

import { autoscroll, footerscroll } from "../components/autoscroll";

import { initAutocomplete } from "../plugins/init_autocomplete";
import { initMapbox } from '../plugins/init_mapbox';
import { dynamicMap } from '../plugins/dynamic_map';

import { toggleIcon } from '../components/toggleicon';

initAutocomplete();
initMapbox();
dynamicMap(initMapbox);


if (document.getElementById('ans-one')) {
  autoscroll();
};

if (document.getElementById('foot-one')) {
  footerscroll();
};

if (document.getElementsByClassName('more-info')) {
  toggleIcon();
};
