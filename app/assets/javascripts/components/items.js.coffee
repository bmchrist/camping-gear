@Items = React.createClass
  getInitialState: ->
    items: @props.data
    editingItemId: null

  #getDefaultProps: ->
    #items: []

  setEditing: (item) ->
    @setState editingItemId: item.id

  cancelEditing: ->
    @setState editingItemId: null

  addItem: (item) ->
    items = @state.items.slice()
    items.push(item)
    @setState items: items

  deleteItem: (item) ->
    items = @state.items.slice()
    index = items.indexOf item
    items.splice index, 1
    @replaceState items: items

  updateItem: (props) ->
    items = @state.items.slice()
    index = items.indexOf props.original
    items[index] = props.new
    @replaceState editingItemId: null, items: items

  render: ->
    React.DOM.div
      className: 'items'
      React.DOM.h2
        className: 'title'
        'Items'
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Name'
            React.DOM.th null, 'Weight (Grams)'
            React.DOM.th null, 'Owned?'
            React.DOM.th null, 'Actions'
        React.DOM.tbody null,
          for item in @state.items
            if item.id == @state.editingItemId
              React.createElement ItemForm, key: item.id, handleUpdateItem: @updateItem, item: item, handleCancelEditing: @cancelEditing
            else
              React.createElement Item, key: item.id, item: item, handleDeleteItem: @deleteItem, handleEditItem: @setEditing
          React.createElement ItemForm, handleNewItem: @addItem, item: {}
