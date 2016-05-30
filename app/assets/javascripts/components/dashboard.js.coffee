@Dashboard = React.createClass
  getInitialState: ->
    currentComponent: 'GearList'

  navigateGearList: ->
    @setState currentComponent: 'GearList'

  navigateTrips: ->
    @setState currentComponent: 'Trips'

  render: ->
    React.DOM.div
      className: 'dashboard'
      React.DOM.ul
        className: 'nav nav-tabs'
        React.DOM.li
          className: if @state.currentComponent == 'Trips' then 'active' else ''
          role: 'navigation'
          onClick: @navigateTrips
          React.DOM.a null,
            'Trips'
        React.DOM.li
          className: if @state.currentComponent == 'GearList' then 'active' else ''
          role: 'navigation'
          onClick: @navigateGearList
          React.DOM.a null,
            'Gear List'
      if @state.currentComponent == 'GearList'
        React.createElement GearList, source: @props.items_source
      else if @state.currentComponent == 'Trips'
        # TODO: this
      else
        console.error("No component selected on dash")
