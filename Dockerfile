# Use an official Node.js runtime as a base image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the local source code to the container
COPY . .

# Expose the port that webssh2 is running on
EXPOSE 8080

# Define the command to run your application
CMD ["npm", "start"]
