# Use the official Node.js image as the base image
FROM node:18-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json (if present) from the /client directory
COPY client/package*.json ./

# Install dependencies
RUN npm install --legacy-peer-deps

# Copy the rest of the application files from /client to the container's /app directory
COPY client/ .

# Build the Next.js application
RUN npm run build

# Expose the port the app will run on (default for Next.js is 3000)
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
