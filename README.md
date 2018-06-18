# Readme
This application is a proof-of-concept of using Behavior Driven Development in Ruby on Rails through rspec. The example is a working, finished version of two tutorials by Austin Kabiru. The code has only been modified to accommodate small updates to the frameworks used. Otherwise, all credit goes to him.

The application makes a typical “Todo list” application that has three types of records: users, their todo lists, and the items of todo list. The endpoints limit what data is retrieved based on the user requesting the records. Look at spec/requests/user_spec.rb for a starting point on reading the tests.

In my opinion, this is one of the most thorough and complete introductions to using BDD to build a practical purpose. It also demonstrates splitting logic into microservices instead of making it part of a layer--or worse yet, directly putting the logic in models and controllers. It’s also a nice introduction to clean, tested authentication.

### Pages:

>https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-one 
>https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-two

