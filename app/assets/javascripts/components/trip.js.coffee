@Trip = React.createClass
  render: ->
    React.DOM.div null,
      React.DOM.a
        onClick: => @props.setCurrentComponent(Trips)
        '< Back'
      React.DOM.p null, @props.trip.name
