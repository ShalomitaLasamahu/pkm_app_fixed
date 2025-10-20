-- Database Setup untuk PKM App di Railway
-- File ini berisi semua tabel yang diperlukan untuk aplikasi

-- Set SQL mode dan timezone
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

-- Set character set
SET NAMES utf8mb4;

-- =============================================
-- TABEL USERS (untuk login)
-- =============================================
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` enum('admin','dosen','mahasiswa') DEFAULT 'mahasiswa',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insert default users
INSERT INTO `users` (`username`, `password`, `role`) VALUES
('admin', 'admin123', 'admin'),
('dosen1', 'dosen123', 'dosen'),
('mhs1', 'mhs123', 'mahasiswa'),
('agnes', 'asleb123', 'dosen')
ON DUPLICATE KEY UPDATE username=username;

-- =============================================
-- TABEL MAHASISWA
-- =============================================
CREATE TABLE IF NOT EXISTS `mahasiswa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `nim` varchar(50) NOT NULL,
  `jurusan` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nim` (`nim`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insert sample data
INSERT INTO `mahasiswa` (`nama`, `nim`, `jurusan`) VALUES
('Karina', '125532', 'Informatika'),
('Sadrina Aisyah', '67890', 'Sistem Informasi'),
('Darren Wijaya', '11523', 'Teknik Elektro')
ON DUPLICATE KEY UPDATE nim=nim;

-- =============================================
-- TABEL TASKS (Deadline Tugas)
-- =============================================
CREATE TABLE IF NOT EXISTS `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `course` varchar(255) NOT NULL,
  `due_date` datetime NOT NULL,
  `priority` enum('low','medium','high') DEFAULT 'medium',
  `description` text DEFAULT NULL,
  `completed` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insert sample tasks
INSERT INTO `tasks` (`name`, `course`, `due_date`, `priority`, `description`, `completed`) VALUES
('Tugas Akhir Web Programming', 'Pemrograman Web', '2025-12-15 23:59:00', 'high', 'Membuat aplikasi web dengan Express.js dan MySQL', 0),
('Laporan Sistem Basis Data', 'Basis Data', '2025-11-30 23:59:00', 'medium', 'Membuat laporan tentang normalisasi database', 1),
('Presentasi AI', 'Kecerdasan Buatan', '2025-11-25 10:00:00', 'high', 'Presentasi tentang algoritma machine learning', 0),
('BUAT TABEL RS', 'ADVANCE', '2025-10-04 16:59:00', 'low', 'ADA 5 SOAL', 0)
ON DUPLICATE KEY UPDATE id=id;

-- =============================================
-- TABEL REKAP KEHADIRAN
-- =============================================
CREATE TABLE IF NOT EXISTS `rekap_kehadiran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nim` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `matkul` varchar(100) NOT NULL,
  `pertemuan` int(11) NOT NULL,
  `status` enum('H','A') DEFAULT 'A',
  `tanggal` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insert sample attendance data
INSERT INTO `rekap_kehadiran` (`nim`, `nama`, `matkul`, `pertemuan`, `status`, `tanggal`) VALUES
('125532', 'Karina', 'Pemrograman Web', 1, 'H', '2025-10-01'),
('67890', 'Sadrina Aisyah', 'Basis Data', 1, 'H', '2025-10-01'),
('11523', 'Darren Wijaya', 'Kecerdasan Buatan', 1, 'A', '2025-10-01')
ON DUPLICATE KEY UPDATE id=id;

-- =============================================
-- SELESAI SETUP DATABASE
-- =============================================
