window.BlockView = Backbone.View.extend

  className: 'block'

  id: ->
    'block-' + @model.id

  render: ->
    @$el.html _.template(@template, @model.options)
    this
  
  initialize: ->
    @template = $('#template-' + @model.get('type')).html()
    @listenTo @model, 'change', @render
    @render()
