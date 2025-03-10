library(tidyverse)

toy_data <- data.frame(
    x = c(1, 2, 3, 4, 5),
    y = c(1, 1, 0, 0, 1),
    z = c("AB", "AC", "AB", "AB", "EA")
)

variable <- "AB"

toy_data %>%
    filter(z == "AB") %>%
    mutate(
        xy = x * y,
        x2 = x^2
    ) %>%
    select(x, y, xy, x2) %>%
    summarise(mean_x2 = mean(x2))

mymatrix <- matrix(c(1, 2, 3, 4, 5), nrow = 2, ncol = 3)
mymatrix

i <- 1:10

for (k in i) {
    i <- c(i, 1)
    print(i)
}


data1 <- read.table("https://raw.githubusercontent.com/szymekdr/AMU_R_workshop/refs/heads/master/class3/data/PLD.txt",
    header = T,
    stringsAsFactors = T
)

mydata <- c(NA, 0, 0, 1, 1, 2, NA, 3, NA, 4)


sum(mydata) / length(mydata)

for (i in 1:length(mydata)) {
    if (i < length(mydata)) {
    } else {
        print(mean(mydata))
    }
}

sum(mydata * 1:length(mydata))

boxplot(pld ~ D.mode,
    data = data1,
    pch = 15,
    col = "lightblue"
)

seq(sqrt(4), sqrt(16))

class(F)


ggplot(data1, aes(x = phylum, y = pld, fill = D.mode)) +
    geom_boxplot(outlier.colour = "gray") +
    theme_bw() +
    labs(x = "Phylum", y = "PLD", fill = "Development mode")


for (i in 1:10) {
    if (i %% 3 == 0) next else print(i)
}


mydata <- c(NA, 0, 0, 1, 1, 2, NA, 3, NA, 4)

out <- numeric(100)
for(i in 1:100) {
    out[i] <- mean(na.omit(mydata)[sample(1:5, replace = T)])
}

sum(out > 0.4) / 100
