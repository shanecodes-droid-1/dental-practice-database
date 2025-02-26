-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2022 at 04:05 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `databaseproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `AppointmentID` int(11) NOT NULL,
  `AppointmentDate` date NOT NULL,
  `AppointmentTime` time NOT NULL,
  `Status` text NOT NULL,
  `PatientID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`AppointmentID`, `AppointmentDate`, `AppointmentTime`, `Status`, `PatientID`) VALUES
(1, '2022-01-18', '10:00:00', 'Complete', 3),
(2, '2022-01-18', '11:00:00', 'Cancelled', 1),
(3, '2022-01-18', '12:00:00', 'Complete', 2),
(4, '2022-01-19', '10:00:00', 'Complete', 4),
(5, '2022-01-19', '11:00:00', 'Complete', 5),
(6, '2022-01-20', '10:00:00', 'Cancelled', 6),
(7, '2022-01-20', '11:00:00', 'Complete', 6),
(8, '2022-01-21', '10:00:00', 'Complete', 1),
(9, '2022-04-29', '10:00:00', 'Scheduled', 3);

-- --------------------------------------------------------

--
-- Table structure for table `appointmentcancellations`
--

CREATE TABLE `appointmentcancellations` (
  `AppointmentID` int(11) NOT NULL,
  `CancellationDate` date NOT NULL,
  `LateCancellationFee` float DEFAULT NULL,
  `PatientID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointmentcancellations`
--

INSERT INTO `appointmentcancellations` (`AppointmentID`, `CancellationDate`, `LateCancellationFee`, `PatientID`) VALUES
(2, '2022-01-17', 10, 1),
(6, '2022-01-10', NULL, 6);

-- --------------------------------------------------------

--
-- Table structure for table `appointmentdetails`
--

CREATE TABLE `appointmentdetails` (
  `AppointmentID` int(11) NOT NULL,
  `TreatmentID` int(11) NOT NULL,
  `PatientID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointmentdetails`
--

INSERT INTO `appointmentdetails` (`AppointmentID`, `TreatmentID`, `PatientID`) VALUES
(1, 1, 3),
(1, 7, 3),
(1, 6, 3),
(3, 1, 2),
(4, 2, 4),
(5, 3, 5),
(5, 4, 5),
(7, 1, 6),
(7, 5, 6),
(8, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `BillNumber` int(11) NOT NULL,
  `BillDueDate` date NOT NULL,
  `PatientID` int(11) NOT NULL,
  `AppointmentID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`BillNumber`, `BillDueDate`, `PatientID`, `AppointmentID`) VALUES
(1, '2022-02-18', 3, 1),
(2, '2022-02-18', 2, 3),
(3, '2022-02-19', 4, 4),
(4, '2022-02-19', 5, 5),
(5, '2022-02-20', 6, 7),
(6, '2022-02-21', 1, 8);

-- --------------------------------------------------------

--
-- Stand-in structure for view `dental_report`
-- (See below for the actual view)
--
CREATE TABLE `dental_report` (
`PatientID` int(11)
,`DentalReport` text
);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `PatientID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `DOB` date NOT NULL,
  `DentalReport` text NOT NULL,
  `PhoneNumber` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`PatientID`, `Name`, `Address`, `DOB`, `DentalReport`, `PhoneNumber`) VALUES
(1, 'Tom Smith', '123 Lane, Dublin', '1980-04-05', 'Patient History redacted', '0857956287'),
(2, 'Mary Quirke', '50 Row, Limerick', '1960-06-09', 'Summary of patient history', '0879502680'),
(3, 'Sarah Hughes', '90 Village Street, Cork', '1990-10-11', 'Summary of patient history', '0868502140'),
(4, 'Jack Jones', '5 The lane, Galway', '1985-02-05', 'Summary of patient history', '0855852209'),
(5, 'Stephen McCarthy', '85 The Chapel, Cork', '1982-10-09', 'Summary of patient history', '0877792206'),
(6, 'Julia Collins', 'Birch road, Cork', '1975-10-06', 'Summary of patient history', '0855601298');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PatientID` int(11) NOT NULL,
  `PaymentAmount` float NOT NULL,
  `PaymentDate` date NOT NULL,
  `ChequeNumber` varchar(255) DEFAULT NULL,
  `CardNumber` int(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PatientID`, `PaymentAmount`, `PaymentDate`, `ChequeNumber`, `CardNumber`) VALUES
(1, 70, '2022-01-21', '4a58rty58', NULL),
(2, 100, '2022-02-18', NULL, 2147483647),
(3, 280, '2022-01-18', NULL, NULL),
(4, 300, '2022-01-19', NULL, 2147483647),
(5, 250, '2022-01-19', '4a58903e', NULL),
(6, 900, '2022-01-20', '48a590g50', 2147483647),
(1, 70, '2022-01-22', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `specialist`
--

CREATE TABLE `specialist` (
  `SpecialistID` int(11) NOT NULL,
  `SpecialistName` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Expertise` varchar(255) DEFAULT NULL,
  `Equipment` varchar(255) DEFAULT NULL,
  `PatientID` int(11) NOT NULL,
  `PhoneNumber` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `specialist`
--

INSERT INTO `specialist` (`SpecialistID`, `SpecialistName`, `Address`, `Expertise`, `Equipment`, `PatientID`, `PhoneNumber`) VALUES
(1, 'Dr. John Collins', '55 Maples, Cork City', 'Surgical Extraction', NULL, 3, '0857859960'),
(2, 'Dr. Mary Burke', '9 Avenue, Dublin', NULL, 'MRI Equipment', 1, '0874859620'),
(3, 'Dr. Jim Murphy', '22 Rows End, Limerick', 'Reconstruction Work', NULL, 4, '0879632418'),
(4, 'Dr. Jackie Burns', '5th Street, Dublin', 'Dentures', 'Moulding Equipment', 2, '0856090506');

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `TreatmentID` int(11) NOT NULL,
  `TreatmentFee` float NOT NULL,
  `TreatmentType` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `treatment`
--

INSERT INTO `treatment` (`TreatmentID`, `TreatmentFee`, `TreatmentType`) VALUES
(1, 200, 'Examination'),
(2, 800, 'Crown'),
(3, 400, 'Extraction'),
(4, 600, 'Root Canal'),
(5, 1600, 'Braces'),
(6, 240, 'Filling'),
(7, 120, 'Cleaning');

-- --------------------------------------------------------

--
-- Structure for view `dental_report`
--
DROP TABLE IF EXISTS `dental_report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dental_report`  AS SELECT `patient`.`PatientID` AS `PatientID`, `patient`.`DentalReport` AS `DentalReport` FROM `patient` WHERE `patient`.`PatientID` is not null ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`AppointmentID`),
  ADD KEY `AppointmentPatientID` (`PatientID`);

--
-- Indexes for table `appointmentcancellations`
--
ALTER TABLE `appointmentcancellations`
  ADD KEY `CancellationAppID` (`AppointmentID`),
  ADD KEY `CancellationPatientID` (`PatientID`);

--
-- Indexes for table `appointmentdetails`
--
ALTER TABLE `appointmentdetails`
  ADD KEY `AppDetailsPatientID` (`PatientID`),
  ADD KEY `AppDetailsTreatmentID` (`TreatmentID`),
  ADD KEY `AppDetailsAppID` (`AppointmentID`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`BillNumber`),
  ADD KEY `BillPatientID` (`PatientID`),
  ADD KEY `BillAppID` (`AppointmentID`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`PatientID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD KEY `paymentPatientID` (`PatientID`);

--
-- Indexes for table `specialist`
--
ALTER TABLE `specialist`
  ADD PRIMARY KEY (`SpecialistID`),
  ADD KEY `SpecialistPatientID` (`PatientID`);

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`TreatmentID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `AppointmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `BillNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `specialist`
--
ALTER TABLE `specialist`
  MODIFY `SpecialistID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `treatment`
--
ALTER TABLE `treatment`
  MODIFY `TreatmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `AppointmentPatientID` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`);

--
-- Constraints for table `appointmentcancellations`
--
ALTER TABLE `appointmentcancellations`
  ADD CONSTRAINT `CancellationAppID` FOREIGN KEY (`AppointmentID`) REFERENCES `appointment` (`AppointmentID`),
  ADD CONSTRAINT `CancellationPatientID` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`);

--
-- Constraints for table `appointmentdetails`
--
ALTER TABLE `appointmentdetails`
  ADD CONSTRAINT `AppDetailsAppID` FOREIGN KEY (`AppointmentID`) REFERENCES `appointment` (`AppointmentID`),
  ADD CONSTRAINT `AppDetailsPatientID` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`),
  ADD CONSTRAINT `AppDetailsTreatmentID` FOREIGN KEY (`TreatmentID`) REFERENCES `treatment` (`TreatmentID`);

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `BillAppID` FOREIGN KEY (`AppointmentID`) REFERENCES `appointment` (`AppointmentID`),
  ADD CONSTRAINT `BillPatientID` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `paymentPatientID` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`);

--
-- Constraints for table `specialist`
--
ALTER TABLE `specialist`
  ADD CONSTRAINT `SpecialistPatientID` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
