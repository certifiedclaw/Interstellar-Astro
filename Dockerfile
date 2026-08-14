FROM node:bookworm-slim AS builder
ENV NODE_ENV=production

WORKDIR /app

RUN npm install -g pnpm
RUN npm install -g bun

COPY ["package.json", "pnpm-lock.yaml*", "./"]

RUN pnpm install

COPY . .

RUN pnpm build

EXPOSE 8080

CMD ["pnpm", "start"]
