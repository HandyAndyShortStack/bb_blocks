BbBlocks.Page = Backbone.Model.extend

  urlRoot: '/pages'

  initialize: ->
    CustomSandboxCollection = BbBlocks.SandboxCollection.extend(page: this)
    @sandboxes = new CustomSandboxCollection()
