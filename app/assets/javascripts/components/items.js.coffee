@Items = React.createClass
  getInitialState: ->
    items: @props.data
    editingItemId: null
    filterData: {}

  getDefaultProps: ->
    data: []

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
    @setState items: items

  updateItem: (props) ->
    items = @state.items.slice()
    index = items.indexOf props.original
    items[index] = props.new
    @replaceState editingItemId: null, items: items

  handleFilterChange: (filter, value) ->
    filterData = @state.filterData
    filterData[filter] = value
    @setState filterData: filterData

  render: ->
    React.DOM.div
      className: 'items'
      React.createElement ItemsFilters, filterData: @state.filterData, handleFilterChange: @handleFilterChange
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
            if !!@state.filterData.owned and !item.owned
              continue
            if item.id == @state.editingItemId
              React.createElement ItemForm, key: item.id, handleUpdateItem: @updateItem, item: item, handleCancelEditing: @cancelEditing
            else
              React.createElement Item, key: item.id, item: item, handleDeleteItem: @deleteItem, handleEditItem: @setEditing
          React.createElement ItemForm, handleNewItem: @addItem
