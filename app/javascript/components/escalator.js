const escalator = () => {
  $(document).ready(function(){
    $(".escalator-choice").click(function(){
      $(this).toggleClass("active");
    });
  });
};

export { escalator };
