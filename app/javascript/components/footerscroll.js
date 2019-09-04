const footerscroll = () => {

  // const ones = document.querySelectorAll('#foot-one');
  // ones.forEach((one) => {
  //   one.addEventListener('click', () => {
  //     console.log("clic on 1");
  //     document.querySelector('#ans-top-one').scrollIntoView({ block: 'start', behavior: 'smooth' });
  //   })
  // });

  // const twos = document.querySelectorAll('#foot-two');
  // twos.forEach((two) => {
  //   two.addEventListener('click', () => {
  //     console.log("clic on 2");
  //     document.querySelector('#ans-top-two').scrollIntoView({ block: 'start', behavior: 'smooth' });
  //   })
  // });

  // const threes = document.querySelectorAll('#foot-three');
  // threes.forEach((three) => {
  //   three.addEventListener('click', () => {
  //     console.log("clic on 3");
  //     document.querySelector('#ans-top-three').scrollIntoView({ block: 'start', behavior: 'smooth' });
  //   })
  // });

  // const fours = document.querySelectorAll('#foot-four');
  // fours.forEach((four) => {
  //   four.addEventListener('click', () => {
  //     console.log("clic on 4");
  //     document.querySelector('#ans-top-four').scrollIntoView({ block: 'start', behavior: 'smooth' });
  //   })
  // });

  // const fives = document.querySelectorAll('#foot-five');
  // fives.forEach((five) => {
  //   five.addEventListener('click', () => {
  //     console.log("clic on 5");
  //     document.querySelector('#ans-top-five').scrollIntoView({ block: 'end', behavior: 'smooth' });
  //   })
  // });

  jQuery(document).ready(function() {
    jQuery('.js-scrollTo').on('click', function() { // Au clic sur un élément
      var page = jQuery(this).attr('href'); // Page cible
      var speed = 750; // Durée de l'animation (en ms)
      jQuery('html, body').animate( { scrollTop: jQuery(page).offset().top }, speed ); // Go
      return false;
    });
  });


};


export { footerscroll }
