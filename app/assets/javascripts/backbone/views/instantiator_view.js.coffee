BbBlocks.InstantiatorView = Backbone.View.extend

  render: ->
    self = this
    @$el.html '<div style="height:50px;background-color:grey;color:white;">' + @model.get('type') + '</div>'

  initialize: ->
    @render()
    dock = $('.instantiator-dock[data-type=' + @model.get('type') + ']')
    @$el.appendTo dock

    @$el.sortable
      connectWith: '.sandbox'
      update: (event, ui) =>
        ui.item.removeAttr 'style'
        sandboxId = ui.item.parent().attr('id')[8..]
        sandbox = page.sandboxes.findWhere(name: sandboxId)
        block = sandbox.blocks.add(type: @model.get('type'), sandbox_id: sandbox.id)
        ui.item.replaceWith block.view.$el
        @setElement $('<div></div>')
        @initialize()

    @$el.disableSelection()
