@ItemForm = React.createClass
  getInitialState: ->
    name: ''
    grams: ''
    owned: false
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  handleChecked: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.checked
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
      className: 'form'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.label
          htmlFor: 'name'
          'Name'
        React.DOM.input
          id: 'name'
          type: 'text'
          className: 'form-control'
          placeholder: 'Name'
          name: 'name'
          value: @state.name
          onChange: @handleChange
        React.DOM.small
          className: 'text-muted'
          'The name of the item'
      React.DOM.div
        className: 'form-group'
        React.DOM.label
          htmlFor: 'grams'
          'Weight (grams)'
        React.DOM.input
          type: 'number'
          id: 'grams'
          className: 'form-control'
          placeholder: 'Grams'
          name: 'grams'
          value: @state.grams
          onChange: @handleChange
        React.DOM.small
          className: 'text-muted'
          'The weight in grams. We\'ll convert this for you later'
      React.DOM.div
        className: 'form-group'
        React.DOM.label
          htmlFor: 'owned'
          'Owned?'
          React.DOM.input
            id: 'owned'
            type: 'checkbox'
            name: 'owned'
            value: @state.owned
            onClick: @handleChecked
        React.DOM.small
          className: 'text-muted'
          'Do you already own this?'
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Create record'
