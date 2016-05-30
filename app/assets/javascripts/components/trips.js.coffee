@Trips = React.createClass
  mixins: [Mixins.AjaxLoader]
  ajaxLoaderResultsVariable: "trips"

  getInitialState: ->
    trips: []

  render: ->
    React.DOM.div
      className: 'trips'
      if @state.loading
        React.createElement "p", null, "Loading gear..."
      else
        React.createElement TripsTable, trips: @state.trips

@TripsTable = React.createClass
  render: ->
    React.DOM.table
      className: 'table table-bordered'
      React.DOM.thead null,
        React.DOM.tr null,
          React.DOM.th null, 'Name'
      React.DOM.tbody null,
        for trip in @props.trips
          React.createElement TripTableRecord, key: trip.id, trip: trip

@TripTableRecord = React.createClass
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.trip.name
