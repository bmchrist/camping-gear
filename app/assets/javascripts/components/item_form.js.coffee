@ItemForm = React.createClass
  getInitialState: ->
    id: @props.item.id
    name: @props.item.name || ''
    category: @props.item.category || ''
    grams: @props.item.grams || ''
    owned: @props.item.owned || false

  getDefaultProps: ->
    item: {}

  editing: ->
    !!@state.id

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  handleChecked: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.checked

  handleUpdate: (e) ->
    e.preventDefault()
    $.ajax
      method: 'PUT'
      url: "/items/#{ @props.item.id }"
      dataType: 'JSON'
      data: { item: @state }
      success: (data) =>
        @props.handleUpdateItem(original: @props.item, new: data)

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { item: @state }, (data) =>
      @props.handleNewItem data
      @setState @getInitialState()
    , 'JSON'

  handleCancel: (e) ->
    e.preventDefault()
    @props.handleCancelEditing()

  valid: ->
    @state.name && (@state.grams >= 0 || !@state.grams) && @state.owned != null

  render: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.div
          className: 'form-group'
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
      React.DOM.td null,
        React.DOM.div
          className: 'form-group'
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
      React.DOM.td null,
        React.DOM.div
          className: 'form-group'
          React.DOM.input
            id: 'category'
            type: 'text'
            className: 'form-control'
            placeholder: 'Category'
            name: 'category'
            value: @state.category
            onChange: @handleChange
      React.DOM.td null,
        React.DOM.div
          className: 'form-group'
          React.DOM.label
            htmlFor: 'owned'
            React.DOM.input
              id: 'owned'
              type: 'checkbox'
              name: 'owned'
              checked: @state.owned
              onChange: @handleChecked
      React.DOM.td null,
        if @editing()
          [
            React.DOM.a
              key: "update"
              className: 'btn btn-primary'
              onClick: @handleUpdate
              disabled: !@valid()
              'Update'
            React.DOM.a
              key: "cancel"
              className: 'btn btn-default'
              onClick: @handleCancel
              disabled: !@valid()
              'Cancel'
          ]
        else
          React.DOM.button
            key: "add"
            type: 'submit'
            className: 'btn btn-success'
            onClick: @handleSubmit
            disabled: !@valid()
            'Add'
