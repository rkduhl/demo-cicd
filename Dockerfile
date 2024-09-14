FROM node:20-ALPINE
RUN apk add --no-cache python2 g++ make
WORKDIR /app
COPY . .
RUN npm run dev
CMD ["node","src/index.js"]
EXPOSE 3000