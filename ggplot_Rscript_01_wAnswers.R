# ggplot2 R Script ==============================
# EXERCISE 01: MAKE A SCATTERPLOT================
library(palmerpenguins)
library(ggplot2)

# Make a scatterplot
ggplot(penguins) + 
  aes(x=bill_length_mm, 
      y=bill_depth_mm, 
      color = species) + 
  geom_point() +
  xlab("Bill Length (mm)") +
  ylab("Bill Depth (mm)") +
  ggtitle("Penguins Bill Dimensions")

# add a theme
# Add axis labels and a title
ggplot(penguins) + 
  aes(x=bill_length_mm, 
      y=bill_depth_mm,
      color = species) + 
  geom_point() +
  xlab("Bill Length(mm)") + 
  ylab("Bill Depth (mm)") + 
  ggtitle("Penguins Bill Dimensions") +
  theme_dark()

# ggthemes OPTIONAL =========================
library(ggthemes)

ggplot(penguins) + 
  aes(x=bill_length_mm, 
      y=bill_depth_mm,
      color = species) + 
  geom_point() +
  xlab("Bill Length(mm)") + 
  ylab("Bill Depth (mm)") + 
  ggtitle("WSJ Theme") +
  theme_wsj()

# ggthemr OPTIONAL =========================
library(ggthemr)

ggthemr('pale')
ggplot(penguins,
       aes(x=bill_length_mm, 
           y=bill_depth_mm,
           colour = species)) + 
  geom_point() +
  xlab("Bill Length(mm)") + 
  ylab("Bill Depth (mm)") + 
  ggtitle("ggthemr - pale theme") +
  scale_colour_ggthemr_d()
ggthemr_reset()

# R Graphics Cookbook ===========================
# http://www.cookbook-r.com/Graphs/

# Make a histogram with overlaid density curve
# Look at flipper_length_mm
# for Palmer Penguins
# Histogram with density curve
# Use y=..density..
# Overlay with transparent density plot
ggplot(penguins, 
       aes(x=flipper_length_mm)) + 
  geom_histogram(aes(y=..density..),      
                 binwidth=2,
                 colour="black", 
                 fill="white") +
  geom_density(alpha=.2, 
               fill="#FF6666") 

# **UPDATES**
#' Warning messages:
#' 1: The dot-dot notation (`..density..`) was 
#' deprecated in ggplot2 3.4.0.
#' ℹ Please use `after_stat(density)` instead.
ggplot(penguins, 
       aes(x=flipper_length_mm)) + 
  geom_histogram(aes(y = after_stat(density)),      
                 binwidth=2,
                 colour="black", 
                 fill="white") +
  geom_density(alpha=.2, 
               fill="#FF6666") 

# EXERCISE 02 YOUR TURN ======================
# Fill in ___ Blanks below
# Make a scatterplot of 
# flipper_length_mm on Y-axis
# with body_mass_g on X-axis
# update axis labels and title
ggplot(penguins) + 
  aes(x=body_mass_g, 
      y=flipper_length_mm, 
      color = species) + 
  geom_point() +
  xlab("Body Mass (g)") +
  ylab("Flipper Length (mm)") +
  ggtitle("Penguins Flipper and Body Mass Measurements")

# EXERCISE 03 YOUR TURN ======================
# go to http://www.cookbook-r.com/Graphs/Scatterplots_(ggplot2)/
# redo the scatterplot above
# and use different shapes for the 3 species
# in addition to the colors
# PUT YOUR CODE HERE
ggplot(penguins) + 
  aes(x=body_mass_g, 
      y=flipper_length_mm, 
      color = species,
      shape = species) + 
  geom_point() +
  xlab("Body Mass (g)") +
  ylab("Flipper Length (mm)") +
  ggtitle("Penguins Flipper and Body Mass Measurements")

# Break out by Facet/Panels ===================
# Look at flipper_length_mm
# for Palmer Penguins
# Histogram with density curve
# Use y=..density..
# **UPDATED**
# Use y = after_stat(density)
# Overlay with transparent density plot
ggplot(penguins, 
       aes(x=flipper_length_mm)) + 
  geom_histogram(aes(y=after_stat(density)),      
                 binwidth=2,
                 colour="black", 
                 fill="white") +
  geom_density(alpha=.2, 
               fill="#FF6666") +
  facet_wrap(vars(species))

# add best fit line using lm, linear model method
# take out color=species
ggplot(penguins,
       aes(x=bill_length_mm, 
           y=bill_depth_mm)) +
  geom_point() +
  # add best fit line
  # using lm, linear model
  geom_smooth(method=lm) + 
  xlab("Bill Length(mm)") + 
  ylab("Bill Depth (mm)") + 
  ggtitle("Penguins Bill Depth by Length")

# add color back - what changed?
# without species the slope of the line
# is slightly negative
# but within each species this correlation
# is positive - example of ecological fallacy
ggplot(penguins,
       aes(x=bill_length_mm, 
           y=bill_depth_mm,
           color = species)) + 
  geom_point() +
  geom_smooth(method=lm) + 
  # add best fit line
  # using lm, linear model
  xlab("Bill Length(mm)") + 
  ylab("Bill Depth (mm)") + 
  ggtitle("Penguins Bill Depth by Length")

# EXERCISE 04 YOUR TURN ======================
# Use code above, add facet_wrap
# for species
ggplot(penguins,
       aes(x=bill_length_mm, 
           y=bill_depth_mm,
           color = species)) + 
  geom_point() +
  geom_smooth(method=lm) + 
  # add best fit line
  # using lm, linear model
  xlab("Bill Length(mm)") + 
  ylab("Bill Depth (mm)") + 
  ggtitle("Penguins Bill Depth by Length") +
  facet_wrap(vars(species))


