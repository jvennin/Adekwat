const autoscroll = () => {
  const ones = document.querySelectorAll('#ans-one');
  //search
  ones.forEach((one) => {
    one.addEventListener('click', () => {
      document.querySelector('.fa-crosshairs').style.color = '#000000';
      document.querySelector('#foot-three img').src = '/assets/ascending-stairs-signal.png';
      document.querySelector('#foot-four img').src = '/assets/upwards-escalator1.png';
      document.querySelector('#foot-five img').src = '/assets/business-affiliate-network1.png';
      document.querySelector('.two').scrollIntoView({ block: 'start', behavior: 'smooth' });
      document.querySelector('#foot-two img').src = '/assets/person-walking3.png';
    })
  });
  //walk
  const twos = document.querySelectorAll('#ans-two');
  twos.forEach((two) => {
    two.addEventListener('click', () => {
      document.querySelector('.fa-crosshairs').style.color = '#000000';
      document.querySelector('#foot-two img').src = '/assets/person-walking1.png';
      document.querySelector('#foot-four img').src = '/assets/upwards-escalator1.png';
      document.querySelector('#foot-five img').src = '/assets/business-affiliate-network1.png';
      document.querySelector('.three').scrollIntoView({ block: 'start', behavior: 'smooth' });

      document.querySelector('#foot-three img').src = '/assets/ascending-stairs-signal2.png';
    })
  });
  //stairs
  const threes = document.querySelectorAll('#ans-three');
  threes.forEach((three) => {
    three.addEventListener('click', () => {
      // reset all images
      document.querySelector('.fa-crosshairs').style.color = '#000000';
      document.querySelector('#foot-two img').src = '/assets/person-walking1.png';
      document.querySelector('#foot-three img').src = '/assets/ascending-stairs-signal.png';
      document.querySelector('#foot-five img').src = '/assets/business-affiliate-network1.png';
      document.querySelector('.four').scrollIntoView({ block: 'start', behavior: 'smooth' });      document.querySelector('#foot-four img').src = '/assets/upwards-escalator2.png';
      document.querySelector('#foot-four img').src = '/assets/upwards-escalator3.png';

    })
  });
  //escalator
  const fours = document.querySelectorAll('#ans-four');
  fours.forEach((four) => {
    four.addEventListener('click', () => {
      document.querySelector('.fa-crosshairs').style.color = '#000000';
      document.querySelector('#foot-two img').src = '/assets/person-walking1.png';
      document.querySelector('#foot-three img').src = '/assets/ascending-stairs-signal.png';
      document.querySelector('#foot-four img').src = '/assets/upwards-escalator1.png';
      document.querySelector('.five').scrollIntoView({ block: 'start', behavior: 'smooth' });
      document.querySelector('#foot-five img').src = '/assets/business-affiliate-network3.png';
    })
  });

};


export { autoscroll };
