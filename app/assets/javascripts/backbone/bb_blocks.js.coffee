#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.BbBlocks = {}

_.templateSettings =
  interpolate: /\{\{\=(.+?)\}\}/g
  evaluate: /\{\{(.+?)\}\}/g

$ ->
  BbBlocks.BlockView.prototype.sharedTemplate = $('#template-control-buttons').text()

  window.page = new BbBlocks.Page(id: 1)
  page.fetch()
  page.sandboxes.fetch
    success: ->
      _.each $('.sandbox'), (sandboxDiv) ->
        name = sandboxDiv.id.replace 'sandbox-', ''
        sandbox = page.sandboxes.findWhere(name: name) or
            page.sandboxes.add(name: name, page_id: page.id).save()
        sandbox.view.setElement sandboxDiv

  $('.sandbox').sortable
    connectWith: '.sandbox'
    dropOnEmpty: true
    handle: '.icon-move'

  $('.sandbox').droppable
    over: ->
      $(this).addClass 'hovering'
      $(this).find('.ui-sortable-placeholder').show()
    out: ->
      $(this).removeClass 'hovering'
      $('.ui-sortable-placeholder').hide()
    receive: ->
      $(this).droppable('cancel')

  $('.sandbox').disableSelection()

  _.each $('.instantiator-dock'), (dock) ->
    new BbBlocks.Instantiator(type: $(dock).data('type'))
