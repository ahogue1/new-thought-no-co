//= require jquery
//= require rails-ujs
//= require_tree .


window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 600 || document.documentElement.scrollTop > 600) {
    document.getElementById("myBtn").style.display = "block";
  } else {
    document.getElementById("myBtn").style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
}

$(document).ready(function() {
  $('.dropdown-submenu a').on("click", function(e) {
    var $menu = $(this).next('ul');
    $('.dropdown-submenu .dropdown-menu').not($menu).hide();

    $menu.toggle();

    e.stopPropagation();
    e.preventDefault();
  });

  $('#myBtn').click(function() {
    $('html, body').animate({ scrollTop: 0 }, 800);
  });
});
