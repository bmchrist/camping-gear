@Item = React.createClass
  displayOwnedStatus: (val) ->
    if val
      "Yes"
    else
      "No"

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
      React.DOM.td null, @props.item.grams
      React.DOM.td null, @displayOwnedStatus(@props.item.owned)
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'
        React.DOM.a
          className: 'btn btn-primary'
          onClick: @handleEdit
          'Edit'
