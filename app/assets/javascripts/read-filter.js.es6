$(document).ready(function(){

  $('.read-filter').on('click', function(){
    removeUnread();
  });
});

function removeUnread() {
  $('.unread').remove();
}
