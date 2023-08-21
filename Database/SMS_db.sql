-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.32 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for adyapana-institute
CREATE DATABASE IF NOT EXISTS `adyapana-institute` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `adyapana-institute`;

-- Dumping structure for table adyapana-institute.admit_program
CREATE TABLE IF NOT EXISTS `admit_program` (
  `id` int NOT NULL,
  `student_id` int NOT NULL,
  `program_id` int NOT NULL,
  `batch_id` int NOT NULL,
  `admit_date` datetime NOT NULL,
  `admit_by` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table adyapana-institute.admit_program: 0 rows
/*!40000 ALTER TABLE `admit_program` DISABLE KEYS */;
/*!40000 ALTER TABLE `admit_program` ENABLE KEYS */;

-- Dumping structure for table adyapana-institute.attendance
CREATE TABLE IF NOT EXISTS `attendance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `student_id` int NOT NULL,
  `classe_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_attendance_students1_idx` (`student_id`),
  KEY `fk_attendance_classes1_idx` (`classe_id`),
  CONSTRAINT `fk_attendance_classes1` FOREIGN KEY (`classe_id`) REFERENCES `class` (`id`),
  CONSTRAINT `fk_attendance_students1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table adyapana-institute.attendance: ~0 rows (approximately)

-- Dumping structure for table adyapana-institute.batch
CREATE TABLE IF NOT EXISTS `batch` (
  `id` int NOT NULL,
  `name` text NOT NULL,
  `start` text,
  `end` text NOT NULL,
  `day` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table adyapana-institute.batch: 0 rows
/*!40000 ALTER TABLE `batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `batch` ENABLE KEYS */;

-- Dumping structure for table adyapana-institute.chat
CREATE TABLE IF NOT EXISTS `chat` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `message` text NOT NULL,
  `date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table adyapana-institute.chat: 0 rows
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;

-- Dumping structure for table adyapana-institute.class
CREATE TABLE IF NOT EXISTS `class` (
  `id` int NOT NULL AUTO_INCREMENT,
  `time` varchar(45) DEFAULT NULL,
  `date` date NOT NULL,
  `subject_id` int NOT NULL,
  `teachers_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_classes_subjects1_idx` (`subject_id`),
  KEY `fk_classes_teachers1_idx` (`teachers_id`),
  CONSTRAINT `fk_classes_subjects1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `fk_classes_teachers1` FOREIGN KEY (`teachers_id`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table adyapana-institute.class: ~0 rows (approximately)
INSERT INTO `class` (`id`, `time`, `date`, `subject_id`, `teachers_id`) VALUES
	(1, '12:00', '2023-07-15', 4, 6);

-- Dumping structure for table adyapana-institute.gender
CREATE TABLE IF NOT EXISTS `gender` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table adyapana-institute.gender: ~2 rows (approximately)
INSERT INTO `gender` (`id`, `type`) VALUES
	(1, 'Male'),
	(2, 'Female');

-- Dumping structure for table adyapana-institute.payment
CREATE TABLE IF NOT EXISTS `payment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `student_id` int NOT NULL,
  `class_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_payments_students1_idx` (`student_id`),
  KEY `fk_payments_classes1_idx` (`class_id`),
  CONSTRAINT `fk_payments_classes1` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`),
  CONSTRAINT `fk_payments_students1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table adyapana-institute.payment: ~0 rows (approximately)
INSERT INTO `payment` (`id`, `date`, `student_id`, `class_id`) VALUES
	(1, '2023-07-12', 4, 1);

-- Dumping structure for table adyapana-institute.student
CREATE TABLE IF NOT EXISTS `student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `date_of_birth` date NOT NULL,
  `address` varchar(80) NOT NULL,
  `email` varchar(45) NOT NULL,
  `mobile` varchar(45) NOT NULL,
  `gender_id` int NOT NULL,
  `is_removed` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_students_genders_idx` (`gender_id`),
  CONSTRAINT `fk_students_genders` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table adyapana-institute.student: ~2 rows (approximately)
INSERT INTO `student` (`id`, `name`, `date_of_birth`, `address`, `email`, `mobile`, `gender_id`, `is_removed`) VALUES
	(4, 'Chathura', '2023-07-14', '224/12 Mabima heiyanthuduwa', 'Chathura@gmail.com', '0705321516', 1, 0),
	(5, 'Sudaraka', '2023-07-15', 'smanthi mawatha', 'Sudaraka@11', '0705321516', 1, 0);

-- Dumping structure for table adyapana-institute.students_has_classes
CREATE TABLE IF NOT EXISTS `students_has_classes` (
  `student_id` int NOT NULL,
  `class_id` int NOT NULL,
  PRIMARY KEY (`student_id`,`class_id`),
  KEY `fk_students_has_classes_classes1_idx` (`class_id`),
  KEY `fk_students_has_classes_students1_idx` (`student_id`),
  CONSTRAINT `fk_students_has_classes_classes1` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_students_has_classes_students1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table adyapana-institute.students_has_classes: ~0 rows (approximately)

-- Dumping structure for table adyapana-institute.students_has_subjects
CREATE TABLE IF NOT EXISTS `students_has_subjects` (
  `students_id` int NOT NULL,
  `subjects_id` int NOT NULL,
  PRIMARY KEY (`students_id`,`subjects_id`),
  KEY `fk_students_has_subjects_subjects1_idx` (`subjects_id`),
  KEY `fk_students_has_subjects_students1_idx` (`students_id`),
  CONSTRAINT `fk_students_has_subjects_students1` FOREIGN KEY (`students_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_students_has_subjects_subjects1` FOREIGN KEY (`subjects_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table adyapana-institute.students_has_subjects: ~0 rows (approximately)

-- Dumping structure for table adyapana-institute.subject
CREATE TABLE IF NOT EXISTS `subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table adyapana-institute.subject: ~7 rows (approximately)
INSERT INTO `subject` (`id`, `name`) VALUES
	(3, 'Maths'),
	(4, 'Science'),
	(7, 'test'),
	(8, 'test'),
	(9, 'test'),
	(10, 'test');

-- Dumping structure for table adyapana-institute.subjects_has_teachers
CREATE TABLE IF NOT EXISTS `subjects_has_teachers` (
  `subject_id` int NOT NULL,
  `teacher_id` int NOT NULL,
  PRIMARY KEY (`subject_id`,`teacher_id`),
  KEY `fk_subjects_has_teachers_teachers1_idx` (`teacher_id`),
  KEY `fk_subjects_has_teachers_subjects1_idx` (`subject_id`),
  CONSTRAINT `fk_subjects_has_teachers_subjects1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_subjects_has_teachers_teachers1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table adyapana-institute.subjects_has_teachers: ~0 rows (approximately)
INSERT INTO `subjects_has_teachers` (`subject_id`, `teacher_id`) VALUES
	(3, 6);

-- Dumping structure for table adyapana-institute.teacher
CREATE TABLE IF NOT EXISTS `teacher` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `address` varchar(80) NOT NULL,
  `mobile` varchar(45) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table adyapana-institute.teacher: ~3 rows (approximately)
INSERT INTO `teacher` (`id`, `name`, `address`, `mobile`, `email`) VALUES
	(4, 'Chathura', 'biyagama', '0705321516', 'fvarcar'),
	(6, 'brer', 'berbe', 'btebe', '42vrew');

-- Dumping structure for table adyapana-institute.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `nic` varchar(20) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `gender_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_genders1_idx` (`gender_id`),
  CONSTRAINT `fk_users_genders1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table adyapana-institute.user: ~1 rows (approximately)
INSERT INTO `user` (`id`, `name`, `nic`, `mobile`, `email`, `password`, `gender_id`) VALUES
	(4, 'Chathura', '200505903342', '0705321516', 'Chathura@gmail.com', '123', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
