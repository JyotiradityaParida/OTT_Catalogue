DROP DATABASE IF EXISTS myottdb;
CREATE DATABASE myottdb;
USE myottdb;

CREATE TABLE CONTENT (
    Title        VARCHAR(15) NOT NULL,
    ReleaseYear  INT NOT NULL,
    Lang         VARCHAR(15) NOT NULL,
    ContentID    INT NOT NULL,
    AgeRating    VARCHAR(5) NOT NULL,
    PRIMARY KEY  (ContentID)
);

CREATE TABLE STREAMING_PLATFORM (
    Name             VARCHAR(20) NOT NULL,
    Region           VARCHAR(20) NOT NULL,
    PlatformID       INT NOT NULL,
    PRIMARY KEY (PlatformID)
);

CREATE TABLE GENRE (
    GenreID    INT NOT NULL,
    GenreName  VARCHAR(20) NOT NULL,
    PRIMARY KEY (GenreID)
);

CREATE TABLE CAST_MEMBER (
    PersonID    INT NOT NULL,
    PName  VARCHAR(20) NOT NULL,
    Nationality  VARCHAR(20) NOT NULL,
    PRIMARY KEY (PersonID)
);

CREATE TABLE SUBSCRIPTION_PLAN (
    PlanID    INT NOT NULL,
    PlatformID   INT NOT NULL,
    PlanName  VARCHAR(20) NOT NULL,
    Price     INT NOT NULL,
    MaxStreams INT NOT NULL,
    Resolution  VARCHAR(20) NOT NULL,
    PRIMARY KEY (PlanID)
);

CREATE TABLE CONTENT_GENRE (
    ContentID  INT NOT NULL,
    GenreID    INT NOT NULL,
    PRIMARY KEY (ContentID,GenreID)
);

CREATE TABLE CONTENT_CAST (
    ContentID  INT NOT NULL,
    PersonID    INT NOT NULL,
    PRIMARY KEY (ContentID,PersonID)
);

CREATE TABLE AVAILABILITY (
    ContentID  INT NOT NULL,
    PlatformID    INT NOT NULL,
    PRIMARY KEY (ContentID,PlatformID)
);

CREATE TABLE CONTENT_STATISTICS (
    StatisticsID    INT NOT NULL,
    ContentID       INT NOT NULL,
    ViewCount       INT NOT NULL,
    Rating          INT NOT NULL,
    NumberOfReviews INT NOT NULL,
    PRIMARY KEY (StatisticsID),
    UNIQUE (ContentID)
);

CREATE TABLE MOVIE (
    ContentID       INT NOT NULL,
    Duration        INT NOT NULL,
    Budget          INT NOT NULL,
    PRIMARY KEY (ContentID)
);

CREATE TABLE SERIES (
    ContentID       INT NOT NULL,
    TotalSeasons    INT NOT NULL,
    Stat            VARCHAR(20) NOT NULL,
    PRIMARY KEY (ContentID)
);

CREATE TABLE TRAILER (
    TrailerID       INT NOT NULL,
    ContentID       INT NOT NULL,
    Duration        INT NOT NULL,
    ReleaseDate     DATE,
    PRIMARY KEY (TrailerID),
    UNIQUE (ContentID)
);

CREATE TABLE SEASON (
    SeasonID       INT NOT NULL,
    ContentID       INT NOT NULL,
    SeasonNumber    INT NOT NULL,
    ReleaseYear     CHAR(4),
    PRIMARY KEY (SeasonID)
);

CREATE TABLE EPISODE (
    EpisodeID        INT NOT NULL,
    SeasonID         INT NOT NULL,
    EpisodeNumber    INT NOT NULL,
    Title            VARCHAR(20) NOT NULL,
    Duration         INT NOT NULL,
    PRIMARY KEY (EpisodeID)
);