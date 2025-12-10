FROM node:18

# 1. Gerekli tüm kütüphaneleri ve Sanal Ekran (xvfb) aracını yükle
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    ca-certificates \
    procps \
    libxss1 \
    xvfb \
    libnss3 \
    libatk-bridge2.0-0 \
    libgtk-3-0 \
    libgbm-dev \
    libasound2 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# 2. Paket dosyalarını kopyala ve kur
COPY package*.json ./
RUN npm install

# 3. Tüm proje dosyalarını kopyala
COPY . .

# 4. ÖNEMLİ: Uygulamayı "Sanal Ekran" (xvfb) içinde başlat
CMD ["xvfb-run", "--auto-servernum", "--server-args='-screen 0 1280x1024x24'", "node", "index.js"]
