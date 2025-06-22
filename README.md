📘 SQL Subquery Practice – UniversityDB

Sharpen your SQL subquery super‑powers with this hands‑on, self‑contained practice set built around a fictional university.  The project ships with an easy‑to‑load PostgreSQL script (Sub_query.sql) that creates all tables, inserts sample data, and parks 10 thought‑provoking challenges that can be solved purely with sub‑queries.

🏗️ Schema at a Glance

Table

Description

Key Columns

students

Basic student profile + GPA‑like grade

student_id (PK), department_id, grade

departments

University departments

department_id (PK)

courses

Courses offered by each department

course_id (PK), department_id

enrollments

Junction table linking students → courses

enrollment_id (PK), student_id, course_id, score

Tip:  The dataset is intentionally kept small (4 tables, 26 rows) so you can focus on query logic, not loading gigabytes of data.

🎯 Learning Objectives

Scalar, multi‑row, and correlated sub‑queries

IN / NOT IN, EXISTS / NOT EXISTS

Aggregates inside sub‑queries (AVG, MAX, SUM …)

Nested filtering with HAVING, GROUP BY, and window‑style logic

By the end you’ll be comfortable recognising when a sub‑query is the cleanest (or only) solution.

🔍 Challenge Set (10 Questions)

Above‑average students – names of students whose grade exceeds the overall average.

Top‑score enrolments – students enrolled in the course that recorded the single highest score.

Department buddies – students who share a department with Alice.

Courses of the valedictorian – course list for the student who holds the highest grade.

Course‑less scholars – students not enrolled in any course.

Calculus champion – top scorer(s) in Calculus.

Crowded departments – department names hosting more than one student.

Completionists – students who have taken every course offered by their own department.

Struggling department – department(s) with the lowest average student grade.

Above‑average totals – students whose combined score beats the population’s average total.

Each solution lives in the script and is documented with inline comments so you can compare approaches.

⚙️ Setup & Usage

Clone or download this repo.

Open Sub_query.sql in pgAdmin 4 (or any psql client).

Execute the script – it will create the schema, populate data, and print some exploratory SELECT * outputs.

Work through the Q1…Q10 blocks, tweaking or rewriting them until they click.

💡 Not on PostgreSQL?  The script uses ANSI‑standard features and should run on MySQL 8⁺ or SQLite 3 with minor tweaks (mainly casting syntax).

🛠️ Extending the Practice

Add new tables (e.g., professors, semesters).

Rewrite the challenges using JOINs instead of sub‑queries to compare styles.

Turn the static data into parameterised tests for automated assessment.

Feel free to open Pull Requests with additional challenges or optimisations!

👤 Author

Pushpkar Roy🔗 [LinkedIn](https://www.linkedin.com/in/pushpkar-roy?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app) • 🐙 [GitHub](https://github.com/PushpkarRoy)

📄 License

Released under the MIT License – see LICENSE for details.
