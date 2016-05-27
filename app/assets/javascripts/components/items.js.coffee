@Items = React.createClass
  getInitialState: ->
    items: @props.data
  getDefaultProps: ->
    items: []
  addItem: (item) ->
    items = @state.items.slice()
    items.push(item)
    @setState items: items
  deleteItem: (item) ->
    items = @state.items.slice()
    index = items.indexOf item
    items.splice index, 1
    @replaceState items: items
  render: ->
    React.DOM.div
      className: 'items'
      React.DOM.h2
        className: 'title'
        'Items'
      React.createElement ItemForm, handleNewItem: @addItem
      React.DOM.hr null
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Name'
            React.DOM.th null, 'Grams'
            React.DOM.th null, 'Owned?'
            React.DOM.th null, 'Actions'
        React.DOM.tbody null,
          for item in @state.items
            React.createElement Item, key: item.id, item: item, handleDeleteItem: @deleteItem
