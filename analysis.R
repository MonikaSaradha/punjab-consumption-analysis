# -------------------------------
# Punjab Consumption Analysis (R)
# -------------------------------

# Libraries
library(readxl)
library(ggplot2)
library(dplyr)
library(sf)
library(naniar)

# -------------------------------
# 1. Load Data
# -------------------------------
punjab <- read_excel("Punjab_ds.xlsx")

# View structure
colnames(punjab)

# -------------------------------
# 2. Missing Values
# -------------------------------
plot_missing(punjab)
sum(is.na(punjab))

# Remove missing values
punjab <- na.omit(punjab)
sum(is.na(punjab))

# -------------------------------
# 3. Outlier Analysis
# -------------------------------
boxplot(
  punjab$pulsestot_q,
  punjab$milkprott_q,
  punjab$potato_q,
  punjab$sugaros_q,
  punjab$eggsno_q,
  main = "Boxplot for Punjab",
  names = c("Pulses", "Milk", "Potato", "Sugar", "Eggs"),
  xlab = "Variables",
  ylab = "Quantity"
)

# -------------------------------
# 4. Total Consumption
# -------------------------------
punjab$total_consumption <- 
  punjab$pulsestot_q +
  punjab$milkprott_q +
  punjab$potato_q +
  punjab$sugaros_q +
  punjab$eggsno_q

# Aggregate by district
punjab_summary <- punjab %>%
  group_by(District) %>%
  summarise(total = sum(total_consumption))

# -------------------------------
# 5. Histogram / Bar Plot
# -------------------------------
ggplot(punjab_summary, aes(x = District, y = total, fill = District)) +
  geom_bar(stat = "identity") +
  ggtitle("Total Consumption by District") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

# -------------------------------
# 6. Geospatial Mapping
# -------------------------------

# Load shapefile
punjab_map <- st_read("indian_districts.shp")

# Rename column for merging
punjab_map <- punjab_map %>%
  rename(District = district.0)

# Merge data
punjab_map_data <- merge(punjab_summary, punjab_map, by = "District")

# Plot map (basic)
ggplot(punjab_map_data) +
  geom_sf(aes(fill = total)) +
  scale_fill_gradient(low = "white", high = "red") +
  ggtitle("Total Consumption by District")

# Plot map with labels
ggplot(punjab_map_data) +
  geom_sf(aes(fill = total)) +
  scale_fill_gradient(low = "white", high = "purple") +
  geom_sf_text(aes(label = District), fun.geometry = st_centroid) +
  ggtitle("Consumption by District (Labels)")

# Plot map with values
ggplot(punjab_map_data) +
  geom_sf(aes(fill = total)) +
  scale_fill_gradient(low = "white", high = "green") +
  geom_sf_text(aes(label = paste(District, total)), fun.geometry = st_centroid) +
  ggtitle("Consumption by District (Values)")
