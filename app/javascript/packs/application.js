import "bootstrap";

import { initAutocomplete } from "../plugins/init_autocomplete";
import { slider } from "../components/slide";

initAutocomplete();

if (document.getElementById('walkingDurationID')) {
  slider();
};
