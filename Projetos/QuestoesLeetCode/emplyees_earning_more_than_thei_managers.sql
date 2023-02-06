Question:https://leetcode.com/problems/employees-earning-more-than-their-managers/

Answer:
SELECT e.name AS Employee
FROM Employee e
WHERE e.salary >
(SELECT m.salary
FROM Employee m 
WHERE e.managerID = m.id)