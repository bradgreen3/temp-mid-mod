$(document).ready(function(){

  $('#links-list').on('click', 'button.mark-unread', function(){
    var $this = $(this);
    var linkId = $this.parents('.link').data('id');
    var readStatus = $(`#link_read_${linkId}`)
    var $newLinkUrl = $(this).parents('.link').children('.link-url').text()
    var button = $this.parents('p.link_buttons').children().first()

    $.ajax({
      url: '/api/v1/links/' + linkId,
      method: 'PATCH',
      data: {read: false}
    });

    readStatus.text("false")
    button.text("Mark as Read")

    button.addClass('mark-read').removeClass('mark-unread');

  });
});
