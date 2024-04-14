# Grade Management System

This repository contains SQL scripts for creating and managing a database system for a grade management system.

## Table of Contents
- [Database Schema](#database-schema)
- [Inserting Data](#inserting-data)
- [Queries](#queries)
  - [Computing Statistics](#computing-statistics)
  - [Listing Students](#listing-students)
  - [Adding Assignments](#adding-assignments)
  - [Updating Categories](#updating-categories)
  - [Adjusting Grades](#adjusting-grades)
- [Readme](#readme)

## Database Schema

The database schema consists of the following tables:
- `Student`: Stores student information.
- `Course`: Stores course information.
- `Category`: Stores assignment categories and their weights.
- `Assignment`: Stores assignment details.
- `Grade`: Stores student grades for assignments.

## Inserting Data

Data is inserted into the tables using SQL `INSERT INTO` statements. Students, courses, categories, assignments, and grades are added to the respective tables.

## Queries

Several SQL queries are provided to perform various operations on the database:

### Computing Statistics

- Average, maximum, and minimum grades for a specific assignment.
- Computing the total grade for a student.
- Computing the adjusted grade for a student while dropping the lowest scoring category.

### Listing Students

- Listing all students in a specific course.
- Listing all students and their scores for every assignment.

### Adding Assignments

- Adding a new assignment to a course.

### Updating Categories

- Updating the weightage of categories for a course.

### Adjusting Grades

- Adding points to each student on a specific assignment.
- Adding points to students whose last name contains a specific letter.

## Readme

This file serves as the readme for the repository, providing an overview of the database schema, data insertion methods, available queries, and their functionalities.

