# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


curl -u mail:pass POST -d '{"price":"12.1","store":"TestSTore", "comment":"just a comment"}' http://localhost:3000/api/costs


curl -u mail:pass POST -d '{"week":"12","year":"2016"}' http://localhost:3000/api/weekstats
curl -u mail:pass -GET -d '{"link":"12.1"}' http://localhost:3000/api/weekstats


curl -u mail:pass -d 'cost[market]=ruuble' -d 'cost[comment]=Kommentar' http://localhost:3000/api/costs

curl -u mail:pass -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"week":40,"year":2016}' http://localhost:3000/api/weekstats
