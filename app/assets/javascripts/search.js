$(document).on('turbolinks:load', function() {
  var search_list = $(".main__contents__list");

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
                    <div class="image" style="background-image: url(${post.food_image.url});">
                    </div>
                    <div class="posts__content">
                      <div class="postt__content__name">
                      ${post.shop_name}
                      </div>
                      <ul class="food">
                        <li>
                        ${post.user_name}
                        </li>
                      </ul>
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
      $(".main__contents__list").empty();
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




// $(function() {
//   var search_list = $(".contents.row");

//   function appendPost(post) {
//     if(post.user_sign_in && post.user_sign_in.id == post.user_id){
//       var current_user = `<li>
//                             <a href="/posts/${post.id}/edit" data-method="get" >編集</a>
//                           </li>
//                           <li>
//                             <a href="/posts/${post.id}" data-method="delete" >削除</a>
//                           </li>`
//     } else {
//       var current_user = ""
//     }

//     var html = `<div class="content_post" style="background-image: url(${post.food_image});">
//                   <div class="more">
//                     <span><img src="/assets/arrow_top.png"></span>
//                     <ul class="more_list">
//                       <li>
//                         <a href="/posts/${post.id}" data-method="get" >詳細</a>
//                       </li>
//                       ${current_user}
//                     </ul>
//                   </div>
//                   <span class="name">
//                     <a href="/users/${post.user_id}">
//                       <span>投稿者</span>${post.user_name}
//                     </a>
//                   </span>
//                 </div>`
//     search_list.append(html);
//   }

//   function appendErrMsgToHTML(msg) {
//     var html = `<div class='name'>${ msg }</div>`
//     search_list.append(html);
//   }

//   $(".search-input").on("keyup", function() {
//     var input = $(".search-input").val();
//     $.ajax({
//       type: 'GET',
//       url: '/posts/search',
//       data: { keyword: input },
//       dataType: 'json'
//     })
//     .done(function(posts) {
//       search_list.empty();
//       $(".contents.row").empty();
//       if (posts.length !== 0) {
//         posts.forEach(function(post){
//           appendpost(post);
//         });
//       }
//       else {
//         appendErrMsgToHTML("一致するツイートがありません");
//       }
//     })
//     .fail(function() {
//       alert('error');
//     });
//   });
// });


// // 「クラス名が".search-input”の部分のテキストフィールドがkeyupしたら、テキストフィールドの文字を取得して変数inputに代入する」