@Item = React.createClass
  handleEdit: (e) ->
    @props.handleEditItem @props.item

  convertWeight: (grams, desiredFormat) ->
    switch(desiredFormat)
      when "grams" then grams
      when "kilograms" then (grams/1000).toFixed(3)
      when "ounces" then (grams*0.035274).toFixed(2)
      when "pounds" then (grams*0.0022046249999752).toFixed(2)

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
        "#{@convertWeight(@props.item.grams, "kilograms")}kg | #{@convertWeight(@props.item.grams, "ounces")}oz"
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
