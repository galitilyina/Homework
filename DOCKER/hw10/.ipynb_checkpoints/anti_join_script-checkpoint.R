# Проверяем dplyr
if (!require(dplyr)) {
  install.packages("dplyr", repos = "https://cloud.r-project.org")
  library(dplyr)
}

cat("dplyr version:", as.character(packageVersion("dplyr")), "\n")

# ===============================
# ТЕСТОВЫЕ ДАННЫЕ
# ===============================

left <- data.frame(
  id = 1:5,
  value_left = c("A", "B", "C", "D", "E")
)

right <- data.frame(
  id = c(3, 4, 6),
  value_right = c("X", "Y", "Z")
)

# сохраняем входные данные
write.csv(left, "data/left.csv", row.names = FALSE)
write.csv(right, "data/right.csv", row.names = FALSE)

# ===============================
# ANTI-JOIN операции
# ===============================

# Left anti-join — что есть в left, но нет в right
anti_left <- anti_join(left, right, by = "id")
write.csv(anti_left, "data/anti_left.csv", row.names = FALSE)

# Right anti-join — что есть в right, но нет в left
anti_right <- anti_join(right, left, by = "id")
write.csv(anti_right, "data/anti_right.csv", row.names = FALSE)

# Outer anti-join — всё уникальное из обеих таблиц
anti_outer <- bind_rows(
  anti_left %>% mutate(source = "left"),
  anti_right %>% mutate(source = "right")
)

write.csv(anti_outer, "data/anti_outer.csv", row.names = FALSE)

cat("Готово! Файлы сохранены в папку data/\n")
