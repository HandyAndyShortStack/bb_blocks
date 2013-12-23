BbBlocks.BlockCollection = Backbone.Collection.extend

  model: BbBlocks.Block.extend {}

  url: ->
    '/sandboxes/' + @sandbox.id + '/blocks'

  initialize: ->
    @model = @model.extend
      defaults:
        _.extend (@model.defaults or {}), sandbox_id: @sandbox.id
    @fetch
      success: =>
        @each (block) ->
          block.view.enter()
