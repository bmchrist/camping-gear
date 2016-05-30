window.Helpers = {}

Helpers.convertWeight = (grams, desiredFormat) ->
  switch(desiredFormat)
    when "grams" then grams
    when "kilograms" then (grams/1000).toFixed(3)
    when "ounces" then (grams*0.035274).toFixed(2)
    when "pounds" then (grams*0.0022046249999752).toFixed(2)
    else throw("unsupported format requested from convertWeight")
