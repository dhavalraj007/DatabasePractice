-- get name details of all hdfc bank users
select fellowship_candidates.first_name , fellowship_candidates.last_name from candidate_bank_det inner join fellowship_candidates on fellowship_candidates.id = candidate_bank_det.id where candidate_bank_det.name='hdfc';  
