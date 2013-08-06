$ ->
  unless $('#control_tower_form').length == 0
    names = []
    corp_hash = {}
    for corp in corporations
      names.push(corp["name"])
      corp_hash[corp["name"]] = corp["id"]
      
    $('#corporation_name').typeahead(
      source: names
        
      updater: (item) ->
        console.log "(brave-pos-tracker) selecting corporation: #{item} (id:#{corp_hash[item]})"
        $('#control_tower_corporation_id').val(corp_hash[item])
        return item
              
      minLength: 3
      items: 5
    )
    
    $('#control_tower_type_id').ready(
      () ->
        console.log "looking up control towers"
        $.get(
          'http://evedata.herokuapp.com/items'
          { group: "Control Tower", limit: 50 }
          (data) ->
            $.each(data, (key, val) ->
              $('#control_tower_type_id').append("<option value='#{data[key].id}'>#{data[key].name}</option>")
            )
        )
    )
    
  unless $('#control_tower_show').length == 0
    type_id = $('#control_tower_icon').text()
    $.get(
      "http://evedata.herokuapp.com/items/#{type_id}"
      (data) ->
        $('#control_tower_icon').empty()
        $('#control_tower_icon').append("<img src='#{data[0].images.thumb}' />&nbsp;<b>#{data[0].name}</b>")
    )
    
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
