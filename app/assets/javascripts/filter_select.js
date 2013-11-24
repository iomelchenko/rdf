jQuery.fn.filterByText = function(filter_title, source_nameSingleMatch) {
  return this.each(function() {
    var source_name = this;
    var options = [];
    $(source_name).find('option').each(function() {
      options.push({value: $(this).val(), text: $(this).text()});
    });
    $(source_name).data('options', options);
    $(filter_title).bind('change keyup', function() {
      var options = $(source_name).empty().scrollTop(0).data('options');
      var search = $.trim($(this).val());
      var regex = new RegExp(search,'gi');

      $.each(options, function(i) {
        var option = options[i];
        if(option.text.match(regex) !== null) {
          $(source_name).append(
             $('<option>').text(option.text).val(option.value)
          );
        }
      });
      if (source_nameSingleMatch === true && 
          $(source_name).children().length === 1) {
        $(source_name).children().get(0).source_nameed = true;
      }
    });
  });
};

$(function() {
  $('#source_name').filterByText($('#filter_title'), true);
});  
