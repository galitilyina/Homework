# Простой R скрипт для генерации CSV файла.

# Создаем простой набор данных
data <- data.frame(
  ID = 1:10,
  Name = c("Alice", "Bob", "Charlie", "David", "Eve", "Frank", "Grace", "Henry", "Ivy", "Jack"),
  Age = c(25, 30, 35, 28, 32, 45, 29, 33, 27, 31),
  Score = c(85, 92, 78, 88, 95, 82, 90, 87, 79, 93)
)

# Выводим информацию о данных
print("Сгенерированные данные:")
print(data)
print(paste("Размер данных:", nrow(data), "строк,", ncol(data), "столбцов"))

# Сохраняем в CSV файл
output_file <- "/home/results/sample_data.csv"
write.csv(data, output_file, row.names = FALSE)

print(paste("Файл сохранен как:", output_file))
print("Готово!")