window.SandboxCollection = Backbone.Collection.extend

  model: Sandbox

  url: ->
    @page.url() + '/sandboxes'

  publish: ->
    @each (sandbox) ->
      sandbox.publish()
