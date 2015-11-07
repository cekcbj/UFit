

$('#exercises a.add_fields').data('association-insertion-position', 'before').data 'association-insertion-node', 'this'
$('#exercises').on 'cocoon:after-insert', ->
  $('.workout-item-fields a.add_fields').data('association-insertion-position', 'before').data 'association-insertion-node', 'this'
  $('.workout-item-fields').on 'cocoon:after-insert', ->
    $(this).children('#tag_from_list').remove()
    $(this).children('a.add_fields').hide()
    return
  return
