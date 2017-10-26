---
title: Airbnb Listing
subtitle: Using r 
date: 2017-10-25
tags: ["r"]
---

In this day of so many sharing services like Uber and Lyft , pricey hotels are being replaced by Airbnb. Students, working people and travelers wouldnt always want to pay a high price for staying a couple of nights at the Marriot and would rather stay at a place where they have the basic amenities needed for them at a reasonable price. So in this project I am trying to understand  the listings put on Airbnb on how the price varies by neighbourhood ,house type and various other factors.

 I am using the data for <a href="http://insideairbnb.com/about.html">New York</a> for this post. To start with we can see the properties listed by neighborhood across New York.In the table below you can see the count for the Airbnb listings aggregated at burrough level and neighborhood level.
 
 <div class="output_html rendered_html output_subarea ">
<table>
<thead><tr><th scope=col>Burrough</th><th scope=col>Count</th></tr></thead>
<tbody>
	<tr><td>Bronx        </td><td>  649        </td></tr>
	<tr><td>Brooklyn     </td><td>16810        </td></tr>
	<tr><td>Manhattan    </td><td>19212        </td></tr>
	<tr><td>Queens       </td><td> 3821        </td></tr>
	<tr><td>Staten Island</td><td>  261        </td></tr>
</tbody>
</table>

</div>

  <div class="output_html rendered_html output_subarea ">
<table>
<thead><tr><th scope=col>Neighbourhood</th><th scope=col>Count</th></tr></thead>
<tbody>
	<tr><td>Allerton                  </td><td>  23                      </td></tr>
	<tr><td>Arden Heights             </td><td>   6                      </td></tr>
	<tr><td>Arrochar                  </td><td>  14                      </td></tr>
	<tr><td>Arverne                   </td><td>  71                      </td></tr>
	<tr><td>Astoria                   </td><td> 755                      </td></tr>
	<tr><td>Bath Beach                </td><td>  11                      </td></tr>
	<tr><td>Battery Park City         </td><td>  65                      </td></tr>
	<tr><td>Bay Ridge                 </td><td>  91                      </td></tr>
	<tr><td>Bay Terrace               </td><td>   5                      </td></tr>
	<tr><td>Bay Terrace, Staten Island</td><td>   1                      </td></tr>
	<tr><td>Baychester                </td><td>   6                      </td></tr>
	<tr><td>Bayside                   </td><td>  40                      </td></tr>
	<tr><td>Bayswater                 </td><td>   8                      </td></tr>
	<tr><td>Bedford-Stuyvesant        </td><td>2850                      </td></tr>
	<tr><td>Belle Harbor              </td><td>   5                      </td></tr>
	<tr><td>Bellerose                 </td><td>  10                      </td></tr>
	<tr><td>Belmont                   </td><td>   8                      </td></tr>
	<tr><td>Bensonhurst               </td><td>  44                      </td></tr>
	<tr><td>Bergen Beach              </td><td>   3                      </td></tr>
	<tr><td>Boerum Hill               </td><td> 153                      </td></tr>
	<tr><td>Borough Park              </td><td>  90                      </td></tr>
	<tr><td>Briarwood                 </td><td>  28                      </td></tr>
	<tr><td>Brighton Beach            </td><td>  46                      </td></tr>
	<tr><td>Bronxdale                 </td><td>  12                      </td></tr>
	<tr><td>Brooklyn Heights          </td><td> 129                      </td></tr>
	<tr><td>Brownsville               </td><td>  42                      </td></tr>
	<tr><td>Bushwick                  </td><td>1937                      </td></tr>
	<tr><td>Cambria Heights           </td><td>  13                      </td></tr>
	<tr><td>Canarsie                  </td><td>  75                      </td></tr>
	<tr><td>Carroll Gardens           </td><td> 227                      </td></tr>
	<tr><td>⋮</td><td>⋮</td></tr>
	<tr><td>Sunset Park       </td><td> 312              </td></tr>
	<tr><td>Theater District  </td><td> 173              </td></tr>
	<tr><td>Throgs Neck       </td><td>   8              </td></tr>
	<tr><td>Todt Hill         </td><td>   2              </td></tr>
	<tr><td>Tompkinsville     </td><td>  28              </td></tr>
	<tr><td>Tottenville       </td><td>   3              </td></tr>
	<tr><td>Tremont           </td><td>   5              </td></tr>
	<tr><td>Tribeca           </td><td> 156              </td></tr>
	<tr><td>Two Bridges       </td><td>  55              </td></tr>
	<tr><td>Unionport         </td><td>   4              </td></tr>
	<tr><td>University Heights</td><td>  16              </td></tr>
	<tr><td>Upper East Side   </td><td>1543              </td></tr>
	<tr><td>Upper West Side   </td><td>1782              </td></tr>
	<tr><td>Van Nest          </td><td>  10              </td></tr>
	<tr><td>Vinegar Hill      </td><td>  26              </td></tr>
	<tr><td>Wakefield         </td><td>  21              </td></tr>
	<tr><td>Washington Heights</td><td> 870              </td></tr>
	<tr><td>West Brighton     </td><td>  11              </td></tr>
	<tr><td>West Farms        </td><td>   6              </td></tr>
	<tr><td>West Village      </td><td> 780              </td></tr>
	<tr><td>Westchester Square</td><td>   2              </td></tr>
	<tr><td>Westerleigh       </td><td>   2              </td></tr>
	<tr><td>Whitestone        </td><td>   5              </td></tr>
	<tr><td>Williamsbridge    </td><td>  24              </td></tr>
	<tr><td>Williamsburg      </td><td>3719              </td></tr>
	<tr><td>Windsor Terrace   </td><td> 128              </td></tr>
	<tr><td>Woodhaven         </td><td>  36              </td></tr>
	<tr><td>Woodlawn          </td><td>   6              </td></tr>
	<tr><td>Woodrow           </td><td>   2              </td></tr>
	<tr><td>Woodside          </td><td> 113              </td></tr>
