install.packages("dplyr")
##########
iris
head(iris)

hist(iris$Sepal.Length)
plot(iris$Petal.Length, iris$Petal.Width)

boxplot(iris$Petal.Length ~ iris$Species)
plot(iris$Petal.Length ~ iris$Species)
plot(iris$Petal.Length, iris$Petal.Width)
points(iris$Petal.Length[iris$Species== "setosa"], iris$Petal.Width[iris$Species== "setosa"], col="red",pch=16)
stripchart(iris$Petal.Length ~ iris$Species)


############
library(ggplot2)

ggplot(data=iris, mapping = aes(x=Species, y=Sepal.Length,
                  fill=Species))+
  geom_boxplot()+
  theme_light()
  
ggplot(data=iris, mapping = aes(x=Sepal.Length,fill=Species))+
  geom_histogram(bins=10)+
  theme_light()+
  facet_grid(rows=vars(Species))

ggplot(data=iris, mapping = aes(x=Petal.Length,y=Petal.Width))+
  geom_point()+
  theme_light()+
  geom_smooth()

ggplot(data=iris, mapping = aes(x=Petal.Length,y=Petal.Width))+
  geom_point()+
  theme_light()+
  geom_smooth(method="lm")

ggplot(data=iris, mapping = aes(x=Petal.Length,y=Petal.Width, group = Species))+
  geom_point()+
  theme_light()+
  geom_smooth(method="lm", aes(colour = Species))

ggplot(data=iris, mapping = aes(x=Petal.Length,y=Petal.Width, group = Species, colour = Species))+
  geom_point()+
  theme_light()+
  geom_smooth(method="lm")

library(dplyr)
data("starwars")
head("starwars")



# Chargement des données avec le bon séparateur
data <- read.csv2("bretz.csv", header = TRUE, sep = ";", row.names = 1, encoding = "latin1")

# Vérification des noms de colonnes
head(data)
names(data)

ggplot(data, aes(x = factor(row.names(data)), y = data[,1])) + 
  geom_bar(stat = "identity", position = "dodge", color = "black", linewidth = 2) +
  scale_fill_manual(values = c("red", "blue", "yellow", "green", "purple", "pink", "orange")) +
  theme(
    panel.background = element_rect(fill = "black"),
    panel.grid.major = element_line(color = "white", linetype = "dotted"),
    panel.grid.minor = element_line(color = "cyan", linetype = "dashed"),
    axis.text.x = element_text(color = "red", size = 15, angle = 45, face = "bold"),
    axis.text.y = element_text(color = "yellow", size = 15, face = "italic"),
    legend.background = element_rect(fill = "magenta", color = "blue", size = 2),
    legend.text = element_text(color = "cyan", size = 14, face = "bold"),
    plot.title = element_text(color = "chartreuse", size = 20, face = "bold", hjust = 0.5)
  ) +
  ggtitle("Le Tableau Le Plus Moche du Monde")







##########

data_long <- data %>%
  pivot_longer(cols = everything(), names_to = "person", values_to = "note") %>%
  mutate(chips_type = rep(row.names(data), times = ncol(data)))


# Création du nuage de points
ggplot(data_long, aes(x = person, y = note, color = chips_type)) + 
  geom_point(size = 4, alpha = 0.7) +
  theme(
    panel.background = element_rect(fill = "black"),
    panel.grid.major = element_line(color = "white", linetype = "dotted"),
    panel.grid.minor = element_line(color = "cyan", linetype = "dashed"),
    axis.text.x = element_text(color = "red", size = 15, angle = 45, face = "bold"),
    axis.text.y = element_text(color = "yellow", size = 15, face = "italic"),
    legend.background = element_rect(fill = "magenta", color = "blue", size = 2),
    legend.text = element_text(color = "cyan", size = 14, face = "bold"),
    plot.title = element_text(color = "chartreuse", size = 20, face = "bold", hjust = 0.5)
  ) +
  ggtitle("Nuage de Points des Notes par Personne et Type de Chips")

