var $newLinkTitle, $newLinkUrl;

$(document).ready(function(){

  $('#links-list').on('click', 'button.mark-read', function(){
    var $this = $(this);
    var linkId = $this.parents('.link').data('id');
    var readStatus = $(`#link_read_${linkId}`)
    var $newLinkUrl = $(this).parents('.link').children('.link-url').text()

    $.ajax({
      url: '/api/v1/links/' + linkId,
      method: 'PATCH',
      data: {read: true}
    });

    readStatus.text("true")

    $.ajax({
      url: 'http://localhost:4000/api/v1/links',
      method: 'POST',
      data: {url: $newLinkUrl}
    });
  })
})
