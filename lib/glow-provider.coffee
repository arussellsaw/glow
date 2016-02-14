GlowView = require './glow-view'
{CompositeDisposable} = require 'atom'
{Subscriber, Emitter} = require('emissary')

module.exports =
class GlowProvider
  Subscriber.includeInto(this)

  statusBar: null
  views: {}

  constructor: (statusBar) ->
    @statusBar = statusBar
    atom.packages.onDidActivatePackage((pkg) => @getGoPlus(pkg))

  getGoPlus: (pkg) ->
    if pkg.name is 'go-plus'
      @dispatch = pkg.mainModule.getDispatch()
      @subscribe(@dispatch.on('messages-collected', (event) => @handleEvent(event)))

  handleEvent: (event) ->
    if event is 0
      @green()
    else
      @red()

  newGlow: (name) ->
    gv = new GlowView(name)
    @statusBar.addRightTile(item: gv,priority:1000)
    @views[name] = gv

  getGlow: (name) ->
    if !@views.hasOwnProperty(name)
      this.newGlow name
    return @views[name]

  green: ->
    this.getGlow('default').green()

  red: ->
    this.getGlow('default').red()

  blue: ->
    this.getGlow('default').blue()

  color: (color) ->
    this.getGlow('default').color(color)
