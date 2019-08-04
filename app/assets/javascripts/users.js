document.addEventListener('turbolinks:load',function(){
  $('.alert_user').hide()
  $('.user_btn').click(function(){
    var pass = $('.user_pass').text()
    var pass_confirm = $('.user_passConfirm').val()
    var sendflag = true //下記全てtrueならsubmit
    if(!$('.user_text').val()){
      $('.user_text_section .alert_user').show();
      sendflag = false
    }else{
      $('.user_text_section .alert_user').hide();
    }
    if(!$('.user_email').val()){
      $('.user_mail_section .alert_user').show();
      sendflag = false
    }else{
      $('.user_mail_section .alert_user').hide();
    }
    if(!pass > 6){
      $('.user_pass_section .alert_user').show();
      sendflag = false
    }else{
      $('.user_pass_section .alert_user').hide();
    }
    if(!pass_confirm != pass){
      $('.user_passcon_section .alert_user').show();
      sendflag = false
    }else{
      $('.user_passcon_section .alert_user').hide();
    }
    if(sendflag == false){
      return false
    }
  })
});