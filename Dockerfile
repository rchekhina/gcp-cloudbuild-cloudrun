# Imagen base oficial ligera de Python
FROM python:3.10-slim

# Evita que Python escriba archivos .pyc y asegura que los logs salgan directo
ENV PYTHONUNBUFFERED True

# Directorio de trabajo en el contenedor
WORKDIR /app

# Copiar dependencias e instalarlas
RUN pip install Flask gunicorn

# Copiar el código fuente
COPY app.py .

# Ejecutar la app usando gunicorn para producción
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 app:app
