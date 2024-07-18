/* **Question: What are the most in-demand skills for data analysts?**
- Identify the top 10 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 10 skills with the highest demand in the job market, 
- providing insights into the most valuable skills for job seekers. */


SELECT 
    skills,
    COUNT(job_postings_fact.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 10;

-- Query filtered down to entry-level Data Analyst job skills
SELECT 
    skills,
    COUNT(job_postings_fact.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    (job_title LIKE '%Entry%' OR job_title LIKE '%Junior%'
    OR job_title LIKE '%Beginner%')
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 10

/* Summary:
Core Skills (SQL, Excel, Python) are essential across all levels but are in higher demand for experienced analysts.
Visualization and Statistical Tools are important for creating insights and performing analyses, with increased relevance as analysts gain experience.
General Office and Database Management Skills are necessary but secondary to specialized data analysis skills, becoming more critical at advanced levels of experience.
*/