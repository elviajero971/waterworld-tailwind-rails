$(document).ready(function (){
  $('#navbar-profile-button').click(function () {
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

$(document).ready(function (){
  $('#navbar-language-button').click(function () {
    if($('#toggle-language').hasClass("hidden")){
      $('#toggle-language').removeClass("hidden");
    }else{
      $('#toggle-language').addClass("hidden");
    }
  })
})

