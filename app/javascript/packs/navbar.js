$(document).ready(function (){
  $('#navbar-profile-button').click(function () {
    console.log('click');
    if($('#toggle-profile').hasClass("hidden")){
      $('#toggle-profile').removeClass("hidden");
    }else{
      $('#toggle-profile').addClass("hidden");
    }
  })
})

$(document).ready(function (){
  $('#burger-nav').click(function () {
    console.log('click');
    if($('#mobile-menu').hasClass("hidden")){
      $('#mobile-menu').removeClass("hidden");
    }else{
      $('#mobile-menu').addClass("hidden");
    }
  })
})

