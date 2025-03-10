data_chol <- read.table("https://raw.githubusercontent.com/wbabik/Practical_computing/teaching/Class_10/data/Cholesterol_Age_R.csv",
                        sep = ";", header = T,
                        stringsAsFactors = T
)

plot(After8weeks ~ Before, data = data_chol,
     xlab = "Cholesterol conc. before diet",
     ylab = "Cholesterol conc. after 8 weeks",
     main = "Change of cholesterol concentration",
     pch = 15, col = c('pink', 'chartreuse', 'brown')[data_chol$AgeGroup])


legend(
  legend = c("Young", "Middle", "Old", "Other"),
  title = "Age group",
  col = c('brown', 'pink', 'chartreuse', 'blue'),
  lty = c(1,2,3,2),
  lwd = c(2,2,2,2),
  x = "topleft"
)


plot1 <- ggplot(data = data_chol,
                mapping = aes(x = Before, y = After8weeks)) +
  geom_point(color = 'blue', shape = 15, cex = 3)

plot1


plot1 <- ggplot(data = data_chol,
                mapping = aes(x = Before, y = After8weeks)) +
  geom_point(color = 'blue', shape = 15, cex = 3) +
  theme_bw()
plot1

plot2 <- plot1 + theme(text = element_text(size = 20))

plot1 <- ggplot(data = data_chol,
                mapping = aes(x = Before, y = After8weeks)) +
  geom_point(color = 'blue', shape = 15, cex = 3) +
  theme_classic() +
  geom_smooth(method = 'lm') +
  theme(text = element_text(size = 20))
plot1


plot1 <- ggplot(data = data_chol, mapping = aes(x = Before, y = After8weeks)) +
  geom_point(color = 'blue', shape = 15, cex = 3) +
  theme_classic() +
  geom_smooth() +
  theme(text = element_text(size = 20))
plot1


plot1 <- ggplot(data = data_chol,
                mapping = aes(x = Before, y = After8weeks, color = AgeGroup)) +
  geom_point(shape = 15, cex = 3) +
  theme_classic() +
  geom_smooth(method = 'lm') +
  theme(text = element_text(size = 20))
plot1

plot1 <- ggplot(data = data_chol,
                mapping = aes(x = Before, y = After8weeks, shape = AgeGroup)) +
  geom_point(color = 'blue', cex = 3) +
  theme_classic() +
  geom_smooth(method = 'lm') +
  theme(text = element_text(size = 20))
plot1


plot1 <- ggplot(data = data_chol,
                mapping = aes(x = Before, y = After8weeks, shape = AgeGroup)) +
  geom_point(color = 'blue', cex = 3) +
  theme_classic() +
  geom_smooth(method = 'lm') +
  theme(text = element_text(size = 20)) +
  labs(x = "Before diet", y = "After diet", shape = "Age of patient")
plot1

labelx <- "My new label x"
mycex <- 5
plot1 <- ggplot(data = data_chol,
                mapping = aes(x = Before, y = After8weeks, shape = AgeGroup)) +
  geom_point(color = 'blue', cex = mycex) +
  theme_classic() +
  geom_smooth(method = 'lm') +
  theme(text = element_text(size = 20)) +
  labs(x = labelx, y = "After diet", shape = "Age of patient")
plot1

ggplot(data = data_chol,
       mapping = aes(x = Before, y = After8weeks, shape = AgeGroup)) +
  geom_point(color = 'blue', cex = mycex) +
  theme_classic() +
  # geom_smooth(method = 'lm') +
  theme(text = element_text(size = 20)) +
  labs(x = labelx, y = "After diet", shape = "Age of patient")


hist(data_chol$After8weeks, breaks = 15)

plot1 <- ggplot(data = data_chol, mapping = aes(x = After8weeks)) +
  geom_histogram(fill = 'red', color = 'black', bins = 10) +
  labs(x = "Concentration after 8 weeks") +
  theme_classic() +
  theme(text = element_text(size = 20))
plot1


plot1 <- ggplot(data = data_chol, mapping = aes(x = After8weeks)) +
  geom_histogram(fill = 'red', color = 'black', bins = 10,
                 aes(y = ..count../sum(..count..))) +
  labs(x = "Concentration after 8 weeks") +
  theme_classic() +
  theme(text = element_text(size = 20))
plot1

# if (condition) CODE else CODE
# if (condition) {CODE} else {CODE}

for (i in 1:10) {
  print(i)
}

for (i in 1:10) print(i)


for (i in 4:17) {
  if (i %% 2 == 0) {
    print(LETTERS[i])
  }
}

for (charact in LETTERS) {
  print(charact)
}

j <- 1
for (charact in LETTERS) {
  if (j %% 10 == 0) {
    print("yay!")
  }
  j <- j + 1
}

# random sampling from a uniform distribution
runif(1)



N <- 10000000
inside <- 0
all <- 0

for (i in 1:N) {
  x <- runif(1)
  y <- runif(1)
  if (x^2 + y^2 < 1) {
    inside <- inside + 1
  }
  all <- all + 1
}

pi_est <- 4 * inside / all
pi_est


sqrt(1:10000)


n <- 10000000
x <- runif(n)
y <- runif(n)
inside <- sum(x^2 + y^2 < 1)
pi_est <- 4 * inside / n

pi_est