// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .


/*フローティングメニュー*/
document.addEventListener('turbolinks:load',function(){
  $('.parent_floating_nav_user').click(function(){
    $('.child_floating_nav_user').slideToggle(200);  
  })
})

document.addEventListener('turbolinks:load',function(){
  $('.parent_floating_nav_message').click(function(){
    $('.child_floating_nav_message').slideToggle(200);  
  })
})

document.addEventListener('turbolinks:load',function(){
  $('.floating_nav').hover(function(){
    $('.floating').slideToggle(100);  
  })
})

document.addEventListener('turbolinks:load',function(){
  $(window).scroll(function(){
    $('.floating_nav').stop().animate({'top': $(window)
    .scrollTop() +100}, 500);
    })
})

  /*共通ﾃｰﾌﾞﾙセルハイライト*/
  document.addEventListener('turbolinks:load',function(){
    $('td').hover(function(){
      $(this).parent().addClass('target')
      var myIndex = $(this).index()
      myIndex ++;
      //同列もハイライト $("td:nth-child("+ myIndex +")").addClass('target')
    },function(){
      $(".target").removeClass("target")
    })
  })