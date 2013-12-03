window.Sandbox = Backbone.Model.extend
  initialize: ->
    @blocks = _.extend new BlockCollection(), sandbox: this
    @view = new SandboxView(model: this)
    @page = @collection.page

    @blocks.fetch()
