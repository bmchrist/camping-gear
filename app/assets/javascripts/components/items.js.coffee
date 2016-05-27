@Items = React.createClass
  getInitialState: ->
    items: @props.data
  getDefaultProps: ->
    items: []
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
            React.DOM.th null, 'Grams'
            React.DOM.th null, 'Owned?'
        React.DOM.tbody null,
          for item in @state.items
            React.createElement Item, key: item.id, item: item
