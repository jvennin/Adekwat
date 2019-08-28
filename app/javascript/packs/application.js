import "bootstrap";

import { initAutocomplete } from "../plugins/init_autocomplete";
import { slider } from "../components/slider";
import { escalator } from "../components/escalator";

initAutocomplete();

if (document.getElementById('walkingDurationID')) {
  slider();
};
