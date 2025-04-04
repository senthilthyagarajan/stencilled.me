---
title: Colleges vs Breweries - What tops in your State ?
date: 2018-09-24
---


In this post we see how the no. of breweries stack up against no. of colleges across USA. Here I am using d3js and a grid bar chartwhere each grid represents 5 breweries/colleges.I collected the data for Brewery
from <a href="https://www.beeradvocate.com/">Beer Advocate</a> and for colleges from <a href="https://en.m.wikipedia.org">wikipedia</a>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <link href="main.css" rel="stylesheet">
    <title>More Breweries than Colleges</title>
  </head>
  <body>
    <div id="chart">
      <svg width="1000" height="370">
        <g class="chart" transform="translate(20, 40)">
          <text class="title" x="300" y="-11" >Breweries vs Colleges in US</text>
          <g class="legend" transform="translate(870,-20)" >
            <rect width="13" height="13" />
            <text x="17" y="11"> = 5 </text>
          </g>
          <g class="y axis" />
          <g class="bars" transform="translate(10, 0)"></g>
        </g>
      </svg>
    </div>
    <div id="menu">
      <select class="mode">
        <option value="top10">Top 10 States</option>
        <option value="bottom10">Bottom 10 States</option>
      </select>
      <select class="year">
        <option value="College"selected>College</option>
        <option value="Brewery" >Brewery</option>
      </select>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/d3/4.4.4/d3.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.11/lodash.min.js"></script>
    <script>

    var tilesPerRow = 5;
    var tileSize = 15;
    var barPadding = 20;
    var maxValue = 100;
    var numVisibleCountries = 10;

    var barWidth = (tilesPerRow * tileSize) + barPadding;

    var data, filteredData;
    let colors = ["#8dd3c7","#a6cee3","#bebada","#fb8072","#80b1d3","#fdb462","#b3de69","#fccde5","#d9d9d9","#bc80bd"];

    var selectedYear = "College", selectedMode = "top10";

    function initializeData() {
      data = data.map(function(d) {
        return {
          name: d.country,
          year: d.year,
          age: +d.all
        }
      });
    }

    function updateFilteredData() {
      filteredData = data.filter(function(d) {
        return d.year === selectedYear;
      });
      filteredData = _.sortBy(filteredData, function(d) {
        return selectedMode === "top10" ? -d.age : d.age;
      });
      filteredData = filteredData.slice(0, numVisibleCountries);
    }

    function getTiles(num) {
      var tiles = [];

      for(var i = 0; i < num; i++) {
        var rowNumber = Math.floor(i / tilesPerRow);
        tiles.push({
          x: (i % tilesPerRow) * tileSize,
          y: -(rowNumber + 1) * tileSize
        });
      }

      return tiles
    }

    function updateBar(d, i) {
      var tiles = getTiles(d.age/5);

      var u = d3.select(this)
        .attr("transform", "translate(" + i * barWidth + ", 300)")
        .selectAll("rect")
        .data(tiles);

      u.enter()
        .append("rect")
        .style("opacity", 0)
        .style("stroke", "white")
        .style("stroke-width", "0.5")
        .style("shape-rendering", "crispEdges")
        .merge(u)
        .attr("x", function(d) {
          return d.x;
        })
        .attr("y", function(d) {
          return d.y;
        })
        .attr("width", tileSize)
        .attr("height", tileSize)
        .transition()
        .delay(function(d, i) {
          return i * 20;
        })
        .style("opacity", 1);


      u.exit()
        .transition()
        .delay(function(d, i) {
          return (100 - i) * 20;
        })
        .style("opacity", 0)
        .on("end", function() {
          d3.select(this).remove();
        });
    }

    function updateLabel(d) {
      var el = d3.select(this)
        .select("text");

      if(el.empty()) {
        el = d3.select(this)
          .append("text")
          .attr("y", -4)
          .attr("transform", "rotate(-90)")
          .style("font-weight", "bold")
          .style("font-size", "12px")
          .style("fill", "#777");
      }

      el.text(d.name);
    }

    function updateBars() {
      var u = d3.select("g.bars")
        .selectAll("g")
        .data(filteredData);

      u.enter()
        .append("g")
        .merge(u)
        .style("fill", function(d, i) {
          return colors[i % colors.length];
        })
        .each(updateBar)
        .each(updateLabel);

      u.exit().remove();
    }

    function updateAxis() {
      var chartWidth = numVisibleCountries * barWidth;
      var chartHeight = (maxValue / tilesPerRow) * tileSize;

      var yScale = d3.scaleLinear().domain([0, maxValue]).range([chartHeight, 0]);
      var yAxis = d3.axisRight().scale(yScale).tickSize(chartWidth);

      d3.select(".y.axis")
        .call(yAxis);
    }

    function initialize() {
      initializeData();

      d3.select("select.mode")
        .on("change", function() {
          selectedMode = this.value;
          update();
        })

      d3.select("select.year")
        .on("change", function() {
          selectedYear = this.value;
          update();
        });
    }

    function update() {
      updateFilteredData();
      updateBars();
      updateAxis();
    }

    d3.tsv("College_Brewery.tsv", function(err, tsv) {


      data = tsv;

      initialize();
      update();
    });

    </script>
  </body>
</html>
