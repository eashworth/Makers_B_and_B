### MAKERS B&B

A Makers Academy group project to build an Air BnB clone.

A web application that allows users to list spaces and rent them out on a per-night basis.

## HOW TO RUN

# Step 1:

Clone this repo and run the following:

```
bundle install
```


# Step 2:

In your Terminal, create two local databases using postgresql:

```
CREATE DATABASE makersbnb;
CREATE DATABASE makersbnb_test;
```

You do not need to create any tables within the databases.
That is done automatically by the app.


# Step 3

Modify the database access commands to work on your local machine.
This is done as follows:

In spec-helper, modify this command:

```
DataMapper.setup(:default, 'postgres://michael@127.0.0.1/makersbnb_test')
```
changing michael to your local user name.

In app.rb, modify this command:

```
DataMapper.setup(:default, 'postgres://student@127.0.0.1/makersbnb')
```
changing student to your local user name.



## User stories:

```
As a user,
So I can sign in to Makers B&B,
I want to create a new account.

As a user,
So I can list a new space,
I want to be able to create a new space.

As a user,
So I can list multiple spaces,
I want to be able to create more than one space on my account.

As a user,
So I can describe my listings,
I want to be able to enter a name for each space, with a short description and a price.

As a user,
So I can manage my bookings,
I want to be able to offer a range of dates when my space is available.

As a user,
So I choose between available spaces,
I want to be able to see a list of available spaces.

As a user,
So I can stay in a place of my choice,
I want to be able to request a space for one night.

As a user,
So I can decide who stays at my property,
I want to approve requests from other users.

As a user,
So that spaces cannot be double-booked,
I want a space to be blocked after it has been booked.

As a user,
So that I can choose who I want to stay at my property,
I want to be able to recieve multiple requests until I confirm.
```
