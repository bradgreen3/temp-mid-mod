$(document).ready(function(){

  $('.read-filter').on('click', function(){
    clearLinks();
  });
});

function getLinks() {
  var userId = $('.main-header').data('userid')
  $.ajax({
    url: '/api/v1/links',
    method: 'GET',
    data: {user_id: userId}
  })
  .done(populateLinks)
  .then(removeUnread)
 }

 function removeUnread() {
   $('.unread').remove();
 }

function populateLinks(data) {
 data.forEach(function(link) {
   appendLink(link)
 })
}

function appendLink(link) {
  if (link.read == true) {
    $("#links-list").append(`<div style="display: inline-block; border: 1px solid black; margin: 30px;" class='link read' data-id='${link.id}' id="link-${link.id}">
              <p class='link-title'>${ link.title }</p>
              <p class='link-url'>${ link.url }</p>

              <p class="link_read">
                ${ link.read }
              </p>
              <p class="link_buttons">
                <button class="mark-read">Mark as Read</button>
                <button class='edit-link'>Edit</button>
                <button class='delete-link'>Delete</button>
              </p>
            </div>`)
  } else {
    $("#links-list").append(`<div style="display: inline-block; border: 1px solid black; margin: 30px;" class='link unread' data-id='${link.id}' id="link-${link.id}">
              <p class='link-title'>${ link.title }</p>
              <p class='link-url'>${ link.url }</p>

              <p class="link_read">
                ${ link.read }
              </p>
              <p class="link_buttons">
                <button class="mark-unread">Mark as Unread</button>
                <button class='edit-link'>Edit</button>
                <button class='delete-link'>Delete</button>
              </p>
            </div>`)
  }
}

 function clearLinks() {
   $('#links-list').children().remove()
   getLinks();
 }
