window.Page = Backbone.Model.extend
  urlRoot: '/pages'
  initialize: ->
    @sandboxes = new SandboxCollection(this)
