const resetIconImages = () => {
  document.querySelector('#foot-one i').style.color = '#000000';

  // AFTER REFACTORING
  const icons = document.querySelectorAll('.footer .icon img');

  icons.forEach((icon) => {
    icon.src = icon.dataset.icon;
  });

  // -- BEFORE RECACTORING
  // const iconTwo = document.querySelector('#foot-two img');
  // iconTwo.src = iconTwo.dataset.icon;

  // const imgThree = document.querySelector('#foot-three img');
  // imgThree.src = imgThree.dataset.icon;

  // const imgFour = document.querySelector('#foot-four img');
  // imgFour.src = imgFour.dataset.icon;

  // const imgFive = document.querySelector('#foot-five img');
  // imgFive.src = imgFive.dataset.icon;
}

const autoscroll = () => {
  //search
  const one = document.querySelector('#ans-one');
  one.addEventListener('click', () => {
    resetIconImages();

    const iconTwo = document.querySelector('#foot-two img');
    iconTwo.src = iconTwo.dataset.iconActive;

    //document.querySelector('.two').scrollIntoView({ block: 'start', behavior: 'smooth' });

    jQuery('html, body').animate( { scrollTop: jQuery('.two').offset().top }, 750 );
  });

  //walk
  const twoLabels = document.querySelectorAll('#ans-two label');
  twoLabels.forEach((two) => {
    two.addEventListener('click', () => {
      resetIconImages();

      const imgThree = document.querySelector('#foot-three img');
      imgThree.src = imgThree.dataset.iconActive;

      //document.querySelector('.three').scrollIntoView({ block: 'start', behavior: 'smooth' });
      jQuery('html, body').animate( { scrollTop: jQuery('.three').offset().top }, 750 );
    });
  });

  //stairs
  const threeLabels = document.querySelectorAll('#ans-three label');
  threeLabels.forEach((three) => {
    three.addEventListener('click', () => {
      resetIconImages();

      const imgFour = document.querySelector('#foot-four img');
      imgFour.src = imgFour.dataset.iconActive;

      //document.querySelector('.four').scrollIntoView({ block: 'start', behavior: 'smooth' });
      jQuery('html, body').animate( { scrollTop: jQuery('.four').offset().top }, 750 );
    });
  });

  //escalator
  const fourLabels = document.querySelectorAll('#ans-four label');
  fourLabels.forEach((four) => {
    four.addEventListener('click', () => {
      resetIconImages();

      const imgFive = document.querySelector('#foot-five img');
      imgFive.src = imgFive.dataset.iconActive;

      //document.querySelector('.five').scrollIntoView({ block: 'start', behavior: 'smooth' });
      jQuery('html, body').animate( { scrollTop: jQuery('.five').offset().top }, 750 );
    });
  });
};

const footerscroll = () => {
  jQuery(document).ready(function() {
    jQuery('.js-scrollTo').on('click', function(evt) { // Au clic sur l'icon du footer
      resetIconImages();

      let icon = evt.currentTarget.querySelector('img');

      if (icon) {
        icon.src = icon.dataset.iconActive;
      } else {
        icon = evt.currentTarget.querySelector('i');
        icon.style.color = '#fe144c';
      }

      var page = jQuery(this).attr('href'); // Bloc cible
      var speed = 750; // Durée de l'animation (en ms)
      jQuery('html, body').animate( { scrollTop: jQuery(page).offset().top }, speed ); // Go
      return false;
    });
  });
};

export { autoscroll, footerscroll };
