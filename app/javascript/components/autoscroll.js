const autoscroll = () => {
  const ones = document.querySelectorAll('#ans-one');

  ones.forEach((one) => {
    one.addEventListener('click', () => {
      document.querySelector('.two').scrollIntoView({ block: 'start', behavior: 'smooth' });
    })
  });

  const twos = document.querySelectorAll('#ans-two');
  twos.forEach((two) => {
    two.addEventListener('click', () => {
      document.querySelector('.three').scrollIntoView({ block: 'start', behavior: 'smooth' });
      document.querySelector('#foot-two img').src = '/assets/person-walking3.png'
    })
  });

  const threes = document.querySelectorAll('#ans-three');
  threes.forEach((three) => {
    three.addEventListener('click', () => {
      document.querySelector('.four').scrollIntoView({ block: 'start', behavior: 'smooth' });
      document.querySelector('#foot-three img').src = '/assets/ascending-stairs-signal2.png'
    })
  });

  const fours = document.querySelectorAll('#ans-four');
  fours.forEach((four) => {
    four.addEventListener('click', () => {
      document.querySelector('.five').scrollIntoView({ block: 'start', behavior: 'smooth' });
      document.querySelector('#foot-four img').src = '/assets/business-affiliate-network3.png'
    })
  });

};


export { autoscroll };
