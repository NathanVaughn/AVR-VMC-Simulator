#! /bin/bash

export PX4_HOME_LAT=${PX4_HOME_LAT:-32.808549}
export PX4_HOME_LON=${PX4_HOME_LON:--97.156345}
export PX4_HOME_ALT=${PX4_HOME_ALT:-161.5}

echo "Starting at ${PX4_HOME_LAT}, ${PX4_HOME_LON}, ${PX4_HOME_ALT}"
make px4_sitl_default gazebo