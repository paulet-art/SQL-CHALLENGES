
SELECT c.company_code, c.founder, 
    count(distinct lm.lead_manager_code), 
    count(distinct sm.senior_manager_code), 
    count(distinct m.manager_code),
    count(distinct e.employee_code) 
    FROM Company as c 
    left join Lead_Manager as lm on c.company_code = lm.company_code
    left join Senior_Manager as sm on lm.lead_manager_code =      sm.lead_manager_code
    left join Manager as m on sm.senior_manager_code = m.senior_manager_code
    left join Employee as e on m.manager_code = e.manager_code 
    group by c.company_code, c.founder 
    order by c.company_code;
