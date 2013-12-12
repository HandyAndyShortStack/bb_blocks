BbBlocks.InstantiatorView = Backbone.View.extend
  
  id: 'instantiator'

  render: ->
    self = this
    @$el.html '<div style="height:50px;width:50px;background-color:grey;"></div>'

  initialize: ->
    @render()
    @$el.appendTo $('#instantiator-BlueSquareBlock')

    @$el.sortable
      connectWith: '.sandbox'
      beforeStop: (event, ui) =>
        ui.item.removeAttr 'style'
        sandboxId = ui.placeholder.parent().attr('id')[8..]
        sandbox = page.sandboxes.findWhere(name: sandboxId)
        block = sandbox.blocks.add(type: 'BlueSquareBlock', sandbox_id: sandbox.id)
        ui.item.replaceWith block.view.$el
        @setElement $('<div></div>')
        @initialize()

    @$el.disableSelection()
