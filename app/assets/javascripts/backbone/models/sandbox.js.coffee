window.Sandbox = Backbone.Model.extend

  initialize: ->
    CustomBlockCollection = BlockCollection.extend(sandbox: this)
    @blocks = new CustomBlockCollection()
    @view = new SandboxView(model: this)
    @page = @collection.page

  getOrder: ->
    Array.apply null, @view.$el.find('.block').map ->
      parseInt @id[6..], 10
