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
          React.createElement ReactRouter.IndexRedirect,
            to: "/app/trips"
            key: "index"
          React.createElement Route,
            key: "gear"
            path: "/app/gear",
            component: GearList
          React.createElement Route,
            key: "trips"
            path: "/app/trips",
            component: Trips
          React.createElement Route,
            key: "trip_form"
            path: "/app/trip_form",
            component: TripForm
          React.createElement Route,
            key: "trip"
            path: "/app/trips/:id",
            component: TripContainer
        ]
    document.getElementById("container")
  )
