USE uspto_couse ;

SELECT * FROM patent_1pct limit 20;

select count(*) from patent_1pct;

select count(distinct id) from patent_1pct;

select count(distinct country) from patent_1pct;

select country, count(*) as obs from patent_1pct group by country;

select num_claims, count(*) as obs from patent_1pct group by num_claims;
select num_claims, count(*) as obs from patent_1pct group by num_claims order by obs desc;

select type, count(*) as obs from patent_1pct group by type;

select kind, count(*) as obs from patent_1pct group by kind order by obs desc;

select count(*) from assigne_1pct;
select count(distinct id) from assigne_1pct;

select type, count(*) as obs from assigne_1pct group by type;
select type, count(*) as obs from assigne_1pct group by type order by obs desc;

select * from patent_1pct as p 
join patent_assigne_1pct as pa on p.id = pa.patent_id
	limit 10;
    
select * from patent_1pct as p 
join patent_assigne_1pct as pa on p.id = pa.patent_id
	join assigne_1pct as a on pa.assignee_id = a.id
	limit 10;
    
    
CREATE TABLE tmp_patent_assignees
SELECT p.id AS patent_id, a.id AS assignee_id, p.date, a.type AS assignee_type, a.name_first, a.name_last, a.organization
FROM patent_1pct AS p
JOIN patent_assigne_1pct AS pa ON p.id = pa.patent_id
JOIN assigne_1pct AS a ON pa.assignee_id = a.id; 

alter table tmp_patent_assignees add index (organisation);
alter table tmp_patent_assignees add index ( assignee_type);

select assignee_type, organisation, name_first, name_last, count(*) as nb_patents from tmp_patent_assignees
group by assignee_type, organisation, name_first, name_last
order by nb_patents desc
limit 20;
    
SELECT * FROM cpc_current_1pct LIMIT 10;    

select section_id, count(*) as obs from cpc_current_1pct group by section_id order by obs desc;

select patent_id, count(section_id) as obs from cpc_current_1pct group by patent_id order by patent_id desc;
select patent_id,count(distinct section_id) as obs from cpc_current_1pct group by patent_id order by patent_id desc;
select patent_id,count(distinct section_id) as obs from cpc_current_1pct group by patent_id order by obs desc;

select patent_id, section_id,subsection_id,subgroup_id, count(*) as obs from cpc_current_1pct group by patent_id, subgroup_id order by patent_id desc;
select patent_id, section_id,subsection_id, count(*) as obs from cpc_current_1pct group by patent_id, section_id order by patent_id desc;
