# Use official MySQL image
FROM mysql:8.0

# Environment variables (set on Render dashboard for security)
ENV MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
ENV MYSQL_DATABASE=${MYSQL_DATABASE}
ENV MYSQL_USER=${MYSQL_USER}
ENV MYSQL_PASSWORD=${MYSQL_PASSWORD}

# Copy your database backup
COPY Data.sql /docker-entrypoint-initdb.d/

# Copy tiny HTTP server
COPY server.sh /server.sh

# Expose MySQL and dummy HTTP ports
EXPOSE 3306 8080

# Start MySQL and tiny HTTP server together
CMD ["sh", "-c", "/server.sh & docker-entrypoint.sh mysqld"]
