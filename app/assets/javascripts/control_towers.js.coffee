$ ->
  unless $('#control_tower_form').length == 0
    corp_names = []
    corp_hash = {}
    for corp in corporations
      corp_names.push(corp["name"])
      corp_hash[corp["name"]] = corp["id"]
      
    $('#corporation_name').typeahead(
      source: corp_names
        
      updater: (item) ->
        console.log "(brave-pos-tracker) selecting corporation: #{item} (id:#{corp_hash[item]})"
        $('#control_tower_corporation_id').val(corp_hash[item])
        return item
              
      minLength: 3
      items: 5
    )
    
    window.star_map = {}
    
    $('#solar_system_name').typeahead(
      source: (query, process) ->
        $.get(
          'http://evedata.herokuapp.com/solar_systems'
          { limit: 5, name: query }
          (data) ->
            star_names = []
            
            $.each(data, (key, val) ->
              star_names.push(data[key].name)
              star_map[data[key].name] = data[key].id
            )
            process(star_names)
        )
      
      updater: (item) ->
        $('#control_tower_solar_system_id').val(star_map[item])
        return item
              
      minLength: 3
      items: 5
    )
    
    $('#control_tower_type_id').ready(
      () ->
        $.get(
          'http://evedata.herokuapp.com/items'
          { group: "Control Tower", limit: 50 }
          (data) ->
            $.each(data, (key, val) ->
              $('#control_tower_type_id').append("<option value='#{data[key].id}'>#{data[key].name}</option>")
            )
        )
    )
    
    $('#solar_system_name').change(
      () ->
        $('#control_tower_moon_id').empty()
        
        location = $('#solar_system_name').val()
        $.get(
          'http://evedata.herokuapp.com/celestials'
          { solar_system: location, group_id: 8, limit: 100 }
          (data) ->
            $('#control_tower_constellation_id').val(data[0].constellation.id)
            $('#control_tower_region_id').val(data[0].region.id)
            
            $.each(data, (key, val) ->
              $('#control_tower_moon_id').append("<option value='#{data[key].id}'>#{data[key].name}</option>")
            )
        )
    )
    
    $('#control_tower_moon_id').change(
      () ->
        $('#control_tower_moon_name').empty()
        
        id = $('#control_tower_moon_id').val()
        $.get(
          "http://evedata.herokuapp.com/celestials/#{id}"
          (data) ->
            $('#control_tower_moon_name').val(data[0].name)
        )
    )
    
  unless $('#control_tower_show').length == 0
    type_id = $('#control_tower_icon').text()
    solar_system_id = $('#solar_system_name').text()
    $.get(
      "http://evedata.herokuapp.com/items/#{type_id}"
      (data) ->
        $('#control_tower_icon').empty()
        $('#control_tower_icon').append("<img src='#{data[0].images.thumb}' />&nbsp;<b>#{data[0].name}</b>")
    )
    
    $.get(
      "http://evedata.herokuapp.com/celestials/#{solar_system_id}"
      (data) ->
        $('#solar_system_name').text(data[0].name)
        $('#constellation_name').text(data[0].constellation.name)
        $('#region_name').text(data[0].region.name)
    )
    
    utc_time = $('#reinforcement_timer_expires_at').text()
    $('#reinforcement_timer_countdown').countdown({until: new Date(utc_time)})
    
  unless $('#control_tower_index').length == 0
    $('.control_tower').each(
      (index) ->
        obj = $($('.control_tower').get(index))
        type_id = obj.children('.type_id').text()
        $.get(
          "http://evedata.herokuapp.com/items/#{type_id}"
          (data) ->
            obj.children('.type_id').empty()
            obj.children('.type_id').append("#{data[0].name}")
        )
    )
    
    $('.solar_system_name').each(
      (index) ->
        obj = $($('.solar_system_name').get(index))
        id = obj.text()
        $.get(
          "http://evedata.herokuapp.com/celestials/#{id}"
          (data) ->
            obj.text(data[0].name)
        )
    )
