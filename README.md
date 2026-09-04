# RaceDay System

## Project Description

RaceDay is a system designed to manage running and racing events.

The system allows organisers to manage events and race categories, while participants can register for races and view their results.

## Project Documentation

The `docs` folder contains the main planning and database documents for the RaceDay system.

### Section A: ERD

The Entity Relationship Diagram shows the database entities, attributes, primary keys, foreign keys, and relationships between the entities.

File:
`docs/RaceDay_ERD.png`

### Section B: API Endpoint Plan

The API Endpoint Plan describes the REST API endpoints that will be used by the RaceDay system.

File:
`docs/RaceDay_Endpoint_Plan.md`

### Section C: SQL Database Script

The SQL script creates the RaceDay database, tables, relationships, constraints, and sample data.

File:
`docs/RaceDay_Database.sql`

## Main Entities

The database contains the following main entities:

- Users
- Organisers
- Participants
- Events
- Categories
- Enrolments
- Results

## Technologies

- SQL Server
- REST API
- GitHub
- GitHub Actions

## Project Structure

```text
RaceDay
│
├── .github
│   └── workflows
│       └── validate-docs.yml
│
├── docs
│   ├── RaceDay_ERD.png
│   ├── RaceDay_Endpoint_Plan.md
│   └── RaceDay_Database.sql
│
└── README.md

<!-- Documentation validated -->
