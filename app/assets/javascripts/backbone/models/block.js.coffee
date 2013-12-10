BbBlocks.Block = Backbone.Model.extend
  
  initialize: ->
    @view = new BbBlocks.BlockView model: this
    @fetch
      success: =>
        @view.render()
