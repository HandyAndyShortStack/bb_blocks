BbBlocks.SandboxCollection = Backbone.Collection.extend

  model: BbBlocks.Sandbox

  url: ->
    @page.url() + '/sandboxes'

  publish: (callback) ->
    reduceFunc = (a, b) ->
      ->
        b.publish ->
          a()
    _.reduce(@models, reduceFunc, callback)()
