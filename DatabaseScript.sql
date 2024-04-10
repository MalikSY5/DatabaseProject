#Create Tables
CREATE TABLE Student (
    StudentID INT PRIMARY KEY AUTO_INCREMENT, 
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

CREATE TABLE Course (
	CourseID INT PRIMARY KEY AUTO_INCREMENT, 
    Department VARCHAR(50),
    CourseNumber INT,
    CourseName VARCHAR(100),
    Semester VARCHAR(20),
    Year INT
);

CREATE TABLE Category (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    CourseID INT,
    CategoryName VARCHAR(50),
    Weight DECIMAL(5,2)
);

CREATE TABLE Assignment (
    AssignmentID INT PRIMARY KEY AUTO_INCREMENT,
    CourseID INT,
    AssignmentName VARCHAR(100),
    CategoryID INT,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

CREATE TABLE Grade (
	GradeID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    AssignmentID INT,
    Grade DECIMAL(5,2),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (AssignmentID) REFERENCES Assignment(AssignmentID)
);
#Insert Values into tables
#Adding Students
INSERT INTO Student(FirstName, LastName) VALUES ('Malik','Stewart'); #StudentID 1
INSERT INTO Student(FirstName, LastName) VALUES ('Rickelle','Jones'); #StudentID 2
INSERT INTO Student(FirstName, LastName) VALUES ('Jordan','Thomas'); #StudentID 3
INSERT INTO Student(FirstName, LastName) VALUES ('Luhan','Raquaza'); #StudentID 4
#Adding Courses
INSERT INTO Course(Department, CourseNumber, CourseName, Semester, Year) VALUES ('Computer Science', 101, 'Database Management', 'Spring', 2024 );
INSERT INTO Course(Department, CourseNumber, CourseName, Semester, Year) VALUES ('Computer Science', 102, 'Fundamentals of Algorithms', 'Fall', 2024 );
#Adding Categories
INSERT INTO Category (CourseID, CategoryName, Weight) VALUES (1, 'Participation', 10.0);
INSERT INTO Category (CourseID, CategoryName, Weight) VALUES (1, 'Homework', 20.0);
INSERT INTO Category (CourseID, CategoryName, Weight) VALUES (1, 'Tests', 50.0);
INSERT INTO Category (CourseID, CategoryName, Weight) VALUES (1, 'Project', 20.0);
#Adding Assignments
INSERT INTO Assignment(CourseID, AssignmentName, CategoryID) VALUES (1, 'Participation', 1); #assignmentID 1
INSERT INTO Assignment(CourseID, AssignmentName, CategoryID) VALUES (1,'Homework 1', 2); #assignmentID 2
INSERT INTO Assignment(CourseID, AssignmentName, CategoryID) VALUES (1, 'Midterm', 3); #assignmentID 3
INSERT INTO Assignment(CourseID, AssignmentName, CategoryID) VALUES (1,'GradeBook Project', 4); #assignmentID 4
#Adding Grades
#Student 1 AKA Malik
INSERT INTO Grade(StudentID, AssignmentID, Grade) Values (1, 1, 100);
INSERT INTO Grade(StudentID, AssignmentID, Grade) Values (1, 2, 80);
INSERT INTO Grade(StudentID, AssignmentID, Grade) Values (1, 3, 75);
INSERT INTO Grade(StudentID, AssignmentID, Grade) Values (1, 4, 100);
#Student 2 AKA Rickelle
INSERT INTO Grade(StudentID, AssignmentID, Grade) Values (2, 1, 80);
INSERT INTO Grade(StudentID, AssignmentID, Grade) Values (2, 2, 90);
INSERT INTO Grade(StudentID, AssignmentID, Grade) Values (2, 3, 75);
INSERT INTO Grade(StudentID, AssignmentID, Grade) Values (2, 4, 78);
#Student 3 AKA Jordan
INSERT INTO Grade(StudentID, AssignmentID, Grade) Values (3, 1, 100);
INSERT INTO Grade(StudentID, AssignmentID, Grade) Values (3, 2, 67);
INSERT INTO Grade(StudentID, AssignmentID, Grade) Values (3, 3, 88);
INSERT INTO Grade(StudentID, AssignmentID, Grade) Values (3, 4, 92);
#Student 4 AKA Luhan
INSERT INTO Grade(StudentID, AssignmentID, Grade) Values (4, 1, 60);
INSERT INTO Grade(StudentID, AssignmentID, Grade) Values (4, 2, 40);
INSERT INTO Grade(StudentID, AssignmentID, Grade) Values (4, 3, 72);
INSERT INTO Grade(StudentID, AssignmentID, Grade) Values (4, 4, 110);
#Show Content
SELECT * FROM Student;
SELECT * FROM Category;
SELECT * FROM Course;
SELECT * FROM Assignment;
SELECT * FROM Grade;
#Compute Average, Max and Min of an Assignment
SELECT AVG(grade) FROM grade WHERE AssignmentID = 1;
Select Max(grade) FROM grade WHERE AssignmentID = 1;
Select MIN(grade) FROM grade WHERE AssignmentID = 1;
#List all students in a course
SELECT DISTINCT s.FirstName, s.LastName FROM Student s JOIN Grade g ON s.StudentID = g.StudentID JOIN Assignment a ON g.AssignmentID = a.AssignmentID JOIN Category c ON a.CategoryId = c.CategoryID JOIN Course crs ON c.CourseID = crs.CourseID WHERE crs.CourseID = 1;
#List all students and all scores of every assignment	
SELECT s.FirstName, s.LastName, a.AssignmentName, g.Grade FROM Student s JOIN Grade g ON s.StudentID = g.StudentID JOIN Assignment a ON g.AssignmentID = a.AssignmentID;
#Add assignment to course
INSERT INTO Assignment(CourseID, AssignmentName, CategoryID) VALUES (1, 'Final Exam', 3); #assignmentID 1
#Change Percentages of categories for course
UPDATE Category SET Weight = 30 WHERE CategoryID = 1;
#Add 2 points to each student on assignment
UPDATE Grade SET Grade = Grade + 2 WHERE AssignmentID = 1;
#Add 2 points to students whose last name contain a Q
UPDATE Grade SET Grade = Grade + 2 WHERE AssignmentID = 1 AND StudentID IN (SELECT StudentID FROM Student Where LastName LIKE '%Q%');
#Compute Grade for student
SELECT SUM(g.Grade * c.Weight / 100) AS TotalGrade 
FROM Grade g 
JOIN Assignment a ON g.AssignmentID = a.AssignmentID 
JOIN Category c ON a.CategoryID = c.CategoryID 
WHERE g.StudentID = 1;
#Compute Grade while dropping lowest score category
SELECT s.StudentID, 
       SUM(BestScore.score * c.Weight / 100) AS AdjustedGrade 
FROM (
    SELECT g.StudentID, g.AssignmentID, MAX(g.Grade) as score 
    FROM Grade g
    JOIN Assignment a ON g.AssignmentID = a.AssignmentID 
    WHERE g.StudentID = 1
    GROUP BY g.StudentID, g.AssignmentID
) as BestScore
JOIN Assignment a ON BestScore.AssignmentID = a.AssignmentID
JOIN Category c ON a.CategoryID = c.CategoryID
JOIN Student s ON BestScore.StudentID = s.StudentID
GROUP BY s.StudentID;


    
