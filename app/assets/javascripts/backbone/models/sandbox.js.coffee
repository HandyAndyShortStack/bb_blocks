window.Sandbox = Backbone.Model.extend
  urlRoot: '/sandboxes'
  initialize: ->
    @blocks = new BlockCollection(this)
