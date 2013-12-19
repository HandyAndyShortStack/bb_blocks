BbBlocks.Sandbox = Backbone.Model.extend

  initialize: ->
    CustomBlockCollection = BbBlocks.BlockCollection.extend(sandbox: this)
    @blocks = new CustomBlockCollection()
    @view = new BbBlocks.SandboxView(model: this)
    @page = @collection.page

  getOrder: ->
    _.map @view.$el.find('.block').toArray(), (el) ->
      parseInt el.id[6..], 10

  publish: (callback) ->
    @blocks.saveSync =>
      @set order: @getOrder()
      @save {}, success: callback
