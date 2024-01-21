# # Step 1: Build React App
# FROM node:alpine3.18 as build
# WORKDIR /app 
# COPY package.json .
# RUN npm install
# COPY . .
# RUN npm run build

# # Step 2: Server With Nginx
# FROM nginx:1.23-alpine
# WORKDIR /usr/share/nginx/html
# # RUN rm -rf *
# COPY --from=build /app/build .
# EXPOSE 80
# ENTRYPOINT [ "nginx", "-g", "daemon off;" ]

# Use an official Node.js runtime as a parent image
FROM node:16

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install app dependencies, including Material-UI 5
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the React app
RUN npm run build

# Expose the port that the app will run on (adjust if needed)
EXPOSE 80

# Define the command to start the app
CMD ["npm", "start"]
