window.SandboxCollection = Backbone.Collection.extend
  model: Sandbox
  initialize: (@page) ->
    @url = ->
      @page.url() + '/sandboxes'
