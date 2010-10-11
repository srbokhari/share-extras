function main()
{
    var s = new XML(config.script);
    var defaultLocation = parseInt(s.defaultLoc, 8); // London by default
    var locID = (args.location != null) ? args.location : defaultLocation;
    var forecastUrl = s.forecastURL.toString().replace("{loc}", locID);
    var observationsUrl = s.observationsURL.toString().replace("{loc}", locID);
    
    var connector = remote.connect("http");
    var obsResult = connector.get(observationsUrl);
    
    if (obsResult.status == 200)
    {
        var rssXml = new String(obsResult.response);    
        var re = /<[r|R][s|S]{2}/; // Is this really an RSS document?
        if (re.test(rssXml))
        {
	        // Strip out any preceding xml processing instructions or E4X will choke
	        var idx = rssXml.search(re);
	        rssXml = rssXml.substring(idx);
	        
	        // It looks we need to get rid of the trailing junk as well.
	        if ( rssXml.indexOf('</rss>') != -1 ) {     
	            rssXml = rssXml.substring(0,rssXml.indexOf('</rss>')+6);
	        }
	         
	        // Parse the xml document
	        var rss = new XML(rssXml);
	        var items = rss.channel.item.description.toString().split(", ");
	        
           var conditions = rss.channel.item.title.toString().split(": ")[1].split(".")[0];
           var temp = items[0].split(": ")[1];
           
           var geons = new Namespace('http://www.w3.org/2003/01/geo/wgs84_pos#');
	        
	        model.location = {
	           "id": locID,
	           "name": rss.channel.title.toString().split(" Latest Observations for ")[1],
               "observationsURL": rss.channel.item.link.toString(),
               "forecastURL": ""
	        };
	        
	        model.observations = {
               "conditions": conditions,
               "temperature": temp.substring(0, temp.indexOf(" ")), // Temp in celcuis for now
               "windDir": items[1].split(": ")[1],
               "windSpeed": items[2].split(": ")[1],
               "humidity": items[3].split(": ")[1],
               "pressure": items[4].split(": ")[1],
               "pressureTrend": items[5],
               "visibility": items[6].split(": ")[1],
               "pubDate": new Date(rss.channel.pubDate.toString()),
               "lat": rss.channel.item["geons::lat"].toString(),
               "lon": rss.channel.item["geons::long"].toString()
	        };
        }
	    else
	    {
	        status.code = 500;
	        status.message = "The observations page " + observationsUrl + " does not appear to be an RSS feed";
	        status.redirect = true;
	    }
    }
    else
    {
        status.code = 500;
        status.message = "An error occurred fetching the observations page " + observationsUrl + " (status code " + obsResult.status + ")";
        status.redirect = true;
    }
}

main();