</tbody>
</table>

</div>

####Summarizing Price 

As we saw the count for listings at neighborhood and burrough level below are the prices .

<div class="output_html rendered_html output_subarea ">
<table>
<thead><tr><th scope=col>Burrough</th><th scope=col>Pricing($)</th></tr></thead>
<tbody>
	<tr><td>Bronx        </td><td> 83          </td></tr>
	<tr><td>Brooklyn     </td><td>120          </td></tr>
	<tr><td>Manhattan    </td><td>181          </td></tr>
	<tr><td>Queens       </td><td> 95          </td></tr>
	<tr><td>Staten Island</td><td>129          </td></tr>
</tbody>
</table>

</div>

<div class="output_html rendered_html output_subarea ">
<table>
<thead><tr><th scope=col>Neighbourhood</th><th scope=col>Pricing($)</th></tr></thead>
<tbody>
	<tr><td>Allerton                  </td><td> 69                       </td></tr>
	<tr><td>Arden Heights             </td><td> 63                       </td></tr>
	<tr><td>Arrochar                  </td><td>223                       </td></tr>
	<tr><td>Arverne                   </td><td> 93                       </td></tr>
	<tr><td>Astoria                   </td><td> 99                       </td></tr>
	<tr><td>Bath Beach                </td><td>106                       </td></tr>
	<tr><td>Battery Park City         </td><td>221                       </td></tr>
	<tr><td>Bay Ridge                 </td><td> 90                       </td></tr>
	<tr><td>Bay Terrace               </td><td>144                       </td></tr>
	<tr><td>Bay Terrace, Staten Island</td><td> 75                       </td></tr>
	<tr><td>Baychester                </td><td> 54                       </td></tr>
	<tr><td>Bayside                   </td><td> 86                       </td></tr>
	<tr><td>Bayswater                 </td><td> 81                       </td></tr>
	<tr><td>Bedford-Stuyvesant        </td><td>102                       </td></tr>
	<tr><td>Belle Harbor              </td><td>166                       </td></tr>
	<tr><td>Bellerose                 </td><td> 91                       </td></tr>
	<tr><td>Belmont                   </td><td> 56                       </td></tr>
	<tr><td>Bensonhurst               </td><td> 81                       </td></tr>
	<tr><td>Bergen Beach              </td><td>154                       </td></tr>
	<tr><td>Boerum Hill               </td><td>158                       </td></tr>
	<tr><td>Borough Park              </td><td>112                       </td></tr>
	<tr><td>Briarwood                 </td><td>130                       </td></tr>
	<tr><td>Brighton Beach            </td><td>112                       </td></tr>
	<tr><td>Bronxdale                 </td><td> 66                       </td></tr>
	<tr><td>Brooklyn Heights          </td><td>255                       </td></tr>
	<tr><td>Brownsville               </td><td> 72                       </td></tr>
	<tr><td>Bushwick                  </td><td> 84                       </td></tr>
	<tr><td>Cambria Heights           </td><td> 75                       </td></tr>
	<tr><td>Canarsie                  </td><td>126                       </td></tr>
	<tr><td>Carroll Gardens           </td><td>183                       </td></tr>
	<tr><td>⋮</td><td>⋮</td></tr>
	<tr><td>Sunset Park       </td><td>106               </td></tr>
	<tr><td>Theater District  </td><td>232               </td></tr>
	<tr><td>Throgs Neck       </td><td> 98               </td></tr>
	<tr><td>Todt Hill         </td><td>257               </td></tr>
	<tr><td>Tompkinsville     </td><td> 69               </td></tr>
	<tr><td>Tottenville       </td><td>218               </td></tr>
	<tr><td>Tremont           </td><td> 62               </td></tr>
	<tr><td>Tribeca           </td><td>353               </td></tr>
	<tr><td>Two Bridges       </td><td>123               </td></tr>
	<tr><td>Unionport         </td><td> 65               </td></tr>
	<tr><td>University Heights</td><td> 60               </td></tr>
	<tr><td>Upper East Side   </td><td>173               </td></tr>
	<tr><td>Upper West Side   </td><td>195               </td></tr>
	<tr><td>Van Nest          </td><td>170               </td></tr>
	<tr><td>Vinegar Hill      </td><td>173               </td></tr>
	<tr><td>Wakefield         </td><td>108               </td></tr>
	<tr><td>Washington Heights</td><td> 91               </td></tr>
	<tr><td>West Brighton     </td><td> 77               </td></tr>
	<tr><td>West Farms        </td><td>205               </td></tr>
	<tr><td>West Village      </td><td>240               </td></tr>
	<tr><td>Westchester Square</td><td> 70               </td></tr>
	<tr><td>Westerleigh       </td><td>785               </td></tr>
	<tr><td>Whitestone        </td><td>148               </td></tr>
	<tr><td>Williamsbridge    </td><td> 92               </td></tr>
	<tr><td>Williamsburg      </td><td>140               </td></tr>
	<tr><td>Windsor Terrace   </td><td>129               </td></tr>
	<tr><td>Woodhaven         </td><td> 59               </td></tr>
	<tr><td>Woodlawn          </td><td> 69               </td></tr>
	<tr><td>Woodrow           </td><td>458               </td></tr>
	<tr><td>Woodside          </td><td> 83               </td></tr>
