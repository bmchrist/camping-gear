@ItemsFilters = React.createClass
  getDefaultProps: ->
    filterData: {
      owned: true
    }

  handleChecked: (e) ->
    @props.handleFilterChange(e.target.name, e.target.checked)

  render: ->
    React.DOM.div
      className: 'well'
      React.DOM.label
        'Owned Only'
        React.DOM.input
          type: 'checkbox'
          name: "owned"
          defaultChecked: @props.filterData.owned
          onChange: @handleChecked
