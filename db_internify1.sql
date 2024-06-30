-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 30, 2024 at 07:57 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_internify1`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` char(36) NOT NULL,
  `id_kelompok` int(11) NOT NULL,
  `nim_anggota` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `id_kelompok`, `nim_anggota`, `created_at`, `updated_at`) VALUES
('2af57376-c4a0-4380-9917-d64aa4c3e53b', 42, '84186419346', '2024-06-24 04:10:54', '2024-06-24 04:10:54'),
('2b6347fa-5063-4acd-aa78-41138d827e4f', 42, '49854029', '2024-06-24 04:10:54', '2024-06-24 04:10:54'),
('4a9de024-e9b7-4dec-94b8-f9bb3960d1c3', 49, '49850257', '2024-06-30 13:19:34', '2024-06-30 13:19:34'),
('77e8088b-c05f-4457-b745-773b281a45bb', 45, '419341034', '2024-06-29 13:30:58', '2024-06-29 13:30:58'),
('8732a180-bc68-46e0-a17c-b276e16bd0f6', 44, '472805924572', '2024-06-29 07:35:15', '2024-06-29 07:35:15'),
('8f8bcac2-9d01-4c25-802d-d0d6a45f3f63', 44, '204752457', '2024-06-29 07:35:15', '2024-06-29 07:35:15'),
('a0ea5c1e-6326-48b3-ae6d-1e3f8a93e5a6', 41, '52045702475', '2024-06-24 04:09:23', '2024-06-24 04:09:23'),
('af953a4f-c5a7-4d8c-ad34-0041045c4b9a', 41, '459745027', '2024-06-24 04:09:23', '2024-06-24 04:09:23'),
('b30913f7-4776-4d38-966c-6c95e60f95d4', 45, '075272', '2024-06-29 13:30:58', '2024-06-29 13:30:58'),
('daad204b-d259-4e6b-b9b1-478fbc99a265', 43, '2111523056', '2024-06-29 07:33:03', '2024-06-29 07:33:03'),
('f39669a0-df96-4a58-ba74-54c7b8a0b90a', 43, '2111529007', '2024-06-29 07:33:03', '2024-06-29 07:33:03'),
('fee2f985-ddc1-4d56-90e8-35443052c5f4', 49, '450257', '2024-06-30 13:19:34', '2024-06-30 13:19:34'),
('fff6b9bf-ed45-4ac1-9483-335f6bb83ce6', 49, '138417073', '2024-06-30 13:19:34', '2024-06-30 13:19:34');

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `nip` varchar(20) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`nip`, `nama`, `created_at`, `updated_at`) VALUES
('12', 'Ricky Akbar', '2024-06-19 05:25:13', '2024-06-19 05:25:36'),
('153353', 'Afriyanti', '2024-06-19 05:25:13', '2024-06-19 05:25:36');

-- --------------------------------------------------------

--
-- Table structure for table `kelompok`
--

