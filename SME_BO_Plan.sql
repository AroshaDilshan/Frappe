
create table `sme_org` (
	`id` int(11) not null auto_increment,
	`affiliation` varchar(255) default null,
	`director` varchar(255) default null,
	`g-dept_no` int(11) not null,
	`g-dept` varchar(255) default null,
	`dept_no` int(11) not null,
	`dept` varchar(255) default null,
	`sec_branch_no` int(11) not null,
	`sec_branch` varchar(255) default null,
	`unit_no` int(11) not null,
	`unit` varchar(255) default null,
	`m-unit_no` int(11) not null,
	`mini_unit` varchar(255) default null,
	`sales_pair` varchar(255) default null,
	`sales_cc` varchar(255) default null,
	`staff_no` varchar(255) default null,
	`staff_name` varchar(255) default null,
	`gender` varchar(255) default null,
	`former_job` varchar(255) default null,
	`hire_date` date not null,
	`title` varchar(255) default null,
	`h_b` varchar(255) default null,
	`rank` int(11) not null,
	`retirement_date` date default null,
	primary key (`id`)
) engine=InnoDB auto_increment=1 default charset=utf8;


-- ------------------------------------ SME BO & Plan ---------------------------------------------
select * from tabSME_BO_and_Plan order by name desc;
select * from sme_bo_and_plan_id_seq ;

alter table tabSME_BO_and_Plan change name name bigint(20) auto_increment ; -- to make your form can add new record after you import data by cvs
alter table tabSME_BO_and_Plan auto_increment=11448;

update tabSME_BO_and_Plan set normal_bullet = normalbullet, disbursement_date_pay_date = disbursement_datepay_date  ;
alter table tabSME_BO_and_Plan drop column normalbullet;
alter table tabSME_BO_and_Plan drop column disbursement_datepay_date;

-- tabSME_BO_and_Plan -> test SME_BO_and_Plan https://docs.google.com/spreadsheets/d/1dqrXSSNq6ACAKzOuep62Qxl8ebKF9SUI3Z5v6e6f9sE/edit#gid=1867067672
select bp.modified `Timestamp`, concat('http://13.250.153.252:8000/app/sme_bo_and_plan/', name) `Edit`,
	sme.dept `DEPT`, sme.sec_branch `SECT`, sme.unit_no `Unit_no`, sme.unit `Unit`,
	bp.staff_no `Staff No`, bp.staff_name `Staff Name`, `point` , `type` , bp.usd_amount , bp.normal_bullet , bp.contract_no , bp.case_no , bp.customer_name , bp.customer_tel ,
	bp.ringi_status , bp.ringi_comment , bp.disbursement_date_pay_date , bp.contract_status , bp.contract_comment , bp.customer_card , bp.rank1 , bp.approch_list , bp.rank_update , 
	bp.visit_date , bp.visit_or_not ,
	case when contract_status = 'Cancelled' then 'Cancelled' else null end `Cancelled Result`, 
	case when rank_update in ('S','A','B','C') then 1 else 0 end `SABC`, 
	case when rank_update in ('C') then 1 else 0 end `C`, 
	sme.sales_cc `sales_cc`
from tabSME_BO_and_Plan bp left join sme_org sme on (bp.staff_no = sme.staff_no)
order by bp.name asc;


-- tabSME_BO_and_Plan -> test SME_BO_and_Plan https://docs.google.com/spreadsheets/d/1dqrXSSNq6ACAKzOuep62Qxl8ebKF9SUI3Z5v6e6f9sE/edit#gid=1867067672
select date_format(bp.modified, '%Y-%m-%d %H:%m:%s') `Timestamp`, sme.dept `DEPT`, sme.unit_no `Unit_no`, sme.unit `Unit`, sme.sales_cc `sales_cc`,
	bp.staff_no `Staff No`, bp.staff_name `Staff Name`, `point` , `type` , bp.usd_amount , bp.customer_name , 
	bp.ringi_status , bp.ringi_comment , bp.disbursement_date_pay_date , bp.contract_status , bp.contract_comment , bp.customer_card , bp.rank1 , bp.approch_list , bp.rank_update , 
	bp.visit_date , bp.visit_or_not ,
	case when contract_status = 'Cancelled' then 'Cancelled' else null end `Cancelled Result`, 
	case when rank_update in ('S','A','B','C') then 1 else 0 end `SABC`, 
	case when rank_update in ('C') then 1 else 0 end `C`
from tabSME_BO_and_Plan bp left join sme_org sme on (bp.staff_no = sme.staff_no)
order by bp.name asc;


