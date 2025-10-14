# Use Ubuntu as base, then install MySQL + Python manually
FROM ubuntu:22.04

# Install MySQL Server and Python
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server python3 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Environment variables (will be overridden in Render)
ENV MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
ENV MYSQL_DATABASE=${MYSQL_DATABASE}
ENV MYSQL_USER=${MYSQL_USER}
ENV MYSQL_PASSWORD=${MYSQL_PASSWORD}

# Copy your backup file if needed
COPY Data.sql /docker-entrypoint-initdb.d/

# Expose MySQL (3306) and dummy HTTP (8080)
EXPOSE 3306 8080

# Start MySQL and a tiny HTTP server
CMD ["sh", "-c", "service mysql start && python3 -m http.server 8080"]
