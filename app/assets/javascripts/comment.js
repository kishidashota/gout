
$(function(){
  function buildHTML(comment){
    var html = `<div class="icon">
                  <div class="img">
                    <a href=/users/${comment.user_id}>${comment.user_name}</a>
                    <div class="img" style="background-image: url(${comment.user_image.url});">
                  </div>
                </div>
                ${comment.content}
                <div class>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
  })
  .done(function(data){
      var html = buildHTML(data);
      $('.comments').append(html);
      $('.textbox').val('');
      $('.form__submit').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })  
})