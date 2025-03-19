FROM node:22-alpine AS base
WORKDIR /app
RUN apk add --no-cache libc6-compat

# client

# FROM base AS client-deps

# COPY client/package*.json ./
# RUN npm ci

# FROM base AS client-builder
# WORKDIR /app

# COPY --from=client-deps /app/node_modules ./node_modules
# COPY client/. .

# RUN npm run build

# FROM base AS client

# ENV NODE_ENV=production

# COPY --from=client-builder /app/public ./public
# COPY --from=client-builder /app/.next/standalone ./
# COPY --from=client-builder /app/.next/static ./.next/static

# EXPOSE 3000

# ENV PORT=3000
# ENV HOSTNAME="0.0.0.0"

# CMD ["node", "server.js"]

# server

FROM base AS api-builder
WORKDIR /app

COPY ./api/package*.json ./
RUN npm ci

COPY api/. .

RUN npm run build

ENV NODE_ENV=production

EXPOSE 3333

ENV PORT=3333
ENV HOSTNAME="0.0.0.0"

CMD [ "npm", "start" ]
