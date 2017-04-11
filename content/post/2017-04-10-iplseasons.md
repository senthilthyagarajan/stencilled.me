---
title: Indian Premier League so far.
subtitle: Using excel and d3js
date: 2017-04-10
tags: ["excel", "d3js"]
---

Indian Premier League(IPL) has had 13 different teams over the past ten years. In this project I have tried to visualize how these teams 
have performed over the years.
<!--more-->
{{< highlight javascript >}}

<style>

svg text{
  fill:grey;
  font-size:11px;
}
svg .values text{
  pointer-events:none;
  stroke-width: 0.5px;
}
.groups:hover{
  cursor:pointer;
  font-weight:bold;
}
</style>
<body>
<script src="https://d3js.org/d3.v4.min.js"></script>
<script src="http://vizjs.org/viz.v1.1.0.min.js"></script>
<script>

var data = [['Chennai Super Kings','Deccan Chargers',6],
['Chennai Super Kings','Delhi Daredevils',11],
['Chennai Super Kings','Kings XI Punjab',10],
['Chennai Super Kings','Kochi Tuskers Kerala',1],
['Chennai Super Kings','Kolkata Knight Riders',10],
['Chennai Super Kings','Mumbai Indians',10],
['Chennai Super Kings','Pune Warriors',4],
['Chennai Super Kings','Rajasthan Royals',11],
['Chennai Super Kings','Royal Challengers Bangalore',12],
['Chennai Super Kings','Sunrisers Hyderabad',4],
['Deccan Chargers','Chennai Super Kings',4],
['Deccan Chargers','Delhi Daredevils',4],
['Deccan Chargers','Kings XI Punjab',3],
['Deccan Chargers','Kochi Tuskers Kerala',1],
['Deccan Chargers','Kolkata Knight Riders',2],
['Deccan Chargers','Mumbai Indians',4],
['Deccan Chargers','Pune Warriors',3],
['Deccan Chargers','Rajasthan Royals',2],
['Deccan Chargers','Royal Challengers Bangalore',6],
['Delhi Daredevils','Chennai Super Kings',5],
['Delhi Daredevils','Deccan Chargers',7],
['Delhi Daredevils','Gujarat Lions',1],
['Delhi Daredevils','Kings XI Punjab',8],
['Delhi Daredevils','Kochi Tuskers Kerala',1],
['Delhi Daredevils','Kolkata Knight Riders',7],
['Delhi Daredevils','Mumbai Indians',9],
['Delhi Daredevils','Pune Warriors',3],
['Delhi Daredevils','Rajasthan Royals',6],
['Delhi Daredevils','Royal Challengers Bangalore',6],
['Delhi Daredevils','Sunrisers Hyderabad',3],
['Gujarat Lions','Delhi Daredevils',1],
['Gujarat Lions','Kings XI Punjab',1],
['Gujarat Lions','Kolkata Knight Riders',2],
['Gujarat Lions','Mumbai Indians',2],
['Gujarat Lions','Rising Pune Supergiants',2],
['Gujarat Lions','Royal Challengers Bangalore',1],
['Kings XI Punjab','Chennai Super Kings',7],
['Kings XI Punjab','Deccan Chargers',7],
['Kings XI Punjab','Delhi Daredevils',10],
['Kings XI Punjab','Gujarat Lions',1],
['Kings XI Punjab','Kochi Tuskers Kerala',1],
['Kings XI Punjab','Kolkata Knight Riders',6],
['Kings XI Punjab','Mumbai Indians',9],
['Kings XI Punjab','Pune Warriors',3],
['Kings XI Punjab','Rajasthan Royals',6],
['Kings XI Punjab','Rising Pune Supergiants',1],
['Kings XI Punjab','Royal Challengers Bangalore',10],
['Kings XI Punjab','Sunrisers Hyderabad',2],
['Kochi Tuskers Kerala','Chennai Super Kings',1],
['Kochi Tuskers Kerala','Delhi Daredevils',1],
['Kochi Tuskers Kerala','Kolkata Knight Riders',2],
['Kochi Tuskers Kerala','Mumbai Indians',1],
['Kochi Tuskers Kerala','Rajasthan Royals',1],
['Kolkata Knight Riders','Chennai Super Kings',6],
['Kolkata Knight Riders','Deccan Chargers',7],
['Kolkata Knight Riders','Delhi Daredevils',10],
['Kolkata Knight Riders','Kings XI Punjab',13],
['Kolkata Knight Riders','Mumbai Indians',5],
['Kolkata Knight Riders','Pune Warriors',4],
['Kolkata Knight Riders','Rajasthan Royals',6],
['Kolkata Knight Riders','Rising Pune Supergiants',2],
['Kolkata Knight Riders','Royal Challengers Bangalore',9],
['Kolkata Knight Riders','Sunrisers Hyderabad',6],
['Mumbai Indians','Chennai Super Kings',12],
['Mumbai Indians','Deccan Chargers',6],
['Mumbai Indians','Delhi Daredevils',9],
['Mumbai Indians','Kings XI Punjab',9],
['Mumbai Indians','Kolkata Knight Riders',13],
['Mumbai Indians','Pune Warriors',5],
['Mumbai Indians','Rajasthan Royals',10],
['Mumbai Indians','Rising Pune Supergiants',1],
['Mumbai Indians','Royal Challengers Bangalore',11],
['Mumbai Indians','Sunrisers Hyderabad',4],
['Pune Warriors','Chennai Super Kings',2],
['Pune Warriors','Deccan Chargers',1],
['Pune Warriors','Delhi Daredevils',2],
['Pune Warriors','Kings XI Punjab',3],
['Pune Warriors','Kochi Tuskers Kerala',1],
['Pune Warriors','Kolkata Knight Riders',1],
['Pune Warriors','Mumbai Indians',1],
['Pune Warriors','Rajasthan Royals',1],
['Rajasthan Royals','Chennai Super Kings',6],
['Rajasthan Royals','Deccan Chargers',7],
['Rajasthan Royals','Delhi Daredevils',10],
['Rajasthan Royals','Kings XI Punjab',9],
['Rajasthan Royals','Kochi Tuskers Kerala',1],
['Rajasthan Royals','Kolkata Knight Riders',9],
['Rajasthan Royals','Mumbai Indians',6],
['Rajasthan Royals','Pune Warriors',4],
['Rajasthan Royals','Royal Challengers Bangalore',7],
['Rajasthan Royals','Sunrisers Hyderabad',4],
['Rising Pune Supergiants','Delhi Daredevils',2],
['Rising Pune Supergiants','Kings XI Punjab',1],
['Rising Pune Supergiants','Mumbai Indians',1],
['Rising Pune Supergiants','Sunrisers Hyderabad',1],
['Royal Challengers Bangalore','Chennai Super Kings',7],
['Royal Challengers Bangalore','Deccan Chargers',5],
['Royal Challengers Bangalore','Delhi Daredevils',10],
['Royal Challengers Bangalore','Gujarat Lions',2],
['Royal Challengers Bangalore','Kings XI Punjab',8],
['Royal Challengers Bangalore','Kochi Tuskers Kerala',2],
['Royal Challengers Bangalore','Kolkata Knight Riders',9],
['Royal Challengers Bangalore','Mumbai Indians',8],
['Royal Challengers Bangalore','Pune Warriors',5],
['Royal Challengers Bangalore','Rajasthan Royals',8],
['Royal Challengers Bangalore','Rising Pune Supergiants',2],
['Royal Challengers Bangalore','Sunrisers Hyderabad',4],
['Sunrisers Hyderabad','Chennai Super Kings',2],
['Sunrisers Hyderabad','Delhi Daredevils',5],
['Sunrisers Hyderabad','Gujarat Lions',3],
['Sunrisers Hyderabad','Kings XI Punjab',6],
['Sunrisers Hyderabad','Kolkata Knight Riders',3],
['Sunrisers Hyderabad','Mumbai Indians',4],
['Sunrisers Hyderabad','Pune Warriors',2],
['Sunrisers Hyderabad','Rajasthan Royals',3],
['Sunrisers Hyderabad','Rising Pune Supergiants',1],
['Sunrisers Hyderabad','Royal Challengers Bangalore',5]]


