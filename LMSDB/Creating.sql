use LMS;

CREATE TABLE hired_candidates (
  id int NOT NULL,
  first_name varchar(100) NOT NULL,
  middle_name varchar(100) DEFAULT NULL,
  last_name varchar(100) NOT NULL,
  email varchar(50) NOT NULL,
  mobile_num bigint NOT NULL,
  hired_city varchar(50) NOT NULL,
  hired_date datetime NOT NULL,
  degree varchar(100) NOT NULL,
  aggr_per float DEFAULT NULL,
  current_pincode int DEFAULT NULL,
  permanent_pincode int DEFAULT NULL,
  hired_lab varchar(20) DEFAULT NULL,
  attitude_remark varchar(15) DEFAULT NULL,
  communication_remark varchar(15) DEFAULT NULL,
  knowledge_remark varchar(15) DEFAULT NULL,
  status varchar(20) NOT NULL,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  PRIMARY KEY (id)
);


-- fellowship engineers microservice
-- fellowship_engineers
CREATE TABLE fellowship_candidates (
  id int NOT NULL,
  first_name varchar(100) NOT NULL,
  middle_name varchar(100) DEFAULT NULL,
  last_name varchar(100) NOT NULL,
  email varchar(50) NOT NULL,
  mobile_num bigint NOT NULL,
  hired_city varchar(50) NOT NULL,
  hired_date datetime NOT NULL,
  degree varchar(50) NOT NULL,
  aggr_per float DEFAULT NULL,
  current_pincode int DEFAULT NULL,
  permanent_pincode int DEFAULT NULL,
  hired_lab varchar(20) DEFAULT NULL,
  attitude_remark varchar(15) DEFAULT NULL,
  communication_remark varchar(15) DEFAULT NULL,
  knowledge_remark varchar(15) DEFAULT NULL,
  birth_date date NOT NULL,
  is_birth_date_verified int DEFAULT 0,
  parent_name varchar(50) DEFAULT NULL,
  parent_occupation varchar(100) NOT NULL,
  parent_mobile_num bigint NOT NULL,
  parent_annual_sal float DEFAULT NULL,
  local_addr varchar(255) NOT NULL,
  permanent_addr varchar(150) DEFAULT NULL,
  photo_path varchar(500) DEFAULT NULL,
  joining_date date DEFAULT NULL,
  candidate_status varchar(20) NOT NULL,
  personal_info_filled int DEFAULT 0,
  bank_info_filled int DEFAULT 0,
  educational_info_filled int DEFAULT 0,
  doc_status varchar(20) DEFAULT NULL,
  remark varchar(150) DEFAULT NULL,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  PRIMARY KEY (id)
); 




CREATE TABLE candidates_personal_det_check (
  id int NOT NULL,
  candidate_id  int NOT NULL,
  field_name int NOT NULL,
  is_verified int DEFAULT NULL,
  lastupd_stamp datetime DEFAULT NULL,
  lastupd_user int DEFAULT NULL,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL
);

-------------------------


CREATE TABLE candidate_bank_det(
  id int NOT NULL,
  candidate_id int NOT NULL,
  name varchar(100) NOT NULL,
  account_num int NOT NULL,
  is_account_num_verified int DEFAULT 0,
  ifsc_code varchar(20) NOT NULL,
  is_ifsc_code_verified int DEFAULT 0,
  pan_number varchar(10) DEFAULT NULL,
  is_pan_number_verified int DEFAULT 0,
  addhaar_num int NOT NULL,
  is_addhaar_num_verified int DEFAULT 0,
  --
  CONSTRAINT FK_candidate_bank_det_candidate_id FOREIGN KEY (candidate_id)       REFERENCES fellowship_candidates (id),
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  PRIMARY KEY(id)
) ;

insert into candidate_bank_det values(1,1,'hdfc',123456,1,'BMCH123213',1,'AMI1221',1,72319,1,getdate(),3);
insert into candidate_bank_det values(2,2,'axis',123456,1,'AXCH123213',1,'AMX4223',1,73379,1,getdate(),3);
select * from candidate_bank_det;

-- get name details of all hdfc bank users
select fellowship_candidates.first_name , fellowship_candidates.last_name from candidate_bank_det inner join fellowship_candidates on fellowship_candidates.id = candidate_bank_det.id where candidate_bank_det.name='hdfc';  

CREATE TABLE candidates_bank_det_check (
  id int NOT NULL,
  candidate_id  int NOT NULL,
  field_name int NOT NULL,
  is_verified int DEFAULT NULL,
  lastupd_stamp datetime DEFAULT NULL,
  lastupd_user int DEFAULT NULL,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL
);


