# dental-practice-database

Project Description
The dental practice database is comprised of the below.

The Specialist table contains the following
SpecialistID used as a primary key to uniquely identify the specialist.
The name, address and phone number are basic contact information.
The patientID is used to reference the patient table and has a foreign key delete and update restrict
constraint. This means that a specialist cannot reference a patient ID unless it exists in the patient table.
It has optional many to optional many relationship with the patient table. As one specialist may be
seeing multiple patients and each patient may be seeing multiple specialists.
The expertise and equipment attributes give information on their specialty. These values can be set to
null as they can be either a specialist with a particular expertise or piece of equipment.

The treatment table contains the following
TreatmentID is the primary key and acts as a unique identifier for each treatment. Treatment fee
catalogues the price of each treatment. Treatment type gives a description of the treatment.

The payment table contains the following
PatientID is a foreign key reference to the patient table. It has an optional many to many relationship
with the patient table as many patients may make multiple payments.
Payment amount which specifies the amount paid by the patient this can be by card, cheque or cash.
For cash payments the card and cheque fields will be null.
Payment date this is the date a payment was made. If the final payment for a bill has been made this can
be checked against the bill due date by running a query.
Cheque number if the payment is made by cheque. Can be set to null if not applicable Card number if
the payment is made by card. Can be set to null if not applicable

The appointment table contains the following
AppointmentID is the primary key and is a unique identifier for each appointment.
Appointment date specifies the date for the appointment Appointment time specifies the time of the
appointment.Status outlines whether the appointment is scheduled, has been cancelled or has been
completed.

Patient ID is a foreign key reference to the patient table. It has a one to optional many relationship with
the patient table. As one patient may have multiple appointments but each appointment is specific for
one patient.

The appointmentdetails table contains the following
The appointmentID is a foreign key reference to the appointment table. It has a many to many
relationship to the appointment table. Each appointment may have multiple details and there may be
multiple appointments listed. It has been normalized from the appointment table due to this. This
reduced data redundancy and allowed the appointment ID to remain unique in the appointment table.

TreatmentID is referenced in the appointmentdetails table as a foreign key. This allows the treatments
carried out during an appointment to be detailed for a patient. A query can be run to give both the
appointment details and treatment types and costs by joining the two tables. The treatment table has
an optional many to many relationship with the appointmentdetails table. As each appointment may
have multiple treatments carried out and multiple appointments may also be listed within the
appointmentdetails table.

The patient ID is a foreign key reference to the patient table. This allows the treatment cost to be
calculated for a patient. It has optional many to optional many relationship as many patients can have
many appointment details.

The appointmentcancellations contains the following

AppointmentID is a foreign key reference to the appointment table. It has a one to optional many
relationship as each appointment can only be cancelled once but multiple appointments may be
cancelled.

CancellationDate is the date that the appointment was cancelled. This can be checked against the
appointment date and if the dates are too close a late cancellation fee is applied.
LateCancellationFee can be set to null if not applicable or is set to 10 if applicable.

PatientID is a foreign key reference to the patient table. It has an optional many to optional many
relationship as a patient can have multiple cancellations and multiple patients can have cancellations.
The patient table contains the following

PatientID is the primary key and is a unique identified for each patient.
Name, Address, Date of Birth and Phone number are basic patient information.

Dental Report is a summary of the patient’s history with the dentist and includes information from the
specialist if applicable.

The bill table contains the following.
Bill number is the primary key and is a unique identifier for each bill.
Bill due date is the date a bill is owed by and can be checked against the payment table by joining using
the patient id to get last payment date.
PatientID is a foreign key reference to the patient table. It has an optional may to one relationship with
the patient table as one bill is owed by one patient but one patient may have many bills.
AppointmentID is a foreign key reference to the appointment table. This can be used to query the
amount owed from the appointmentdetails table. It has one to one relationship with the appointment
table as one bill is due for one appointment.
