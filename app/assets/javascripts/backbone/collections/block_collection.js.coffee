window.BlockCollection = Backbone.Collection.extend

  model: Block

  url: ->
    '/sandboxes/' + @sandbox.id + '/blocks'

  initialize: ->
    @fetch
      success: =>
        @each (block) =>
          block.view.$el.appendTo @sandbox.view.$el
