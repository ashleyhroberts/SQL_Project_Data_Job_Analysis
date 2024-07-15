/* **Question: What are the top-paying data analyst jobs, and what skills are required?** 
- Identify the top 10 highest-paying Data Analyst jobs and the specific skills required for these roles.
- Filters for roles with specified salaries that are remote
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
  helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
    SELECT 
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;


    /*
    The bar chart shows the top 15 most frequent skills mentioned in the top 10 Data Analyst roles from the 2023 job postings. Here are the key insights:

SQL and Python are the most frequently required skills, emphasizing their importance in data analysis.
R, Azure, and Databricks also appear frequently, highlighting their relevance in modern data analysis and cloud-based data management.
Power BI, Excel, AWS, Tableau, and Snowflake are crucial for data visualization and cloud-based data solutions.
Other notable skills include SAS, Spark, Hadoop, Linux, and Git, indicating a demand for big data technologies, operating systems knowledge, and version control expertise.
These insights suggest that a strong foundation in SQL and Python, coupled with proficiency in cloud platforms, data visualization tools, and big data technologies, is highly valuable for data analyst roles

Most Frequently Mentioned Skills:

SQL: Mentioned 8 times.
Python: Mentioned 7 times.
Tableau: Mentioned 6 times.
R: Mentioned 4 times.
Snowflake: Mentioned 3 times.
Pandas: Mentioned 3 times.
Excel: Mentioned 3 times.
Other Skills Mentioned:

Azure, Bitbucket, Go, Oracle, Power BI, Confluence, GitLab, Atlassian, Jira, AWS, Numpy: Each mentioned 2 times.
Jenkins, SAP, Crystal, Flow, Hadoop, PowerPoint, Jupyter, Pyspark, Databricks, Git: Each mentioned 1 time.
These results highlight that SQL, Python, and Tableau are the top skills in demand for Data Analyst positions, 
followed by other important tools and platforms.
*/

