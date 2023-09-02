FROM docker.io/px4io/px4-dev-simulation-focal:latest
WORKDIR /work/

ENV DEBIAN_FRONTEND noninteractive

# install git
RUN apt-get update -y \
 && apt-get install -y git

# figure out what version of PX4 we need
COPY AVR-PX4-Firmware/.px4-version .px4-version

# clone PX4
RUN git clone https://github.com/PX4/PX4-Autopilot --depth 1 --branch $(cat .px4-version) --recurse-submodules
WORKDIR /work/PX4-Autopilot

# compile PX4
RUN HEADLESS=1 DONT_RUN=1 make px4_sitl_default gazebo

# use this to disable failsafe parameters when running in SITL
# https://github.com/PX4/PX4-Autopilot/blob/main/ROMFS/px4fmu_common/init.d-posix/px4-rc.params
# https://docs.px4.io/main/en/simulation/failsafes.html
COPY px4-rc.params ROMFS/px4fmu_common/init.d-posix/px4-rc.params
RUN chmod +x ROMFS/px4fmu_common/init.d-posix/px4-rc.params

# entrypoint
WORKDIR /work/
COPY docker-entrypoint.sh docker-entrypoint.sh
RUN chmod +x docker-entrypoint.sh

WORKDIR /work/PX4-Autopilot
ENTRYPOINT [ "/work/docker-entrypoint.sh" ]