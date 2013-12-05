window.Sandbox = Backbone.Model.extend
  initialize: ->
    @blocks = _.extend new BlockCollection(), sandbox: this
    @view = new SandboxView(model: this)
    @page = @collection.page

    @blocks.fetch
      success: =>
        _.each @get('order'), (block_id) =>
          @blocks.findWhere(id: block_id).view.$el.appendTo @view.$el
