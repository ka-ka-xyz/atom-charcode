AtomCharcodeView = require './atom-charcode-view'
iconv = require 'iconv-lite'
encodings =
  utf8:
    status: 'UTF-8'
  utf16le:
    status: 'UTF-16 LE'
  utf16be:
    status: 'UTF-16 BE'
  windows1252:
    status: 'Windows 1252'
  iso88591:
    status: 'ISO 8859-1'
  iso88593:
    status: 'ISO 8859-3'
  iso885915:
    status: 'ISO 8859-15'
  macroman:
    status: 'Mac Roman'
  cp437:
    status: 'CP437'
  windows1256:
    status: 'Windows 1256'
  iso88596:
    status: 'ISO 8859-6'
  windows1257:
    status: 'Windows 1257'
  iso88594:
    status: 'ISO 8859-4'
  iso885914:
    status: 'ISO 8859-14'
  windows1250:
    status: 'Windows 1250'
  iso88592:
    status: 'ISO 8859-2'
  windows1251:
    status: 'Windows 1251'
  windows866:
    status: 'Windows 866'
  iso88595:
    status: 'ISO 8859-5'
  koi8r:
    status: 'KOI8-R'
  koi8u:
    status: 'KOI8-U'
  iso885913:
    status: 'ISO 8859-13'
  windows1253:
    status: 'Windows 1253'
  iso88597:
    status: 'ISO 8859-7'
  windows1255:
    status: 'Windows 1255'
  iso88598:
    status: 'ISO 8859-8'
  iso885910:
    status: 'ISO 8859-10'
  iso885916:
    status: 'ISO 8859-16'
  windows1254:
    status: 'Windows 1254'
  iso88597:
    status: 'ISO 8859-9'
  windows1258:
    status: 'Windows 1254'
  gbk:
    status: 'GBK'
  shiftjis:
    status: 'Shift JIS'
  eucjp:
    status: 'EUC-JP'
  euckr:
    status: 'EUC-KR'

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
        encodings[editor.getEncoding()]["status"]) +
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
