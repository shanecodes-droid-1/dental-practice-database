 /* INSERTION
 The below query is an example of an insertion query
 It creates a new patient in the patient table. The values should match the 
 expeceted attributes, otherwise the columns that are being 
 updated should be included in the statement.
 */
 
 INSERT INTO patient VALUES 
 (1, "Tom Smith", "123 Lane, Dublin", "1980-04-05", 
 "Summary of patient history", "0857956287");
 
 /*
SELECTION Query
To get the total amount paid by the patient the below query 
can be run */
SELECT 
    SUM(payment.PaymentAmount)
FROM
    payment
WHERE
    PatientID = 1;
    
    /*
SELECTION Query
If the dentist wanted to refer a patient for instance for 
surgical extraction the specialist table could be checked 
using the below select query. */

SELECT 
    SpecialistName
FROM
    specialist
WHERE
    Expertise = 'Surgical Extraction';
    
 
 /*
SELECTION Query
If the secretary wants to run a query to show the nexts weeks 
appointments the below query can be run. It will display the 
patient name and address by joining with the patient table 
through the patient ID. */

SELECT 
    AppointmentID,
    AppointmentDate,
    AppointmentTime,
    patient.Name,
    patient.Address
FROM
    appointment,
    patient
WHERE
    AppointmentDate BETWEEN '2022-01-18' AND '2022-01-25'
        AND appointment.PatientID = patient.PatientID;
        
/* UPDATE Query
If the secretary wants to cancel an appointment for a patient 
the below query can be run.
*/

UPDATE appointment 
SET 
    Status = 'Cancelled'
WHERE
    AppointmentID = 9;

/*
The cancelled appointment would then be added to the 
appointmentcancellation table using the below query and a 
cancellation fee would be added if necessary.
*/
Insert INTO appointmentcancellations VALUES (9, "2022-04-21", 10);

/*DELETE Query
A dummy table can be created see query below 
*/
CREATE TABLE dummy (
    dm1 INT,
    dm2 TEXT
);
/*
This table can then be deleted using the following query
*/

drop table dummy;

/*
NARRATIVE Query
To get the total bill amount for an appointment the below query 
can be run. This query includes any charges for treatments 
during an appointment and whether any late cancellation fees 
apply. It uses an inner select statement to get the cancellation
 fee and an outer select statement to get the treatment fee 
 total. The ifnull statement is used to handle null values 
and treat them as zero.
*/

SELECT 
    (IFNULL((SELECT 
                    SUM(treatment.TreatmentFee)
                FROM
                    appointmentdetails,
                    treatment
                WHERE
                    appointmentdetails.TreatmentID = treatment.TreatmentID
                        AND appointmentdetails.AppointmentID = 2),
            0) + IFNULL((SELECT 
                    appointmentcancellations.LateCancellationFee
                FROM
                    appointmentcancellations
                WHERE
                    appointmentcancellations.AppointmentID = 2),
            0)) AS BillTotal;
            


    /*
    NARRATIVE Query
    The following query can be used to get the outstanding 
    balance owed by a patient eg. patient no 1 for all treatments 
    and late cancellation fees. */
    
SELECT 
    (IFNULL((SELECT 
                    SUM(treatment.TreatmentFee)
                FROM
                    appointmentdetails,
                    treatment
                WHERE
                    appointmentdetails.TreatmentID = treatment.TreatmentID
                        AND appointmentdetails.PatientID = 1),
            0) + IFNULL((SELECT 
                    appointmentcancellations.LateCancellationFee
                FROM
                    appointmentcancellations
                WHERE
                    appointmentcancellations.PatientID = 1),
            0) - IFNULL((SELECT 
                    SUM(payment.PaymentAmount)
                FROM
                    payment
                WHERE
                    payment.PatientID = 1),
            0)) AS OutstandingBalance;
            

 

 
 
 

    