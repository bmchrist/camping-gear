@Trips = React.createClass
  mixins: [Mixins.AjaxLoader]
  ajaxLoaderResultsVariable: "trips"
  source: "/trips"

  getInitialState: ->
    trips: []

  render: ->
    React.DOM.div
      className: 'trips'

      React.DOM.button
        type: 'submit'
        className: 'btn btn-success'
        onClick: => @props.setCurrentComponent(TripForm)
        '+ New'

      if @state.loading
        React.createElement "p", null, "Loading gear..."
      else
        React.createElement TripsTable, trips: @state.trips, setCurrentComponent: @props.setCurrentComponent

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
          React.createElement TripTableRecord, key: trip.id, trip: trip, setCurrentComponent: @props.setCurrentComponent

@TripTableRecord = React.createClass
  render: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.a
          onClick: => @props.setCurrentComponent(Trip, { trip: @props.trip })
          @props.trip.name
      React.DOM.td null, @props.trip.start_date || "N/A"
      React.DOM.td null, @props.trip.end_date || "N/A"
