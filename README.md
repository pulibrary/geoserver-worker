# Geoserver::Worker

[![Build Status](https://img.shields.io/travis/pulibrary/geoserver-worker/master.svg)](https://travis-ci.org/pulibrary/geoserver-worker)
[![Coverage Status](https://img.shields.io/coveralls/pulibrary/geoserver-worker/master.svg)](https://coveralls.io/github/pulibrary/geoserver-worker?branch=master)

Sneakers worker for syncing GeoServer using RabbitMQ.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'geoserver-worker'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install geoserver-worker

## Configuration

#### Default

To use the default RabbitMQ and GeoServer connection parameters, no further configuration is needed. These are useful for testing and development against a local GeoServer instance.

 - rabbit server: `amqp://localhost:5672`
 - rabbit exchange: `geoserver_events`
 - geoserver url: `http://localhost:8080/geoserver/rest`
 - geoserver user: `admin`
 - geoserver password: `geoserver`

 #### Environment Variables

RabbitMQ and GeoServer Connection parameters can be set using environment variables.
  
  - RABBIT_SERVER
  - RABBIT\_GEOSERVER\_EXCHANGE
  - GEOSERVER_URL
  - GEOSERVER_USER
  - GEOSERVER_PASSWORD

## Usage

    $ geoserver-worker

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pulibrary/geoserver-worker.
