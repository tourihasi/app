//画像切り替え
document.addEventListener('turbolinks:load',function(){
  $('.change_img_a').click(function(){
    $('figure img').attr('src', $(this).attr('href'));
    return false
  })
})

//ﾀﾌﾞ

document.addEventListener('turbolinks:load',function(){
  $(function(){
    $('#contents div[id != "tab1"]').hide();
    $('.tab_a').click(function(){
      $('#contents div').hide();
      $($(this).attr('href')).show();

      $('.current').removeClass('current')
      $(this).addClass('current')
      return false
    })
  })
})

//ツールチップ
document.addEventListener('turbolinks:load',function(){
  $('.tooltip_li').hover(function(){
    $('body').append('<div id="tooltip"><p></p></div>')
    $('#tooltip p').html($(this).children().attr('alt'))
    $('#tooltip').hide();
    // ツールチップ縦位置：アイコンの縦位置 - 角丸四角形高さ - 三角形高さ
    $('#tooltip').css('top',$(this).offset().top -
    $('#tooltip').height() - 18); 
    // ツールチップ横位置：アイコンの横位置 + (アイコンの幅 - ツールチップの幅)/2
    $("#tooltip").css("left", $(this).offset().left - 
    ($("#tooltip").width() - $(this).width())/2);
    $('#tooltip').stop().fadeIn();
  }, function(){
    $("#tooltip").remove();
  })
})