@Trip = React.createClass
  render: ->
    React.DOM.div null,
      React.DOM.a
        React.createElement ReactRouter.Link,
          to: "/app/trips"
          '< Back'
      React.DOM.p null, @props.params.id
