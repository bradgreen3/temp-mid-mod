$(document).ready(function(){

  $('.unread-filter').on('click', function(){
    removeRead();
  });
});

function removeRead() {
  $('.read').remove();
}
