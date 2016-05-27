@Item = React.createClass
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
      React.DOM.td null, @props.item.owned
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'
