//= require rails-ujs
//= require jquery
//= require micromodal/dist/micromodal
//= require_tree .


window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  var myBtn = document.getElementById("myBtn");

  if(myBtn) {
    if (document.body.scrollTop > 600 || document.documentElement.scrollTop > 600) {
      myBtn.style.display = "block";
    } else {
      myBtn.style.display = "none";
    }
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
}

$(document).ready(function() {
  $('.dropdown-submenu a.dropdown-submenu-item').on("click", function(e) {
    var $menu = $(this).next('ul');
    $('.dropdown-submenu .dropdown-menu').not($menu).hide();

    $menu.toggle();

    e.stopPropagation();
    e.preventDefault();
  });

  $('#myBtn').click(function() {
    $('html, body').animate({ scrollTop: 0 }, 800);
  });

  MicroModal.init();
  MicroModal.show('modal-1');
});

