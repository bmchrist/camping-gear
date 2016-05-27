@ItemForm = React.createClass
  getInitialState: ->
    name: ''
    grams: ''
    owned: ''
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { item: @state }, (data) =>
      @props.handleNewItem data
      @setState @getInitialState()
    , 'JSON'
  valid: ->
    @state.name && (@state.grams >= 0 || !@state.grams)
  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Name'
          name: 'name'
          value: @state.name
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'number'
          className: 'form-control'
          placeholder: 'Grams'
          name: 'grams'
          value: @state.grams
          onChange: @handleChange
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Create record'
