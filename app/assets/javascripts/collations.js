document.addEventListener('turbolinks:load',function(){
  var number1 = $('#collation_number1')
  var number2 = $('#collation_number2')
  var succes = $('#collation_succes')
  number1.focus();
  number1.val('')
  number2.val('')
  

  number1.keypress(function(e){
    if (e.which == 13){
      number2.focus();
      return false;
    }
  });

  number2.keypress(function(e){
    if ( e.which == 13 ) {
      $('.edit_collation').on('submit',function(){
        var $collation_num1 = number1.val();
        var $collation_num2 = number2.val();   
        var $target1 = number1.val().length;
        var $target2 = number2.val().length;
        if ($target1 > $target2 ){
          var $collation_num1 = number2.val()
          var $collation_num2 = number1.val()
        }
        if ($collation_num2.match($collation_num1) && $collation_num2 != $collation_num1){
          number2.blur();       
          $('#audio1').volume = 0.2;
          $('#audio1').get(0).play();
          succes.val('true');
          console.log('1')
        } else{
          number2.blur();     
          $('#audio2').volume = 0.2;
          $('#audio2').get(0).play();
          succes.val('false');
          setTimeout(function(){
            console.log('2');
          },5000);
        }
      })
    }
  });
})