CREATE TABLE candidate_qualification(
  id int NOT NULL,
  candidate_id int NOT NULL,
  diploma int DEFAULT 0,
  degree_name varchar(10) NOT NULL,
  is_degree_name_verified int DEFAULT 0,
  employee_decipline varchar(100) NOT NULL,
  is_employee_decipline_verified int DEFAULT 0,
  passing_year int NOT NULL,
  is_passing_year_verified int DEFAULT 0,
  aggr_per float DEFAULT NULL,
  final_year_per float DEFAULT NULL,
  is_final_year_per_verified int DEFAULT 0,
  training_institute varchar(20) NOT NULL,
  is_training_institute_verified int DEFAULT 0,
  training_duration_month int DEFAULT NULL,
  is_training_duration_month_verified int DEFAULT 0,
  other_training varchar(255) DEFAULT NULL,
  is_other_training_verified int DEFAULT 0,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  CONSTRAINT  FK_candidate_qual_candidate_id  FOREIGN KEY ( candidate_id ) REFERENCES  fellowship_candidates  ( id ),
 PRIMARY KEY (id)
) ;










CREATE TABLE candidates_education_det_check (
  id int NOT NULL,
  candidate_id  int NOT NULL,
  field_name int NOT NULL,
  is_verified int DEFAULT NULL,
  lastupd_stamp datetime DEFAULT NULL,
  lastupd_user int DEFAULT NULL,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL
);


CREATE TABLE candidate_docs(
  id int NOT NULL,
  candidate_id int NOT NULL,
  doc_type varchar(20) DEFAULT NULL,
  doc_path varchar(500) DEFAULT NULL,
  status int DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
    
  CONSTRAINT  FK_candidate_docs_candidate_id  FOREIGN KEY ( candidate_id ) REFERENCES  fellowship_candidates  ( id ),
  PRIMARY KEY (id)
) ;



CREATE TABLE user_details (
  id int NOT NULL,
  email varchar(50) NOT NULL,
  first_name varchar(100) NOT NULL,
  last_name varchar(100) NOT NULL,
  password varchar(15) NOT NULL,
  contact_number bigint NOT NULL,
  verified bit DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE(email)
) ;


CREATE TABLE user_roles (
  user_id int NOT NULL ,
  role_name varchar(100)
) ;





CREATE TABLE company(
  id int NOT NULL,
  name int NOT NULL,
  address varchar(150) DEFAULT NULL,
  location varchar(50) DEFAULT NULL,
  status int DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  PRIMARY KEY (id)
) ;


CREATE TABLE tech_type (
  id int NOT NULL Primary key,
  type_name varchar(50) NOT NULL,
  cur_status char(1) DEFAULT NULL,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL
) ;

CREATE TABLE maker_program(
  id int NOT NULL,
  program_name int NOT NULL,
  program_type varchar(10) DEFAULT NULL,
  program_link text DEFAULT NULL,
  tech_stack_id int DEFAULT NULL,
  tech_type_id int NOT NULL,
  is_program_approved int,
  description varchar(500) DEFAULT NULL,
  status int DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  
  CONSTRAINT  FK_maker_program_tech_stack_id  FOREIGN KEY ( tech_stack_id ) REFERENCES tech_stack(id),
  
  CONSTRAINT  FK_maker_program_tech_type_id  FOREIGN KEY ( tech_type_id ) REFERENCES  tech_type( id ),
  PRIMARY KEY (id)
) ;

CREATE TABLE lab(
  id int NOT NULL,
  name varchar(50) DEFAULT NULL,
  location varchar(50) DEFAULT NULL,
  address  varchar(255) DEFAULT NULL,
  status int DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  PRIMARY KEY (id)
) ;


CREATE TABLE app_parameters (
  id int NOT NULL,
  key_type varchar(20) NOT NULL,
  key_value varchar(20) NOT NULL,
  key_text varchar(80) DEFAULT NULL,
  cur_status char(1) DEFAULT NULL,
  lastupd_user int DEFAULT NULL,
  lastupd_stamp datetime DEFAULT NULL,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  seq_num int DEFAULT NULL,
  Index app_parameters_1 (key_type,  key_value)
) ;



CREATE TABLE mentor(
  id int NOT NULL,
  name varchar(50) DEFAULT NULL,
  mentor_type varchar(20) DEFAULT NULL,
  lab_id int NOT NULL,
  status int DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  
  CONSTRAINT  FK_mentor_lab_id  FOREIGN KEY ( lab_id ) REFERENCES  mentor  ( id ),
  PRIMARY KEY (id)
) ;



CREATE TABLE mentor_ideation_map(
  id int NOT NULL,
  mentor_id int NOT NULL,
  status int DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
    
  CONSTRAINT  FK_mentor_ideation_map_mentor_id  FOREIGN KEY ( mentor_id ) REFERENCES  mentor  ( id ),
  PRIMARY KEY (id)
) ;







