HAIR SALON

Author: Lindsay Culver

Program name: Hair Salon

Setup: Bundle ruby app.rb

Database setup:
CREATE DATABASE hair_salon;
CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);

RSpec is setup to be based off a test database. For additional testing, please utilize this additional line:

CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;


Description: Hair Salon is an app where a salon owner can save stylists and their client's information.

For example:

Add a Stylist: Enter stylist info.
    Select a stylist to see and add a list of clients.

Copyright and license:

Code and documentation copyright 2015 Lindsay Culver. Hair Salon is released under the MIT license
