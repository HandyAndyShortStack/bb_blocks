BbBlocks.Instantiator = Backbone.Model.extend
  
  initialize: ->
    @view = new BbBlocks.InstantiatorView(model: this)
