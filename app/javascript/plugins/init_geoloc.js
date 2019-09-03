// https://developer.mozilla.org/fr/docs/Web/API/Geolocation/getCurrentPosition

const geolocalizeMe = () => {
  let crd
  const button = document.querySelector('.ap-icon-pin');



  let options = {
    enableHighAccuracy: true,
    timeout: 5000,
    maximumAge: 0
  };

  const success = (pos) => {
    crd = pos.coords;

    console.log('Votre position actuelle est :');
    console.log(`Latitude : ${crd.latitude}`);
    console.log(`Longitude : ${crd.longitude}`);
    console.log(`La précision est de ${crd.accuracy} mètres.`);
  }

  const error = (err) => {
    console.warn(`ERREUR (${err.code}): ${err.message}`);
  }

  navigator.geolocation.getCurrentPosition(success, error, options);

  button.addEventListener('click', () => {
    console.log("Geoloc");
    const input = document.querySelector('#start');
    input.value = `${crd.latitude}, ${crd.longitude}`;
  })

};

export { geolocalizeMe };
