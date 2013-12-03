#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.BbBlocks = {}

$ ->
  window.page = new Page(id: 1)
  page.fetch()
  page.sandboxes.fetch
    success: ->
      _.each $('.sandbox'), (sandboxDiv) ->
        name = sandboxDiv.id.replace 'sandbox-', ''
        sandbox = page.sandboxes.findWhere(name: name) or
            page.sandboxes.add(name: name, page_id: page.id).save()
