$ ->
  if $('#corporations-show').length != 0
    corp_id = $('#corporation-eveid').text()
    eveapi_url = "https://api.eveonline.com/corp/CorporationSheet.xml.aspx?corporationID=#{corp_id}"
    requestXmlCrossDomain(eveapi_url, (data) ->
      xml = (new DOMParser()).parseFromString(data.results, 'text/xml')
      
      if xml
        alliance_name = $(xml).find('allianceName').text()
        member_count = $(xml).find('memberCount').text()
        ticker = $(xml).find('ticker').text()
        ceo_name = $(xml).find('ceoName').text()
        
        $('#corporation-alliance-name').text(alliance_name)
        $('#corporation-membercount').text(member_count)
        $('#corporation-ticker').text(ticker)
        $('#corporation-ceoname').text(ceo_name)
      else
        throw new Error('Nothing returned from getJSON.')
    )

requestXmlCrossDomain = (site, callback) ->
  # If no url was passed, exit.
  if !site
    alert('No site was passed.')
    return false

  # Take the provided url, and add it to a YQL query. Make sure you encode it!
  yql = 'http://query.yahooapis.com/v1/public/yql?q=' + encodeURIComponent('select * from xml where url="' + site + '"') + '&format=xml&callback=?'
  
  #Out put the yql string for debugging
  console.log yql

  # Request that YSQL string, and run a callback function.
  # Pass a defined function to prevent cache-busting.
  $.getJSON(yql, callback)
