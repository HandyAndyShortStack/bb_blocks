window.Sandbox = Backbone.Model.extend
  initialize: ->
    CustomBlockCollection = BlockCollection.extend(sandbox: this)
    @blocks = new CustomBlockCollection()
    @view = new SandboxView(model: this)
    @page = @collection.page
