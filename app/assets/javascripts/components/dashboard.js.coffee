@Dashboard = React.createClass
  getInitialState: ->
    propsForComponent: {}

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
        className: if window.location.pathname == '/app/trips' then 'active' else ''
        role: 'navigation'
        React.createElement ReactRouter.Link,
          to: "/app/trips"
          'Trips'
      React.DOM.li
        className: if window.location.pathname == '/app/gear' then 'active' else ''
        role: 'navigation'
        React.createElement ReactRouter.Link,
          to: "/app/gear"
          'Gear List'

$(document).ready ->
  Router = ReactRouter.Router
  window.browserHistory = ReactRouter.browserHistory
  Route = ReactRouter.Route
  Link = ReactRouter.Link

  ReactDOM.render(
    React.createElement Router, { history: browserHistory },
      React.createElement Route,
        component: Dashboard
        path: "/app"
        [
          React.createElement Route,
            path: "/app/gear",
            component: GearList
          React.createElement Route,
            path: "/app/trips",
            component: Trips
          React.createElement Route,
            path: "/app/trip_form",
            component: TripForm
        ]
    document.getElementById("container")
  )
