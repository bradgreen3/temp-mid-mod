var $newLinkTitle, $newLinkUrl;

$(document).ready(function(){

  $('#links-list').on('click', 'button.mark-read', function(){
    var $this = $(this);
    var linkId = $this.parents('.link').data('id');
    var readStatus = $(`#link_read_${linkId}`);
    var $newLinkUrl = $(this).parents('.link').children('.link-url').text();
    var button = $this.parents('p.link_buttons').children().first()

    $.ajax({
      url: '/api/v1/links/' + linkId,
      method: 'PATCH',
      data: {read: true}
    });

    readStatus.text("true")
    button.text("Mark as Unread")
    button.addClass('mark-unread').removeClass('mark-read');
    $this.parent().parent().addClass('read')

    $.ajax({
      url: 'http://localhost:4000/api/v1/links',
      method: 'POST',
      data: {url: $newLinkUrl}
    });
  })
})
