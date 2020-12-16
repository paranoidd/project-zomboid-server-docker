FROM steamcmd/steamcmd:ubuntu-18

ARG STEAM_GAME_ID="380870"
ARG INSTALL_DIR="/home/gamer"
ARG DATA_DIR="$INSTALL_DIR/Zomboid"

ENV ENTRYPOINT_PATH="$INSTALL_DIR/start-server.sh"

# Create user for runtime
RUN groupadd -g 1000 gamer
RUN useradd -u 1000 -ms /bin/bash -g gamer gamer

# Install game via steamcmd
RUN steamcmd +login anonymous +force_install_dir $INSTALL_DIR +app_update $STEAM_GAME_ID validate +quit && \
    chown -R gamer:gamer $INSTALL_DIR .

# Drop root
USER gamer

WORKDIR $INSTALL_DIR

# Start game server
ENTRYPOINT $ENTRYPOINT_PATH
EXPOSE 8766/tcp 16261/tcp
