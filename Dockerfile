FROM node:20-alpine3.18 AS base

FROM base AS development

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 5173
CMD ["npm", "run", "dev"]

FROM base AS production

WORKDIR /app
COPY package*.json ./
RUN npm install
# RUN npm install --only=production
COPY . .
EXPOSE 5173
CMD ["npm", "run", "dev"]