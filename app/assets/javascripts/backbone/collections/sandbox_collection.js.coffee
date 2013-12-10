BbBlocks.SandboxCollection = Backbone.Collection.extend

  model: BbBlocks.Sandbox

  url: ->
    @page.url() + '/sandboxes'

  publish: ->
    @each (sandbox) ->
      sandbox.publish()
