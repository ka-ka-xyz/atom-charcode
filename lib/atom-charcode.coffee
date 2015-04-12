AtomCharcodeView = require './atom-charcode-view'
iconv = require 'iconv-lite'

myself = null
module.exports =
  atomCharcodeView: null

  activate: (state) ->
    @atomCharcodeView = new AtomCharcodeView(state.atomCharcodeViewState)

    myself = @
    atom.workspace.observeTextEditors (editor) ->
      editor.getLastCursor().onDidChangePosition (event) ->
        cursor = editor?.getLastCursor()
        col = cursor?.getBufferColumn();
        code = cursor?.getCurrentBufferLine().codePointAt(col)
        if !isNaN(code)
          char = String.fromCodePoint(code)
        else
          char = cursor?.getCurrentBufferLine().charAt(col)

        msg = myself?.getCurrentEncodingCharCode(char ,
        document.querySelector('encoding-selector-status')?.
          encodings[editor.getEncoding()].status) +
          "(" + myself?.getUnicodeCodePointStr(code) + ")"
          myself.atomCharcodeView.text(msg)

  deactivate: ->
     @atomCharcodeView.destroy()
  serialize: ->
    atomCharcodeViewState: @atomCharcodeView.serialize()

  getUnicodeCodePointStr: (code) ->
    rtn = ""
    if isNaN(code) is false
      rtn = code.toString(16).toUpperCase()

    if rtn.length < 1
      rtn = "0000"
    else if rtn.length < 4
      rtn = ("000" + rtn).slice(-4)
    "U+" + rtn

  getCurrentEncodingCharCode: (char, encodingType)->
    rtn = ""
    for c in iconv.encode(char, encodingType)
      rtn += c.toString(16).toUpperCase()
    if rtn.length < 1
      rtn = "0000"
    else if rtn.length < 4
      rtn = ("000" + rtn).slice(-4)
    "0x" + rtn
