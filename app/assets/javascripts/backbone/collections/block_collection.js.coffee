window.BlockCollection = Backbone.Collection.extend
  model: Block
  url: ->
    '/sandboxes/' + @sandbox.id + '/blocks'
