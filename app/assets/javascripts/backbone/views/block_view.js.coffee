window.BlockView = Backbone.View.extend

  render: ->
    @$el.html '<div style="background-color:green;height:100px;width:100px"></div>'
    this
  
  initialize: ->
    @template = $('#template-' + @model.get('type')).html()
    console.log @model.get('type')
    @listenTo @model, "change", @render
    @render()
