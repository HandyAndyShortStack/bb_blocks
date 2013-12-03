#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.BbBlocks = {}

$ ->
  page = window.page = new Page(id: 1)
  page.fetch()
  page.sandboxes.fetch()

  _.each $('.sandbox'), (sandboxDiv) ->
    name = sandboxDiv.id.replace 'sandbox-', ''
    sandbox = page.sandboxes.findWhere