CREATE TABLE mentor_techstack(
  id int NOT NULL,
  mentor_id int NOT NULL,
  tech_stack_id int NOT NULL,
  status int DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  PRIMARY KEY (id),
    
  CONSTRAINT  FK_mentor_mentor_id  FOREIGN KEY ( mentor_id ) REFERENCES  mentor  ( id ),
  
  CONSTRAINT  FK_mentor_tech_stack_id  FOREIGN KEY ( tech_stack_id ) REFERENCES  tech_stack  ( id )
) ;


CREATE TABLE tech_stack (
  id int NOT NULL Primary key,
  tech_name varchar(50) NOT NULL,
  image_path varchar(500) DEFAULT NULL,
  framework text DEFAULT NULL,
  cur_status char(1) DEFAULT NULL,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL
) ;


---------
CREATE TABLE lab_threshold(
  id int NOT NULL,
  lab_id int NOT NULL,
  lab_capacity varchar(50) DEFAULT NULL,
  lead_threshold int DEFAULT NULL,
  ideation_engg_threshold int DEFAULT NULL,
  buddy_engg_threshold int DEFAULT NULL,
  status int DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  PRIMARY KEY (id),
  
  CONSTRAINT  FK_lab_lab_id  FOREIGN KEY ( lab_id ) REFERENCES  candidate_lead  ( id )
  ) ;










				


CREATE TABLE company_requirement(
id int NOT NULL,
company_id int NOT NULL,
candidate_id int NOT NULL,
requested_month varchar(20) NOT NULL,
city varchar(20) DEFAULT NULL,
is_doc_verification int DEFAULT 1,
requirement_doc_path varchar(500) DEFAULT NULL,
no_of_engg int NOT NULL,
tech_stack_id int NOT NULL,
tech_type_id int NOT NULL,
maker_programs_id int NOT NULL,
lead_id int NOT NULL,
ideateion_engg_id int DEFAULT NULL,
buddy_engg_id int  DEFAULT NULL,
special_remark text DEFAULT NULL,
status int DEFAULT 1,
creator_stamp datetime DEFAULT NULL,
creator_user int DEFAULT NULL,
  
  CONSTRAINT  FK_candidate_candidate_id  FOREIGN KEY ( candidate_id ) REFERENCES  fellowship_candidates  ( id ),
PRIMARY KEY(id)
);













CREATE TABLE candidate_techstack_assignment(
  id int NOT NULL,
  requirement_id int NOT NULL,
  candidate_id int NOT NULL,
  assign_date datetime DEFAULT NULL,
  status varchar(20) DEFAULT NULL,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  
  CONSTRAINT  FK_candidate_techstack_assignment_requirement_id  FOREIGN KEY ( requirement_id ) REFERENCES  company_requirement  ( id ),
  
  FOREIGN KEY ( candidate_id ) REFERENCES  fellowship_candidates  ( id ),
  PRIMARY KEY (id)
) ;


CREATE TABLE user_engagement_MIS(
id int NOT NULL,
candidate_id int NOT NULL,
date_of_attendancce datetime DEFAULT NULL,
time_of_attendance datetime DEFAULT NULL,
email_id varchar(50) NOT NULL,

 FOREIGN KEY ( candidate_id ) REFERENCES  fellowship_candidates  ( id ),
PRIMARY KEY (id)
) ;























CREATE TABLE temporary_MIS(
Date_Time  DATE NOT NULL,
Cpu_Count int NOT NULL,
Cpu_Working_Time float NOT NULL,
Cpu_idle_Time float NOT NULL,
cpu_percent float NOT NULL,
Usage_cpu_count int NOT NULL,
number_of_software_interrupts_since_boot float NOT NULL,
number_of_system_calls_since_boot int NOT NULL,
number_of_interrupts_since_boot int NOT NULL,
cpu_avg_load_over_1_min float NOT NULL,
cpu_avg_load_over_5_min   float NOT NULL,
cpu_avg_load_over_15_min float NOT NULL,
system_total_memory bigint NOT NULL,
system_used_memory bigint NOT NULL,
system_free_memory bigint NOT NULL,
system_active_memory bigint NOT NULL,
system_inactive_memory bigint NOT NULL,
system_buffers_memory bigint NOT NULL,
system_cached_memory bigint NOT NULL,
system_shared_memory bigint NOT NULL,
system_avalible_memory bigint NOT NULL,
disk_total_memory bigint NOT NULL,
disk_used_memory bigint NOT NULL,
disk_free_memory bigint NOT NULL,
disk_read_count bigint NOT NULL,
disk_write_count bigint NOT NULL,
disk_read_bytes bigint NOT NULL,
disk_write_bytes bigint NOT NULL,
time_spent_reading_from_disk bigint NOT NULL,
time_spent_writing_to_disk bigint NOT NULL,
time_spent_doing_actual_Input_Output bigint NOT NULL,
number_of_bytes_sent bigint NOT NULL,
number_of_bytes_received bigint NOT NULL,
number_of_packets_sent bigint NOT NULL,
number_of_packets_recived bigint NOT NULL,
total_number_of_errors_while_receiving bigint NOT NULL,
total_number_of_errors_while_sending bigint NOT NULL,
total_number_of_incoming_packets_which_were_dropped bigint NOT NULL,
total_number_of_outgoing_packets_which_were_dropped bigint NOT NULL,
boot_time varchar(100) NOT NULL,
user_name varchar(50) NOT NULL,
keyboard int NOT NULL,
mouse int NOT NULL,
technology varchar(100) NOT NULL,
files_changed int NOT NULL,
PRIMARY KEY (user_name)
) ;

