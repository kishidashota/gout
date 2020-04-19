$(document).on('turbolinks:load', function() {
  var search_list = $(".main__contents");

  function appendPost(post) {
    if(post.user_sign_in && post.user_sign_in.id == post.user_id){
      var current_user = `
                         `
    } else {
      var current_user = ""
    }
    var html = `
                    <a herf=  "/posts/${post.id}" data-method="get">
                    <div class="posts__image">
                      <img class="image" src=${post.food_image.url}>
                      </div>
                    </div>
                    <div class="posts__content">
                      <div class="post__content__name">
                      ${post.shop_name}
                      </div>
                    </div>
      `
    search_list.append(html);
  }

  function appendErrMsgToHTML(msg) {
    var html = `<div class='name'>${ msg }</div>`
    search_list.append(html);
  }

  $(".search-input").on("keyup", function() {
    var input = $(".search-input").val();
    $.ajax({
      type: 'GET',
      url: '/posts/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(posts) {
      search_list.empty();
      $(".main__contents").empty();
      if (posts.length !== 0) {
        posts.forEach(function(post){
          appendPost(post);
        });
      }
      else {
        appendErrMsgToHTML("一致する投稿はありません");
      }
    })
  });
});
