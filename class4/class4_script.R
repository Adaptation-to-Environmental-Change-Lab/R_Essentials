BTdata <- read.table(
  here("data", "BTdata.csv"),
  header = TRUE,
  sep = ",",
  dec = ".",
  stringsAsFactors = TRUE
)

BTdata_mod <- BTdata %>%
  group_by(dam) %>%
  mutate(mean_tarsus = mean(tarsus)) %>%
  arrange(dam) %>%
  ungroup() %>%
  print(n = 30)
class(BTdata_mod)

as.data.frame(BTdata_mod)
BTdata_mod[BTdata_mod$tarsus > 13.5, 1:3]




bt_mb <- read.table(here("data", "bt_mb.csv"),
                    header = TRUE,
                    sep = ";",
                    stringsAsFactors = FALSE
)

bt_meta <- read.table(here("data", "bt_meta.csv"),
                      header = TRUE,
                      sep = ";",
                      stringsAsFactors = TRUE
)


bt_mb_l <- bt_mb %>%
  pivot_longer(
    cols = -Ind_ring,
    names_to = "OTU",
    values_to = "reads"
  ) %>%
  filter(reads > 2)
bt_mb_l


data_chol <- read.table("https://raw.githubusercontent.com/wbabik/Practical_computing/teaching/Class_10/data/Cholesterol_Age_R.csv",
                        sep = ";", header = T,
                        stringsAsFactors = T
)


# y = a + bx
# y ~ x

# y = a + bx + cz
# y ~ x + z

# y = a + bx - cz = a + bx + (-cz)
# y ~ x + z

plot(After8weeks ~ Before, data = data_chol)
plot(x = data_chol$Before, y = data_chol$After8weeks,
     pch = 19, col = "#DD22EE25", type = "n")



plot(After8weeks ~ Before, data = data_chol[order(data_chol$Before),],
     xlab = "Cholesterol conc. before diet",
     ylab = "Cholesterol conc. after 8 weeks",
     main = "Change of cholesterol concentration",
     pch = 15, col = "blue", type = 'l')


plot(After8weeks ~ Before, data = arrange(data_chol, Before),
     xlab = "Cholesterol conc. before diet",
     ylab = "Cholesterol conc. after 8 weeks",
     main = "Change of cholesterol concentration",
     pch = 15, col = "blue", type = 'l')


plot(After8weeks ~ Before, data = data_chol %>% arrange(Before),
     xlab = "Cholesterol conc. before diet",
     ylab = "Cholesterol conc. after 8 weeks",
     main = "Change of cholesterol concentration",
     pch = 15, col = "blue", type = 'l')

?rainbow

N <- 11
plot(1:N, rep(1, N), cex = 10, pch = 19,
     col = heat.colors(N),
     xlab = 'x', ylab = 'y')
plot(1:N, rep(1, N), cex = 10, pch = 19,
     col = topo.colors(N),
     xlab = 'x', ylab = 'y')
plot(1:N, rep(1, N), cex = 10, pch = 19,
     col = terrain.colors(N),
     xlab = 'x', ylab = 'y')


str(data_chol)

plot(After8weeks ~ Before, data = data_chol,
     xlab = "Cholesterol conc. before diet",
     ylab = "Cholesterol conc. after 8 weeks",
     main = "Change of cholesterol concentration",
     pch = 15, col = terrain.colors(3)[data_chol$AgeGroup])

plot(After8weeks ~ Before, data = data_chol,
     xlab = "Cholesterol conc. before diet",
     ylab = "Cholesterol conc. after 8 weeks",
     main = "Change of cholesterol concentration",
     pch = 15, col = c('pink', 'chartreuse', 'brown')[data_chol$AgeGroup])

plot(After8weeks ~ Before, data = data_chol,
     xlab = "Cholesterol conc. before diet",
     ylab = "Cholesterol conc. after 8 weeks",
     main = "Change of cholesterol concentration",
     pch = 15, col = c(rep('brown', 5), rep('pink',6), rep( 'chartreuse',7)))


c('pink', 'chartreuse', 'brown')[data_chol$AgeGroup]

c(1,2,3,4) * c(2)

c("A", "B")[c(2,1,1,2,2,1,2,1,2,2,1,2)]
