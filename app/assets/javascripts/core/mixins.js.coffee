Mixins = {}
window.Mixins = Mixins

Mixins.AjaxLoader = {
  componentWillMount: ->
    @setState(loading: true)

  componentDidMount: ->
    if typeof @ajaxLoaderResultsVariable == "undefined"
      console.error("Must define ajaxLoaderResultsVaraible")
    if typeof @source == "undefined"
      console.error("Must define source")

    # TODO: one day have this check cache and only load if cache is outdated
    @serverRequest = $.getJSON(@source, (results) =>
      state = { loading: false }
      state[@ajaxLoaderResultsVariable] = results
      @setState(state)
    )

  componentWillUnmount: ->
    @serverRequest.abort()
}
