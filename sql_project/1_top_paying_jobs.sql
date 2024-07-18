/* **Question: What are the top-paying data analyst jobs?**
- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
- Focuses on job postings with specified salaries.
- Why? Aims to highlight the top-paying opportunities for Data Analysts, 
- offering insights into employment options and location flexibility.
*/

--Top 10 highest paying data analyst roles that are remote
SELECT 
    job_id,
	job_title,
	job_location,
	job_schedule_type,
	salary_year_avg,
	job_posted_date,
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
LIMIT 10;

/* Salary Range: Salaries for these data analyst roles range significantly from $184,000 to $650,000, indicating varied compensation based on experience, role, and company.
Employers: High-profile employers like Mantys, Meta, AT&T, Pinterest, Uclahealthcareers, and SmartAsset are offering these lucrative positions, highlighting the demand for data analysts across diverse industries.
Job Titles: The roles include a variety of titles such as Data Analyst, Director of Analytics, Associate Director- Data Insights, Data Analyst, Marketing, Principal Data Analyst, and ERM Data Analyst, showcasing a range of positions from entry-level to senior leadership in data analysis.
*/

