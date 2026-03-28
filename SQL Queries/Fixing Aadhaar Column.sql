alter table kyc_info add cleaned_aadhaar varchar2(20);
update kyc_info
set cleaned_aadhaar = replace(aadhaar,'.00','');