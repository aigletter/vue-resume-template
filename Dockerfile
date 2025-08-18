FROM node:20-alpine

# Встановимо робочу директорію
WORKDIR /app

# Копіюємо package.json та lock-файл
COPY package*.json ./

# Встановлюємо залежності
RUN npm ci

# Копіюємо весь код проєкту
COPY . .

# Дозволяємо виконання скрипта
RUN chmod +x ./.docker/npm/entrypoint.sh

# Вказуємо змінну середовища за замовчуванням
ENV APP_ENV=dev

# Експортуємо порт (якщо треба для dev-сервера)
EXPOSE 5173

# Використовуємо наш скрипт як точку входу
ENTRYPOINT ["./entrypoint.sh"]