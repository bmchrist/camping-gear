@GearList = React.createClass
  mixins: [Mixins.AjaxLoader]
  ajaxLoaderResultsVariable: "items"

  getInitialState: ->
    items: []
    editingItemId: null
    filterData: {
      ownedOnly: false
      category: null
    }

  categories: ->
    categories = []
    for item in @state.items
      if item.category not in categories
        categories.push(item.category)
    categories

  totalGrams: ->
    weight = 0
    for item in @filteredItems()
      continue if isNaN(item.grams)
      weight = weight + item.grams
    weight

  filteredItems: ->
    @state.items.filter (item) =>
      (!@state.filterData.ownedOnly or item.owned) and
        (!@state.filterData.category or item.category == @state.filterData.category)

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
    @setState editingItemId: null, items: items

  handleFilterChange: (filter, value) ->
    filterData = @state.filterData
    filterData[filter] = value
    @setState filterData: filterData

  render: ->
    React.DOM.div
      className: 'items'
      React.createElement "p", null,
        "#{Helpers.convertWeight(@totalGrams(), "kilograms")} kg"
      React.createElement "p", null,
        "#{Helpers.convertWeight(@totalGrams(), "pounds")} pounds"
      React.DOM.div
        className: 'col-md-2'
        React.createElement ItemsFilters,
          filterData: @state.filterData,
          handleFilterChange: @handleFilterChange,
          allowedCategories: @categories()
      React.DOM.div
        className: 'col-md-10'
        if @state.loading
          React.createElement "p", null, "Loading gear..."
        else
          React.DOM.table
            className: 'table table-bordered'
            React.DOM.thead null,
              React.DOM.tr null,
                React.DOM.th null, 'Name'
                React.DOM.th null, 'Weight (Grams)'
                React.DOM.th null, 'Category'
                React.DOM.th null, 'Owned?'
                React.DOM.th null, 'Actions'
            React.DOM.tbody null,
              for item in @filteredItems()
                if item.id == @state.editingItemId
                  React.createElement ItemForm, key: item.id, handleUpdateItem: @updateItem, item: item, handleCancelEditing: @cancelEditing
                else
                  React.createElement Item, key: item.id, item: item, handleDeleteItem: @deleteItem, handleEditItem: @setEditing
              React.createElement ItemForm, handleNewItem: @addItem
