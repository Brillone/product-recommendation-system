FROM pandologicalgo/python38-pyodbc:v1.0

ARG USERNAME=appuser
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE 1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED 1

# ENV DASK_ROOT_CONFIG=/etc/dask/


WORKDIR /project
ADD . /project

# Install pip requirements
RUN python -m pip install -r /project/requirements.txt

RUN apt-get update \
    # Create a non-root user
    && groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    # Add sudo support for the non-root user
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME\
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    #
    # Clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* \
    # Clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

ENV HOME /home/$USERNAME
USER ${USERNAME}


RUN while true; do sleep 10000; done