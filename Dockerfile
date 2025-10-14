# Use official MySQL image
FROM mysql:8.0

# Install Python (for tiny HTTP server)
RUN apt-get update && apt-get install -y python3 && apt-get clean

# Environment variables (use Render dashboard for actual secrets)
ENV MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
ENV MYSQL_DATABASE=${MYSQL_DATABASE}
ENV MYSQL_USER=${MYSQL_USER}
ENV MYSQL_PASSWORD=${MYSQL_PASSWORD}

# Copy your local SQL dump if you want to auto-import
COPY Data.sql /docker-entrypoint-initdb.d/

# Expose ports
EXPOSE 3306 8080

# Start MySQL and a dummy HTTP server on port 8080
CMD ["sh", "-c", "mysqld & python3 -m http.server 8080"]
