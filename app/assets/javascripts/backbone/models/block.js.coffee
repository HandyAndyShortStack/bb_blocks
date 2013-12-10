BbBlocks.Block = Backbone.Model.extend
  
  initialize: ->
    viewConstructor = BbBlocks[@get('type') + 'View'] || BbBlocks.BlockView
    @view = new viewConstructor(model: this)
    @fetch
      success: =>
        @view.render()
