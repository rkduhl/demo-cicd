# Use the latest Node.js image
FROM node:20-alpine

# Install build dependencies
RUN apk add --no-cache g++ make python3

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json first to leverage Docker caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the Vite React app for production
RUN npm run build

# Expose port 3000 for the Vite development server
EXPOSE 3000

# Start the Vite server
CMD ["npm", "run", "preview"]
