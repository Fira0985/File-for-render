# Use official MySQL image
FROM mysql:8.0

# Environment variables
ENV MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
ENV MYSQL_DATABASE=${MYSQL_DATABASE}
ENV MYSQL_USER=${MYSQL_USER}
ENV MYSQL_PASSWORD=${MYSQL_PASSWORD}

# Copy backup.sql
COPY Data.sql /docker-entrypoint-initdb.d/

# Expose MySQL and dummy HTTP ports
EXPOSE 3306 8080

# Start MySQL and tiny HTTP server together
CMD ["sh", "-c", "mysqld & python3 -m http.server 8080"]
