docker run --name mesos_slave -d \
    --net=host \
    --privileged \
    -e MESOS_CONTAINERIZERS=docker \
    -e MESOS_DOCKER_SOCK=/var/run/docker.sock \
    -e MESOS_DOCKER_MESOS_IMAGE=mesosphere/mesos-slave:0.27.0-0.2.190.ubuntu1404 \
    -e MESOS_EXECUTOR_REGISTRATION_TIMEOUT=5mins \
    -e MESOS_HOSTNAME=127.0.0.1 \
    -e MESOS_ISOLATOR=cgroups/cpu,cgroups/mem \
    -e MESOS_LOG_DIR=/var/log/mesos/slave \
    -e MESOS_MASTER=zk://127.0.0.1:2181/mesos \
    -e MESOS_PORT=5051 \
    -e MESOS_WORK_DIR=/var/lib/mesos/slave \
    -v /lib/libpthread.so.0:/lib/libpthread.so.0:ro \
    -v /usr/local/bin/docker:/usr/bin/docker:ro \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /sys:/sys \
    -v /proc:/proc \
    mesosphere/mesos-slave:0.27.0-0.2.190.ubuntu1404
