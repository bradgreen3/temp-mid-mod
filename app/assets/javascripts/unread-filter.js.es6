$(document).ready(function(){

  $('.unread-filter').on('click', function(){
    clearAllLinks();
  });
});

function getAllLinks() {
  var userId = $('.main-header').data('userid')
  $.ajax({
    url: '/api/v1/links',
    method: 'GET',
    data: {user_id: userId}
  })
  .done(populateLinks)
  .then(removeRead)
 }

 function removeRead() {
   $('.read').remove();
 }

function populateLinks(data) {
 data.forEach(function(link) {
   appendALink(link)
 })
}

function appendALink(link) {
  if (link.read == true) {
    $("#links-list").append(`<div style="display: inline-block; border: 1px solid black; margin: 30px;" class='link read' data-id='${link.id}' id="link-${link.id}">
              <p class='link-title'>${ link.title }</p>
              <p class='link-url'>${ link.url }</p>

              <p class="link_read">
                ${ link.read }
              </p>
              <p class="link_buttons">
                <button class="mark-read">Mark as Unread</button>
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
                <button class="mark-unread">Mark as Read</button>
                <button class='edit-link'>Edit</button>
                <button class='delete-link'>Delete</button>
              </p>
            </div>`)
  }
}

 function clearAllLinks() {
   $('#links-list').children().remove()
   getAllLinks();
 }
