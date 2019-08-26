document.addEventListener('turbolinks:load',function(){
  $('#text').val('')
  let encode_form = $('.encode_form')
  let encode_text = $('.encode_text')
  $('.encode_btn').on('click',function(){
    let form_element_length = $('.encode_form .encode_text').length
    encode_form.append(`<input class="encode_text" type="text[]" name="text[]" id="text">`)
  })
})