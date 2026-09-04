CREATE DATABASE RaceDayDB;
GO

USE RaceDayDB;
GO

CREATE TABLE Users
(
    UserId INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL,
    Role VARCHAR(20) NOT NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),

    CONSTRAINT CK_Users_Role
        CHECK (Role IN ('Organiser', 'Participant'))
);
GO

CREATE TABLE Organisers
(
    OrganiserId INT IDENTITY(1,1) PRIMARY KEY,
    UserId INT NOT NULL UNIQUE,
    OrganisationName VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(20),

    CONSTRAINT FK_Organisers_Users
        FOREIGN KEY (UserId)
        REFERENCES Users(UserId)
);
GO

CREATE TABLE Participants
(
    ParticipantId INT IDENTITY(1,1) PRIMARY KEY,
    UserId INT NOT NULL UNIQUE,
    DateOfBirth DATE,
    Gender VARCHAR(20),
    PhoneNumber VARCHAR(20),

    CONSTRAINT FK_Participants_Users
        FOREIGN KEY (UserId)
        REFERENCES Users(UserId)
);
GO

CREATE TABLE Events
(
    EventId INT IDENTITY(1,1) PRIMARY KEY,
    OrganiserId INT NOT NULL,
    EventName VARCHAR(100) NOT NULL,
    EventDate DATETIME NOT NULL,
    Location VARCHAR(150) NOT NULL,
    Description VARCHAR(500),

    CONSTRAINT FK_Events_Organisers
        FOREIGN KEY (OrganiserId)
        REFERENCES Organisers(OrganiserId)
);
GO

CREATE TABLE Categories
(
    CategoryId INT IDENTITY(1,1) PRIMARY KEY,
    EventId INT NOT NULL,
    CategoryName VARCHAR(100) NOT NULL,
    DistanceKm DECIMAL(6,2) NOT NULL,
    EntryFee DECIMAL(10,2) NOT NULL DEFAULT 0,
    MaxParticipants INT NOT NULL,

    CONSTRAINT FK_Categories_Events
        FOREIGN KEY (EventId)
        REFERENCES Events(EventId),

    CONSTRAINT CK_Categories_Distance
        CHECK (DistanceKm > 0),

    CONSTRAINT CK_Categories_EntryFee
        CHECK (EntryFee >= 0),

    CONSTRAINT CK_Categories_MaxParticipants
        CHECK (MaxParticipants > 0),

    CONSTRAINT UQ_Category_Event_Name
        UNIQUE (EventId, CategoryName)
);
GO

CREATE TABLE Enrolments
(
    EnrolmentId INT IDENTITY(1,1) PRIMARY KEY,
    ParticipantId INT NOT NULL,
    CategoryId INT NOT NULL,
    EnrolmentDate DATETIME NOT NULL DEFAULT GETDATE(),
    Status VARCHAR(20) NOT NULL DEFAULT 'Registered',
    BibNumber VARCHAR(20) NOT NULL UNIQUE,

    CONSTRAINT FK_Enrolments_Participants
        FOREIGN KEY (ParticipantId)
        REFERENCES Participants(ParticipantId),

    CONSTRAINT FK_Enrolments_Categories
        FOREIGN KEY (CategoryId)
        REFERENCES Categories(CategoryId),

    CONSTRAINT UQ_Enrolment_Participant_Category
        UNIQUE (ParticipantId, CategoryId),

    CONSTRAINT CK_Enrolments_Status
        CHECK (Status IN ('Registered', 'Cancelled', 'Completed'))
);
GO

CREATE TABLE Results
(
    ResultId INT IDENTITY(1,1) PRIMARY KEY,
    EnrolmentId INT NOT NULL UNIQUE,
    FinishTimeSeconds INT,
    Position INT,
    Completed BIT NOT NULL DEFAULT 0,

    CONSTRAINT FK_Results_Enrolments
        FOREIGN KEY (EnrolmentId)
        REFERENCES Enrolments(EnrolmentId),

    CONSTRAINT CK_Results_FinishTime
        CHECK (FinishTimeSeconds IS NULL OR FinishTimeSeconds >= 0),

    CONSTRAINT CK_Results_Position
        CHECK (Position IS NULL OR Position > 0)
);
GO


-- =========================================
-- SAMPLE USERS
-- =========================================

INSERT INTO Users
(FirstName, LastName, Email, PasswordHash, Role)
VALUES
('Thabo', 'Mokoena', 'thabo@raceday.co.za', 'hashed_password_1', 'Organiser'),
('Naledi', 'Khumalo', 'naledi@raceday.co.za', 'hashed_password_2', 'Organiser'),
('Lerato', 'Nkosi', 'lerato@email.com', 'hashed_password_3', 'Participant'),
('Kagiso', 'Molefe', 'kagiso@email.com', 'hashed_password_4', 'Participant');
GO


-- =========================================
-- SAMPLE ORGANISERS
-- =========================================

INSERT INTO Organisers
(UserId, OrganisationName, PhoneNumber)
VALUES
(1, 'Pretoria Running Club', '0125551001'),
(2, 'Gauteng Athletics Events', '0115552002');
GO


-- =========================================
-- SAMPLE PARTICIPANTS
-- =========================================

INSERT INTO Participants
(UserId, DateOfBirth, Gender, PhoneNumber)
VALUES
(3, '2002-05-14', 'Female', '0712345678'),
(4, '2001-11-20', 'Male', '0723456789');
GO


-- =========================================
-- SAMPLE EVENTS
-- =========================================

INSERT INTO Events
(OrganiserId, EventName, EventDate, Location, Description)
VALUES
(1, 'Pretoria Spring Run', '2026-09-20 07:00:00',
 'Union Buildings, Pretoria',
 'Annual spring road race.'),

(1, 'Jacaranda City Marathon', '2026-10-18 06:00:00',
 'Pretoria CBD',
 'A marathon through Pretoria.'),

(2, 'Gauteng Heritage Run', '2026-11-07 07:30:00',
 'Johannesburg',
 'Heritage themed road race.');
GO


-- =========================================
-- SAMPLE CATEGORIES
-- =========================================

INSERT INTO Categories
(EventId, CategoryName, DistanceKm, EntryFee, MaxParticipants)
VALUES
(1, '5 km Fun Run', 5.00, 100.00, 500),
(1, '10 km Race', 10.00, 150.00, 500),

(2, '10 km Race', 10.00, 180.00, 800),
(2, '21.1 km Half Marathon', 21.10, 250.00, 600),
(2, '42.2 km Marathon', 42.20, 350.00, 400),

(3, '5 km Fun Run', 5.00, 120.00, 400),
(3, '10 km Race', 10.00, 170.00, 500);
GO


-- =========================================
-- SAMPLE ENROLMENTS
-- =========================================

INSERT INTO Enrolments
(ParticipantId, CategoryId, Status, BibNumber)
VALUES
(1, 1, 'Registered', 'PSR001'),
(2, 2, 'Registered', 'PSR002'),
(1, 4, 'Registered', 'JCM001'),
(2, 7, 'Registered', 'GHR001');
GO


-- =========================================
-- SAMPLE RESULTS
-- =========================================

INSERT INTO Results
(EnrolmentId, FinishTimeSeconds, Position, Completed)
VALUES
(1, 1650, 5, 1),
(2, 3100, 12, 1);
GO


-- =========================================
-- TEST THE DATABASE
-- =========================================

SELECT * FROM Users;
SELECT * FROM Organisers;
SELECT * FROM Participants;
SELECT * FROM Events;
SELECT * FROM Categories;
SELECT * FROM Enrolments;
SELECT * FROM Results;
GO
