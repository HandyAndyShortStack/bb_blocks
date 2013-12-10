BbBlocks.BlockCollection = Backbone.Collection.extend

  model: BbBlocks.Block

  url: ->
    '/sandboxes/' + @sandbox.id + '/blocks'

  initialize: ->
    @fetch
      success: =>
        @each (block) ->
          block.view.enter()
