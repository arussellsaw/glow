GlowProvider = require './glow-provider'
{CompositeDisposable} = require 'atom'

module.exports = Glow =
  subscriptions: null

  activate: (state) ->
    @subscriptions = new CompositeDisposable

  deactivate: ->
    @subscriptions.dispose()

  consumeStatusBar: (statusBar) ->
    @glowProvider = new GlowProvider
    @glowProvider.statusBar = statusBar
    @glowProvider.color('#ffffff')
