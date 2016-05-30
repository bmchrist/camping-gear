@Trips = React.createClass
  mixins: [Mixins.AjaxLoader]
  ajaxLoaderResultsVariable: "trips"
  source: "/trips"

  getInitialState: ->
    trips: []

  render: ->
    React.DOM.div
      className: 'trips'

      React.createElement ReactRouter.Link,
        to: "/app/trip_form"
        React.DOM.button
          type: 'submit'
          className: 'btn btn-success'
          '+ New'

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
          React.DOM.th null, 'Start Date'
          React.DOM.th null, 'End Date'
      React.DOM.tbody null,
        for trip in @props.trips
          React.createElement TripTableRecord, key: trip.id, trip: trip

@TripTableRecord = React.createClass
  render: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.createElement ReactRouter.Link,
          to: "/app/trips/#{@props.trip.id}"
          @props.trip.name
      React.DOM.td null, @props.trip.start_date || "N/A"
      React.DOM.td null, @props.trip.end_date || "N/A"