;

var colors = {
"Chennai Super Kings":              "#F6F93B"
,"Deccan Chargers":                 "#E97D23"
,"Delhi Daredevils":                "#DF320B"
,"Gujarat Lions":                   "#FAA555"
,"Kings XI Punjab":                 "#F37D8A"
,"Kochi Tuskers Kerala":            "#9144E7"
,"Kolkata Knight Riders":           "#AF54D9"
,"Mumbai Indians":                  "#134DCC"
,"Pune Warriors":                   "#84A9FB"
,"Rajasthan Royals":                "#0350FB"
,"Rising Pune Supergiants":         "#F380EE"
,"Royal Challengers Bangalore":     "#FC0D05"
,"Sunrisers Hyderabad":             "#F27303"
};

var sortOrder =[
"Chennai Super Kings"        
,"Deccan Chargers"           
,"Delhi Daredevils"           
,"Gujarat Lions"            
,"Kings XI Punjab"            
,"Kochi Tuskers Kerala"       
,"Kolkata Knight Riders"      
,"Mumbai Indians"             
,"Pune Warriors"             
,"Rajasthan Royals"          
,"Rising Pune Supergiants"   
,"Royal Challengers Bangalore"
,"Sunrisers Hyderabad"
];

function sort(a,b){ return d3.ascending(sortOrder.indexOf(a),sortOrder.indexOf(b)); }

var ch = viz.ch().data(data)
      .padding(.01)
      .sort(sort)
	  .innerRadius(430)
	  .outerRadius(450)
	  .duration(1000)
	  .chordOpacity(0.3)
	  .labelPadding(.03)
      .fill(function(d){ return colors[d];});

var width=1300, height=1100;

var svg = d3.select("body").append("svg").attr("height",height).attr("width",width);

svg.append("g").attr("transform", "translate(600,550)").call(ch);

// adjust height of frame in bl.ocks.org
d3.select(self.frameElement).style("height", height+"px").style("width", width+"px");     
</script>

{{< /highlight >}}

I got the data for this project from <a href="https://www.kaggle.com/manasgarg/ipl/downloads/ipl.zip">Kaggle.</a> As per the dataset 577 games were 
played so far for which 574 of them had results and 3 games had no results. Just hover over each team to see how their performance has been.
