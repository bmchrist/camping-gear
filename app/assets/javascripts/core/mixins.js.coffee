Mixins = {}
window.Mixins = Mixins

Mixins.AjaxLoader = {
  # TODO make sure loading: true was initially set
  componentWillMount: ->
    @setState(loading: true)

  componentDidMount: ->
    if typeof @ajaxLoaderResultsVariable == "undefined"
      console.error("Must define ajaxLoaderResultsVaraible")

    # TODO: one day have this check cache and only load if cache is outdated
    @serverRequest = $.getJSON(@props.source, (results) =>
      state = { loading: false }
      state[@ajaxLoaderResultsVariable] = results
      @setState(state)
    )

  componentWillUnmount: ->
    @serverRequest.abort()
}
