# The first layer adds basic commands and a package manager, such as apt.
# The second layer installs a Python runtime and pip for dependency management.
# The third layer copies in an application’s specific requirements.txt file.
# The fourth layer installs that application’s specific dependencies.
# The fifth layer copies in the actual source code of the application.

FROM debian:bookworm

COPY ./conf/ /app/

WORKDIR /app

RUN apt install mariadb-client 