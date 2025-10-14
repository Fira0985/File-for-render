# Use official MySQL image
FROM mysql:8.0

# Set MySQL root password (admin)
ENV MYSQL_ROOT_PASSWORD=MyStrongRootPass123!

# Set a regular database user
ENV MYSQL_DATABASE=mydatabase
ENV MYSQL_USER=myuser
ENV MYSQL_PASSWORD=MyUserPass123!

# Copy your database backup to automatically import it
COPY Data.sql /docker-entrypoint-initdb.d/

# Expose MySQL port
EXPOSE 3306
