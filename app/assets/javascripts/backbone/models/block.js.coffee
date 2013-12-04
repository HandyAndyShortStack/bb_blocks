window.Block = Backbone.Model.extend
  
  initialize: ->
    @view = new BlockView model: this
    @fetch
      success: =>
        @view.render().$el.appendTo @collection.sandbox.view.$el
