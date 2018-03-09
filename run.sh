# Run this to start a RabbitMQ server with the desired configuration.
#
# Make sure to first create the variables RABBITMQ_USER and RABBITMQ_PASSWORD
# with the username and password that you want to set up RabbitMQ with.
#
# We provide several alternative ports to the outside world for talking to
# both the RabbitMQ server and the management UI. These alternative ports are
# mapped by the host to the ports 5672 and 15672 of the container, which are
# the default ports of the RabbitMQ server and the management UI, respectively.
#------------------------------------------------------------------------------#

docker run \
    -d \
    -e RABBITMQ_DEFAULT_USER="$RABBITMQ_USER" \
    -e RABBITMQ_DEFAULT_PASS="$RABBITMQ_PASSWORD" \
    -p 5672:5672 \
    -p 1723:5672 \
    -p 15672:15672 \
    -p 8443:15672 \
    -p 8080:15672 \
    rabbitmq:3.7.3-management &&

echo "amqp://$RABBITMQ_USER:$RABBITMQ_PASSWORD@$(curl -s http://169.254.169.254/latest/meta-data/public-hostname):1723/"
