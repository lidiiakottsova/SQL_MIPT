use polyclinic9
go

alter table treatment
add constraint fktreatmentpatient
foreign key(patient_id)
references patient(patient_id)
on update cascade

alter table treatment
add constraint fktreatmentdoctor
foreign key(doctor_id)
references doctor(doctor_id)
on update cascade

alter table treatment
add constraint fktreatmentservicec
foreign key(service_id)
references servicec(service_id)
on update cascade

alter table treatment
add constraint fktreatmentapp_rec
foreign key(appointment_id)
references app_rec(appointment_id)
on delete no action

alter table treatment
add constraint fktreatmentdiagnosis
foreign key(diagnosis)
references diagnosis(diagnosis)
on update cascade

alter table patient
add constraint fkpatientsite
foreign key(site_id)
references site(site_id)
on update cascade

alter table doctor
add constraint fkdoctorsite
foreign key(site_id)
references site(site_id)
on update no action

alter table doctor
add constraint fkdoctorschedule
foreign key(schedule_id)
references schedule(schedule_id)
on update cascade

alter table app_rec
add constraint fkapp_recmedicine
foreign key(reception_id)
references medicine(reception_id)
on update cascade
