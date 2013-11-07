!function ($) {
  $(function(){
    var $form = $('form.edit_rental');
    var $list = $form.find('ul');

    var $btn = $('<button type="button" class="btn">Add another image</button>');

    $btn.on('click', function (e) {
      var $lis = $list.find('li');
      var newIndex = $lis.length;

      function updateNumber (index, value) {
        return value.replace(/(\d+)/, newIndex);
      }

      var $newLi = $lis.last().clone();
      $newLi.find('label').attr('for', updateNumber);
      $newLi.find('input')
        .attr('id', updateNumber);
        .attr('name', updateNumber);

      $list.append($newLi);
    });  
  });
}(window.jQuery);