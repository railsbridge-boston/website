$(document).ready(function(){
  $(".quick-find").sticky({topSpacing:50});

  $(".resources-content section").waypoint(function() {
    idName = $(this).attr("id");
    navLinks = $(".quick-find a");
    activeLink = $(".to-" + idName);

    navLinks.removeClass("active");
    activeLink.addClass("active");
  }, {offset: "35%"});
});
