{ CompositeDisposable } = require 'atom'
texts = require '../assets/texts'

module.exports = AtomJaDummy =
    subscriptions: null

    activate: (state) ->
        @subscriptions = new CompositeDisposable
        @subscriptions.add atom.commands.add 'atom-workspace', 'atom-ja-dummy:generateFirst': => @generate(1)
        @subscriptions.add atom.commands.add 'atom-workspace', 'atom-ja-dummy:generateSecond': => @generate(2)
        @subscriptions.add atom.commands.add 'atom-workspace', 'atom-ja-dummy:generateThird': => @generate(3)

    deactivate: ->
        @subscriptions.dispose()

    serialize: ->

    generate: ( type ) ->
        if editor = atom.workspace.getActiveTextEditor()
            switch type
                when  1
                    editor.insertText(texts.type1)
                when  2
                    editor.insertText(texts.type2)
                when  3
                    editor.insertText(texts.type3)
                else editor.insertText(texts.type1)
