BbBlocks.Sandbox = Backbone.Model.extend

  initialize: ->
    CustomBlockCollection = BbBlocks.BlockCollection.extend(sandbox: this)
    @blocks = new CustomBlockCollection()
    @view = new BbBlocks.SandboxView(model: this)
    @page = @collection.page

  getOrder: ->
    _.map @view.$el.find('.block').toArray(), (el) ->
      parseInt el.id[6..], 10

  updateOrder: ->
    @set order: @getOrder()

  publish: (callback) ->
    iterator = (model, callback) ->
      model.save {}, success: ->
        callback()
    async.each @blocks.models, iterator, =>
      @updateOrder()
      @save {}, success: ->
        callback()
