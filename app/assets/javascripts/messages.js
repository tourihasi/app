document.addEventListener('turbolinks:load',function(){ //turbolink読み込まれたら(発火しないため)
    $('#form_show').on('click',function(){ //id form_show ｸﾘｯｸ時
    $('#content_form').toggleClass('off');     //id content_formにｸﾗｽ:onを付与,2回目はonを除去,3回目はonを付与
    if ($('#content_form').hasClass('off')){   //id content_form がｸﾗｽ:onを持っているとき
      $('#form_show').text('詳細検索');  //.text = ｾﾚｸﾀのtext変更
      $("#content_form").fadeOut(200);  // id content_formをﾌｪｰﾄﾞｱｳﾄ
    } else {
      $('#form_show').text('閉じる'); 
      $("#content_form").fadeIn(200);         //.feadIn = ｾﾚｸﾀのstyle="display:none"を消して表示 (200)は表示する㎜秒  
    }
    });
  });

  document.addEventListener('turbolinks:load',function(){
    $('#form_show').mouseover(function(){           //form_showにｶｰｿﾙが合わさった時
      $('#form_show').css('color','orange');        //ｽﾀｲﾙｼｰﾄ ｶﾗｰをorangeに変更
    }).mouseout(function(){                         //form_showからｶｰｿﾙが外れた時
      $('#form_show').css('color','');
    });
  });

  //反映されていない
  document.addEventListener('turbolinks:load',function(){ //入力欄 class: text にマウスｵｰﾊﾞｰで枠線と中身の色を変える
    $('#title_or_body_or_user_name_or_comments_content_cont').mouseover(function(){          
        console.log('OK');
        $('#title_or_body_or_user_name_or_comments_content_cont').css('border-color','#67c5ff');
    }).mouseout(function(){
        $('#title_or_body_or_user_name_or_comments_content_cont').css('border-color','#ffe4b5');
    });
  });

/*
1. ﾀﾎﾞｰﾘﾝｸｽ回避(=ﾀｰﾎﾞﾘﾝｸｽがloadされた時に、下記実行)
2. class deleteの要素(ﾀｸﾞのこと以下要素=ﾀｸﾞ)を全て取得して、繰り返す(取得した要素分) 引数a = 取得した要素
3. 取得した要素がajax:success(今回は削除※remote: true で削除ﾘﾝｸを踏みdestroyｱｸｼｮﾝが成功したら)されたら以下関数実行
4. 取得した要素の親要素取得　変数名tdとしているのは、実際に取得されるのがtdのため　削除ﾘﾝｸの親要素はtdのため　divとかの場合もある
5. 取得した要素の親要素の親要素取得　今回がtr
6. tr以下の表示を none = 消す
*/
document.addEventListener('turbolinks:load',function(){
document.querySelectorAll('.delete').forEach(function(a){
    a.addEventListener('ajax:success',function(){
    let td = a.parentNode;
    let tr = td.parentNode;
    tr.style.display = 'none';
    });
  });
});

//ﾒｯｾｰｼﾞの文字数取得
document.addEventListener('turbolinks:load',function(){
  $('#message_body').on('keydown keyup change', function() {
    var count = $(this).val().length;
    $("#count").text(count);
    if(count > 5000) {
      $("#count").css({color: 'red', fontWeight: 'bold'});
    }else{
      $("#count").css({color: '#333', fontWeight: 'normal'});
    }
  });
});


//メッセージフォーム装飾
document.addEventListener('turbolinks:load',function(){
  $(document).ready(function(){
    $('.nice-textbox').blur(function() {
        if($(this).val().length === 0){
          $('.nice-label').removeClass("focus");
        }
        else { returns; }
      })
      .focus(function() {
        $('.nice-label').addClass("focus")
      });
  });
});

//タイトルフォーム装飾
document.addEventListener('turbolinks:load',function(){
  $(document).ready(function(){
    $('.nice-textbox_title').blur(function() {
        if($(this).val().length === 0){
          $('.nice-label_title').removeClass("focus");
        }
        else { returns; }
      })
      .focus(function() {
        $('.nice-label_title').addClass("focus")
      });
  });
});

//image_form
$(document).on('turbolinks:load', function() {

  $('#message_images').on('change',function(e){
    var files = e.target.files; //target.files = ファイル名を取得
    var d = (new $.Deferred()).resolve();  // http://www.jquerystudy.info/reference/deferred/resolve.html
    $.each(files,function(i,file){
      d = d.then(function(){return previewImage(file)});
    });
  })

  var previewImage = function(imageFile){
    var reader = new FileReader();
    var img = new Image();
    var def =$.Deferred();
    reader.onload = function(e){
      $('.images_field').append(img);
      img.src = e.target.result;
      def.resolve(img);
    };
    reader.readAsDataURL(imageFile);
    return def.promise();
  }
})