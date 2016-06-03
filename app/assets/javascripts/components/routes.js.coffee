$(document).ready ->
  Route = ReactRouter.Route

  ReactDOM.render(
    React.createElement ReactRouter.Router, { history: ReactRouter.browserHistory },
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

