@ItemsFilters = React.createClass
  getDefaultProps: ->
    filterData: {
      ownedOnly: true
      category: null
    }
    allowedCategories: []

  handleChecked: (e) ->
    @props.handleFilterChange(e.target.name, e.target.checked)

  handleSelected: (e) ->
    @props.handleFilterChange(e.target.name, e.target.value)

  render: ->
    React.DOM.div
      className: 'well items__filter-box'
      React.DOM.label
        htmlFor: "items-filter-category"
        'Category'
      React.DOM.select
        className: 'form-control items__category-filter margin-bottom'
        id: "items-filter-category"
        name: 'categories'
        defaultValue: @props.filterData.category
        onChange: @handleSelected
        React.DOM.option
          key: ""
          value: ""
        for category in @props.allowedCategories
          React.DOM.option
            key: category
            value: category
            category
      React.DOM.label
        'Owned Only'
        React.DOM.input
          type: 'checkbox'
          name: "ownedOnly"
          defaultChecked: @props.filterData.ownedOnly
          onChange: @handleChanged
