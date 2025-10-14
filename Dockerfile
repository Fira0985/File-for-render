# Use official MySQL image
FROM mysql:8.0

# Use environment variables for credentials (set on Render dashboard)
ENV MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
ENV MYSQL_DATABASE=${MYSQL_DATABASE}
ENV MYSQL_USER=${MYSQL_USER}
ENV MYSQL_PASSWORD=${MYSQL_PASSWORD}

# Copy your database backup
COPY Data.sql /docker-entrypoint-initdb.d/

# Expose MySQL port
EXPOSE 3306
