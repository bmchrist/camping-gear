@Trip = React.createClass
  propTypes:
    params: React.PropTypes.shape # Via the Router/URI
      id: React.PropTypes.number.isRequired

  render: ->
    React.DOM.div null,
      React.DOM.a
        React.createElement ReactRouter.Link,
          to: "/app/trips"
          '< Back'
      React.DOM.p null, @props.params.id
