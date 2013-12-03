window.Page = Backbone.Model.extend
  urlRoot: '/pages'
  initialize: ->
    @sandboxes = _.extend new SandboxCollection(), page: this
