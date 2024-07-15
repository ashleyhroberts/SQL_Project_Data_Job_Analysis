-- Query to look at Data Analyst job title details
SELECT 
    job_title,
    job_title_short,
    COUNT (job_id)
FROM
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst'
GROUP BY
    job_title,
    job_title_short;


-- Query to find entry-level Data Analyst job salaries
SELECT 
    job_title,
    job_title_short,
    salary_year_avg
FROM 
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_location = 'Anywhere' AND
    (job_title LIKE '%Entry%' OR job_title LIKE '%Junior%')
ORDER BY
    salary_year_avg DESC

--Query to find out that the $650K job has no skill associated
SELECT
    job_postings_fact.job_id,
	job_title,
	job_location,
	job_schedule_type,
	salary_year_avg,
	job_posted_date,
    name AS company_name,
    skills_dim.skill_id
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
 WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg = '650000'