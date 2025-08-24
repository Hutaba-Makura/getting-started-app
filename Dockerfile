FROM node:18-alpine
WORKDIR /app

# yarnを有効化
RUN corepack enable

# package.json / yarn.lock をコピー
COPY package.json yarn.lock ./

# yarnで依存をインストール（lockファイルを尊重）
RUN yarn install --production

# アプリ本体をコピー
COPY . .

# コンテナ内で待ち受けるポート番号
EXPOSE 3000

# 起動コマンド（package.json の "start": "node src/index.js" を利用）
CMD ["yarn", "start"]

