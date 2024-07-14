install.packages("geodata")
library(geodata)
my0 <- gadm(country = "USA", level = 0, path = tempdir()) 
my1 <- gadm(country = "USA", level = 1, path = tempdir())
par(mfrow=c(1,2))
plot(my0,main='USA Boundaries level = 0')
plot(my1,main='USA Boundaries level = 1')
#World climate
path_to_save <- "C:/Users/KOYELISHA/OneDrive/Desktop/bioclim/LionFish"
climate <- worldclim_global(var = 'bio', res = 2.5,path = path_to_save )
climate_stack <- stack(climate)
max_temp_layer <- climate_stack[[5]]  # BIO5: Max temperature of warmest month
min_temp_layer <- climate_stack[[6]]  # BIO6: Min temperature of coldest month
plot(max_temp_layer, main = "Maximum Temperature of Warmest Month", col = rev(terrain.colors(100)))
plot(min_temp_layer, main = "Minimum Temperature of Coldest Month", col = rev(terrain.colors(100)))
install.packages("raster")
library(geodata)
library(stars)
setwd("C:/Users/KOYELISHA/OneDrive/Desktop/bioclim/LionFish")
elevation1 <- read_stars("n28_w098_1arc_v3.tif")
elevation2 <- read_stars("n28_w099_1arc_v3.tif")
elevation3 <- read_stars("n28_w100_1arc_v3.tif")
# Check dimensions
dim(elevation1)
dim(elevation2)
dim(elevation3)

st_crs(elevation1)
st_crs(elevation2)
st_crs(elevation3)

dim(elevation1)
dim(elevation2_aligned)  # Make sure this matches elevation1

# Check CRS
st_crs(elevation1)
st_crs(elevation2_aligned)
elevation2_aligned <- st_warp(elevation2, crs = st_crs(elevation1))
dim(elevation2_aligned)
st_crs(elevation2_aligned)
merged_elevation <- elevation1 + elevation2_aligned
