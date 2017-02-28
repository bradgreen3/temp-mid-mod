$(document).ready(function() {
  $('.search-box').keyup(function() {
    clearAll();
    var searchParams = $(this).val();
    fetchLinks(searchParams);
  });
});

function clearAll() {
  $('#links-list').children().remove()
}

function fetchLinks(searchParams) {
  var userId = $('.main-header').data('userid')
  $.ajax({
    method: 'GET',
    url: '/api/v1/links/search_all',
    data: {q: searchParams}
  })
  .done(populateAllLinks)
}

function populateAllLinks(data) {
  data.forEach(function(link) {
    appendEachLink(link)
  })
}

function appendEachLink(link) {
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
