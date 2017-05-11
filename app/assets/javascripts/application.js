// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery_ujs
//= require Chart.bundle
//= require chartkick
//= require jquery.maskedinput
//= require_self
//= require_tree .

function searchAndHideEvents() {
  var input = document.getElementById('searchTerm').value;
  var eventCards = $('.event-card-selector')
  for (i=0; i < eventCards.length; i++) {
    if (eventCards[i].innerHTML.includes(input)) {
      console.log(input)
    }
    else {
      $(eventCards[i]).hide()
    }
  }
};


function refreshPage() {
  location.reload();
}

/* Open the sidenav */
function openNav() {
    document.getElementById("mySidenav").style.width = "35%";
}

/* Close/hide the sidenav */
function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}

$(document).ready(function() {

$('.seller-dropdown').on('change', function() {
  var value = $(this).val();
  $('.seller-field').val(value);
});
});

