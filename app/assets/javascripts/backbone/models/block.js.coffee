window.Block = Backbone.Model.extend
  
  initialize: ->
    @view = new BlockView model: this
    @view.render
    @view.$el.appendTo @collection.sandbox.view.$el
