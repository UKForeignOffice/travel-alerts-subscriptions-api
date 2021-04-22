# FCDO Travel Alerts - Subscriptions API

A REST API and database to manage:
* user subscriptions for travel alerts
* sending travel alerts to subscribers

## Tech stack
* Postgres (uses `postgres` Docker image)
* Node.js
* Typescript
* [Prisma](https://www.prisma.io/) - DB client / ORM for Postgres  
* HTTP server - Express
    * Request payload validation - Joi / Celebrate  
* Test runner - Jest
    * HTTP requests - Supertest
* Linting - eslint & Prettier

## Setup for running locally

### Prerequisites
[Docker](https://www.docker.com/products/docker-desktop) should be running

### Set up database

This will:
1. Create a [Prisma](https://www.prisma.io/) client and type definitions
2. Set up all tables
3. Seed tables with data

```
docker-compose up
npm i
npm run db:setup
```

### Run node.js API

Ensure the database is running:
```
docker-compose up
```

Start the app (enables Node debugger):
```
npm run start:dev
```

### API endpoints

See the Postman collection in /docs:

* PUT /subscriptions
* GET /subscriptions
