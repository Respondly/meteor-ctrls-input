sizeMap =
  'c-size-50': 'c-btn-large'
  'c-size-32': 'c-btn'
  'c-size-28': 'c-btn-small'
  'c-size-22': 'c-btn-mini'


###
A standard button.

Events:
  - clicked

###
Ctrl.define
  'c-button':
    init: ->
      throwUnlessSupported = (attr, value, supportedValues) =>
          unless (supportedValues.any (item) -> item is value)
            throw new Error("#{ attr } '#{ value }' not supported. Use one of: #{ supportedValues }")

      @autorun => throwUnlessSupported('size', @api.size(), [50, 32, 28, 22])
      @autorun => throwUnlessSupported('color', @api.color(), ['silver', 'blue', 'green', 'red', 'orange', 'black', null])



    api:
      ###
      REACTIVE Properties.
      ###
      isEnabled: (value) -> @prop 'isEnabled', value, default:true
      labelOnly: (value) -> @prop 'labelOnly', value, default:false
      size:      (value) -> @prop 'size', value, default:32
      label:     (value) -> @prop 'label', value
      color:     (value) -> @prop 'color', value, default:'silver'
      isPressed: (value) -> @prop 'isPressed', value, default:false
      tabIndex:  (value) -> @prop 'tabIndex', value
      isOver:    (value) -> @prop 'isOver', value, default:false

      ###
      Simulates a click action on the button.
      ###
      click: ->
        @helpers.onClick(true)
        Util.delay => @helpers.onClick(false)



    helpers:
      cssClass: ->
        isEnabled = @api.isEnabled()
        labelOnly = @api.labelOnly()

        cssSize = "c-size-#{ @api.size() }"
        cssBtn = sizeMap[cssSize]

        if labelOnly and not @api.isOver()
          color = 'c-label-only'
        else
          color = @api.color()
          color = '' if color is 'silver'
          color = '' if color is null
          color = '' if not isEnabled
          color = "c-#{ color }" unless color is ''

        css = "#{ cssSize } #{ cssBtn } #{ color }"
        css += ' c-enabled' if isEnabled
        css += ' c-disabled' if not isEnabled
        css += " #{ @defaultValue('cssClass') }"
        css

      disabled: -> 'disabled' unless @api.isEnabled()
      tabIndex: -> @api.tabIndex() ? ''

      label: ->
        label = @api.label()
        return if label is null
        label = 'Unnamed' if Util.isBlank(label)
        label

      fire: (event) -> @trigger(event, { label:@api.label() })

      onClick: (isPressed) ->
        if @api.isEnabled()
          @api.isPressed(isPressed)
          if isPressed is false
            @helpers.fire('clicked')


    events:
      'mousedown': (e) -> @helpers.onClick(true) if e.button is 0
      'mouseup': (e) -> @helpers.onClick(false) if e.button is 0

      'mouseenter': (e) -> @api.isOver(true)
      'mouseleave': (e) -> @api.isOver(false)

      'keyup': (e) ->
        if @ctrl.hasFocus()
          @api.click() if e.which is Const.KEYS.ENTER

