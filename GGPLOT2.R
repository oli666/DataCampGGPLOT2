# Load the ggplot2 package
library(ggplot2)
library(psych)
library(dplyr)
library(tidyr)
library(ggthemes)
############################ 1 ################################

# Explore the mtcars data frame with str()
str(mtcars)

# Execute the following command
ggplot(mtcars, aes(x = factor(cyl), y = mpg)) + geom_point()
############################  ################################
# A scatter plot has been made for you
ggplot(mtcars, aes(x = wt, y = mpg)) + geom_point()
# Replace ___ with the correct vector
ggplot(mtcars, aes(x = wt, y = mpg, col = disp)) + geom_point()
# Replace ___ with the correct vector
ggplot(mtcars, aes(x = wt, y = mpg, size = disp, col = disp)) + geom_point()
############################ 3 ################################
# Explore the diamonds data frame with str()
str(diamonds)
# Add geom_point() with +
ggplot(diamonds, aes(x = carat, y = price)) + geom_point()
# Add geom_point() and geom_smooth() with +
ggplot(diamonds, aes(x = carat, y = price)) + geom_point() + geom_smooth()
############################ Exploring ggplot2, part 5 ################################
# The plot you created in the previous exercise
ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point() +
  geom_smooth()
# Copy the above command but show only the smooth line
ggplot(diamonds, aes(x = carat, y = price)) +
  geom_smooth()
# Copy the above command and assign the correct value to col in aes()
ggplot(diamonds, aes(x = carat, y = price, col = clarity)) +
  geom_smooth()
# Keep the color settings from previous command. Plot only the points with argument alpha.
ggplot(diamonds, aes(x = carat, y = price, col = clarity)) + geom_point(alpha = .4)
############################ Understanding the grammar, part 1 ################################
# Create the object containing the data and aes layers: dia_plot
dia_plot = ggplot(diamonds, aes(x = carat, y = price))

# Add a geom layer with + and geom_point()
dia_plot + geom_point()

# Add the same geom layer, but with aes() inside
dia_plot + geom_point(aes(col = clarity))

############################ Understanding the grammar, part 2 ################################
set.seed(1)

# The dia_plot object has been created for you
dia_plot <- ggplot(diamonds, aes(x = carat, y = price))

# Expand dia_plot by adding geom_point() with alpha set to 0.2
dia_plot = dia_plot + geom_point(alpha = 0.2)


# Plot dia_plot with additional geom_smooth() with se set to FALSE
dia_plot + geom_smooth(se = F)

# Copy the command from above and add aes() with the correct mapping to geom_smooth()
dia_plot + geom_smooth(se = F, aes(col = clarity))
############################ base package and ggplot2, part 1 - plot ################################
# Plot the correct variables of mtcars
attach(mtcars)
plot(mtcars$wt, mtcars$mpg, col = mtcars$cyl)

# Change cyl inside mtcars to a factor
mtcars$cyl = as.factor(mtcars$cyl)

# Make the same plot as in the first instruction
plot(mtcars$wt, mtcars$mpg, col = mtcars$cyl)
############################  base package and ggplot2, part 2 - lm ################################
# Basic plot
mtcars$cyl <- as.factor(mtcars$cyl)
plot(mtcars$wt, mtcars$mpg, col = mtcars$cyl)
# Use lm() to calculate a linear model and save it as carModel
carModel = lm(mtcars$mpg ~ mtcars$wt)
# Call abline() with carModel as first argument and lty as second
abline(carModel, lty = 2)

# Plot each subset efficiently with lapply
# You don't have to edit this code
lapply(mtcars$cyl, function(x) {
  abline(lm(mpg ~ wt, mtcars, subset = (cyl == x)), col = x)
  })

# This code will draw the legend of the plot
# You don't have to edit this code
legend(x = 5, y = 33, legend = levels(mtcars$cyl), 
       col = 1:3, pch = 1, bty = "n")
############################ base package and ggplot2, part 3 ################################
# Convert cyl to factor
mtcars$cyl <- as.factor(mtcars$cyl)
# Example from base R
plot(mtcars$wt, mtcars$mpg, col = mtcars$cyl)
abline(lm(mpg ~ wt, data = mtcars), lty = 2)
lapply(mtcars$cyl, function(x) {
  abline(lm(mpg ~ wt, mtcars, subset = (cyl == x)), col = x)
  })
legend(x = 5, y = 33, legend = levels(mtcars$cyl), 
       col = 1:3, pch = 1, bty = "n")

