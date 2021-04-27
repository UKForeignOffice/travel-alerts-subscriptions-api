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

### Build and run database and API

This will:
1. Create a [Prisma](https://www.prisma.io/) client and type definitions
2. Set up all tables
3. Seed tables with data

```
docker-compose up --build
```

The Node debugger is available on port 9229

### API endpoints

See the Postman collection in /docs:

* PUT /subscriptions
* GET /subscriptions
