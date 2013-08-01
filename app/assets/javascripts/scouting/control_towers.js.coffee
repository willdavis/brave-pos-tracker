# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('#controltowers').ready(
    $('.controltower').each(
      (index) ->
        tower_obj = $($('.controltower').get(index))
        corp_id = tower_obj.children('.controltower-corp-name').text()
        eveapi_url = "https://api.eveonline.com/corp/CorporationSheet.xml.aspx?corporationID=#{corp_id}"
        requestCrossDomain(eveapi_url, (data) ->
          xml = (new DOMParser()).parseFromString(data.results, 'text/xml')
          
          if xml
            name = $(xml).find('corporationName').text()
            alliance_name = $(xml).find('allianceName').text()
            tower_obj.children('.controltower-corp-name').empty()
            tower_obj.children('.controltower-corp-name').append("<a href='../../corporations/#{corp_id}'>#{name}</a>")
            tower_obj.children('.controltower-alliance-name').text(alliance_name)
        )
    )
  )
  
requestCrossDomain = (site, callback) ->
  # If no url was passed, exit.
  if !site
    alert('No site was passed.')
    return false

  # Take the provided url, and add it to a YQL query. Make sure you encode it!
  yql = 'http://query.yahooapis.com/v1/public/yql?q=' + encodeURIComponent('select * from xml where url="' + site + '"') + '&format=xml&callback=?'
  
  #Out put the yql string for debugging
  #console.log yql

  # Request that YSQL string, and run a callback function.
  # Pass a defined function to prevent cache-busting.
  $.getJSON(yql, callback)
