# RaceDay_Part1

## 1. Project Overview

RaceDay is a race event management system designed to help organisers manage running events and participants.

The system provides a structured way to manage users, organisers, participants, events, race categories, enrolments, and race results.

The project focuses on planning the system using an Entity Relationship Diagram (ERD), a REST API endpoint plan, and a relational SQL database.

---

## 2. Project Purpose

The purpose of the RaceDay system is to provide a centralised system for managing race events.

The system is designed to make it easier for organisers to:

- Create and manage race events.
- Create race categories for events.
- Set distances and entry fees.
- View participant enrolments.
- Record participant results.
- Manage race information.

Participants can use the system to:

- Register an account.
- Log in to the system.
- Manage their profile.
- View available race events.
- Enrol in race categories.
- View their race results.

---

## 3. Project Objectives

The main objectives of the RaceDay system are:

1. To manage users and their roles.
2. To manage race organisers.
3. To manage race participants.
4. To create and manage race events.
5. To create and manage event categories.
6. To allow participants to enrol in race categories.
7. To record and manage race results.
8. To store information in a structured relational database.
9. To design REST API endpoints for communication between the system components.
10. To use GitHub for version control and project documentation.
11. To use GitHub Actions for automated project validation.

---

## 4. System Users

The RaceDay system has two main user roles.

### 4.1 Organiser

An organiser is responsible for managing race events.

Organisers can:

- Create an account.
- Log in.
- Manage their profile.
- Create events.
- Update events.
- Delete events.
- Create event categories.
- Update event categories.
- Delete event categories.
- View participant enrolments.
- Record race results.
- Update race results.

### 4.2 Participant

A participant is a person who enters a race event.

Participants can:

- Create an account.
- Log in.
- Manage their profile.
- View available events.
- View event categories.
- Enrol in a race category.
- Cancel an enrolment.
- View their race results.

---

## 5. Main System Entities

The RaceDay database contains the following main entities:

### Users

Stores general user account information.

Main information includes:

- User ID
- First name
- Last name
- Email
- Password hash
- Role
- Date created

### Organisers

Stores information about users who organise race events.

Main information includes:

- Organiser ID
- User ID
- Organisation name
- Phone number

### Participants

Stores information about users who participate in races.

Main information includes:

- Participant ID
- User ID
- Date of birth
- Gender
- Phone number

### Events

Stores information about race events.

Main information includes:

- Event ID
- Organiser ID
- Event name
- Event date
- Location
- Description

### Categories

Stores the different race categories available for an event.

Main information includes:

- Category ID
- Event ID
- Category name
- Distance
- Entry fee
- Maximum number of participants

### Enrolments

Stores participant registrations for race categories.

Main information includes:

- Enrolment ID
- Participant ID
- Category ID
- Enrolment date
- Status
- Bib number

### Results

Stores race results for participants.

Main information includes:

- Result ID
- Enrolment ID
- Finish time
- Position
- Completion status

---

## 6. Entity Relationships

The main relationships in the RaceDay database are:

- A User can have an Organiser profile.
- A User can have a Participant profile.
- An Organiser can manage multiple Events.
- An Event can contain multiple Categories.
- A Participant can have multiple Enrolments.
- A Category can have multiple Enrolments.
- An Enrolment can have zero or one Result.

The Enrolment entity connects Participants and Categories.

The complete database relationships are shown in the Entity Relationship Diagram located in the `docs` folder.

---

## 7. Database Design

The RaceDay database is designed as a relational database.

The database contains the following tables:

```text
Users
Organisers
Participants
Events
Categories
Enrolments
Results
