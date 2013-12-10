window.Sandbox = Backbone.Model.extend

  initialize: ->
    CustomBlockCollection = BlockCollection.extend(sandbox: this)
    @blocks = new CustomBlockCollection()
    @view = new SandboxView(model: this)
    @page = @collection.page

  getOrder: ->
    _.map @view.$el.find('.block').toArray(), (el) ->
      parseInt el.id[6..], 10

  publish: (callback) ->
    @blocks.saveSync =>
      @set order: @getOrder()
      @save()
