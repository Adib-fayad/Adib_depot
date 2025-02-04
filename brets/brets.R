#library a telecharger a l'avance avec  install.packages()

library(ade4)
library(FactoMineR)



brets <- read.csv2("bretz.csv", header = TRUE, sep = ";", 
                     row.names = 1, encoding = "latin1");brets
head(brets)
names(brets)

sumli <- apply(brets, 1, sum)
sumco <- apply(brets, 2, sum)
sumli <- apply(brets, 1, mean)
sumco <- apply(brets, 2, mean)

classement<-data.frame(sumli)
classement1<-arrange(classement,sumli)
classement1

barplot(sort(sumli), horiz = TRUE, las = 2, cex.names = 0.5, col = "slateblue")
barplot(sort(sumco), horiz = TRUE, las = 2, col = "red3", cex.names = 0.5)


##ACP

res <- PCA(brets, graph = FALSE)
par(mfrow = c(1, 1), mar = c(4, 4, 2, 2))
barplot(res$eig[, 2], main = "Valeurs Propres", ylab = "Inertie %", names.arg = paste("Axe", 1: nrow(res$eig)))
plot.PCA(res, choix = "var")
plot.PCA(res, choix = "ind")



#CAH

hc <- HCPC(res, graph = FALSE, nb.clust = 8 )


#arbre des correlation

plot.HCPC(hc, choice = "tree")

# plot de la CAH

plot.HCPC(hc, choice = "map", draw.tree = FALSE) #plot generale








## AFC
ca1 <- CA(brets, graph = FALSE)
## Valeurs propres
barplot(ca1$eig[, 2], las = 2 )

## Graphiques
plot.CA(ca1)
plot.CA(ca1, invisible = "col")
plot.CA(ca1, invisible = "row")



####
## Classification
cahp <- HCPC(ca1, graph = FALSE, nb.clust = 10, consol = FALSE)
plot.HCPC(cahp, choice = "tree")
plot.HCPC(cahp, choice = "map", draw.tree = FALSE)

lapply(cahp$desc.var, function(x) head(round(x, 2), 6))
## Interprétation
cahp$data.clust |> 
  row.names() |> 
  split(cahp$data.clust$clust) |> 
  lapply(FUN=sort)

