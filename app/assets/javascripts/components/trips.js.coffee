@Trips = React.createClass
  mixins: [Mixins.AjaxLoader]
  ajaxLoaderResultsVariable: "trips"

  getInitialState: ->
    trips: []

  render: ->
    React.DOM.div
      className: 'trips'
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
            React.DOM.tbody null,
              for trip in @state.trips
                React.createElement Trip, key: trip.id, trip: trip

@Trip = React.createClass
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.trip.name
