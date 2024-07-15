/* **Question: What are the most optimal skills to learn (aka it’s in high demand 
and a high-paying skill) for a data analyst?** 
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
 offering strategic insights for career development in data analysis */

WITH skills_demand AS (
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skill_id
), avg_salary AS (
SELECT 
    skills_job_dim.skill_id,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills_job_dim.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count AS demand_count,
    avg_salary AS avg_salary
FROM
    skills_demand
INNER JOIN avg_salary ON skills_demand.skill_id = avg_salary.skill_id
WHERE
    demand_count > 10
ORDER BY
    demand_count DESC,
    avg_salary DESC

--rewriting this query more concisely and with an option
--to filter on entry-level data analyst skills & salaries
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg),0) AS avg_salary
FROM 
    job_postings_fact
INNER JOIN 
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings_fact.job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
    --AND
    --(job_postings_fact.job_title LIKE '%Entry%' OR job_postings_fact.job_title LIKE '%Junio%'
    --OR job_postings_fact.job_title LIKE '%Begin%')
GROUP BY    
    skills_dim.skill_id,
    skills_dim.skills
HAVING 
    COUNT(skills_job_dim.job_id) >10
ORDER BY 
    demand_count DESC,
    avg_salary DESC

/* Core Skills: Master SQL, Excel, and Python for a strong foundation in data manipulation and analysis.
Visualization Tools: Learn Tableau and Power BI to effectively present data insights.
Statistical and Big Data Analysis: Acquire skills in R, SAS, Spark, Hadoop, and TensorFlow for advanced data analysis and machine learning.
Cloud Computing and Collaboration: Gain proficiency in AWS, Azure, Git, Jira, and Confluence for cloud data management and effective teamwork.
*/