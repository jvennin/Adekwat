const slider = () => {
  const slider = document.getElementById("walkingDurationId");
  const output = document.getElementById("steps");
  output.innerHTML = slider.value;

  slider.oninput = function() {
    output.innerHTML = this.value;
  };
};

export { slider };

