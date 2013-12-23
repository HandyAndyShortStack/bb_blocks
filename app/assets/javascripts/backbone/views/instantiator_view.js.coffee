BbBlocks.InstantiatorView = Backbone.View.extend

  render: ->
    self = this
    @$el.html '<div class="instantiator" style="height:50px;background-color:grey;color:white;">' + @model.get('type') + '</div>'

  initialize: ->
    @render()
    dock = $('.instantiator-dock[data-type=' + @model.get('type') + ']')
    @$el.appendTo dock

    @$el.sortable
      connectWith: '.sandbox'
      update: (event, ui) =>
        sandboxId = ui.item.parent().attr('id')[8..]
        sandbox = page.sandboxes.findWhere(name: sandboxId)
        return @$el.sortable('cancel') unless sandbox.view.$el.hasClass 'hovering'
        ui.item.removeAttr 'style'
        block = sandbox.blocks.add type: @model.get('type')
        ui.item.replaceWith block.view.$el
        @setElement $('<div></div>')
        @initialize()
      start: (event, ui) ->
        ui.placeholder.hide();

    @$el.disableSelection()
