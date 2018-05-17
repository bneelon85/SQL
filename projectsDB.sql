SELECT project.name, tech.name FROM project
  INNER JOIN project_uses_tech on project_uses_tech.project_id = project.id
  INNER JOIN tech on project_uses_tech.tech_id = tech.id
    WHERE tech.id = 3;

SELECT project.name, tech.name FROM project
  INNER JOIN project_uses_tech on project_uses_tech.project_id = project.id
  INNER JOIN tech on project_uses_tech.tech_id = tech.id
    WHERE project.id = 4;

SELECT 
tech.id,
tech.name,
project_uses_tech.project_id
FROM 
tech
LEFT OUTER JOIN project_uses_tech 
  ON project_uses_tech.tech_id = tech.id
WHERE project_uses_tech.project_id IS NULL;

SELECT
project_uses_tech.project_ID,
COUNT(tech.id)
FROM 
tech
LEFT OUTER JOIN project_uses_tech 
  ON project_uses_tech.tech_id = tech.id
GROUP BY project_ID;

SELECT
project.id,
project.name,
project_uses_tech.tech_id
FROM 
project
LEFT OUTER JOIN project_uses_tech 
  ON project_uses_tech.project_id = project.id
WHERE project_uses_tech.tech_id IS NULL;

SELECT
project_uses_tech.tech_id,
COUNT(project.id)
FROM 
project
LEFT OUTER JOIN project_uses_tech 
  ON project_uses_tech.project_id = project.id
GROUP BY tech_id;

SELECT
project.id,
project.name,
tech.id AS tech_id,
tech.name AS tech_name
FROM
project
FULL JOIN project_uses_tech on project_uses_tech.project_id = project.id
  FULL JOIN tech on project_uses_tech.tech_id = tech.id
WHERE project.id IS NOT NULL;

SELECT
DISTINCT(project_uses_tech.tech_id),
tech.name
FROM
project_uses_tech
INNER JOIN tech
 ON project_uses_tech.tech_id = tech.id
ORDER BY project_uses_tech.tech_id
;

SELECT
DISTINCT(project_uses_tech.tech_id),
tech.name
FROM
tech
LEFT JOIN project_uses_tech
 ON project_uses_tech.tech_id = tech.id
WHERE project_uses_tech.tech_id IS NULL
;

SELECT
DISTINCT(project_uses_tech.project_id),
project.name
FROM
project
INNER JOIN project_uses_tech
 ON project_uses_tech.project_id = project.id
ORDER BY project_uses_tech.project_id
;

SELECT
DISTINCT(project_uses_tech.project_id),
project.name
FROM
project
FULL JOIN project_uses_tech
 ON project_uses_tech.project_id = project.id
WHERE project_uses_tech.project_id IS NULL
;

SELECT
project.id,
project.name,
COUNT(tech.id)
FROM
project
FULL JOIN project_uses_tech
 ON project_uses_tech.project_id = project.id
FULL JOIN tech
  ON project_uses_tech.tech_id = tech.id
WHERE project.id IS NOT NULL
GROUP BY project.id
ORDER BY COUNT(tech.id) DESC;