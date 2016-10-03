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


token = 0adc0104c5da42b6bce04f978ffc67fc

curl -H "Content-Type: application/json" -X POST -d '{"email":"12345@12345.de","password":"12345"}' http://localhost:3000/api/sessions

curl -H "Authorization: Token token=0adc0104c5da42b6bce04f978ffc67fc" http://localhost:3000/api/costs

curl -H "Authorization: Token token=0adc0104c5da42b6bce04f978ffc67fc" -X POST -d '{"price":"12.1","store":"TestSTore", "comment":"just a comment"}' http://localhost:3000/api/costs

curl -H "Authorization: Token token=0adcprice]=12.1' -d 'cost[market]=ruuble' -d 'cost[comment]=Kommentar' http://localhost:3000/api/costs
