@Item = React.createClass
  propTypes:
    handleEditItem: React.PropTypes.func,
    handleDeleteItemEditing: React.PropTypes.func,
    item: React.PropTypes.shape
      id: React.PropTypes.number.isRequired,
      name: React.PropTypes.string,
      grams: React.PropTypes.number,
      owned: React.PropTypes.bool,
      category: React.PropTypes.string

  handleEditClick: (e) ->
    @props.handleEditItem @props.item

  handleDeleteClick: (e) ->
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
          onClick: @handleDeleteClick
          'Delete'
        React.DOM.a
          className: 'btn btn-primary'
          onClick: @handleEditClick
          'Edit'
