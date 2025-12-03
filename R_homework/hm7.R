
# Данные о 10 белках разной длины (готовые значения)
protein_names <- c(
  "Инсулин", "Гормон роста", "Альбумин", "Tau protein", "p53",
  "Parkin", "Myosin-9", "Keratin", "Neurogranin", "Elongation factor"
)

protein_lengths <- c(110, 217, 609, 758, 393, 465, 1960, 644, 78, 462)

# Создаем таблицу данных
protein_data <- data.frame(
  Белок = protein_names,
  Длина = protein_lengths
)

# Показываем таблицу
print(protein_data)

# Строим столбчатую диаграмму
barplot(protein_data$Длина,
        names.arg = protein_data$Белок,
        main = "Длина белковых последовательностей",
        xlab = "Белки",
        ylab = "Длина (аминокислоты)",
        col = "lightblue",
        las = 2,  # Вертикальные подписи по оси X
        cex.names = 0.8)  # Размер шрифта подписей

# Добавляем сетку для удобства чтения
grid(nx = NA, ny = NULL)

# Добавляем значения поверх столбцов
text(1:10, protein_data$Длина + 50, labels = protein_data$Длина)

# Загружаем необходимые библиотеки
library(httr)

# Функция для получения белка в формате FASTA
get_protein_fasta <- function(accession) {
  url <- paste0("https://www.ebi.ac.uk/proteins/api/proteins/", accession)
  
  # Делаем запрос с заголовком для FASTA формата
  response <- GET(url, accept("text/x-fasta"))
  
  if (status_code(response) == 200) {
    return(content(response, "text"))
  } else {
    cat("Ошибка:", status_code(response), "для белка", accession, "\n")
    return(NULL)
  }
}

# Получаем FASTA для белка (например, P00533 - EGFR)
accession <- "P00533"
fasta_content <- get_protein_fasta(accession)

if (!is.null(fasta_content)) {
  # Создаем имя файла
  filename <- paste0(accession, ".fasta")
  
  # Сохраняем в файл
  writeLines(fasta_content, filename)
  
  cat("Файл сохранен:", filename, "\n")
  cat("Содержимое:\n")
  cat(fasta_content)
} else {
  cat("Не удалось получить данные для белка", accession, "\n")
}

