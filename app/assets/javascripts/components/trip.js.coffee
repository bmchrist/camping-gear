# TODO: look into best practices here, this feels a bit gross
@TripContainer = React.createClass
  propTypes:
    params: React.PropTypes.shape # Via the Router/URI
      id: React.PropTypes.string.isRequired

  mixins: [Mixins.AjaxLoader]
  ajaxLoaderResultsVariable: "trip"
  source: -> "/trips/#{@props.params.id}"

  getInitialState: ->
    trip: {}

  render: ->
    React.DOM.div
      className: "trip-container"
      React.DOM.div null,
        React.DOM.a
          React.createElement ReactRouter.Link,
            to: "/app/trips"
            '< Back'
      React.DOM.div null,
        if @state.loading
          React.DOM.span null, "Loading..."
        else
          React.createElement Trip, @state.trip

@Trip = React.createClass
  render: ->
    console.log(@props)
    React.DOM.div null,
      React.DOM.p null,
        "ID: " + @props.id
      React.DOM.p null,
        "Name: " + @props.name
      React.DOM.p null,
        "Description: " + (@props.description || "")
