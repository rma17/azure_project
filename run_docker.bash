xhost local:root

XAUTH=/tmp/.docker.xauth

docker run -it \
	-d\
       --name=ros2 \
       --env="DISPLAY=$DISPLAY" \
       --env="QT_X11_NO_MITSHM=1" \
       --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
       --volume="/home/primi/docker_file/ROS2:/docker-ros" \
       --device /dev:/dev \
       --volume=/dev:/dev\
       --env="XAUTHORITY=$XAUTH" \
       --volume="$XAUTH:$XAUTH" \
       --privileged \
       --gpus all \
       ros2_torch:latest \
       /bin/bash -c "source /docker-ros/local_ws/extra.bash &&bash;
       exec bash" 
