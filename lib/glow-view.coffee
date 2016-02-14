module.exports =
class GlowView
  element = null
  constructor: (name) ->
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('glow')
    @element.title = name
    @element.classList.add('inline-block')


  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element

  red: ->
    @element.style.backgroundColor = '#ff5555'

  blue: ->
    @element.style.backgroundColor = '#55e0ff'

  green: ->
    @element.style.backgroundColor = '#91ed59'

  color: (color) ->
    @element.style.backgroundColor = color
