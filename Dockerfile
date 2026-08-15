FROM oven/bun:1-slim AS builder
ENV NODE_ENV=production

WORKDIR /app

COPY ["package.json", "bun.lock", "./"]

RUN bun install

COPY . .

RUN bunx astro build

EXPOSE 8080

CMD ["bun", "run", "start"]
