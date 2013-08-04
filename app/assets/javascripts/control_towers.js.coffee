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
