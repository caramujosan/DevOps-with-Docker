# Start from ubuntu image
FROM ubuntu:20.04

# Use /usr/src/app as our workdir. The following instructions will be executed in this location.
WORKDIR /usr/src/app

# Copy the hello.sh file from this location to /usr/src/app/ creating /usr/src/app/curler.
COPY script.sh .

# Add execution permission
RUN chmod +x script.sh

# Execute a command with '/bin/sh -c' prefix.
RUN apt-get update

RUN apt-get install curl -y

# When running Docker run the command will be ./script.sh
CMD ./script.sh