</tbody>
</table>
 </div>
 
 We could also see the listings per zip code level. I have use Ari Lamstien's R package **choroplethrzip** . Taking the five burroughs of New York and all the zip codes  within them I aggregated the listings per zipcode and mapped them .As you can see Manhattan and Brooklyn regions are the one with most listings.
 
 ![Listings per zipcode](rentalsbyzip.png)


The Airbnb listings are generally catogorized as an **Entire Apartment / Home** , **private room** and **shared room**.Below is the pricing for each type of listing.

<div class="output_html rendered_html output_subarea ">
<table>
<thead><tr><th scope=col>Room Type</th><th scope=col>Price</th></tr></thead>
<tbody>
	<tr><td>Entire home/apt</td><td>207            </td></tr>
	<tr><td>Private room   </td><td> 88            </td></tr>
	<tr><td>Shared room    </td><td> 71            </td></tr>
</tbody>
</table>

</div>

This graph below shows how each of the burroughs have listings by property type.

![Property Type at Burrough level](Bar_roomtype_neigh.png)

To understand how the listings are spatially located I did plot them and bin them by property time to visualize where the listings are shared or entire apartment.

![Property Type Mapped](byRoomType.png)


**Subway vs Rental Listings**

Apart from all the ameneities mentioned in the listing one of the most important factor when it comes to booking a listing in New York is the proxmity to a subway stop. I downloaded a json for the subways and plotted them against the listings. Considering that poeple want to live closeby I took as 0.1 mile as a walking distance , I created a buffer to capture all the listings inside that 0.1 mile ring.I took the top 20 to understand which of the subway stations had the most listings nearby.

![Top 20 subway stations](bar_Top20subway_png.png)

The same results were also plotted on the map using the leaflet package to vizualize where these subway stations are located and how many listings they have using the graduated symbols.

![Top 20 subway stations Map](subwaytop20.png)

**Description**

The description and the photos put by the property owner plays an important role for anyone to book a listing . A wordcloud of those description helps us understand what do property owners mention in the description which might help them in more bookings.

![Description Word Cloud](Description_wordcloud.png)

**Amenties**

When you book a listing in Airbnb I assume the first thing we look for is does the listing have wifi /internet . So based on the amenities provided across all listings I mapped a word cloud to see what are the top amenities listed by the owners for the property.

![Amenities ](amenitieswordcloud.png)

**Reviews**
Once the user goes through the list of amenities they do scroll down through the reviews to see what people who have stayed in this property thought about. Was the property as per mentioned in the listing ? Was the bed making noise ? Any suggestions for restaurants nearby? 

![Reviews ](reviewwordcloud.png)


**What Next**

The next stage for this project is to identify a relationship between the proximity of listing to subway stations , amenities listed for the property,POI's such as restaurants, workplace, demographic variables such as daytime population. A shiny app which would show the listings and various layers such as rental price by geographies , all in one place for all the cities Airbnb have the rentals listed.
