FROM python:3.9-slim

# Gerekli araçları yükle
RUN apt-get update && apt-get install -y \
    chromium \
    chromium-driver \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

# Kütüphaneleri yükle (requirements.txt dosyası olmadığı için elle yazıyoruz)
RUN pip install --no-cache-dir selenium undetected-chromedriver fake-useragent requests

# Ortam değişkenleri
ENV PYTHONUNBUFFERED=1
ENV CHROME_BIN=/usr/bin/chromium
ENV CHROMEDRIVER=/usr/bin/chromedriver

CMD ["python", "youtube_viewer.py"]
