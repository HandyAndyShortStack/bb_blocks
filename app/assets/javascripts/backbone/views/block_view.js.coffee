BbBlocks.BlockView = Backbone.View.extend

  className: 'block'

  id: ->
    'block-' + @model.id

  render: ->
    @$el.html _.template(@template, @model.options)
    this
  
  initialize: ->
    @template = @sharedTemplate + $('#template-' + @model.get('type')).text()
    @listenTo @model, 'change', @render
    @render()
  
  enter: ->
    @$el.appendTo @model.collection.sandbox.view.$el    

  resetId: ->
    @$el.attr('id', @id())
