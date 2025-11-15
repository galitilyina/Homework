# Читаем данные гемоглобина из CSV файла
data <- read.csv("анализ_гемоглобина.csv")

# Выводим информацию о данных
print("Данные гемоглобина:")
print(head(data))
print(paste("Размер данных:", nrow(data), "строк,", ncol(data), "столбцов"))

# Базовая статистика по гемоглобину
print("Базовая статистика гемоглобина:")
print(summary(data$hemoglobin))

# Сохраняем обработанные данные в CSV файл
output_file <- "/DOCKER/анализ_гемоглобина.csv"
write.csv(data, output_file, row.names = FALSE)

print(paste("Файл сохранен как:", output_file))
print("Анализ завершен!")