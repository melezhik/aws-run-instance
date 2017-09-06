# SYNOPSIS

Sparrow plugin to run aws instance


# INSTALL

    $ sparrow plg install aws-run-instance


# USAGE

To run instance you should set necessary 3 parameters:


    $ sparrow plg run  aws-run-instance --param subnet=$subnet-id --param image=$image-id --param type=$instance-type

The command will return JSON data upon successfull instance creation. You'll grep instance ID for 
further work with instance.


Run as sparrow task.

It's convenient to run plugin as sparrow task providing sane defaults:

    $ sparrow project create aws
    $ sparrow task add aws run-instance aws-run-instance
    $ sparrow task ini aws/run-instance

    ---
    image: ami-bla-bla-bla
    type: "t2.micro"
    subnet: subnet-bla-bla-bla


# Author

Alexey Melezhik


# Prerequisites

Aws cli should be installed

