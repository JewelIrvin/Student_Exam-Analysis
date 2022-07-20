SELECT * FROM portfolio_project.`studentperformances (excel)last - studentsperformance (2)`;


-- Changing the table name from 'port`studentperformances (excel)last - studentsperformance (2)`folio_project.`studentperformances (excel)' to 'Studentsperformance' 

ALTER TABLE portfolio_project.`studentperformances (excel)last - studentsperformance (2)`
RENAME TO studentsperformance;
SELECT * FROM studentsperformance; 

-- Looking for the amount/percentage of students in each gender. 


SELECT COUNT(gender) as female, COUNT(gender)/1000 as FemalePercentage
FROM studentsperformance
WHERE gender = 'female';

-- Female = 518,52%; Male = 482,48%

-- Gender Vs Testing Scores
SELECT gender, AVG(writing_score), AVG(math_score), AVG(reading_score), AVG(overall_test_score)
FROM studentsperformance
GROUP BY gender;
-- Female Average WS = 73%, Math Average WS = 63%
-- Female Average MS = 64%, Male Average MS = 69%
-- Female Average RS = 73%, Male Average RS = 65%
-- Female Average OTS = 70% ; Male Average OTS = 66% 

-- Looking for the amount/percentage of students in race/ethnic group
SELECT COUNT(race_ethnicity) as group_a, COUNT(race_ethnicity)/1000 as groupApercentage
FROM studentsperformance
WHERE race_ethnicity = 'group_A'; 
-- 8.9%, 89

SELECT COUNT(race_ethnicity) as group_B, COUNT(race_ethnicity)/1000 as groupBpercentage
FROM studentsperformance
WHERE race_ethnicity = 'group_b';
-- 19%, 190

SELECT COUNT(race_ethnicity) as group_C, COUNT(race_ethnicity)/1000 as groupCpercentage
FROM studentsperformance
WHERE race_ethnicity = 'group_c';
-- 32%, 318

SELECT COUNT(race_ethnicity) as group_D, COUNT(race_ethnicity)/1000 as groupDpercentage
FROM studentsperformance
WHERE race_ethnicity = 'group_D';
-- 26%, 262

-- Group A = 8.9%, Group B = 19%, Group C = 32% Group D = 26%
-- Not able to gather an analysis for Race vs Scores because Group C is about 30%  data parcipants, which adds to bias error
-- A students Race/Ethnic group has nothing to do with a students performance levels

-- Looking for the amount/percentage of students that recieved free/reduced or standard lunch
SELECT COUNT(lunch) as free_reduced, COUNT(lunch)/1000 as FreelunchPercentage
FROM studentsperformance
WHERE lunch = 'free_reduced';
-- Students with Free/Reduced Lunch  = 355, 36%; Students with Standard Lunch  = 645, 65%

-- Lunch VS Test Scores 
SELECT lunch, AVG(math_score),AVG(reading_score), AVG(writing_score), AVG(overall_test_score)
FROM studentsperformance GROUP BY lunch;
-- Students with Free/Reduced Lunch Average MS = 65%; Students with Standard Lunch Average MS= 72%
-- Students with Free/Reduced Lunch Average RS = 65%; Students with Standard Lunch Average RS= 72%
-- Students with Free/Reduced Lunch Average WS = 63%; Students with Standard Lunch Average WS= 71%
-- Students with Free/Reduced Lunch Average OTS= 62%; Students with Standard Lunch Average OTS= 71%
-- Students with Standard Lunch have higher test scores

-- Looking for amount/percetnge of students that took a the test preperation course.
SELECT COUNT(test_preparation_course) as coursetakers, COUNT(test_preparation_course)/1000 as CoursetakersPercentage
FROM studentsperformance
WHERE test_preparation_course = 'completed';

-- Students that took Test Preparation Course = 358,36%; Students that didn't take the Test Preparation Course = 642, 64.2%

-- Test Preparation Course vs Scores
SELECT test_preparation_course, AVG(math_score), AVG(reading_score), AVG(reading_score),AVG(overall_test_score)
FROM studentsperformance GROUP BY test_preparation_course;

-- Students that took Test Preparation Course Average MS= 70%; Students that didn't take the Test Preparation Course Average MS= 64%
-- Students that took Test Preparation Course Average RS= 74%; Students that didn't take the Test Preparation Course Average RS= 67%
-- Students that took Test Preparation Course Average WS= 74%; Students that didn't take the Test Preparation Course Average WS= 65%
-- Students that took Test Preparation Course Average OTS= 73%; Students that didn't take the Test Preparation Course Average OTS= 65%
-- Students that took the Test Preparation Course scored higher in every section.

-- Pulling data of students with free/reduced lunch that also took the course.
SELECT test_preparation_course, lunch
FROM studentsperformance
WHERE test_preparation_course = 'completed' AND lunch = 'free_reduced';

SELECT COUNT(test_preparation_course), COUNT(lunch)
FROM studentsperformance
WHERE test_preparation_course = 'completed' AND lunch = 'free_reduced';
-- Students that have free reduced lunch /took the course = 131; Students that took the course = 358;
-- Students with free/reduced lunch had an equal oppurinity to the test preparation course as their peers.

-- Parental Level of Education VS. Testing Scores 
-- Pulling data of students and their parental education;

SELECT parental_level_of_education, AVG(math_score), AVG(reading_score), AVG(writing_score),AVG(overall_test_score)
FROM studentsperformance GROUP BY parental_level_of_education;

-- Parent's with Some Highschool Education Average MS = 64%; Parent's with Some Highschool Education Average RS = 67%;Parent's with Some Highschool Education Average WS = 65%; Parent's with Some Highschool Education Average OTS = 65%;
-- Parent's with Highschool Education Average MS = 62%; Parent's with Highschool Education Average RS = 65%;Parent's with Highschool Education Average WS = 63%; Parent's with Highschool Education Average OTS =  63%;
-- Parent's with Some College Education Average MS = 67%; Parent's with Some College Education Average RS = 70%;Parent's with Some College Education Average WS = 69%; Parent's with Some College Education Average OTS = 69%;
-- Parent's with Associate's Degree Average MS = 68%; Parent's with Associate's Degree Average RS = 71%;Parent's with Associate's Degree Average WS = 70%; Parent's with Associate's Degree Average OTS = 70%;
-- Parent's with Bachelor's Degree Average MS = 69%; Parent's with Bachelor's Degree Average RS = 73%;Parent's with Bachelor's Degree Average WS = 73%; Parent's with Bachelor's Degree Average OTS = 72%;
-- Parent's with Master's Degree Average MS = 70%; Parent's with Master's Degree Average RS = 75%;Parent's with Master's Degree Average WS = 76%; Parent's with Master's Degree Average OTS = 74%;

-- Parent's education doesn't effect students testing scores


