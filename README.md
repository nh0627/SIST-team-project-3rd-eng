# SIST Score Management System👩🏻‍🏫(2018)
The system is for web score management based on Spring MVC and MyBatis to process necessary information for overall educational operations of (fictionally named) SIST Education Center. In the system, a user can use features after login according to his/her authority. A student account has authority to retrieve his/her courses and grades. An instructor account has authority to manage course, exam and grade. A manager account has authority to handle overall features of the system.

## Specification
* Java1.8, JDBC, JSP2.3, Servlet3.1, EL3.0, JSTL1.2
* HTML5, CSS3, Javascript1.8.5, jQuery3.2.1, Bootstrap3.3.7
* Spring4.1, SpringMVC, SpringJDBC, MyBatis3.4,
* Oracle 11g XE

## Features
### Student
* View Personal Info - Retrieve his/her name, phone and initial registeration date
* View Score - Retrieve a list of courses that he/she is attending, and details of a course and its subjects, exam information, exam scores

### Instructor
* View Personal Info -  Retrieve his/her name, phone, initial registeration date and available subjects
* View Schedule - Retrieve an instructor’s personal class schedule, and his/her list of students by each course/subject
* Manage Test Info - Update attendance, score information and exam(with exam attachments) by each subject
* Manage Score - Grade a student’s score by each subject

### Manager
* Manage Basic Info - Update a course category, subject category, classroom and textbook
* Manage Instructor Account - Update an instructor’s personal information and his/her schedule
* Manage Available Course and Subject - Update available courses and subjects based on a list of course/subject category
* Manage Student - Retrieve and update a student’s information and course history. Drop or cancle his/her course
* View Score - Retrieve a list of scores by each course, subject and student

## Demo Videos
* Student - <https://youtu.be/GALUBkGqN5Y>
* Instructor - <https://youtu.be/tfNqw0qo15E>
* Manager - <https://youtu.be/qsTqO9MJmME>

## Template Author
[Colorlib](https://colorlib.com)

## Database Table
![data-schema](img/final-schema.png)
