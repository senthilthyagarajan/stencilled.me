---
title: Harry Potter Characters.
subtitle: Using d3js
date: 2017-05-02
tags: ["d3js"]
---

Across 7 books/ 8 movies there are so many characters in this series by J.K Rowling. For this project with the data source is from 
<a href="https://data.world/harishkgarg/harry-potter-universe">data.world</a>.All files here were combined to create a json with nodes and links.
Using d3js I have  visualized  the characters connected to each other.

<!--more-->

{{< highlight javascript >}}

<style>

.link {
  fill: none;
  stroke-width: 0.5px;
}

.link.win{
    stroke: #a6d96a;
}

.link.loss{
    stroke: #ca0020;
}

.node text {
  pointer-events: none;
  font: 10px sans-serif;
}

</style>
<body>
<script src="https://d3js.org/d3.v3.min.js"></script><script>

//Constants for the SVG
var width = 1080,
  height = 900;

//Set up the colour scale
var color = d3.scale.category10();

//Set up the force layout
var force = d3.layout.force()
  .charge(-620)
  .linkDistance(200)
  .size([width, height]);

//Append a SVG to the body of the html page. Assign this SVG as an object to svg
var svg = d3.select("body").append("svg")
  .attr("width", width)
  .attr("height", height);

//Read the data from the mis element
d3.json("https://raw.githubusercontent.com/senthilthyagarajan/stencilled.me/master/content/post/2017-05-02-Harry-Potter-Characters/hp.json", function(error, graph) {
    if (error) throw error;
//Creates the graph data structure out of the json data
force.nodes(graph.nodes)
  .links(graph.links)
  .start();

//Create all the line svgs but without locations yet
var link = svg.selectAll(".link")
  .data(graph.links)
  .enter().append("line")
  .attr("class", "link")
  .style("stroke-width", function(d) {
    return Math.sqrt(d.value);
  });

//Do the same with the circles for the nodes - no
//Changed
var radiusScale = d3.scale.linear()

var node = svg.selectAll(".node")
  .data(graph.nodes)
  .enter().append("g")
  .attr("class", "node")
  .call(force.drag);

node.append("circle")
//  .attr("r", 8)
  .style("fill", function(d) {
    return color(d.group)
  })
  .attr('r', function(d) {
        	d.radius = radiusScale(d.count);
        	return d.radius;
        });

node.append("text")
  .attr("dx", 10)
  .attr("dy", ".35em")
  .text(function(d) {
    return d.name
  });
//End changed


			node.on("mouseover", function (d) {
        var highlightedNodes = {};

				link.style('stroke-width', function(l) {
				    if (d === l.source || d === l.target){
            highlightedNodes[l.source.name] = 1;
            highlightedNodes[l.target.name] = 1;
            return 2;
          }
          return 0;
				})
      });
//Now we are giving the SVGs co-ordinates - the force layout is generating the co-ordinates which this code is using to update the attributes of the SVG elements
force.on("tick", function() {
  link.attr("x1", function(d) {
      return d.source.x;
    })
    .attr("y1", function(d) {
      return d.source.y;
    })
    .attr("x2", function(d) {
      return d.target.x;
    })
    .attr("y2", function(d) {
      return d.target.y;
    });

    link.attr("class", function(d) { return "link "+ d.value});



  //Changed

  d3.selectAll("circle").attr("cx", function(d) {
      return d.x;
    })
    .attr("cy", function(d) {
      return d.y;
    });

  d3.selectAll("text").attr("x", function(d) {
      return d.x;
    })
    .attr("y", function(d) {
      return d.y;
    });




    function unhoverNode() {
            link.attr('stroke-width', 0.25);
        };

  //End Changed

});

});
</script>


{{< /highlight >}}

Their might me an odd instance when the characters might have been connected somehow and I missed it . Feel free to 
use this <a href="https://raw.githubusercontent.com/senthilthyagarajan/stencilled.me/master/content/post/2017-05-02-Harry-Potter-Characters/hp.json">HP graph</a>
and visualize.

