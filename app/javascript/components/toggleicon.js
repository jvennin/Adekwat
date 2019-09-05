const toggleIcon = () => {

  $('.more-info').click(function(){
    $('.more-info').find("i").toggleClass("fa-chevron-up fa-chevron-down");
  })

}

export { toggleIcon };
