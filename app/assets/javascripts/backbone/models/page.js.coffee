window.Page = Backbone.Model.extend

  urlRoot: '/pages'

  initialize: ->
    CustomSandboxCollection = SandboxCollection.extend(page: this)
    @sandboxes = new CustomSandboxCollection()
