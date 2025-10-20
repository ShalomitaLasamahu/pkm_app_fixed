-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Okt 2025 pada 11.25
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pkm_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `course` varchar(255) NOT NULL,
  `due_date` datetime NOT NULL,
  `priority` enum('low','medium','high') DEFAULT 'medium',
  `description` text DEFAULT NULL,
  `completed` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tasks`
--

INSERT INTO `tasks` (`id`, `name`, `course`, `due_date`, `priority`, `description`, `completed`, `created_at`, `updated_at`) VALUES
(1, 'Tugas Akhir Web Programming', 'Pemrograman Web', '2023-12-15 23:59:00', 'high', 'Membuat aplikasi web dengan Express.js dan MySQL', 0, '2025-10-02 08:28:24', '2025-10-02 08:28:24'),
(2, 'Laporan Sistem Basis Data', 'Basis Data', '2023-11-30 23:59:00', 'medium', 'Membuat laporan tentang normalisasi database', 1, '2025-10-02 08:28:24', '2025-10-02 08:28:24'),
(3, 'Presentasi AI', 'Kecerdasan Buatan', '2023-11-25 10:00:00', 'high', 'Presentasi tentang algoritma machine learning', 0, '2025-10-02 08:28:24', '2025-10-02 08:28:24'),
(4, 'BUAT TABEL RS', 'ADVANCE', '2025-10-04 16:59:00', 'low', 'ADA 5 SOAL', 0, '2025-10-03 08:48:50', '2025-10-03 08:48:50');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
