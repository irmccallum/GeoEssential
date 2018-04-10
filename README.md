# GeoEssential
WP6 demo workflow

GEOEssential WP6 Workflow

Indicator 6.6.1.: Change in the extent of water-related ecosystems over time

The definition and the computation method provided by the United Nations (https://unstats.un.org/sdgs/tierIII-indicators/files/Tier3-06-06-01.pdf) are the following: 

Definition:
This indicator tracks changes over time in the extent of water-related ecosystems. It uses the imminent date of 2020 in order to align with the Aichi Biodiversity Targets of the Convention on Biological Diversity, but will continue beyond that date to align with the rest of the SDG Targets set at 2030. Whereas all ecosystems depend on water, some ecosystems play a more prominent role in the provision of water-related services to society. Consequently, for the purpose of global monitoring, the indicator focuses on the following ecosystem categories: vegetated wetlands (swamps, swamp forests, marshes, paddies, peatlands and mangroves), open water (rivers and estuaries, lakes and reservoirs) and groundwater aquifers. Note that this Indicator method defines “extent” as “the size or area of something” (McMillan Dictionary), thus going beyond spatial area to include other size (quantitative) measures of water-related ecosystems i.e. quantity, quality and also state of health.

Computation Method:
Each of the sub-indicators in this 6.6.1 Indicator sets out to determine the percentage of change in a water-related ecosystem. This can only be done if there is some point of reference. The ideal situation is that reporting is done using the “natural” situation as the reference, however this “natural” situation is sometimes difficult to determine and instead an alternative “reference” condition can be used.

This part of the indicator measures the geographic or spatial extent of vegetated wetlands (such as swamps, marshes and peat, and including mangroves, swamp forests and even rice paddies) as well as inland open water (rivers, floodplains and estuaries, lakes and reservoirs). Measurement of spatial extent is important as this provides an indication of the availability of these ecosystems and the potential they have to provide ecosystem services. Both Earth Observation (EO) and ground-based surveys provide data that are used to determine the change in the spatial extent of water-related ecosystems over time.

WP6 Algorithm: 
Inputs:
https://global-surface-water.appspot.com/ (tiled rasters of water change)
https://gadm.org/ (admin boundaries)


Algorithm
1.	Obtain the correct raster change tile for the country of interest
2.	Crop the tile with the country boundary
3.	Aggregate the raster data by factor of 10 to increase speed
4.	Mask out pixels outside of country
5.	Calculate area of water lost, gained and not changed in km2 and write out to csv

Output: a number representing the total area in km2 of water extent lost, gained and unchanged between the years 1984 and 2015.

 
