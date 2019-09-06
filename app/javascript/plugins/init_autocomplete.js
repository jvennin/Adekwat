import places from 'places.js';
const initAutocomplete = () => {
  const startAddressInput = document.getElementById('start');
  const endAddressInput = document.getElementById('end');
  if (startAddressInput) {
    places({
      appId: 'pl2MIL8NBC2Y',
      apiKey: '0ee58fdbb38e85b6485cd50b025baf6d',
      container: startAddressInput,
      countries: ['fr']
    });
  }
  if (endAddressInput) {
    places({
      appId: 'pl2MIL8NBC2Y',
      apiKey: '0ee58fdbb38e85b6485cd50b025baf6d',
      container: endAddressInput,
      countries: ['fr']
    });
  }
};

export { initAutocomplete };




