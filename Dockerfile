# # Stage 1: Build the React app
FROM node:20-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app files
COPY . .

# Expose port 3000 for the app
EXPOSE 3000

# Command to start the development server, after ensuring the host is 0.0.0.0
CMD ["npm", "run", "dev"]

# docker build -t react-app .
# docker run -p 3000:3000 react-app


# =====================jenkins========================================

# # Use the official Jenkins image as the base image
# FROM jenkins/jenkins:2.462.2-jdk17

# # Switch to the root user to install additional tools
# USER root

# # Update package list and install Docker CLI
# RUN apt-get update && apt-get install -y \
#     lsb-release \
#     ca-certificates \
#     curl \
#     gnupg \
#     software-properties-common

# # Add Docker’s official GPG key and repository
# RUN mkdir -m 0755 -p /etc/apt/keyrings && \
#     curl -fsSL https://download.docker.com/linux/debian/gpg | tee /etc/apt/keyrings/docker.asc && \
#     echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# # Install Docker CLI
# RUN apt-get update && apt-get install -y docker-ce-cli

# # Add Jenkins user to the Docker group
# RUN usermod -aG docker jenkins

# # Set the Jenkins user back to default
# USER jenkins

# # Install Jenkins plugins (including Docker and Blue Ocean)
# RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"

# # Expose Jenkins and slave agent ports
# EXPOSE 8081 50000

# # Start Jenkins (default command from base image)
