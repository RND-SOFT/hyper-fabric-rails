## Prerequisites

* Docker version 17.06.2-ce or greater
* Docker Compose version 1.14.0 or greater
* Go programming language 1.9.x
* Node.js - version 6.9.x or greater (Node.js version 7.x is not supported)
* Python 2.7
* Ruby 2.3.* or greater
* Postgres 9.5

## Hyperledger

* Install Hyperledger Fabric Docker Images 
  `curl -sSL https://goo.gl/Q3YRTi | bash`
* Docs for hyperledger simple-app: http://hyperledger-fabric.readthedocs.io/en/latest/build_network.html 

### Rails

1. `bundle install`
2. Configure secrets and database from examples
3. `rake db:create`
4. `rails s`