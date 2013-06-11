# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  window.map = {}
  
  $('#scouting_report_star_id').typeahead(
    source: (query, process) ->
      $.get(
        'http://evedata.herokuapp.com/solar_systems'
        { limit: 5, name: query }
        (data) ->
          console.log "==========================="
          names = []
          $.each(data, (key, val) ->
            names.push(data[key].name)
            console.log "ID: #{data[key].id}, NAME: #{data[key].name}"
          )
          process(names)
      )
    updater: (item) ->
      console.log("'" + item + "' selected.")
      return item
            
    minLength: 2
    items: 5
  )
