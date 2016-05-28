@Item = React.createClass
  handleEdit: (e) ->
    @props.handleEditItem @props.item

  handleCancel: (e) ->
    @props.handleCancelEditing()

  handleDelete: (e) ->
    e.preventDefault()
    if confirm("Are you sure you want to delete this?")
      $.ajax
        method: 'DELETE'
        url: "/items/#{ @props.item.id }"
        dataType: 'JSON'
        success: =>
          @props.handleDeleteItem @props.item

  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.item.name
      React.DOM.td null,
        "#{Helpers.convertWeight(@props.item.grams, "kilograms")}kg | #{Helpers.convertWeight(@props.item.grams, "ounces")}oz"
      React.DOM.td null, @props.item.category
      React.DOM.td null, if @props.item.owned then 'yes' else 'no'
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'
        React.DOM.a
          className: 'btn btn-primary'
          onClick: @handleEdit
          'Edit'
