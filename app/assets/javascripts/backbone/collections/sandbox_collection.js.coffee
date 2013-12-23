BbBlocks.SandboxCollection = Backbone.Collection.extend

  model: BbBlocks.Sandbox

  url: ->
    @page.url() + '/sandboxes'

  publish: (callback) ->
    iterator = (model, callback) ->
      model.publish callback
    async.each @models, iterator, callback
