# Track Books API

> Track books is a full-stack application that lets users track the books they're reading. This repo hosts the code for the backend of the application. To view the code for the frontend, go to [Track Books (frontend)](https://github.com/meronokbay/track-books/).

## Features

- A user can signup and login.
- Logged in user can add books with title, total chapters and completed chapters as parameters.
- Logged in user can track books and increase the completed chapters.
- Logged in user can view the progress of each book in a circular progress bar.

## API Endpoint

```
https://track-books.herokuapp.com/api/v1
```

## Routes

| HTTP method | Endpoint   | What it does                      |
| ----------- | ---------  | --------------------------------- |
| POST        | /users     | Create a user (Signup)            |
| POST        | /sessions  | Create a new user session (Login) |
| GET         | /books     | Get all books                     |
| POST        | /books     | Create a new book                 |
| GET         | /books/:id | Get a single book                 |
| PATCH       | /books/:id | Update a single book              |
| DELETE      | /books/:id | Delete a single book              |

## Entity Relationship Diagram

![ERD](./docs/ERD.png)

## Built With

- Rails
- RSpec
- PostgreSQL

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

- Ruby 3.0.0
- PostgreSQL

### Setup

```bash
# Clone the repo
git clone https://github.com/meronokbay/track-books-api/

# cd into the cloned repo
cd track-books-api
```

### Install

```bash
bundle install
```

### Usage

```bash
# Create the database
rails db:create

# Run the migrations
rails db:migrate

# Seed the database with a test account (username: 'test_user', password: '123456)
rails db:seed

# Start the server
rails server
```

### Run tests

```bash
bundle exec rspec
```

## Author

👤 **Meron Ogbai**

- Github: [@meronokbay](https://github.com/meronokbay)
- Twitter: [@MeronDev](https://twitter.com/MeronDev)
- Linkedin: [Meron Ogbai](https://linkedin.com/in/meron-ogbai/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](./LICENSE) licensed.
