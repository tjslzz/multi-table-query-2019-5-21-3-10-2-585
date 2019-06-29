# 1.查询同时存在1课程和2课程的情况
SELECT c1.*,c2.courseId,c2.score FROM student_course c1 LEFT JOIN student_course c2 ON (c1.studentId = c2.studentId) WHERE c1.courseId = 1 AND c2.courseId = 2;
# 2.查询同时存在1课程和2课程的情况
SELECT c1.*,c2.courseId,c2.score FROM student_course c1 LEFT JOIN student_course c2 ON (c1.studentId = c2.studentId) WHERE c1.courseId = 1 AND c2.courseId = 2;
# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
SELECT c.studentId,s.name FROM student_course c LEFT JOIN student s ON (c.studentId = s.id) GROUP BY c.studentId HAVING AVG(c.score) >= 60 ;
# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
SELECT * FROM student WHERE id NOT IN (SELECT studentId FROM student_course);
# 5.查询所有有成绩的SQL
SELECT * FROM student WHERE id IN (SELECT studentId FROM student_course);
# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
SELECT s.* FROM student s LEFT JOIN student_course c1 ON(s.id = c1.studentId AND c1.courseId = 1) LEFT JOIN student_course c2 ON(s.id = c2.studentId AND c2.courseId = 2)
# 7.检索1课程分数小于60，按分数降序排列的学生信息
SELECT s.* FROM student s WHERE s.id IN (SELECT c.studentId FROM student_course c WHERE c.score < 60 ORDER BY c.score DESC)
# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
SELECT * FROM student_course GROUP BY student_course.courseId ORDER BY AVG(student_course.score),student_course.courseId DESC;
# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
SELECT s.name,sc.score FROM student_course sc LEFT JOIN student s ON(sc.studentId = s.id) WHERE sc.score < 60 AND sc.courseId IN (SELECT c.id FROM course c WHERE c.name = '数学');