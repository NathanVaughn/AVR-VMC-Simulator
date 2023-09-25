# AVR-VMC-Simulator

[![Build Simulator](https://github.com/bellflight/AVR-VMC-Simulator/actions/workflows/build.yml/badge.svg)](https://github.com/bellflight/AVR-VMC-Simulator/actions/workflows/build.yml)

Docker container for [gazebo](https://docs.px4.io/main/en/sim_gazebo_gz/) bundled with PX4.


## Usage

By default, looks up the IP address of the hostname `mavp2p`, and then sends
the GCS and offboard MAVLink streams to that address.
This can be overriden with the environment variables `MAVLINK_HOST_TARGET` or
`MAVLINK_IP_TARGET` for either a different host or IP address, respectively.
