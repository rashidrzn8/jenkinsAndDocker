# Use the latest version of the Node.js image as the base image
FROM node:20-alpine 

# Set the working directory inside the container to /usr/src/app
WORKDIR /usr/src/app  

# Copy the contents of the local "my-project" directory to the root directory of the container
COPY my-project/* /  

# Run the npm install command to install the dependencies specified in package.json
RUN npm install  

# Expose port 4000 to allow incoming connections to the container
EXPOSE 4000  

# Start the application by running the "npm start" command
CMD [ "npm", "start" ]  