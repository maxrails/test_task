# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('#new_campaign').validationEngine()
  $('#campaign_started_at').datetimepicker()
  $('#campaign_ended_at').datetimepicker()

  $('#campaign_start_timezone').change ->
    $('#campaign_end_timezone').val($(this).val())
  $('.remove_row').click ->
    if $('.regions').length > 1
      $(this).closest('tr.regions').remove()
  $('#add-country').click ->
    $('.remove_row').unbind()
    $('.remove_row').click ->
      if $('.regions').length > 1
        $(this).closest('tr.regions').remove()
  $('.show_link').click ->
    $(this).closest('div.short_info').hide();
    $(this).parent().parent().find('div.detailed_info').show();
  $('.hide_link').click ->
    $(this).closest('div.detailed_info').hide();
    $(this).parent().parent().find('div.short_info').show();