CREATE TABLE `kelompok` (
  `id_kelompok` int(11) NOT NULL,
  `nim_ketua` varchar(20) NOT NULL,
  `nip_dosen` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kelompok`
--

INSERT INTO `kelompok` (`id_kelompok`, `nim_ketua`, `nip_dosen`, `created_at`, `updated_at`) VALUES
(41, '2111523001', '12', '2024-06-24 04:09:23', '2024-06-24 04:09:23'),
(42, '2111523001', '12', '2024-06-24 04:10:53', '2024-06-24 04:10:53'),
(43, '2111522022', '153353', '2024-06-29 07:33:03', '2024-06-29 07:36:16'),
(44, '2111522022', '12', '2024-06-29 07:35:15', '2024-06-29 13:39:50'),
(45, '2111523001', '12', '2024-06-29 13:30:57', '2024-06-29 13:30:57'),
(49, '2111523016', '12', '2024-06-30 13:19:34', '2024-06-30 13:19:34');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim_ketua` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `nama` varchar(50) NOT NULL,
  `password` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim_ketua`, `created_at`, `updated_at`, `nama`, `password`) VALUES
('04835770845', '2024-06-30 13:56:42', '2024-06-30 13:56:42', 'nima', '$2b$10$Ep0DiZ2LOjFvBEX9OLWpz.rabiFAVKdzWbal1rXCgclFRmJOOQgBe'),
('075272', '2024-06-29 13:30:58', '2024-06-29 13:30:58', 'ciki', '$2b$10$fSD7df13LRy6qFLR2mUNNuPKNCguQEBRxNP.hCVSmUbJ5LwKRplXO'),
('1347180', '2024-06-29 13:32:07', '2024-06-29 13:32:07', 'ciko', '$2b$10$6uPbGSX5IYG.7rSnIkbjfu4uRMMmpWi.7QZnxA8lU/8ng1GDh8N8G'),
('138417073', '2024-06-30 13:19:34', '2024-06-30 13:19:34', 'Melati', '$2b$10$jAIymzJRgUi4HSW1C82DfO6wTgw3kyJIlBiTr5NbxUYkYgusgyuXS'),
('204752457', '2024-06-29 07:35:15', '2024-06-29 07:35:15', 'Noguci', '$2b$10$vplx.PwMbY30Qy0JOzuYFulZxDi7P9FGmdt9RLc5u0G2K4RconXzC'),
('2111522022', '2024-06-29 07:32:16', '2024-06-29 07:32:16', 'Rika', ''),
('2111522024', '2024-06-30 13:35:32', '2024-06-30 13:35:32', 'Ciki', '$2b$10$QNJvCTjbT8u4TZ5ETkOZ/O1g5.y4elL1wJ.9X8SytLHv0KFZCQEcm'),
('2111523001', '2024-06-24 04:05:12', '2024-06-24 04:05:12', 'Lutfi', '12345678'),
('2111523016', '2024-06-30 11:17:33', '2024-06-30 11:17:33', 'Aulia', '$2b$10$x28HdzYov9kc4kvuCVzYSe3J.5OkeWs3SK/HG2mLmtOrhiHVng8m6'),
('2111523056', '2024-06-29 07:33:03', '2024-06-29 07:33:03', 'Rima', '$2b$10$swX67YOGPKwb4vaMtrKPbedw6YNPRqDGsFOrP2bjakGj2Db5BBQYi'),
('2111529007', '2024-06-29 07:33:03', '2024-06-29 07:33:03', 'Maruko', '$2b$10$UktgxbyZzUQVphWgqvuB7.g4CJUKv7vYK2BB2GIs0LxKHliQTmuV.'),
('245820', '2024-06-29 13:42:29', '2024-06-29 13:42:29', 'Cipung', '$2b$10$TfBEa2r5JUKlpoYXmpLYTu4DAd6OXI/KmuarJ8xeDnrl.h26S7mNe'),
('25802457', '2024-06-29 13:40:58', '2024-06-29 13:40:58', 'Cipung', '$2b$10$2PNnxzjTGg55dhM2RVHf0ukEN6G/KmfdtF8XaAIv1drM2RaQKFVx6'),
('347134701', '2024-06-29 13:42:30', '2024-06-29 13:42:30', 'Abe', '$2b$10$Cap/GWYsE.mGkBpaedWmEOBsebLFBMfC3GP3xDMarblMqxSLzPPAu'),
('419341034', '2024-06-29 13:30:58', '2024-06-29 13:30:58', 'ciko', '$2b$10$ngsaMD3uRHD1Xafqlg.RyuGf.brbq736Bhs68QI1wPzGVyXO06J2W'),
('450257', '2024-06-30 13:19:34', '2024-06-30 13:19:34', 'Citra', '$2b$10$EDgbjpKcGdS.YPU85b7IqusiO6nkI00tBh9KblEJ886qtbYwtbnIS'),
('45720452', '2024-06-29 13:32:07', '2024-06-29 13:32:07', 'ciki', '$2b$10$T.QHHRzSG1v.29aejdicFOyPNa.w6K9XbRoAzrt3t3bvWNt2E0oq.'),
('459745027', '2024-06-24 04:09:23', '2024-06-24 04:09:23', 'Andini', '$2b$10$dFZY7uzfNgKCpUilSTHf1.qHECIQzkgc56Yp7c4p91U1jgqbjNrlq'),
('472805924572', '2024-06-29 07:35:15', '2024-06-29 07:35:15', 'Sakiko', '$2b$10$cmb9v83DLf8DSefhhMjcDufyRq/y5R5.RB20uLbcjy9bTaDvKc5cK'),
('49835490', '2024-06-24 04:01:01', '2024-06-24 04:01:01', 'Mice', '$2b$10$F2cYxDD.WpRHXTcDXx6Sr.Wlw/idF273jdQ.iInt.y71RQJ4lLUS.'),
('49850257', '2024-06-30 13:19:34', '2024-06-30 13:19:34', 'Bunga', '$2b$10$s.n0/NLULLa0QP3wceKLoOByOPrZ9Aal1AcauOUSVxzIDt9luj6Hu'),
('49854029', '2024-06-24 04:10:54', '2024-06-24 04:10:54', 'Mice', '$2b$10$vNElkasx3287xcC3a45TuOD8aqeZ/QXpXYLCpy4wKj9XG9i/t8eGy'),
('52045702475', '2024-06-24 04:09:23', '2024-06-24 04:09:23', 'Mayo', '$2b$10$EZYTcOKH0sj8GtyFB3jVDeROEECGwneitmtDHLBjeSy3XGueddsZS'),
('84186419346', '2024-06-24 04:10:54', '2024-06-24 04:10:54', 'Andini', '$2b$10$gdN2e3Kv9phWLrKebgue9.YBofVB38PPU9rOQcz0ud6kxZEE3cFmy'),
('9087502570', '2024-06-30 13:56:42', '2024-06-30 13:56:42', 'nami', '$2b$10$evq/YJ68kJ3.RtvfBySqtuT3Ft4RRT2CP7WXEfYN.N2gDTHmjMCKK'),
('934707', '2024-06-29 13:40:58', '2024-06-29 13:40:58', 'Abe', '$2b$10$E73W3aSRfb54BWgxBYYhw.dPyGN9S0eZnmSx/C1m4pSGCwbNkXg0O');

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan_kp`
--

CREATE TABLE `pengajuan_kp` (
  `id_pengajuan` char(36) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `id_kelompok` int(11) NOT NULL,
  `id_suratPengantar` char(36) DEFAULT NULL,
  `id_suratBalasan` char(36) DEFAULT NULL,
  `id_proposal` char(36) DEFAULT NULL,
  `id_suratTugas` char(36) DEFAULT NULL,
  `status_pengajuan` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengajuan_kp`
--

INSERT INTO `pengajuan_kp` (`id_pengajuan`, `nip`, `id_kelompok`, `id_suratPengantar`, `id_suratBalasan`, `id_proposal`, `id_suratTugas`, `status_pengajuan`, `created_at`, `updated_at`) VALUES
('3f8af1f8-3de0-4c85-9092-e96020125fc7', '12345678', 45, '598dac3d-5f02-448b-a07a-a032ce50c7c5', NULL, NULL, NULL, 'Diproses', '2024-06-29 13:30:57', '2024-06-29 13:30:57'),
('9758991b-d69c-4f41-8df0-9807e3c8f056', '12345678', 44, NULL, NULL, NULL, 'f947a492-8484-4d17-a744-543f15ae9842', 'Diproses', '2024-06-29 07:35:15', '2024-06-29 07:35:15'),
('a8ea86a6-9a07-4f0e-8e49-d7ff854282e3', '1234567890', 49, '27c76b03-4bc5-4135-bf0f-cfab507a8eed', NULL, NULL, NULL, 'Diproses', '2024-06-30 13:19:34', '2024-06-30 13:19:34');

-- --------------------------------------------------------

--
-- Table structure for table `proposal`
--

CREATE TABLE `proposal` (
  `id_proposal` char(36) NOT NULL,
  `tanggal_pengajuan` date NOT NULL,
  `judul_proposal` longtext NOT NULL,
  `perusahaan_tujuan` longtext NOT NULL,
  `lokasi` longtext NOT NULL,
  `file_proposal` varchar(256) NOT NULL,
  `status_proposal` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `proposal`
--

INSERT INTO `proposal` (`id_proposal`, `tanggal_pengajuan`, `judul_proposal`, `perusahaan_tujuan`, `lokasi`, `file_proposal`, `status_proposal`, `created_at`, `updated_at`) VALUES
('77a9e984-ca6f-4a9e-ba3c-e6f6841a544f', '2024-06-24', 'Proposal KP LLDIKTI X', 'LLDIKTI Wilayah X', 'Padang', '10 - Daftar Hadir Seminar KP (KP-006A).docx.pdf', 'Disetujui', '2024-06-30 13:52:56', '2024-06-30 13:53:26'),
('aa527569-9341-4901-899e-edfdc7f1675e', '0000-00-00', 'ini judul baru edit', 'telkomsel', 'padang baru edit', 'Colorful Playful Illustration 2024 Calendar.pdf', 'Disetujui', '2024-06-16 14:14:19', '2024-06-16 14:16:08');

-- --------------------------------------------------------

--
-- Table structure for table `sekretaris`
--

CREATE TABLE `sekretaris` (
  `nip` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `password` varchar(256) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sekretaris`
--

INSERT INTO `sekretaris` (`nip`, `nama`, `password`, `created_at`, `updated_at`) VALUES
('12345678', 'sekre SI', '$2b$10$Hw9JYg/AKKVkguYqy7AheuJpbzBHYmQkgzvyNqBNYHUqtWswa4jrC', '2024-06-16 14:11:52', '2024-06-16 14:11:52'),
('1234567890', 'Nindy', '$2b$10$j1JBIG.T9uRMakrVRDa9eOr.fW0hPEDG5WEbb4Biu1DEIugy4YROm', '2024-06-30 11:22:20', '2024-06-30 11:22:20');

-- --------------------------------------------------------

--
-- Table structure for table `surat_balasan`
--

CREATE TABLE `surat_balasan` (
  `id_suratBalasan` char(36) NOT NULL,
  `tanggal_pengajuan` date NOT NULL,
  `perusahaan_tujuan` longtext NOT NULL,
  `status` varchar(30) NOT NULL,
  `file_surat_balasan` varchar(256) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `surat_balasan`
--

INSERT INTO `surat_balasan` (`id_suratBalasan`, `tanggal_pengajuan`, `perusahaan_tujuan`, `status`, `file_surat_balasan`, `created_at`, `updated_at`) VALUES
('440f0ba2-1290-4a1c-b3c4-7fe4588458ae', '2024-12-12', 'zyx', 'Diterima', 'Colorful Playful Illustration 2024 Calendar.pdf', '2024-06-16 14:17:39', '2024-06-16 14:17:39');

-- --------------------------------------------------------

--
-- Table structure for table `surat_pengantar`
--

CREATE TABLE `surat_pengantar` (
  `id_suratPengantar` char(36) NOT NULL,
  `perusahaan_tujuan` longtext NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `file_suratPengantar` varchar(256) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `no` varchar(25) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `surat_pengantar`
--

INSERT INTO `surat_pengantar` (`id_suratPengantar`, `perusahaan_tujuan`, `tanggal_mulai`, `tanggal_selesai`, `file_suratPengantar`, `status`, `no`, `created_at`, `updated_at`) VALUES
('00badde9-0b34-43f1-a928-b7dba78423bf', 'LLDIKTI Wilayah X', '2024-06-25', '2024-07-25', NULL, 'diproses', 'SURAT-0006', '2024-06-23 16:28:54', '2024-06-23 16:28:54'),
('071ca4e9-8ab6-42f3-b579-ebc95a1ec0bc', 'Kantor Gubernur', '2024-06-27', '2024-06-29', NULL, 'diproses', 'SURAT-0001', '2024-06-23 16:36:15', '2024-06-23 16:36:15'),
('129cc5a4-8bcf-4fce-a0e8-3b0b1f4a5495', 'LLDIKTI Wilayah X', '2024-06-25', '2024-06-25', NULL, 'diproses', 'SURAT-0001', '2024-06-23 16:33:08', '2024-06-23 16:33:08'),
('27c76b03-4bc5-4135-bf0f-cfab507a8eed', 'LLDIKTI Wilayah X', '2024-07-01', '2024-07-13', '27c76b03-4bc5-4135-bf0f-cfab507a8eed.surat_pengantar.pdf', 'diproses', 'SURAT-0019', '2024-06-30 13:19:34', '2024-06-30 13:19:35'),
('29e7d759-24ab-46ed-9678-3639bf47d3a6', 'ytey8', '2024-06-20', '2024-06-21', NULL, 'diproses', 'SURAT-0001', '2024-06-20 03:22:06', '2024-06-20 03:22:06'),
('35492337-a295-4297-9cf5-4d4ea440bbeb', 'ytey8', '2024-06-20', '2024-06-21', NULL, 'diproses', 'SURAT-0001', '2024-06-20 03:16:28', '2024-06-20 03:16:28'),
('4ada8332-4cb3-430a-8fb3-39ca6f531a60', 'ytey8', '2024-06-20', '2024-06-21', '4ada8332-4cb3-430a-8fb3-39ca6f531a60.surat_pengantar.pdf', 'diproses', 'SURAT-0001', '2024-06-20 03:18:10', '2024-06-20 03:18:11'),
('5721d0bd-d4a0-43b4-9349-c594dc850fa4', 'LLDIKTI Wilayah X', '2024-06-28', '2024-07-06', '5721d0bd-d4a0-43b4-9349-c594dc850fa4.surat_pengantar.pdf', 'diproses', 'SURAT-0018', '2024-06-29 13:40:57', '2024-06-29 13:40:59'),
('598dac3d-5f02-448b-a07a-a032ce50c7c5', 'LLDIKTI Wilayah X', '2024-06-30', '2024-07-06', '598dac3d-5f02-448b-a07a-a032ce50c7c5.surat_pengantar.pdf', 'ditolak', 'SURAT-0017', '2024-06-29 13:30:57', '2024-06-29 13:40:13'),
('654969f5-bbea-4022-ae0c-e682d5991545', 'LLDIKTI Wilayah X', '2024-06-25', '2024-06-27', '654969f5-bbea-4022-ae0c-e682d5991545.surat_pengantar.pdf', 'diproses', 'SURAT-0013', '2024-06-24 02:55:33', '2024-06-24 02:55:34'),
('78b24a27-9011-457d-a2af-e6d1846044d2', 'ytey8', '2024-06-20', '2024-06-21', '78b24a27-9011-457d-a2af-e6d1846044d2.surat_pengantar.pdf', 'diproses', 'SURAT-0001', '2024-06-20 03:22:22', '2024-06-20 03:26:11'),
('7d0c14b0-c577-47fc-8a51-c95f5008fb9b', 'LLDIKTI Wilayah X', '2024-07-01', '2024-07-13', '7d0c14b0-c577-47fc-8a51-c95f5008fb9b.surat_pengantar.pdf', 'diproses', 'SURAT-0020', '2024-06-30 13:56:42', '2024-06-30 13:56:43'),
('83fb8921-a14b-4c20-b7f8-1e3e64d065dc', 'Kantor Gubernur', '2024-06-27', '2024-06-29', NULL, 'diproses', 'SURAT-0001', '2024-06-23 16:45:18', '2024-06-23 16:45:18'),
('9a3e6692-dbe0-4bcc-9e4a-2f601214caf7', 'LLDIKTI Wilayah X', '2024-06-25', '2024-06-27', NULL, 'diproses', 'SURAT-0011', '2024-06-24 02:47:54', '2024-06-24 02:47:54'),
('a0920eb8-c96e-4803-90e6-846e997f0dbb', 'LLDIKTI Wilayah X', '2024-06-25', '2024-06-26', 'a0920eb8-c96e-4803-90e6-846e997f0dbb.surat_pengantar.pdf', 'ditolak', 'SURAT-0014', '2024-06-24 03:02:43', '2024-06-24 03:03:50'),
('d044a4f7-5ec8-4732-8d2e-3e220502fd86', 'LLDIKTI Wilayah X', '2024-06-25', '2024-07-25', NULL, 'diproses', 'SURAT-0006', '2024-06-23 16:28:42', '2024-06-23 16:28:42'),
('d82bd19c-e9c3-4be7-995c-acbb1fa57047', 'ytey8', '2024-06-20', '2024-06-21', NULL, 'diproses', 'SURAT-0001', '2024-06-20 03:17:26', '2024-06-20 03:17:26'),
('dd787de6-da41-498f-87d3-11fcc9ea394d', 'LLDIKTI Wilayah X', '2024-06-30', '2024-07-06', 'dd787de6-da41-498f-87d3-11fcc9ea394d.surat_pengantar.pdf', 'diproses', 'SURAT-0018', '2024-06-29 13:32:07', '2024-06-29 13:32:08'),
('e2f5b697-6dfd-42cb-8c64-298dde22a082', 'LLDIKTI Wilayah X', '2024-06-25', '2024-06-27', NULL, 'diproses', 'SURAT-0011', '2024-06-24 02:18:32', '2024-06-24 02:18:32'),
('e5768a64-05dc-4fdc-ad2d-d35d0b8c5d4d', 'LLDIKTI Wilayah X', '2024-06-25', '2024-06-28', 'e5768a64-05dc-4fdc-ad2d-d35d0b8c5d4d.surat_pengantar.pdf', 'ditolak', 'SURAT-0015', '2024-06-24 04:01:00', '2024-06-24 04:01:25'),
('jhg', 'uy', '2024-06-20', '2024-06-25', 'jhg.surat_pengantar.pdf', '', 'ww', '2024-06-20 02:50:28', '2024-06-20 03:07:20');

-- --------------------------------------------------------

--
-- Table structure for table `surat_tugas`
--

CREATE TABLE `surat_tugas` (
  `id_surat_tugas` char(36) NOT NULL,
  `perusahaan_tujuan` longtext NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `file_surat_tugas` varchar(256) DEFAULT NULL,
  `status` varchar(30) NOT NULL,
  `no` varchar(25) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `surat_tugas`
--

INSERT INTO `surat_tugas` (`id_surat_tugas`, `perusahaan_tujuan`, `tanggal_mulai`, `tanggal_selesai`, `file_surat_tugas`, `status`, `no`, `created_at`, `updated_at`) VALUES
('02fcf759-1455-44b7-9445-43655df74060', 'ytey8', '2024-06-20', '2024-06-21', NULL, 'diproses', 'SURAT-0027', '2024-06-20 02:23:59', '2024-06-20 02:23:59'),
('2d3ee109-77e5-4803-91c4-ebadb6f679ce', '5tr', '2024-06-19', '2024-06-28', NULL, 'diproses', 'SURAT-0005', '2024-06-20 00:03:36', '2024-06-20 00:03:36'),
('357f8dc3-5e65-44ea-8407-5c54855d741b', 'ytey8', '2024-06-27', '2024-06-28', NULL, 'diproses', '', '2024-06-20 02:19:21', '2024-06-20 02:19:21'),
('3c00b4df-85ec-49e2-8552-e828de1bd83c', 'ytey8', '2024-06-27', '2024-06-28', NULL, 'diproses', '', '2024-06-20 02:19:48', '2024-06-20 02:19:48'),
('3c15bc5d-1b6b-47e6-8d34-7f944f1da1a0', 'ytey8', '2024-06-27', '2024-06-28', NULL, 'diproses', 'SURAT-0019', '2024-06-20 02:16:15', '2024-06-20 02:16:15'),
('45ab61a5-551d-452b-a3a1-57011919ed26', 'ytey8', '2024-06-20', '2024-06-21', NULL, 'diproses', 'SURAT-0011', '2024-06-20 02:25:09', '2024-06-20 02:25:09'),
('4a900258-3685-40e1-8099-4fe42df05336', 'Kantor Gubernur', '2024-06-25', '2024-06-25', NULL, 'diproses', 'SURAT-0017', '2024-06-24 03:10:28', '2024-06-24 03:10:28'),
('4d7151a4-804b-458a-a2d8-309e20f47bd3', 'ytey8', '2024-06-27', '2024-07-05', NULL, 'diproses', 'SURAT-0019', '2024-06-20 01:37:43', '2024-06-20 01:37:43'),
('58a7c03e-d74d-4e3b-9d90-a48dfc961307', '5tr', '2024-06-19', '2024-06-28', NULL, 'diproses', 'SURAT-0001', '2024-06-19 23:58:45', '2024-06-19 23:58:45'),
('61f8bd91-fb2b-4fcc-9252-26f6e56270d6', '5tr', '2024-06-19', '2024-06-28', NULL, 'diproses', 'SURAT-0002', '2024-06-20 00:00:54', '2024-06-20 00:00:54'),
('6f806c5e-629c-4d0a-8132-5f3fa33bae60', 'Kantor Gubernur', '2024-06-25', '2024-06-25', NULL, 'diproses', 'SURAT-0017', '2024-06-24 03:10:35', '2024-06-24 03:10:35'),
('72480c2e-fe48-4977-ad60-a34a1baf2aa1', 'Kantor Gubernur', '2024-06-25', '2024-06-25', NULL, 'diproses', 'SURAT-0017', '2024-06-24 03:06:47', '2024-06-24 03:06:47'),
('77ae7c00-d0f7-4127-9199-55a55589cba0', 'Unand', '2024-06-29', '2024-07-06', '77ae7c00-d0f7-4127-9199-55a55589cba0.surat_tugas.pdf', 'diproses', 'SURAT-0024', '2024-06-29 13:42:29', '2024-06-29 13:42:30'),
('7b2528cc-c61e-4d33-9f73-a13699dbf955', '5tr', '2024-06-19', '2024-06-28', NULL, 'diproses', '', '2024-06-19 23:58:40', '2024-06-19 23:58:40'),
('86e7cfa6-5801-49d3-afcb-c5db24eecad1', 'ytey8', '2024-06-27', '2024-06-28', NULL, 'diproses', 'SURAT-0001', '2024-06-20 02:17:00', '2024-06-20 02:17:00'),
('9d2bb3a8-1d8d-4c72-b37e-89031bca1dd6', 'Kantor Gubernur', '2024-06-25', '2024-06-25', NULL, 'diproses', 'SURAT-0017', '2024-06-24 03:06:39', '2024-06-24 03:06:39'),
('a2640c74-2b10-46d8-80a1-14311346b121', '5tr', '2024-06-19', '2024-06-28', NULL, 'diproses', 'SURAT-0003', '2024-06-20 00:01:28', '2024-06-20 00:01:28'),
('c0464815-904d-47f1-af77-16605b462c77', '5tr', '2024-06-19', '2024-06-28', 'c0464815-904d-47f1-af77-16605b462c77.surat_tugas.pdf', 'diproses', 'SURAT-0010', '2024-06-20 00:04:10', '2024-06-20 02:30:50'),
('cf61002c-94ef-4497-806f-5b0d37e3e90d', 'bumi pacah', '2024-06-27', '2024-06-28', 'cf61002c-94ef-4497-806f-5b0d37e3e90d.surat_tugas.pdf', 'diproses', 'SURAT-0018', '2024-06-20 02:32:14', '2024-06-20 02:32:15'),
('e54b2317-5af0-45d6-9b46-c455d70b4a81', 'ytey8', '2024-06-27', '2024-06-28', NULL, 'diproses', '', '2024-06-20 02:20:18', '2024-06-20 02:20:18'),
('ef502429-c0c0-4fee-9679-7eb159833f38', 'bumi', '2024-06-28', '2024-06-29', 'ef502429-c0c0-4fee-9679-7eb159833f38.surat_tugas.pdf', 'diproses', 'SURAT-0018', '2024-06-20 02:27:54', '2024-06-20 02:29:44'),
('f8a3052a-dfe0-4489-9f83-c3b0096da325', 'LLDIKTI Wilayah X', '2024-06-25', '2024-06-27', 'f8a3052a-dfe0-4489-9f83-c3b0096da325.surat_tugas.pdf', 'diproses', 'SURAT-0022', '2024-06-24 04:02:03', '2024-06-24 04:02:03'),
('f947a492-8484-4d17-a744-543f15ae9842', 'Unand', '2024-06-29', '2024-07-06', 'f947a492-8484-4d17-a744-543f15ae9842.surat_tugas.pdf', 'diproses', 'SURAT-0023', '2024-06-29 07:35:15', '2024-06-29 07:35:15'),
('fd5b5bc6-f370-4a16-9191-66e32ed751f9', 'Kantor Gubernur', '2024-06-25', '2024-06-25', 'fd5b5bc6-f370-4a16-9191-66e32ed751f9.surat_tugas.pdf', 'diproses', 'SURAT-0017', '2024-06-24 03:15:28', '2024-06-24 03:15:28'),
('hgtfrds', 'gl', '2024-06-10', '2024-06-19', 'hgtfrds.surat_tugas.pdf', '', 'u765', '2024-06-19 22:35:02', '2024-06-19 23:26:08');

-- --------------------------------------------------------

--
-- Table structure for table `token_mahasiswa`
--

CREATE TABLE `token_mahasiswa` (
  `id_token` int(36) NOT NULL,
  `token` varchar(256) NOT NULL,
  `nim_ketua` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `expires_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `token_mahasiswa`
--

INSERT INTO `token_mahasiswa` (`id_token`, `token`, `nim_ketua`, `created_at`, `expires_at`) VALUES
(6, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaW0iOiIyMTExNTIzMDE2IiwiaWF0IjoxNzE5NzQ2NjU4LCJleHAiOjE3MjAzNTE0NTh9.wMCnnsk_8_7AFk05Lfu1zEYQDGmpHP5OTbD7I8s5Aqk', '2111523016', '2024-06-30 11:23:08', '2024-07-07'),
(7, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaW0iOiIyMTExNTIzMDE2IiwiaWF0IjoxNzE5NzQ3OTAwLCJleHAiOjE3MjAzNTI3MDB9.HxXaB_9ljZuBMoTRVubAGgFSfqESjw9j3DCpAzjj13A', '2111523016', '2024-06-30 11:23:08', '2024-07-07'),
(8, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaW0iOiIyMTExNTIzMDE2IiwiaWF0IjoxNzE5NzQ3OTYzLCJleHAiOjE3MjAzNTI3NjN9.OPmmm-pQTpQ-3uRakaFomEj2lKlzlCtCBU9ZHMwhs_g', '2111523016', '2024-06-30 11:45:51', '2024-07-07'),
(9, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaW0iOiIyMTExNTIzMDE2IiwiaWF0IjoxNzE5NzQ4MDMxLCJleHAiOjE3MjAzNTI4MzF9.Mmk_06DBu6btc92oGyIxi_suRyM2XFE7YtUjtRR7zmI', '2111523016', '2024-06-30 11:45:51', '2024-07-07'),
(10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaW0iOiIyMTExNTIzMDE2IiwiaWF0IjoxNzE5NzQ4NTkzLCJleHAiOjE3MjAzNTMzOTN9.uOtjoF20QIMwrNOj3NiWPV-yuQh0TtO-1PjNA2b9vTk', '2111523016', '2024-06-30 11:56:28', '2024-07-07'),
(11, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaW0iOiIyMTExNTIzMDE2IiwiaWF0IjoxNzE5NzQ5ODY2LCJleHAiOjE3MjAzNTQ2NjZ9.u-m98HTxkWPCjUUS7cvnhZU7aD97xtYVOKdhoGEAQwI', '2111523016', '2024-06-30 12:16:57', '2024-07-07'),
(12, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaW0iOiIyMTExNTIzMDE2IiwiaWF0IjoxNzE5NzUxNzYzLCJleHAiOjE3MjAzNTY1NjN9.pfXKBRxE0HpG02bfobD4cr3ivcRe5j3hnpsn4BsMxMs', '2111523016', '2024-06-30 12:49:09', '2024-07-07'),
(13, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaW0iOiIyMTExNTIzMDE2IiwiaWF0IjoxNzE5NzUyNjMzLCJleHAiOjE3MjAzNTc0MzN9.fINyg_ldBziReQ7gEpMqZ6F7Qsn-OZGPmxWM54SKL2E', '2111523016', '2024-06-30 13:03:38', '2024-07-07'),
(14, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaW0iOiIyMTExNTIzMDE2IiwiaWF0IjoxNzE5NzUzMzU0LCJleHAiOjE3MjAzNTgxNTR9.6UB0w-vYi4Y3n-yEeN-bmc1rq0VDTFdGbCIu-ckYyIo', '2111523016', '2024-06-30 13:15:46', '2024-07-07'),
(15, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaW0iOiIyMTExNTIzMDE2IiwiaWF0IjoxNzE5NzUzNjgxLCJleHAiOjE3MjAzNTg0ODF9.c6N8I4Ruyme5awCjU1bIT6UewqvdvQfaMC8t1tNNoGw', '2111523016', '2024-06-30 13:20:07', '2024-07-07'),
(16, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaW0iOiIyMTExNTIyMDI0IiwiaWF0IjoxNzE5NzU0NTkwLCJleHAiOjE3MjAzNTkzOTB9.3Ldua5KMoYo1KCTX_OTjwXsyoT-wkICxB1AiYQ6M22k', '2111522024', '2024-06-30 13:36:04', '2024-07-07'),
(17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaW0iOiIyMTExNTIyMDI0IiwiaWF0IjoxNzE5NzU0NjcwLCJleHAiOjE3MjAzNTk0NzB9.SLeAUSLdjS4UxkcbT6vi2HE0501R3ssaE8HoUA6Wvlg', '2111522024', '2024-06-30 13:37:29', '2024-07-07'),
(18, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaW0iOiIyMTExNTIyMDI0IiwiaWF0IjoxNzE5NzU1OTMwLCJleHAiOjE3MjAzNjA3MzB9.ZU3g0tGzKkjQJefbQPj_5S-LzwsK2kW2kUZi_LCC1EQ', '2111522024', '2024-06-30 13:58:24', '2024-07-07'),
(19, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaW0iOiIyMTExNTIyMDI0IiwiaWF0IjoxNzE5NzU2MDk3LCJleHAiOjE3MjAzNjA4OTd9.u7bFdkwQdzkARvWdWBIWWkg8dodFfal3rg3M3S_Jea4', '2111522024', '2024-06-30 14:00:43', '2024-07-07');

-- --------------------------------------------------------

--
-- Table structure for table `token_sekretaris`
--

CREATE TABLE `token_sekretaris` (
  `id_token` int(36) NOT NULL,
  `token` varchar(256) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `expires_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `token_sekretaris`
--

INSERT INTO `token_sekretaris` (`id_token`, `token`, `nip`, `created_at`, `expires_at`) VALUES
(3, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaXAiOiIxMjM0NTY3OCIsImlhdCI6MTcxODU0NzU2NCwiZXhwIjoxNzE5MTUyMzY0fQ.n7tOXzTx2BalSvGjG3HfN8Fpmu9D206HOHCWGf5bCRM', '12345678', '2024-06-16 14:09:21', '2024-06-23'),
(4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaXAiOiIxMjM0NTY3OCIsImlhdCI6MTcxODgzNTU2MywiZXhwIjoxNzE5NDQwMzYzfQ.y4PFoMZPY_W53S1rZoFOqmT8IBJsoQjkp86H1z0KDxE', '12345678', '2024-06-19 22:18:08', '2024-06-27'),
(5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaXAiOiIxMjM0NTY3OCIsImlhdCI6MTcxODgzNTY0MCwiZXhwIjoxNzE5NDQwNDQwfQ.U2RnssY2-MjfjHyx32C7Rm_NdjepzrXGrlM92gdME-8', '12345678', '2024-06-19 22:18:08', '2024-06-27'),
(6, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaXAiOiIxMjM0NTY3OCIsImlhdCI6MTcxOTExMDgxOCwiZXhwIjoxNzE5NzE1NjE4fQ.84uDrZuUxDPWl5ZjfthbDrM5K6hK2505E1rMvx3IyXI', '12345678', '2024-06-23 02:46:48', '2024-06-30'),
(7, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaXAiOiIxMjM0NTY3OCIsImlhdCI6MTcxOTExMzIxMywiZXhwIjoxNzE5NzE4MDEzfQ.rud2I4-glcE0_yIDsOqfBA0uk2cl7fQBoBOVKWmvEVE', '12345678', '2024-06-23 03:26:07', '2024-06-30'),
(8, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaXAiOiIxMjM0NTY3OCIsImlhdCI6MTcxOTE1OTYyMiwiZXhwIjoxNzE5NzY0NDIyfQ.T4GFzfQm9RqJB6ErXE7UKaSsUYQALKElfWgMcIrTMLo', '12345678', '2024-06-23 16:16:51', '2024-06-30'),
(9, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaXAiOiIxMjM0NTY3OCIsImlhdCI6MTcxOTE1OTkzNCwiZXhwIjoxNzE5NzY0NzM0fQ.l9FdeX6kic1dMvT02lWPgIIR-1zZBHGDc_v2rb7AZMU', '12345678', '2024-06-23 16:16:51', '2024-06-30'),
(10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaXAiOiIxMjM0NTY3OCIsImlhdCI6MTcxOTE2MDAyOCwiZXhwIjoxNzE5NzY0ODI4fQ.jQtZKCfik_HhlLCo044p6Sa5oTS0tpNwqBA_rk1KuKs', '12345678', '2024-06-23 16:16:51', '2024-06-30'),
(11, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaXAiOiIxMjM0NTY3OCIsImlhdCI6MTcxOTE2MDMyNywiZXhwIjoxNzE5NzY1MTI3fQ.YAT3r-UIGj3ffeQHsFs5K24aLEZRBXeuNCVbbfeqOag', '12345678', '2024-06-23 16:31:18', '2024-06-30'),
(12, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaXAiOiIxMjM0NTY3OCIsImlhdCI6MTcxOTE2MDMyOCwiZXhwIjoxNzE5NzY1MTI4fQ.AG0Z426q1Ra-ZngbpXkcQm47yf0h3lJ6RIKajhUAwzY', '12345678', '2024-06-23 16:31:18', '2024-06-30'),
(13, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaXAiOiIxMjM0NTY3OCIsImlhdCI6MTcxOTE2MTA0MiwiZXhwIjoxNzE5NzY1ODQyfQ.epFobNPigNlcjoPi9wZenV47AVo5Gd1dFfjmt3aWG0g', '12345678', '2024-06-23 16:43:21', '2024-06-30'),
(14, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaXAiOiIxMjM0NTY3OCIsImlhdCI6MTcxOTE5NTQ2NiwiZXhwIjoxNzE5ODAwMjY2fQ.omXcMleoJF_9zDvU2y90zZoiuUt86kHH1nrJxLaSDF0', '12345678', '2024-06-24 02:17:06', '2024-07-01'),
(15, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaXAiOiIxMjM0NTY3OCIsImlhdCI6MTcxOTE5OTIzMiwiZXhwIjoxNzE5ODA0MDMyfQ.JWpBAQWJPF4PPlHRhfcA17AVxFK6sndi0I7Hf3tpHF0', '12345678', '2024-06-24 02:17:06', '2024-07-01'),
(16, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaXAiOiIxMjM0NTY3OCIsImlhdCI6MTcxOTE5OTI0OCwiZXhwIjoxNzE5ODA0MDQ4fQ.7aDy-nD2oWO6FEWvdVsnfbEhtoNGdsIJmJe1V5-j9uA', '12345678', '2024-06-24 02:17:06', '2024-07-01'),
(17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaXAiOiIxMjM0NTY3OCIsImlhdCI6MTcxOTE5OTMxNywiZXhwIjoxNzE5ODA0MTE3fQ.WlPi9yy20PXLpCdmZybhD_XAcEXLf48NSu16npelwAY', '12345678', '2024-06-24 03:21:26', '2024-07-01'),
(18, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaXAiOiIxMjM0NTY3OCIsImlhdCI6MTcxOTIwMDA0MSwiZXhwIjoxNzE5ODA0ODQxfQ.H6hv-VLWwCuWm2MkbVBMxA3e3SQDW4xWORfMMVyVVfo', '12345678', '2024-06-24 03:21:26', '2024-07-01'),
(19, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaXAiOiIxMjM0NTY3OCIsImlhdCI6MTcxOTIwMDM5MCwiZXhwIjoxNzE5ODA1MTkwfQ.NWnP5VYBXt3ghZTr-pnu8PPsyagHJJc7P0V76fG8HHU', '12345678', '2024-06-24 03:38:59', '2024-07-01'),
(20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaXAiOiIxMjM0NTY3OCIsImlhdCI6MTcxOTIwMDg0OSwiZXhwIjoxNzE5ODA1NjQ5fQ.MAG6de1mY3s8rGyiPjwaWuVEHwdxYludCVOsZYvkKTU', '12345678', '2024-06-24 03:47:21', '2024-07-01'),
(21, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaXAiOiIxMjM0NTY3OCIsImlhdCI6MTcxOTIwMDg4MSwiZXhwIjoxNzE5ODA1NjgxfQ.2hnkO4eUzIoFGu5XXIkPVJmRTMs1IpQCpxQG2ftDIkA', '12345678', '2024-06-24 03:47:21', '2024-07-01'),
(22, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaXAiOiIxMjM0NTY3OCIsImlhdCI6MTcxOTIwMDk2MywiZXhwIjoxNzE5ODA1NzYzfQ.hs88vAFn9W_NvRlLm-qHplF1DPes-V3UI-pqCXU8PDw', '12345678', '2024-06-24 03:47:21', '2024-07-01'),
(23, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaXAiOiIxMjM0NTY3OCIsImlhdCI6MTcxOTIwMTI4OCwiZXhwIjoxNzE5ODA2MDg4fQ.x6UzcEWEctXEuOYHlabx1g5ZSDKhXPVzbjQevKkwoAw', '12345678', '2024-06-24 03:47:21', '2024-07-01'),
(24, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaXAiOiIxMjM0NTY3OCIsImlhdCI6MTcxOTIwMTU2NiwiZXhwIjoxNzE5ODA2MzY2fQ.KjRznmbhwIv1AtUmVlRACQxos92oEZS-9q_4bMxYsJg', '12345678', '2024-06-24 03:47:21', '2024-07-01'),
(25, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaXAiOiIxMjM0NTY3OCIsImlhdCI6MTcxOTIwMTk3NiwiZXhwIjoxNzE5ODA2Nzc2fQ.1QKHLyDDKjAlBUBvL4XQWjUSiQJGf3bacnXwtuMDXUk', '12345678', '2024-06-24 03:47:21', '2024-07-01'),
(26, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaXAiOiIxMjM0NTY3OCIsImlhdCI6MTcxOTIwMjA2MCwiZXhwIjoxNzE5ODA2ODYwfQ.L-_MLRi5Re1S2k9k6GUSIuVyBRsRobi0yxETX9MqUu4', '12345678', '2024-06-24 03:47:21', '2024-07-01'),
(27, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaXAiOiIxMjM0NTY3OCIsImlhdCI6MTcxOTY0NTY2NSwiZXhwIjoxNzIwMjUwNDY1fQ.kz0gIU-JI9qiyTfWLfquyWZVZHBrDMwT1yxcL6mlUkU', '12345678', '2024-06-29 07:20:33', '2024-07-06'),
(28, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaXAiOiIxMjM0NTY3OCIsImlhdCI6MTcxOTY2Nzc1OCwiZXhwIjoxNzIwMjcyNTU4fQ.ZdVLS3QeIwzn4DsIdYx-YijIrGgg8DNhd3nRZmejcQI', '12345678', '2024-06-29 13:28:57', '2024-07-06'),
(29, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaXAiOiIxMjM0NTY3OCIsImlhdCI6MTcxOTc0NDM1MywiZXhwIjoxNzIwMzQ5MTUzfQ.At6uLZq4E8scrYDFv0fIqKeyO_YGIz1WbwVxZtKoiWw', '12345678', '2024-06-30 10:45:21', '2024-07-07'),
(30, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaXAiOiIxMjM0NTY3ODkwIiwiaWF0IjoxNzE5NzQ2NTk3LCJleHAiOjE3MjAzNTEzOTd9.wEp57FaHg_TxLZx8iOnItwtxmRyfZw0koMUxZMaEL4A', '1234567890', '2024-06-30 11:23:08', '2024-07-07'),
(31, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaXAiOiIxMjM0NTY3ODkwIiwiaWF0IjoxNzE5NzUzMTI1LCJleHAiOjE3MjAzNTc5MjV9.4I26_RgMuQrlekBHtbgPFuisjHf8tlj2l1Fj9p2Upu4', '1234567890', '2024-06-30 13:06:24', '2024-07-07'),
(32, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaXAiOiIxMjM0NTY3ODkwIiwiaWF0IjoxNzE5NzUzNTI1LCJleHAiOjE3MjAzNTgzMjV9.VpEFsXgXZJmId37huBdJqbXoyZvt8WSyfOWM5hZzcA4', '1234567890', '2024-06-30 13:18:21', '2024-07-07'),
(33, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaXAiOiIxMjM0NTY3ODkwIiwiaWF0IjoxNzE5NzU1NzI4LCJleHAiOjE3MjAzNjA1Mjh9.stWV48aBuwDwT-wWgZr0D352NKMxQ6ntHsP2VR46vwM', '1234567890', '2024-06-30 13:54:46', '2024-07-07'),
(34, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaXAiOiIxMjM0NTY3ODkwIiwiaWF0IjoxNzE5NzU2MjUwLCJleHAiOjE3MjAzNjEwNTB9.dwTWD8EgBkqOa8Zz6sML-Kp5lABaquewNdbtOTk07M8', '1234567890', '2024-06-30 14:00:43', '2024-07-07'),
(35, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaXAiOiIxMjM0NTY3ODkwIiwiaWF0IjoxNzE5NzU2MjYzLCJleHAiOjE3MjAzNjEwNjN9.SLDGyheYwXDMYcpUGqr1fQSgLgcBx_vCN1BdqvHPczc', '1234567890', '2024-06-30 14:00:43', '2024-07-07'),
(36, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaXAiOiIxMjM0NTY3ODkwIiwiaWF0IjoxNzE5NzU2MzQ0LCJleHAiOjE3MjAzNjExNDR9.P6NnLi6O9rReNmr-GSDuJ-Fj1-m2mZ9FvgU9CYoNrjA', '1234567890', '2024-06-30 14:05:04', '2024-07-07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`),
  ADD KEY `id_kelompok` (`id_kelompok`);

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`nip`);

--
-- Indexes for table `kelompok`
--
ALTER TABLE `kelompok`
  ADD PRIMARY KEY (`id_kelompok`),
  ADD KEY `nim_ketua` (`nim_ketua`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim_ketua`);

--
-- Indexes for table `pengajuan_kp`
--
ALTER TABLE `pengajuan_kp`
  ADD PRIMARY KEY (`id_pengajuan`),
  ADD KEY `nip` (`nip`,`id_kelompok`,`id_suratPengantar`,`id_suratBalasan`,`id_proposal`,`id_suratTugas`),
  ADD KEY `id_kelompok` (`id_kelompok`),
  ADD KEY `id_suratBalasan` (`id_suratBalasan`),
  ADD KEY `id_suratPengantar` (`id_suratPengantar`),
  ADD KEY `id_suratTugas` (`id_suratTugas`),
  ADD KEY `id_proposal` (`id_proposal`);

--
-- Indexes for table `proposal`
--
ALTER TABLE `proposal`
  ADD PRIMARY KEY (`id_proposal`);

--
-- Indexes for table `sekretaris`
--
ALTER TABLE `sekretaris`
  ADD PRIMARY KEY (`nip`);

--
-- Indexes for table `surat_balasan`
--
ALTER TABLE `surat_balasan`
  ADD PRIMARY KEY (`id_suratBalasan`);

--
-- Indexes for table `surat_pengantar`
--
ALTER TABLE `surat_pengantar`
  ADD PRIMARY KEY (`id_suratPengantar`);

--
-- Indexes for table `surat_tugas`
--
ALTER TABLE `surat_tugas`
  ADD PRIMARY KEY (`id_surat_tugas`);

--
-- Indexes for table `token_mahasiswa`
--
ALTER TABLE `token_mahasiswa`
  ADD PRIMARY KEY (`id_token`),
  ADD KEY `nim_ketua` (`nim_ketua`);

--
-- Indexes for table `token_sekretaris`
--
ALTER TABLE `token_sekretaris`
  ADD PRIMARY KEY (`id_token`),
  ADD KEY `nip` (`nip`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kelompok`
--
ALTER TABLE `kelompok`
  MODIFY `id_kelompok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `token_mahasiswa`
--
ALTER TABLE `token_mahasiswa`
  MODIFY `id_token` int(36) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `token_sekretaris`
--
ALTER TABLE `token_sekretaris`
  MODIFY `id_token` int(36) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anggota`
--
ALTER TABLE `anggota`
  ADD CONSTRAINT `anggota_ibfk_1` FOREIGN KEY (`id_kelompok`) REFERENCES `kelompok` (`id_kelompok`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kelompok`
--
ALTER TABLE `kelompok`
  ADD CONSTRAINT `kelompok_ibfk_1` FOREIGN KEY (`nim_ketua`) REFERENCES `mahasiswa` (`nim_ketua`) ON DELETE CASCADE;

--
-- Constraints for table `pengajuan_kp`
--
ALTER TABLE `pengajuan_kp`
  ADD CONSTRAINT `pengajuan_kp_ibfk_1` FOREIGN KEY (`id_kelompok`) REFERENCES `kelompok` (`id_kelompok`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengajuan_kp_ibfk_3` FOREIGN KEY (`id_suratBalasan`) REFERENCES `surat_balasan` (`id_suratBalasan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengajuan_kp_ibfk_4` FOREIGN KEY (`id_suratPengantar`) REFERENCES `surat_pengantar` (`id_suratPengantar`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengajuan_kp_ibfk_5` FOREIGN KEY (`id_suratTugas`) REFERENCES `surat_tugas` (`id_surat_tugas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengajuan_kp_ibfk_6` FOREIGN KEY (`nip`) REFERENCES `sekretaris` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengajuan_kp_ibfk_7` FOREIGN KEY (`id_proposal`) REFERENCES `proposal` (`id_proposal`);

--
-- Constraints for table `token_mahasiswa`
--
ALTER TABLE `token_mahasiswa`
  ADD CONSTRAINT `token_mahasiswa_ibfk_1` FOREIGN KEY (`nim_ketua`) REFERENCES `mahasiswa` (`nim_ketua`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `token_sekretaris`
--
ALTER TABLE `token_sekretaris`
  ADD CONSTRAINT `token_sekretaris_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `sekretaris` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
