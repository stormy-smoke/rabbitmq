# RabbitMQ

We use [RabbitMQ](http://www.rabbitmq.com/) as our message broker.

## Deployment

### Set Up Instance

Set up a computing instance that satisfies the following requirements:

- Docker is installed
- The ports **5672**, **1723**, **15672**, **8443**, and **8080** are open for incoming TCP traffic

There are no particularly high system requirements for running RabbitMQ for our purposes. An AWS EC2 [t2.micro](https://aws.amazon.com/ec2/instance-types/t2/) instance (1 CPU, 1 GB RAM) with a 8 GB hard disk seems to work fine.

### Deployment and Launch

On the instance:

- Create environment variables `RABBITMQ_USER` and `RABBITMQ_PASSWORD` with username and password that you want to use for RabbitMQ
- Source the script in [run.sh](run.sh)

You can do this as follows:

~~~bash
export RABBITMQ_USER=myuser
export RABBITMQ_PASSWORD=mypassword
curl -sk https://raw.githubusercontent.com/stormysmoke/rabbitmq/master/run.sh | bash
~~~

## Usage

### RabbitMQ Server

You can now establish a connection to the RabbitMQ server by the means of a RabbitMQ [client library](http://www.rabbitmq.com/devtools.html) of your choice.

Most of these client libraries allow to establish a connection to a running RabbitMQ server with a URI. Such a URI has the following format:

~~~
amqp://user:password@host:port/vhost
~~~

An example URI thus is:

~~~
amqp://me:mypassword@ec2-35-167-61-219.us-west-2.compute.amazonaws.com:5672/
~~~

This URI encodes the following parameters:

- Username: **me**
- Password: **mypassword**
- Host: **ec2-35-167-61-219.us-west-2.compute.amazonaws.com**
- Port: **5672**
- Virtual host: **/**

In the present installation, the port must be either **5672** (default port of RabbitMQ) or **1723**. The latter port is an alias and is mapped by the host to port 5672 of the container (see [run.sh](run.sh)).

### Management UI

The management UI is accessible over HTTP on `http://host:port`. So, for example:

~~~
http://ec2-35-167-61-219.us-west-2.compute.amazonaws.com:15672
~~~

The port must be either **15672** (default port of RabbitMQ management UI), **8843**, or **8080**. The latter two ports are aliases for 15672 and mapped by the host to the port 15672 of the container (see [run.sh](run.sh)).
