BbBlocks.BlockCollection = Backbone.Collection.extend

  model: (attrs, options) ->
    model = BbBlocks[attrs.type] or BbBlocks.Block
    new model(attrs, options)

  url: ->
    '/sandboxes/' + @sandbox.id + '/blocks'

  initialize: ->
    @fetch
      success: =>
        @each (block) ->
          block.view.enter()
