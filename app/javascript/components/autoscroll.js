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

    document.querySelector('.two').scrollIntoView({ block: 'start', behavior: 'smooth' });
  });

  //walk
  const twoLabels = document.querySelectorAll('#ans-two label');
  twoLabels.forEach((two) => {
    two.addEventListener('click', () => {
      resetIconImages();

      const imgThree = document.querySelector('#foot-three img');
      imgThree.src = imgThree.dataset.iconActive;

      document.querySelector('.three').scrollIntoView({ block: 'start', behavior: 'smooth' });
    });
  });

  //stairs
  const threeLabels = document.querySelectorAll('#ans-three label');
  threeLabels.forEach((three) => {
    three.addEventListener('click', () => {
      resetIconImages();

      const imgFour = document.querySelector('#foot-four img');
      imgFour.src = imgFour.dataset.iconActive;

      document.querySelector('.four').scrollIntoView({ block: 'start', behavior: 'smooth' });
    });
  });

  //escalator
  const fourLabels = document.querySelectorAll('#ans-four label');
  fourLabels.forEach((four) => {
    four.addEventListener('click', () => {
      resetIconImages();

      const imgFive = document.querySelector('#foot-five img');
      imgFive.src = imgFive.dataset.iconActive;

      document.querySelector('.five').scrollIntoView({ block: 'start', behavior: 'smooth' });
    });
  });
};

export { autoscroll };
