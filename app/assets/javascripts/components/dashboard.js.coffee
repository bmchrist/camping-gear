@Dashboard = React.createClass
  getInitialState: ->
    currentComponent: 'Trips'

  setCurrentComponent: (component) ->
    @setState currentComponent: component

  render: ->
    React.DOM.div
      className: 'dashboard'
      React.createElement DashboardNav, handleNavClick: @setCurrentComponent, currentComponent: @state.currentComponent

      if @state.currentComponent == 'GearList'
        React.createElement GearList, source: @props.items_source
      else if @state.currentComponent == 'Trips'
        React.createElement Trips, source: @props.trips_source
      else
        console.error("No component selected on dash")

@DashboardNav = React.createClass
  render: ->
    React.DOM.ul
      className: 'nav nav-tabs'
      React.DOM.li
        className: if @props.currentComponent == 'Trips' then 'active' else ''
        role: 'navigation'
        onClick: => @props.handleNavClick('Trips')
        React.DOM.a null,
          'Trips'
      React.DOM.li
        className: if @props.currentComponent == 'GearList' then 'active' else ''
        role: 'navigation'
        onClick: => @props.handleNavClick('GearList')
        React.DOM.a null,
          'Gear List'
