# Mass Spectrometry Pipeline

# Визуализации графов

# 1. Граф правил (Rule Graph)

![Rule Graph](rulegraph.png)

# 2. Граф файлов (File Graph)

![File Graph](filegraph.png)

#  Запуск

# 1. Собрать Docker образ
docker build -t mass_spec:latest .

# 2. Запустить pipeline
snakemake --cores 1

# 3. Создать графы
snakemake --rulegraph | dot -Tpng > rulegraph.png
snakemake --filegraph | dot -Tpng > filegraph.png