FROM docker

WORKDIR /app/

# Copy the builder script
COPY builder.sh .

# Ensure the script is executable
RUN chmod +x builder.sh

# Set the entry point to the builder script
ENTRYPOINT ["./builder.sh"]






