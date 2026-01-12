FROM node:18-alpine AS builder
WORKDIR /app

# Copy package manifests if present and install dependencies
COPY package*.json ./
RUN if [ -f package.json ]; then npm install --silent; fi

# Copy the rest of the app
COPY . .

# Run the build step if it exists in package.json
RUN if [ -f package.json ] && grep -q "\"build\"" package.json; then npm run build; fi


FROM node:18-alpine AS runner
WORKDIR /app

# Copy built app and node_modules from builder
COPY --from=builder /app /app

ENV NODE_ENV=production
ENV PORT=3000
EXPOSE 3000

# Default start: change to your app's start command if different
CMD ["node", "server.js"]
