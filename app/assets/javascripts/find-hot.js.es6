$(document).ready(function(){

  $('.find-hot').on('click', function(e){
    e.preventDefault();
    fetchLinks();
  })

  function fetchLinks() {
    $.ajax({
      method: 'GET',
      url: 'http://localhost:4000/api/v1/links'
    })
    .done(listHot)
  }

  function listHot(data) {
    $('.hot-links').children().remove();
    data.forEach(function(link, index) {
      if(index == 0) {
        $('.hot-links').append(`<li class="index-`+index+`">${link}</li`)
        $('p:contains('+link+')').css('background-color', 'green');
      } else {
        $('.hot-links').append(`<li class="index-`+index+`">${link}</li`)
        $('p:contains('+link+')').css('background-color', 'red');
      }
    })
  }

});
