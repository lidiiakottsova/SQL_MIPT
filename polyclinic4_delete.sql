use polyclinic9
go

alter table treatment
drop constraint fktreatmentpatient

alter table treatment
drop constraint fktreatmentdoctor

alter table treatment
drop constraint fktreatmentservicec

alter table treatment
drop constraint fktreatmentapp_rec

alter table treatment
drop constraint fktreatmentdiagnosis

alter table patient
drop constraint fkpatientsite

alter table doctor
drop constraint fkdoctorsite

alter table app_rec
drop constraint fkapp_recmedicine

delete from treatment
delete from treatment
delete from treatment
delete from treatment
delete from treatment
delete from patient
delete from doctor
delete from app_rec

drop table app_rec
drop table diagnosis
drop table doctor
drop table medicine
drop table patient
drop table schedule
drop table servicec
drop table site
drop table treatment
