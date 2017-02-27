$(document).ready(function(){

  $('.edit-link').click(function(){
     var linkId = $(this).parent().parent().data('id')
     window.location.href=`/links/${linkId}/edit`;
  })

})
