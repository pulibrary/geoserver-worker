# Geoserver::Worker

Sneakers worker for syncing GeoServer using RabbitMQ

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

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pulibrary/geoserver-messaging.
