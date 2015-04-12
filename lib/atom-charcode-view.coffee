module.exports =
class AtomCharcodeView
  constructor: (serializeState) ->
    # Create root element
    myself = @
    @element = document.createElement('div')
    @element.classList.add("status-bar-atom-charcode","inline-block")
    #myself.element.textContent = " intializing (intializing)"
    atom.packages.once 'activated', ->
        document.querySelector("status-bar")?.
        addLeftTile(item: myself.element, priority: 1000)


    # Register command that toggles this view
    atom.commands.add 'atom-workspace', 'atom-charcode:toggle': => @toggle()

  text: (msg) ->
    @element.textContent = msg

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  # Toggle the visibility of this view
  toggle: ->
