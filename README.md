# RabbitMQ

We use [RabbitMQ](http://www.rabbitmq.com/) as our message broker.

## Deployment

### Prerequisites

Set up a computing instance that satisfies the following requirements:

- Docker is installed
- The ports 5672, 1723, 15672, 8443, and 8080 are open for incoming TCP traffic

There are no particularly high system requirements for running RabbitMQ for our purposes. An AWS EC2 [t2.micro](https://aws.amazon.com/ec2/instance-types/t2/) instance (1 CPU, 1 GB RAM) with a 8 GB hard disk seems to work fine.

### Deployment and Launch

On the instance, run the command in [run.sh](run.sh).
