@Dashboard = React.createClass
  render: ->
    React.DOM.div
      className: 'dashboard'
      React.createElement DashboardNav
      @props.children

@DashboardNav = React.createClass
  render: ->
    React.DOM.ul
      className: 'nav nav-tabs'
      React.DOM.li
        role: 'navigation'
        React.createElement ReactRouter.Link,
          activeClassName: "active"
          to: "/app/trips"
          'Trips'
      React.DOM.li
        role: 'navigation'
        React.createElement ReactRouter.Link,
          activeClassName: "active"
          to: "/app/gear"
          'Gear List'

