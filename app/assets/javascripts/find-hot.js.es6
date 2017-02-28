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
    .done(markTop)
  }

  function listHot(data) {
    $('.hot-links').children().remove();
    data.forEach(function(link, index) {
      $('.hot-links').append(`<li class="index-`+index+`">${link}</li`)
    })
  }

  function markTop() {
    $('.index-0').append('---TOP LINK!');
  }
});
