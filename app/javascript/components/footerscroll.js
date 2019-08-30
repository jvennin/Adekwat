const footerscroll = () => {

  const ones = document.querySelectorAll('#foot-one');
  ones.forEach((one) => {
    one.addEventListener('click', () => {
      document.querySelector('#ans-one').scrollIntoView({ block: 'start', behavior: 'smooth' });
    })
  });

  const twos = document.querySelectorAll('#foot-two');
  twos.forEach((two) => {
    two.addEventListener('click', () => {
      document.querySelector('#ans-two').scrollIntoView({ block: 'start', behavior: 'smooth' });
    })
  });

  const threes = document.querySelectorAll('#foot-three');
  threes.forEach((three) => {
    three.addEventListener('click', () => {
      document.querySelector('#ans-three').scrollIntoView({ block: 'start', behavior: 'smooth' });
    })
  });

  const fours = document.querySelectorAll('#foot-four');
  fours.forEach((four) => {
    four.addEventListener('click', () => {
      document.querySelector('#ans-four').scrollIntoView({ block: 'start', behavior: 'smooth' });
    })
  });



};


export { footerscroll }
