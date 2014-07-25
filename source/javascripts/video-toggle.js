$(document).ready(function(){
  $(".video").click(function(e){
    $(this).toggleClass("show-video");
    $(this).find("iframe").attr("src", "http://player.vimeo.com/video/70699061?autoplay=1");
    $(".media .caption").fadeIn("slow");
  });
});
