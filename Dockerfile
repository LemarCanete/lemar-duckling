# Use a base image with Haskell and Stack pre-installed
FROM haskell9.6.3

# Install the necessary system dependencies for Duckling
RUN apt-get update && apt-get install -y libpcre3 libpcre3-dev build-essential

# Clone the Duckling repository
RUN git clone httpsgithub.comfacebookduckling.git
WORKDIR duckling

# Build the Duckling server
RUN stack install

# Expose the port Duckling will run on
EXPOSE 8000

# Set the command to run the server
CMD [root.localbinduckling-server, -p, 8000]
