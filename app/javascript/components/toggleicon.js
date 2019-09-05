const toggleIcon = () => {

  $('.more-info').click(function(){
    $(this).find("i").toggleClass("fa-chevron-up fa-chevron-down");
  })

}

export { toggleIcon };
