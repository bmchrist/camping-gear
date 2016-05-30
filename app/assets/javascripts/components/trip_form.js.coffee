@TripForm = React.createClass
  getInitialState: ->
    name: ""
    start_date: ""
    end_date: ""

  handleChange: (e) ->
    @setState "#{ e.target.name }": e.target.value

  handleCancel: (e) ->
    e.preventDefault()
    browserHistory.push('/app/trips')

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '/trips', { trip: @state }, (data) =>
      # TODO
      null
    , 'JSON'

  render: ->
    React.DOM.div
      className: "col-md-12"
      React.DOM.form
        className: "form"
        React.DOM.label
          htmlFor: "name"
          "Name"
        React.DOM.input
          id: "name"
          name: "name"
          type: "text"
          className: "form-control"
          placeholder: "Name"
          value: @state.name
          onChange: @handleChange
        React.DOM.button
          className: "btn btn-default"
          onClick: @handleCancel
          "Cancel"
        React.DOM.button
          className: "btn btn-primary"
          onClick: @handleSubmit
          type: "submit"
          "Create"
