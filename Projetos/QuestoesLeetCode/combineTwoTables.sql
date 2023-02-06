Question: https://leetcode.com/problems/combine-two-tables/description/

Answers:
SELECT P.firstName, P.lastName, A.city, A.state
 FROM Person P LEFT JOIN Address A
  on P.PersonId = A.PersonId
  order by firstName

SELECT P.firstName, P.lastName, A.city, A.state
 FROM Person P , Address A
  where P.personId = A.personId (+)
  order by firstName

SELECT P.firstName, P.lastName, A.city, A.state
 FROM Person P , Address A
  where A.personId (+)= P.personId 
  order by firstName
