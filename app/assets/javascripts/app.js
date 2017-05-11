
$(document).ready(function(){
  $('.collapsible').collapsible();
});

$(.search-button).on('click', searchAndHideEvents)

function searchAndHideEvents() {
  console.log('function fired');
};