# EXERCISE 05 YOUR TURN ======================
# Use code above, 
# change coloring by island instead of species
# add facet_wrap for island
# NOTICE the negative slope for Biscoe island
# is because there are 2 species of penguins
ggplot(penguins,
       aes(x=bill_length_mm, 
           y=bill_depth_mm,
           color = island)) + 
  geom_point() +
  geom_smooth(method=lm) + 
  # add best fit line
  # using lm, linear model
  xlab("Bill Length(mm)") + 
  ylab("Bill Depth (mm)") + 
  ggtitle("Penguins Bill Depth by Length") +
  facet_wrap(vars(island))

# OPTIONAL EXAMPLE ADDED =====================
# make same plot as above - color by species
# but facet wrap by island
# this plot actually shows the contribution
# of 4 variables: 
#      bill length, bill depth, species and island
ggplot(penguins,
       aes(x=bill_length_mm, 
           y=bill_depth_mm,
           color = species)) + 
  geom_point() +
  geom_smooth(method=lm) + 
  # add best fit line
  # using lm, linear model
  xlab("Bill Length(mm)") + 
  ylab("Bill Depth (mm)") + 
  ggtitle("Penguins Bill Depth by Length - by Species and Island") +
  facet_wrap(vars(island))

# SIDE-BY-SIDE BOXPLOTS ======================
# Do boxplots of body_mass_g
# by year as a factor
ggplot(penguins, 
       aes(x=as.factor(year), 
           y=body_mass_g)) + 
  geom_boxplot() + 
  xlab("Year") +   
  ylab("Body Mass (g)") + 
  ggtitle("Body Mass by Year")

# Do boxplots of body_mass_g
# by year as a factor
# add jitter'ed points
# NOTE: geom_jitter() is added AFTER geom_boxplot()
ggplot(penguins, 
       aes(x=as.factor(year), 
           y=body_mass_g)) + 
  geom_boxplot() + 
  geom_jitter(color="black") +
  xlab("Year") +   
  ylab("Body Mass (g)") + 
  ggtitle("Body Mass by Year")

# OPTIONAL - what if we reverse these 2 geom's?
ggplot(penguins, 
       aes(x=as.factor(year), 
           y=body_mass_g)) + 
  geom_jitter(color="black") +
  geom_boxplot() + 
  xlab("Year") +   
  ylab("Body Mass (g)") + 
  ggtitle("Body Mass by Year")

# EXERCISE 06 YOUR TURN ======================
# Use code above, 
# add color for year - for boxplot 
ggplot(penguins, 
       aes(x = as.factor(year), 
           y = body_mass_g,
           color = as.factor(year))) + 
  geom_boxplot() + 
  geom_jitter(color="black") +
  xlab("Year") +   
  ylab("Body Mass (g)") + 
  ggtitle("Body Mass by Year")

# add color for year - for both boxplot and points
# simply drop the custom color for geom_jitter()
ggplot(penguins, 
       aes(x = as.factor(year), 
           y = body_mass_g,
           color = as.factor(year))) + 
  geom_boxplot() + 
  geom_jitter() +
  xlab("Year") +   
  ylab("Body Mass (g)") + 
  ggtitle("Body Mass by Year")

# EXERCISE 07 YOUR TURN ======================
# Use code above, 
# add color for year
# change geom_boxplot 
# to geom_violin
# which do you like better?
ggplot(penguins, 
       aes(x = as.factor(year), 
           y = body_mass_g,
           color = as.factor(year))) + 
  geom_violin() + 
  geom_jitter() +
  xlab("Year") +   
  ylab("Body Mass (g)") + 
  ggtitle("Body Mass by Year")

# PATCHWORK ==================================
library(ggplot2)
library(patchwork)

# save each plot as an object
p1 <- ggplot(penguins, 
             aes(x=bill_length_mm, 
                 y=bill_depth_mm, 
                 color = species)) +
  geom_point()  

p2 <- ggplot(penguins, 
             aes(x=species, 
                 y=bill_length_mm)) + 
  geom_boxplot() + 
  xlab("Species") +   
  ylab("Bill Depth (mm)")

p3 <- 
  ggplot(penguins, 
         aes(x=flipper_length_mm)) + 
  geom_histogram(aes(y=..density..),      
                 binwidth=2, colour="black", 
                 fill="white") +
  geom_density(alpha=.2, fill="#FF6666") +
  facet_wrap(vars(species))

# arrange plots as you like
(p1 | p2) / p3

# EXERCISE 08 YOUR TURN ======================
# Using patchwork example above
# pick 2 to 3 of the plots we've made so far
# save them as p4, p5, p6
# then try your own arrangement

# save each plot as an object
p4 <- ggplot(penguins,
             aes(x=bill_length_mm, 
                 y=bill_depth_mm,
                 color = species)) + 
  geom_point() +
  geom_smooth(method=lm) + 
  # add best fit line
  # using lm, linear model
  xlab("Bill Length(mm)") + 
  ylab("Bill Depth (mm)") + 
  ggtitle("Penguins Bill Depth by Length - by Species and Island") +
  facet_wrap(vars(island)) 

p5 <- ggplot(penguins,
             aes(
               x = as.factor(year),
               y = body_mass_g,
               color = as.factor(year)
             )) +
  geom_violin() +
  geom_jitter() +
  xlab("Year") +
  ylab("Body Mass (g)") +
  ggtitle("Body Mass by Year")

p6 <- 
  ggplot(penguins, 
         aes(x=flipper_length_mm)) + 
  geom_histogram(aes(y=..density..),      
                 binwidth=2, colour="black", 
                 fill="white") +
  geom_density(alpha=.2, fill="#FF6666") +
  facet_wrap(vars(species))

# arrange plots as you like
p4 / (p5 + p6)







