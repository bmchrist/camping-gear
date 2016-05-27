@Item = React.createClass
  displayOwnedStatus: (val) ->
    if val
      "Yes"
    else
      "No"

  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/items/#{ @props.item.id }"
      dataType: 'JSON'
      success: () =>
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
