# syntax=docker/dockerfile:1
FROM ubuntu:20.04
LABEL maintainer="William Jawad"
LABEL Description="Docker container for PostgreSQL database 'Universe'"

# install needed files for operations
RUN apt-get update && apt-get install -y gnupg apt-utils

# Add the PostgreSQL PGP key to verify their Debian packages.
# It should be the same key as https://www.postgresql.org/media/keys/ACCC4CF8.asc
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-key 7FCC7D46ACCC4CF8

#ARG DEBIAN_FRONTEND=noninteractive

# Add PostgreSQL's repository. It contains the most recent stable release
#  of PostgreSQL.
RUN touch /etc/apt/sources.list.d/pgdg.list
RUN echo "deb http://apt.postgresql.org/pub/repos/apt focal-pgdg main" > /etc/apt/sources.list.d/pgdg.list

ENV TZ=Europe/Helsinki
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install ``python-software-properties``, ``software-properties-common`` and PostgreSQL 14
#  There are some warnings (in red) that show up during the build. You can hide
#  them by prefixing each apt-get statement with DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y software-properties-common postgresql-14 postgresql-client-14 postgresql-contrib-14


RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Note: The official Debian and Ubuntu images automatically ``apt-get clean``
# after each ``apt-get``



# Run the rest of the commands as the ``postgres`` user created by the ``postgres-14`` package when it was ``apt-get installed``
USER postgres

# Create a PostgreSQL role named ``docker`` with ``docker`` as the password and
# then create a database `docker` owned by the ``docker`` role.
# Note: here we use ``&&\`` to run commands one after the other - the ``\``
#       allows the RUN command to span multiple lines.
RUN    /etc/init.d/postgresql start &&\
    psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" &&\
    createdb -O docker docker

# Adjust PostgreSQL configuration so that remote connections to the
# database are possible.
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/14/main/pg_hba.conf

# And add ``listen_addresses`` to ``/etc/postgresql/14/main/postgresql.conf``
RUN echo "listen_addresses='*'" >> /etc/postgresql/14/main/postgresql.conf

# Expose the PostgreSQL port
EXPOSE 5432

# Add VOLUMEs to allow backup of config, logs and databases
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

# Set the default command to run when starting the container
CMD ["/usr/lib/postgresql/14/bin/postgres", "-D", "/var/lib/postgresql/14/main", "-c", "config_file=/etc/postgresql/14/main/postgresql.conf"]