LOAD DATA LOCAL INFILE '~/Desktop/CpuLogData2019-11-17-new.csv' INTO TABLE temporary_MIS FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS (Date_Time ,
Cpu_Count ,
Cpu_Working_Time ,
Cpu_idle_Time ,
cpu_percent ,
Usage_cpu_count ,
number_of_software_interrupts_since_boot ,
number_of_system_calls_since_boot ,
number_of_interrupts_since_boot ,
cpu_avg_load_over_1_min,
cpu_avg_load_over_5_min  ,
cpu_avg_load_over_15_min ,
system_total_memory  ,
system_used_memory ,
system_free_memory ,
system_active_memory ,
system_inactive_memory ,
system_buffers_memory,
system_cached_memory ,
system_shared_memory ,
system_avalible_memory ,
disk_total_memory ,
disk_used_memory ,
disk_free_memory ,
disk_read_count ,
disk_write_count ,
disk_read_bytes ,
disk_write_bytes ,
time_spent_reading_from_disk ,
time_spent_writing_to_disk ,
time_spent_doing_actual_Input_Output ,
number_of_bytes_sent ,
number_of_bytes_received ,
number_of_packets_sent ,
number_of_packets_recived ,
total_number_of_errors_while_receiving ,
total_number_of_errors_while_sending ,
total_number_of_incoming_packets_which_were_dropped ,
total_number_of_outgoing_packets_which_were_dropped ,
boot_time,
user_name ,
keyboard ,
mouse ,
technology ,
files_changed
);

CREATE TABLE user_engagement_MIS(
id int NOT NULL,
candidate_id int NOT NULL,
Date_Time  DATE NOT NULL,
Cpu_Count int NOT NULL,
Cpu_Working_Time float NOT NULL,
Cpu_idle_Time float NOT NULL,
cpu_percent float NOT NULL,
Usage_cpu_count int NOT NULL,
number_of_software_interrupts_since_boot float NOT NULL,
number_of_system_calls_since_boot int NOT NULL,
number_of_interrupts_since_boot int NOT NULL,
cpu_avg_load_over_1_min float NOT NULL,
cpu_avg_load_over_5_min   float NOT NULL,
cpu_avg_load_over_15_min float NOT NULL,
system_total_memory bigintNOT NULL,
system_used_memory bigint NOT NULL,
system_free_memory bigint NOT NULL,
system_active_memory bigint NOT NULL,
system_inactive_memory bigintNOT NULL,
system_buffers_memory bigint NOT NULL,
system_cached_memory bigint NOT NULL,
system_shared_memory bigint NOT NULL,
system_avalible_memory bigint NOT NULL,
disk_total_memory bigint NOT NULL,
disk_used_memory bigint NOT NULL,
disk_free_memory bigint NOT NULL,
disk_read_count bigint NOT NULL,
disk_write_count bigint NOT NULL,
disk_read_bytes bigint NOT NULL,
disk_write_bytes bigint NOT NULL,
time_spent_reading_from_disk bigint NOT NULL,
time_spent_writing_to_disk bigint NOT NULL,
time_spent_doing_actual_Input_Output bigint NOT NULL,
number_of_bytes_sent bigint NOT NULL,
number_of_bytes_received bigint NOT NULL,
number_of_packets_sent bigint NOT NULL,
number_of_packets_recived bigint NOT NULL,
total_number_of_errors_while_receiving bigint NOT NULL,
total_number_of_errors_while_sending bigint NOT NULL,
total_number_of_incoming_packets_which_were_dropped bigint NOT NULL,
total_number_of_outgoing_packets_which_were_dropped bigint NOT NULL,
boot_time varchar(100) NOT NULL,
keyboard int NOT NULL,
mouse int NOT NULL,
technology varchar(100) NOT NULL,
files_changed int NOT NULL,

  CONSTRAINT  FK_user_engagemnt_mis_candidate_id  FOREIGN KEY ( candidate_id ) REFERENCES  fellowship_candidates  ( id ),
PRIMARY KEY (id)
) ;


