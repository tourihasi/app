document.addEventListener('turbolinks:load',function(){
  $(function(){
    let number1 = $('#collation_number1')
    let number2 = $('#collation_number2')
    let succes = $('#collation_succes')
    number1.focus();
    number1.val('')
    number2.val('')
  
    number1.keypress(function(e){
      if (e.which == 13){
        number2.focus();
        return false;
      }
    });
  
    function ajax_collation(formData){
      $.ajax({
        url: "/collations",
        type: "POST",
        data: formData,
        processData: false,
        contentType: false
      })
      .done(function(){
      })
      .always(function(){
        number1.focus();
        $(".submit-collation").removeAttr("disabled");
      })
    }
  
    number2.keypress(function(e){
      if ( e.which == 13 ) {
        $('.collation-form').on('submit',function(e){
          e.preventDefault();
          let $collation_num1 = number1.val();
          let $collation_num2 = number2.val();   
          let $target1 = number1.val().length;
          let $target2 = number2.val().length;
          if ($target1 > $target2 ){
            let $collation_num1 = number2.val()
            let $collation_num2 = number1.val()
          }
          debugger;
          if ($collation_num2.match($collation_num1) && $collation_num2 != $collation_num1){   
            $('#audio1').volume = 0.2;
            $('#audio1').get(0).play();
            succes.val('true');
          } else{
            $('#audio2').volume = 0.2;
            $('#audio2').get(0).play();
            succes.val('false');
          }
          let formData = new FormData(this);
          $('.collation-form')[0].reset();
          ajax_collation(formData)
        })
      }
    });
  })
})