BbBlocks.BlockView = Backbone.View.extend

  className: 'block'

  id: ->
    'block-' + @model.id

  render: ->
    @$el.html _.template(@template, @locals())
    this
  
  initialize: ->
    @template = @sharedTemplate + $('#template-' + @model.get('type')).text()
    @listenTo @model, 'change', @render
    @render()
  
  enter: ->
    @$el.appendTo @model.collection.sandbox.view.$el    

  resetId: ->
    @$el.attr('id', @id())

  locals: ->
    _.extend @blockOptionsDefaults[@model.get('type')], @model.get('options')

BbBlocks.BlockView.prototype.blockOptionsDefaults =
  ShowImageBlock:
    asset_url: 'http://lorempixel.com/200/100/cats/'
  HTMLBlock:
    content: '<h3><span style="color:red;">H</span><span style="color:green;">T</span><span style="color:skyblue;">M</span><span style="color:orchid;">L</span></h3>'
  BlueSquareBlock: {}
  RedSquareBlock: {}
  ContactFormBlock: {}
  PageMenuBlock:
    pages: [
      {
        title: 'Cats'
        url: 'http://simple.wikipedia.org/wiki/Cat'
      }
      {
        title: 'Doge'
        url: 'http://plspetdoge.com/'
      }
    ]
  PostListBlock: {}
  SlideshowBlock:
    images: [
      { asset_url: 'http://lorempixel.com/200/100/fashion/' }
      { asset_url: 'http://lorempixel.com/200/100/people/' }
    ]
  TextBlock:
    content: 'Placeholder Text'
