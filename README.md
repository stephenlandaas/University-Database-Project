# University Database Project
This is a project created by myself and 2 close friends of mine. Within this project, we created an artificial database that primarily features professor records and student records, amongst other entities, which will be discussed below.

The database keeps information about each professor in our system, with a multitude of attributes regarding each professor. Moreover, the database also keeps track of various departments, courses, course sections, student records, and enrollment records. All of these records are also given a wide variety of detailed attributes regarding each one.

We designed our website to be able to run four queries in particular, which are as follows:

  For the professors:
    a.  Given the social security number of a professor, list the titles, classrooms,
        meeting days and time of his/her classes.
    b. Given a course number and a section number, count how many students
       get each distinct grade, i.e. ‘A’, ‘A-’, ‘B+’, ‘B’, ‘B-’, etc.
       
   For the students:
     a. Given a course number list the sections of the course, including the classrooms, the meeting days and time, and the number of students enrolled in
      each section.
     b. Given the campus wide ID of a student, list all courses the student took
        and the grades.
        
To implement this functionality, my group and I first started by designing an ERD (Entity-Relationship Diagram), and then creating a Relational Model from our ERD. These designs allowed us to successfully structure our database, get an idea of all of the entities, and map out the relations and attributes of each respective entity.

Once our schema was diagrammed, we created the necessary tables using MySQL, and populated our database with fictional indivdiuals and departments. Next, we wrote the queries that would later be implemented in PHP.

Following the completion of our schema and database functionality, I solely worked on the front-end development of the website, utilziing HTML5 and CSS3 to engender an interactive user experience. Once this was complete, I utilized PHP to link our site forms to our database, and display the proper outputs from the user's query. 

Please note that all data inserted into this database is entirely fictional, and none of these records are representative of any real-life persons or organizations.
