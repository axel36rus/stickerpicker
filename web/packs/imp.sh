#!/bin/bash

# Файл со ссылками на стикерпак
STICKERS_FILE="stick.txt"

# Проверяем, что файл существует
if [ ! -f "$STICKERS_FILE" ]; then
  echo "Файл $STICKERS_FILE не найден"
  exit 1
fi

# Проходим по каждой строке файла
while IFS= read -r url; do
  # Пропускаем пустые строки и комментарии
  [[ -z "$url" || "$url" =~ ^# ]] && continue

  echo "Импортируем $url..."
  mstickereditor import "$url"

done < "$STICKERS_FILE"

echo "Импорт завершён!"
