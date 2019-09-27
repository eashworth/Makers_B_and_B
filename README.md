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

## WHAT WE LEARNT

A team of five of us worked on this project for a week.

# What we did

We wrote a web app using Ruby and Sinatra, with DataMapper handling database commands.
We tested using rspec, using feature tests and a small number of unit tests.
We used Bcrypt to encrypt passwords prior to storing them in the database.

# Learning points

New techniques:

Using DataMapper to store/retrieve values in a database.
Creating html that allows user to click on a date in a calendar to select it.
Using Bcrypt to accept a password string and encrypt it as a hash.

Lessons learnt:

Trying to deliver an app at the same time as learning a new toolset is a significant decision, because it takes considerable time to research suitable tools and get them working. The time and effort spent researching a tool that is ultimately found to be unsuitable is not obvious in the output delivered. Because we wanted to learn how to use some new tools, we had to mob for a long time as we planned the set-up, which meant less time was available for us to pair up and begin coding individual user stories.

We felt more relaxed about our speed of progression once we were able to pair up and begin coding the user stories, but if we had not spent a long time planning as a group, we would have struggled to deliver the user stories.

Merging two outstanding branches at once is difficult! Merging in turn is easier, but that leaves other pairs waiting to see the effect of the other branches. We tried to break down tasks into small enough issues that each new branch could be created, written and merged back to master quickly, to allow other pairs to pull an up to date master to work on. In practice, this was difficult, and we still have a lot to learn.
