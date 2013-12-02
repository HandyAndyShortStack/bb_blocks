window.BlockCollection = Backbone.Collection.extend
  model: Block
  initialize: (@sandbox) ->
    @url = ->
      @sandbox.url() + '/blocks'
