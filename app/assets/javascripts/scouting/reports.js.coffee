# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  window.star_ids = {}
  
  $('#scouting_report_solar_system_name').typeahead(
    source: (query, process) ->
      $.get(
        'http://evedata.herokuapp.com/solar_systems'
        { limit: 5, name: query }
        (data) ->
          console.log "==========================="
          names = []
          $.each(data, (key, val) ->
            names.push(data[key].name)
            star_ids[data[key].name] = data[key].id
            console.log "ID: #{data[key].id}, NAME: #{data[key].name}"
          )
          process(names)
      )
    updater: (item) ->
      $('#scouting_report_solar_system_id').val(star_ids[item])
      console.log("'" + item + "' selected.")
      console.log("star_id set to: "+star_ids[item])
      return item
            
    minLength: 2
    items: 5
  )
