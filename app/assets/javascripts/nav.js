$(document).ready(function(){
  $(".nav-toggle").click(function(e){
    $(this).toggleClass("is-on");
    $(".nav").toggleClass("is-open");
     e.preventDefault();
  });
});
