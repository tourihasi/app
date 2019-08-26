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

  function scroll_about(trigger,target){
    $(trigger).on('click',function(){
      let speed = 10;
      let position = target.offset().top;
      $("html, body").animate({scrollTop:position}, speed, "swing");
      return
    })
  }

  scroll_about($('.btn-message')  ,$('.message-manage'))
  scroll_about($('.btn-form')     ,$('.form-manage'))
  scroll_about($('.btn-collation'),$('.collation-manage'))
})