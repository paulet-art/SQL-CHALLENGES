SELECT submission_date, COUNT(DISTINCT hacker_id) as total_hackers,
       hacker_id, name, MAX(submissions) as max_submissions
FROM (
    SELECT s.hacker_id, h.name, s.submission_date, COUNT(*) as submissions
    FROM Submissions s
    JOIN Hackers h ON s.hacker_id = h.hacker_id
    WHERE submission_date BETWEEN '2016-03-01' AND '2016-03-15'
    GROUP BY s.hacker_id, h.name, s.submission_date
) 
GROUP BY submission_date
ORDER BY submission_date ASC;
