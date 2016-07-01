--What query would you run to get the total revenue for March of 2012?
SELECT SUM(amount) as 'Total Revenue'
FROM billing
WHERE charged_datetime BETWEEN '2012-03-01' and '2012-04-01'

--What query would you run to get total revenue collected from the client with an id of 2?
SELECT SUM(amount) as 'Total Revenue'
FROM billing
WHERE client_id = 2

--What query would you run to get all the sites that client=10 owns?
SELECT domain_name, client_id
FROM sites
WHERE client_id = 10

--What query would you run to get total # of sites created each month for the client with an id of 1? What about for client=20?
SELECT count(domain_name) as '# of Sites', MONTHNAME(created_datetime) as 'Month', YEAR(created_datetime) as 'Year'
FROM sites
WHERE client_id = 1
GROUP BY YEAR(created_datetime), MONTHNAME(created_datetime)

--What query would you run to get the total # of leads we've generated for each of our sites between January 1, 2011 to February 15, 2011?
SELECT S.domain_name as Site, Count(L.leads_id) as Leads
FROM sites S
LEFT JOIN leads L ON S.site_id = L.site_id
WHERE L.registered_datetime BETWEEN '2011-01-01' AND '2011-02-16'
GROUP BY Site

--What query would you run to get a list of client names and the total # of leads we've generated for each of our clients between January 1, 2011 to December 31, 2011?
SELECT CONCAT(clients.first_name, ' ', clients.last_name) as client_name, count(leads.leads_id) as 'Total Leads'
FROM leads
LEFT JOIN sites ON leads.site_id = sites.site_id
LEFT JOIN clients ON sites.client_id = clients.client_id
WHERE leads.registered_datetime BETWEEN '2011-01-01' AND '2012-01-01'
GROUP BY client_name
ORDER BY clients.client_id

--What query would you run to get a list of client name and the total # of leads we've generated for each client each month between month 1 - 6 of Year 2011?
SELECT CONCAT(clients.first_name, ' ', clients.last_name) as client_name, 
count(leads.leads_id) as 'Total Leads', MONTHNAME(leads.registered_datetime) as _month
FROM leads
LEFT JOIN sites ON leads.site_id = sites.site_id
LEFT JOIN clients ON sites.client_id = clients.client_id
WHERE leads.registered_datetime BETWEEN '2011-01-01' AND '2011-07-01'
GROUP BY client_name, _month
ORDER BY leads.registered_datetime

--What query would you run to get a list of client name and the total # of leads we've generated for each of our client's sites between January 1, 2011 to December 31, 2011? Come up with a second query that shows all the clients, the site name(s), and the total number of leads generated from each site for all time.
SELECT CONCAT(clients.first_name, ' ', clients.last_name) as client_name, sites.domain_name,
count(leads.leads_id) as 'Total Leads'
FROM leads
LEFT JOIN sites ON leads.site_id = sites.site_id
LEFT JOIN clients ON sites.client_id = clients.client_id
WHERE leads.registered_datetime BETWEEN '2011-01-01' AND '2012-01-01'
GROUP BY client_name, sites.domain_name
ORDER BY clients.client_id

SELECT CONCAT(clients.first_name, ' ', clients.last_name) as client_name, sites.domain_name,
count(leads.leads_id) as total_leads
FROM leads
LEFT JOIN sites ON leads.site_id = sites.site_id
LEFT JOIN clients ON sites.client_id = clients.client_id
WHERE leads.registered_datetime is not NULL
GROUP BY client_name, sites.domain_name
ORDER BY clients.client_id asc, total_leads desc

--Write a single query that retrieves total revenue collected from each client each month of the year.
SELECT CONCAT(clients.first_name, ' ', clients.last_name) as client_name, SUM(billing.amount) as Revenue,
MONTHNAME(billing.charged_datetime) as billing_month, YEAR(billing.charged_datetime) as billing_year
FROM clients
LEFT JOIN billing ON clients.client_id = billing.client_id
GROUP BY client_name, billing_month, billing_year
ORDER BY clients.client_id, billing.charged_datetime

--Write a single query that retrieves all the sites that each client owns. Group the results so that each row shows a new client. Add a new field called 'sites' that has all the sites that the client owns. (HINT: use GROUP_CONCAT)
SELECT CONCAT(clients.first_name, ' ', clients.last_name) as client_name, GROUP_CONCAT(sites.domain_name)
FROM clients
LEFT JOIN sites ON clients.client_id = sites.client_id
GROUP BY client_name
ORDER BY clients.client_id