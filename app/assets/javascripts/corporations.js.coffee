# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('#corporations').ready(
    $('.corporation').each(
      (index) ->
        corp_obj = $($('.corporation').get(index))
        corp_id = corp_obj.children('.corporation-name').text()
        eveapi_url = "https://api.eveonline.com/corp/CorporationSheet.xml.aspx?corporationID=#{corp_id}"
        requestCrossDomain(eveapi_url, (data) ->
          xml = (new DOMParser()).parseFromString(data.results, 'text/xml')  
          
          if xml
            name =          $(xml).find('corporationName').text()
            alliance_name = $(xml).find('allianceName').text()
            ceo_name =      $(xml).find('ceoName').text()
            member_count =  $(xml).find('memberCount').text()
            
            #Fill the HTML elements with info
            corp_obj.children('.corporation-name').empty()
            corp_obj.children('.corporation-name').append("<a href='corporations/#{corp_id}'>#{name}</a>")
            
            corp_obj.children('.corporation-alliance-name').text(alliance_name)
            corp_obj.children('.corporation-ceo-name').text(ceo_name)
            corp_obj.children('.corporation-membercount').text(member_count)
          else
            throw new Error('Nothing returned from getJSON.')
        )
    )
  )
  
  $('#corporation').ready(
    corp_id = $('#corporation').children('#corporation-name').text()
    if corp_id
      eveapi_url = "https://api.eveonline.com/corp/CorporationSheet.xml.aspx?corporationID=#{corp_id}"
      requestCrossDomain(eveapi_url, (data) ->
        xml = (new DOMParser()).parseFromString(data.results, 'text/xml')
        
        if xml
          name = $(xml).find('corporationName').text()
          hq = $(xml).find('stationName').text()
          $('#corporation').children('#corporation-name').text(name)
          $('#corporation').children('#corporation-hq').append(hq)
        else
          throw new Error('Nothing returned from getJSON.')
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
