GlowView = require './glow-view'
{CompositeDisposable} = require 'atom'

module.exports = Glow =
  glowView: null
  subscriptions: null
  statusBar: null

  activate: (state) ->
    @glowView = new GlowView(state.glowViewState)
    @subscriptions = new CompositeDisposable

  deactivate: ->
    @subscriptions.dispose()
    @glowView.destroy()

  serialize: ->
    glowViewState: @glowView.serialize()

  consumeStatusBar: (statusBar) ->
    console.log "consuming status-bar"
    @statusBar = statusBar
    @statusBar.addRightTile(item: @glowView, priority: 1000)

  provideGlow: ->
    @glowView