# Add geom_point() to this command to create a scatter plot
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) + geom_point()
# Copy, paste and expand previous command to include the lines of the linear models, per cyl
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) + geom_point() + geom_smooth(method = "lm", se = F)
# Copy, paste and expand previous command to include a lm for the entire dataset in its whole
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) + geom_point() + geom_smooth(method = "lm", se = F) + geom_smooth(aes(group = 1), method = "lm", se = F, linetype = 2)
############################ Variables to visuals part 1b ################################
iris.tidy = iris %>% gather(key, "Value", -Species) %>% separate(key, c("Part", "Measure"))
head(iris %>% gather(key, value, -Species))
head(iris)
head(iris.tidy)
# Think about which dataset you would use to get the plot shown right
# Fill in the ___ to produce the plot given to the right
ggplot(iris.tidy, aes(x = Length, y = Width, col = Part)) +
  geom_jitter() +
  facet_grid(. ~ Measure)
############################ Variables to visuals part 2b ################################
# Add a new column, Flower, to iris that contains unique ids
iris$Flower <- 1:nrow(iris)
# Fill in the ___ to produce to the correct iris.wide dataset
iris %>%
  gather(key, value, -Species, -Flower) %>%
  separate(key, c("Part", "Measure"), "\\.") %>%
  spread(Measure, value) %>% 
  head()
############################ All about aesthetics ################################
# Map cyl to y
mtcars$cyl = as.factor(mtcars$cyl)
mtcars
ggplot(mtcars, aes(x = mpg, y = cyl)) + geom_point()
# Map cyl to x
ggplot(mtcars, aes(x = cyl, y = mpg)) + geom_point()
# Map cyl to col
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) + geom_point()
# Change shape and size of the points in the above plot
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) + geom_point(shape = 1, size = 4)
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) + geom_point(shape = 1, size = 4)
# Notice that mapping a categorical variable onto fill doesn't change the colors, although a legend is generated! This is because the default shape for points only has a color
# attribute and not a fill attribute. Use fill when you have another shape (such as a bar), or when using a point that does have a fill and a color attribute, such as shape = 21,
# which is a circle with an outline. Any time you use a solid color, make sure to use alpha blending to account for over plotting. 
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) + geom_point(shape = 16, size = 6, alpha = 0.6)

ggplot(mtcars, aes(x = wt, y = mpg, size = cyl)) + geom_point()
ggplot(mtcars, aes(x = wt, y = mpg, alpha = cyl)) + geom_point()
ggplot(mtcars, aes(x = wt, y = mpg, shape = cyl)) + geom_point()
ggplot(mtcars, aes(x = wt, y = mpg, label = cyl)) + geom_text()
############################ All about attributes ################################
# Define a hexadecimal color
my_color <- "#123456"

# Set the color aesthetic 
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) + geom_point()
# Set the color aesthetic and attribute 
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) + geom_point(col = my_color)
# Set the fill aesthetic and color, size and shape attributes
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) + geom_point(size = 10, shape = 23, col = my_color)
# Expand to draw points with alpha 0.5
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) + geom_point(alpha = 0.5)
# Expand to draw points with shape 24 and color yellow
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) + geom_point(shape = 24, col = "yellow")
# Expand to draw text with label x, color red and size 10
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) + geom_text(label = "x", col = "red", size = 10)
############################ Going all out ################################
ggplot(mtcars, aes(x = mpg, y = qsec, col = factor(cyl))) + geom_point()
ggplot(mtcars, aes(x = mpg, y = qsec, shape = factor(am), col = factor(cyl))) + geom_point()
ggplot(mtcars, aes(x = mpg, y = qsec, label = rownames(mtcars), size = (hp/wt), shape = factor(am), col = factor(cyl))) + geom_text()
############################ ggthemes ################################
# Solarized theme from ggthemes
mein_plot = ggplot(mtcars, aes(x = mpg, y = qsec, col = factor(cyl))) + geom_point() + ggtitle("Oli")
mein_plot + theme_solarized() + scale_colour_solarized("blue") #
mein_plot + theme_solarized(light = F) + scale_colour_solarized("blue") #
mein_plot + theme_solarized_2(light = F) + scale_colour_solarized("blue") #
mein_plot + facet_wrap(~am) + theme_solarized_2(light = T) + scale_colour_solarized("blue") #
############################ Position ################################
# Base layers
cyl.am <- ggplot(mtcars, aes(x = factor(cyl), fill = factor(am)))
# Add geom (position = "stack"" by default)
cyl.am + geom_bar(position = "stack")
# Fill - show proportion
cyl.am + geom_bar(position = "fill")
# Dodging - principles of similarity and proximity
cyl.am + geom_bar(position = "dodge")
# Clean up the axes with scale_ functions
val = c("#E41A1C", "#377EB8")
lab = c("Manual", "Automatic")
cyl.am + geom_bar(position = "dodge") + scale_x_discrete("Cylinders") + scale_y_continuous("Number") + scale_fill_manual("Transmission", values = val, labels = lab)
# Test
