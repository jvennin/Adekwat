import places from 'places.js';
const initAutocomplete = () => {
  const startAddressInput = document.getElementById('start');
  const endAddressInput = document.getElementById('end');
  if (startAddressInput) {
    places({
      container: startAddressInput,
      countries: ['fr']
    });
  }
  if (endAddressInput) {
    places({
     container: endAddressInput,
     countries: ['fr']
    });
  }
};

export { initAutocomplete };




