install.packages("ggplot2")
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



