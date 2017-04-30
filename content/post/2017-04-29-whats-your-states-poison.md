---
title: Breweries or Wineries ??
subtitle: Whats your states poison ?
date: 2017-04-29
tags: ["qgis"]
---

<style>

.myIframe {
position: relative;
padding-bottom: 65.25%;
padding-top: 30px;
height: 0;
overflow: auto;
-webkit-overflow-scrolling:touch; //<<--- THIS IS THE KEY
border: solid black 1px;
}
.myIframe iframe {
position: absolute;
top: 0;
left: 0;
width: 100%;
height: 100%;
}
</style>


When you think about Texas, the first thing that would come in mind is barbecue which of course  pairs well with a good beer. In this post I have mapped each state in the 
US ranked based on the breweries or wineries present. I got the data from the Brewers Association and the American Winery Guide. With data visualization being so 
important in representing the dataset I have used hexbins shapefile from   <a href="https://github.com/donmeltz/US-States---Hexbins">Don Meltz's repo</a>.

<!--more-->

Below are the maps for how the states are ranked .


![This is an image](breweries.png)

![This is an image](wineries.png)

![This is an image](winebeer.png)

While doing this whole excerice in QGIS , I did see an extension "qgis2threejs". Using this extension and the number of wineries as a extrusion parameter
this was another way of represeting the data.

![This is an image](wineries_extru.PNG)

To view the extrusion you may using "Shift + Ctrl + Up / Down" to zoom in and zoom out.

 <!-- map code start -->
            <div class='myIframe' >
      <iframe width="720" height="600" src="https://s3.amazonaws.com/hugocontent/static/extru1.html"></iframe>
            </div>
			

It was pretty surprising to see Texas being more of a wine state than a beer state . Well that again gives me more reason to travel to new places for a good beer.CHEERS