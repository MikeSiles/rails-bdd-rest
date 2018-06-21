# Readme
This application is a proof-of-concept of using Behavior Driven Development (BDD) in Ruby on Rails through rspec. If you aren't familiar with BDD, I recommend checking out wikipedia's article on it.
>https://en.wikipedia.org/wiki/Behavior-driven_development

The application makes a simple sales application that stores customers in a database, along with their people and locations. The endpoints limit what data is retrieved based on the user requesting the records, ostensibly the salesperson. Look at spec/requests/ for a starting point on reading the tests.

The goal of this is to make a thorough and complete introduction to using BDD to build a practical purpose. It demonstrates splitting logic into microservices instead of making it part of a layer--or worse yet, directly putting the logic in models and controllers, as well as handling 1-to-many, many-to-many and 1-to-1 relationships. It’s also a nice introduction to clean, tested authentication.

I owe much thanks to Austin Kabiru, and his tutorials on testing rails content in the form of a simple 'todo list' app. Much of the authentication remains the same, saving for small changes to accomodate updated libraries.

>https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-one 

Also thanks to RailsGuides for clarifying the way that Active Record handles different associations

>http://guides.rubyonrails.org/association_basics.html

In addition, this StackOverflow question provides some clarity on how to do Join Tables from the command line.
>https://stackoverflow.com/questions/6561330/rails-has-and-belongs-to-many-migration

And finally, a small thanks to the documentation on both Faker and Shoulda Matchers that I have used throughout the project.

>https://github.com/stympy/faker
>https://github.com/thoughtbot/shoulda-matchers
