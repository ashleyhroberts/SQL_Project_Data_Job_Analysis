SELECT 
    job_title,
    job_title_short,
    salary_year_avg
FROM 
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    (job_title LIKE '%Entry%' OR job_title LIKE '%Junior%')
ORDER BY
    salary_year_avg DESC