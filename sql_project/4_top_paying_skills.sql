/* **Question: What are the top skills based on salary?** 
- Look at the average salary associated with each skill for Data Analyst positions.
- Focuses on roles with specified salaries, regardless of location.
- Why? It reveals how different skills impact salary levels for Data Analysts and 
  helps identify the most financially rewarding skills to acquire or improve.*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 50;


-- Query filtered down to top paying skills for entry-level Data Analysts
SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    (job_title LIKE '%Entry%' OR job_title LIKE '%Junior%')
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 50;

/* Entry-level DA observations (only top 25):
Advanced Technical Skills Command Higher Salaries: Specialized skills like 
TensorFlow, Docker, and machine learning frameworks are highly valued, 
indicating strong demand and higher salaries for entry-level data analysts with these capabilities.
Web Development Knowledge is Lucrative: Skills in web development, such as CSS and HTML, 
are surprisingly well-compensated, suggesting that entry-level data analysts with web development 
expertise can find lucrative opportunities.
Diverse Skill Set is Beneficial: A broad range of skills, including programming languages, 
database management, DevOps tools, and productivity tools, is valued, highlighting the importance 
of a diverse skill set for securing higher-paying entry-level data analyst positions.
*/

/*  Summary for top 50 paying skills for experienced vs entry-level Data Analysts:
Specialized vs. Foundational Skills: Experienced data analysts command higher salaries for specialized and advanced technical skills, while entry-level positions emphasize foundational skills and general programming knowledge.
DevOps and Data Engineering: There is a significant demand for DevOps and advanced data engineering skills among experienced analysts, whereas entry-level roles focus more on basic data management and visualization.
Machine Learning: Advanced machine learning frameworks and tools are highly valued for experienced roles, while entry-level positions require a more basic understanding of these technologies.
Overall, the data highlights the progression from foundational skills at the entry level to more specialized, high-paying skills as data analysts gain experience and expertise.
*/