
library(tidyverse)

gapminder_1997 <- read_csv("data/gapminder_1997.csv")

name <- "Courtney"
name <- 84
name <- "Courtney"
age <- 84
name <- "Sarah"
name <- Sarah
name <- (Sarah)
# Guidelines for naming variables
# cannot begin with a number
1dog <- "Fido"
dog1 <- "Fido"
# cannot contain spaces
my name <- "Courtney"
my_name <- "Courtney"
#case sensitive
dog <- "Fido"
Dog <- "Fluffy"
#Be consistent!

#Plotting in R!
ggplot(data = gapminder_1997) +
  aes(x = gdpPercap, y = lifeExp, color = continent, size = pop/1000000) +
  labs(x = "GDP Per Capita", y = "Life Expectancy", title = "Do people in wealthy countries live longer?", size = "Population (in millions)") +
  geom_point() +
  scale_color_brewer(palette = "Set1") 

# larger gapminder dataset
gapminder_data <- read_csv(file = "gapminder_data.csv")

ggplot(data = gapminder_data) +
  aes(x = year, y = lifeExp, color = continent, group = country) +
  geom_line()

# Discrete plots
ggplot(data = gapminder_1997) +
  aes(x = continent, y = lifeExp) +
  geom_boxplot()

ggplot(data = gapminder_1997) +
  aes(x = continent, y = lifeExp) +
  geom_violin() +
  geom_jitter(width = 0.3, height = 0, aes(size = pop))

# log transformation on x axis

ggplot(data = gapminder_1997) +
  aes(x = gdpPercap, y = lifeExp) +
  geom_point() +
  scale_x_continuous(trans = "log10")

ggplot(data = gapminder_1997) +
  aes(x = log10(gdpPercap), y = lifeExp) +
  geom_point() 

# color vs fill
violin_plot <- ggplot(data = gapminder_1997) +
  aes(x = continent, y = lifeExp) +
  geom_violin(aes(fill = continent)) +
  geom_jitter(width = 0.3)

violin_plot <- violin_plot + theme_bw()
ggsave("awesome_violin_plot.jpg", plot = violin_plot, 
       width = 6, height = 4)

# themes
ggplot(gapminder_1997) +
  aes(x = lifeExp) +
  geom_histogram(bins = 20, color = "black") +
  theme_minimal()

# how to rotate labels on x axis?
ggplot(gapminder_1997) +
  aes(x = lifeExp) +
  geom_histogram(bins = 20, color = "black") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust=1, vjust = 0.5))

#Facets
ggplot(gapminder_1997) +
  aes(x = gdpPercap, y = lifeExp) +
  geom_point() +
  facet_wrap(vars(continent))

ggplot(gapminder_1997) +
  aes(x = gdpPercap, y = lifeExp, fill = continent) +
  geom_point(shape = 21, color = "black") +
  facet_grid(rows = vars(continent)) +
  labs(x = "GDP Per Capita", y = "Life Expectancy", title = "Do people in wealthy countries live longer?") +
  theme_bw() +
  theme(axis.title = element_text(face = "bold"), title = element_text(face = "bold"), legend.position =  "none")
ggsave("awesome_plot.jpg")
