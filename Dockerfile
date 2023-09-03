# Use the official Node.js runtime as the base image for the build stage
FROM node:16 as build

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install Angular CLI globally
RUN npm install -g @angular/cli

# Install app dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Build the Angular app for production using the "production" configuration
RUN ng build --configuration=production

# Use a lightweight Nginx image for the production stage
FROM nginx:latest

# Copy the built Angular app from the build stage to the Nginx web server directory
COPY --from=build /app/dist/weatherapp /usr/share/nginx/html

# Expose port 80 for HTTP
EXPOSE 80

# Start Nginx when the container is run
CMD ["nginx", "-g", "daemon off;"]