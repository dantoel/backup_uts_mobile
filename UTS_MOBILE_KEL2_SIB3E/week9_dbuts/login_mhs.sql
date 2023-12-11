-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2023 at 03:01 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `week9_dbuts`
--

-- --------------------------------------------------------

--
-- Table structure for table `login_mhs`
--

CREATE TABLE `login_mhs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nim` int(11) NOT NULL,
  `nama_mhs` varchar(255) NOT NULL,
  `status_akhir` varchar(255) NOT NULL,
  `ipk` double NOT NULL,
  `total_sks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `login_mhs`
--

INSERT INTO `login_mhs` (`id`, `nim`, `nama_mhs`, `status_akhir`, `ipk`, `total_sks`) VALUES
(1, 1841720001, 'mhs_1', 'Lulus', 3.68, 154),
(2, 1841720002, 'mhs_2', 'Lulus', 3.87, 146),
(3, 1841720003, 'mhs_3', 'Lulus', 3.75, 146),
(4, 1841720004, 'mhs_4', 'Lulus', 3.79, 146),
(5, 1841720005, 'mhs_5', 'Lulus', 3.73, 146),
(6, 1841720006, 'mhs_6', 'Keluar/Mengundurkan Diri', 2.67, 115),
(7, 1841720007, 'mhs_7', 'Mengulang Karena Tidak Lulus Tugas Akhir', 3.01, 146),
(8, 1841720008, 'mhs_8', 'Tidak Aktif Mengulang TA (Mahasiswa Tidak Jelas)', 3.44, 154),
(9, 1841720009, 'mhs_9', 'Lulus', 3.46, 146),
(10, 1841720010, 'mhs_10', 'Lulus', 3.73, 146),
(11, 1841720011, 'mhs_11', 'Lulus', 3.47, 146),
(12, 1841720012, 'mhs_12', 'Lulus', 3.82, 146),
(13, 1841720013, 'mhs_13', 'Lulus', 3.37, 146),
(14, 1841720014, 'mhs_14', 'Lulus', 3.75, 146),
(15, 1841720015, 'mhs_15', 'Lulus', 3.47, 146),
(16, 1841720016, 'mhs_16', 'Lulus', 3.72, 146),
(17, 1841720017, 'mhs_17', 'Lulus', 3.6, 146),
(18, 1841720018, 'mhs_18', 'Tidak Aktif Mengulang TA (Mahasiswa Tidak Jelas)', 2.98, 146),
(19, 1841720019, 'mhs_19', 'Lulus', 3.96, 146),
(20, 1841720020, 'mhs_20', 'Lulus', 3.67, 146),
(21, 1841720021, 'mhs_21', 'Lulus', 3.17, 146),
(22, 1841720022, 'mhs_22', 'Lulus', 3.53, 146),
(23, 1841720023, 'mhs_23', 'Lulus', 3.65, 146),
(24, 1841720024, 'mhs_24', 'Lulus', 3.9, 146),
(25, 1841720025, 'mhs_25', 'Tidak Aktif Mengulang TA (Mahasiswa Tidak Jelas)', 3.4, 146),
(26, 1841720026, 'mhs_26', 'Mengulang Karena Tidak Lulus Tugas Akhir', 3.36, 146),
(27, 1841720027, 'mhs_27', 'Lulus', 2.94, 146),
(28, 1841720028, 'mhs_28', 'Lulus', 3.87, 146),
(29, 1841720029, 'mhs_29', 'Lulus', 3.52, 146),
(30, 1841720030, 'mhs_30', 'Lulus', 3.51, 146),
(31, 1841720031, 'mhs_31', 'Keluar/Mengundurkan Diri', 0, 0),
(32, 1841720032, 'mhs_32', 'Lulus', 3.29, 146),
(33, 1841720033, 'mhs_33', 'Lulus', 3.72, 146),
(34, 1841720034, 'mhs_34', 'Lulus', 3.73, 146),
(35, 1841720035, 'mhs_35', 'Keluar/Mengundurkan Diri', 0, 0),
(36, 1841720036, 'mhs_36', 'Lulus', 3.61, 146),
(37, 1841720037, 'mhs_37', 'Lulus', 3.25, 146),
(38, 1841720038, 'mhs_38', 'MD MABA', 0, 0),
(39, 1841720039, 'mhs_39', 'Tidak Aktif Mengulang TA (Mahasiswa Tidak Jelas)', 2.64, 146),
(40, 1841720040, 'mhs_40', 'Mengulang Karena Tidak Lulus Tugas Akhir', 3.51, 146),
(41, 1841720041, 'mhs_41', 'Lulus', 3.91, 146),
(42, 1841720042, 'mhs_42', 'Mengulang Karena Tidak Lulus Tugas Akhir', 3.35, 146),
(43, 1841720043, 'mhs_43', 'Lulus', 3.83, 146),
(44, 1841720044, 'mhs_44', 'Lulus', 3.83, 146),
(45, 1841720045, 'mhs_45', 'Lulus', 3.7, 154),
(46, 1841720046, 'mhs_46', 'Lulus', 3, 146),
(47, 1841720047, 'mhs_47', 'Mengulang Karena Tidak Lulus Tugas Akhir', 3.29, 134),
(48, 1841720048, 'mhs_48', 'Lulus', 3.76, 146),
(49, 1841720049, 'mhs_49', 'Lulus', 3.64, 154),
(50, 1841720050, 'mhs_50', 'MD MABA', 0, 0),
(51, 1841720051, 'mhs_51', 'Lulus', 3.87, 146),
(52, 1841720052, 'mhs_52', 'Lulus', 3.65, 146),
(53, 1841720053, 'mhs_53', 'Lulus', 3.31, 154),
(54, 1841720054, 'mhs_54', 'Lulus', 3.77, 146),
(55, 1841720055, 'mhs_55', 'MD MABA', 0, 0),
(56, 1841720056, 'mhs_56', 'MD MABA', 0, 0),
(57, 1841720057, 'mhs_57', 'Lulus', 3.34, 146),
(58, 1841720058, 'mhs_58', 'Tidak Aktif Mengulang TA (Mahasiswa Tidak Jelas)', 3.54, 146),
(59, 1841720059, 'mhs_59', 'Lulus', 3.73, 146),
(60, 1841720060, 'mhs_60', 'Lulus', 3.8, 146),
(61, 1841720061, 'mhs_61', 'Lulus', 3.4, 146),
(62, 1841720062, 'mhs_62', 'Lulus', 3.56, 146),
(63, 1841720063, 'mhs_63', 'MD MABA', 0, 0),
(64, 1841720064, 'mhs_64', 'Tidak Aktif Mengulang TA (Mahasiswa Tidak Jelas)', 3.29, 146),
(65, 1841720065, 'mhs_65', 'Lulus', 3.37, 146),
(66, 1841720066, 'mhs_66', 'Lulus', 3.57, 146),
(67, 1841720067, 'mhs_67', 'MD MABA', 0, 0),
(68, 1841720068, 'mhs_68', 'Lulus', 3.61, 146),
(69, 1841720069, 'mhs_69', 'Mengulang Karena Tidak Lulus Tugas Akhir', 3.6, 134),
(70, 1841720070, 'mhs_70', 'Lulus', 3.27, 146),
(71, 1841720071, 'mhs_71', 'MD MABA', 0, 0),
(72, 1841720072, 'mhs_72', 'Lulus', 3.63, 146),
(73, 1841720073, 'mhs_73', 'Lulus', 2.64, 146),
(74, 1841720074, 'mhs_74', 'Lulus', 3.55, 146),
(75, 1841720075, 'mhs_75', 'Lulus', 2.87, 146),
(76, 1841720076, 'mhs_76', 'Lulus', 3.94, 154),
(77, 1841720077, 'mhs_77', 'Keluar/Mengundurkan Diri', 2.35, 113),
(78, 1841720078, 'mhs_78', 'Lulus', 3.42, 146),
(79, 1841720079, 'mhs_79', 'Tidak Aktif Mengulang TA (Mahasiswa Tidak Jelas)', 3.42, 146),
(80, 1841720080, 'mhs_80', 'Lulus', 3.09, 146),
(81, 1841720081, 'mhs_81', 'Lulus', 3.71, 146),
(82, 1841720082, 'mhs_82', 'Lulus', 3.57, 146),
(83, 1841720083, 'mhs_83', 'Lulus', 3.53, 146),
(84, 1841720084, 'mhs_84', 'Lulus', 3.59, 146),
(85, 1841720085, 'mhs_85', 'Lulus', 3.64, 146),
(86, 1841720086, 'mhs_86', 'Lulus', 3.32, 146),
(87, 1841720087, 'mhs_87', 'Lulus', 3.91, 146),
(88, 1841720088, 'mhs_88', 'Lulus', 3.53, 146),
(89, 1841720089, 'mhs_89', 'Lulus', 3.28, 146),
(90, 1841720090, 'mhs_90', 'Lulus', 3.63, 146),
(91, 1841720091, 'mhs_91', 'Keluar/Mengundurkan Diri', 0, 0),
(92, 1841720092, 'mhs_92', 'Lulus', 3.48, 146),
(93, 1841720093, 'mhs_93', 'Keluar/Mengundurkan Diri', 0, 0),
(94, 1841720094, 'mhs_94', 'Lulus', 3.56, 146),
(95, 1841720095, 'mhs_95', 'Lulus', 3.56, 146),
(96, 1841720096, 'mhs_96', 'Lulus', 3.31, 146),
(97, 1841720097, 'mhs_97', 'Lulus', 3.48, 146),
(98, 1841720098, 'mhs_98', 'Lulus', 3.65, 146),
(99, 1841720099, 'mhs_99', 'Lulus', 3.73, 146),
(100, 1841720100, 'mhs_100', 'Lulus', 3.53, 146),
(101, 1841720101, 'mhs_101', 'Keluar/Mengundurkan Diri', 0, 0),
(102, 1841720102, 'mhs_102', 'Lulus', 3.66, 146),
(103, 1841720103, 'mhs_103', 'Keluar/Mengundurkan Diri', 0, 0),
(104, 1841720104, 'mhs_104', 'Lulus', 3.21, 146),
(105, 1841720105, 'mhs_105', 'Lulus', 3.6, 146),
(106, 1841720106, 'mhs_106', 'MD MABA', 0, 0),
(107, 1841720107, 'mhs_107', 'Mengulang Karena Tidak Lulus Tugas Akhir', 3.45, 146),
(108, 1841720108, 'mhs_108', 'Lulus', 3.82, 146),
(109, 1841720109, 'mhs_109', 'Lulus', 3.22, 146),
(110, 1841720110, 'mhs_110', 'Lulus', 3.63, 146),
(111, 1841720111, 'mhs_111', 'Lulus', 3.52, 146),
(112, 1841720112, 'mhs_112', 'Mengulang Karena Tidak Lulus Tugas Akhir', 3.38, 146),
(113, 1841720113, 'mhs_113', 'Lulus', 3.63, 146),
(114, 1841720114, 'mhs_114', 'MD TDU setelah Cuti/TRM', 0, 0),
(115, 1841720115, 'mhs_115', 'Lulus', 2.82, 146),
(116, 1841720116, 'mhs_116', 'Lulus', 2.99, 146),
(117, 1841720117, 'mhs_117', 'Lulus', 3.43, 146),
(118, 1841720118, 'mhs_118', 'Lulus', 3.17, 146),
(119, 1841720119, 'mhs_119', 'Keluar/Mengundurkan Diri', 0, 0),
(120, 1841720120, 'mhs_120', 'Lulus', 3.5, 146),
(121, 1841720121, 'mhs_121', 'Mengulang Karena Tidak Lulus Tugas Akhir', 3.29, 146),
(122, 1841720122, 'mhs_122', 'Tidak Aktif Mengulang TA (Mahasiswa Tidak Jelas)', 3.07, 146),
(123, 1841720123, 'mhs_123', 'Lulus', 3.5, 146),
(124, 1841720124, 'mhs_124', 'Lulus', 3.24, 146),
(125, 1841720125, 'mhs_125', 'Lulus', 3.47, 146),
(126, 1841720126, 'mhs_126', 'Lulus', 3.55, 146),
(127, 1841720127, 'mhs_127', 'Mengulang Karena Tidak Lulus Tugas Akhir', 2.8, 146),
(128, 1841720128, 'mhs_128', 'Lulus', 3.53, 146),
(129, 1841720129, 'mhs_129', 'Lulus', 3.64, 146),
(130, 1841720130, 'mhs_130', 'Lulus', 3.52, 146),
(131, 1841720131, 'mhs_131', 'Lulus', 3.42, 146),
(132, 1841720132, 'mhs_132', 'Lulus', 3.49, 146),
(133, 1841720133, 'mhs_133', 'Lulus', 3.4, 146),
(134, 1841720134, 'mhs_134', 'Lulus', 3.57, 146),
(135, 1841720135, 'mhs_135', 'Lulus', 3.01, 146),
(136, 1841720136, 'mhs_136', 'Mengulang Karena Tidak Lulus Tugas Akhir', 2.64, 146),
(137, 1841720137, 'mhs_137', 'Lulus', 3.47, 146),
(138, 1841720138, 'mhs_138', 'Lulus', 3.54, 146),
(139, 1841720139, 'mhs_139', 'Lulus', 2.88, 146),
(140, 1841720140, 'mhs_140', 'Keluar/Mengundurkan Diri', 0, 0),
(141, 1841720141, 'mhs_141', 'Keluar/Mengundurkan Diri', 0, 0),
(142, 1841720142, 'mhs_142', 'Lulus', 3.21, 146),
(143, 1841720143, 'mhs_143', 'Lulus', 3.56, 146),
(144, 1841720144, 'mhs_144', 'Keluar/Mengundurkan Diri', 0, 0),
(145, 1841720145, 'mhs_145', 'Lulus', 3.61, 154),
(146, 1841720146, 'mhs_146', 'Lulus', 3.41, 146),
(147, 1841720147, 'mhs_147', 'Lulus', 3.73, 146),
(148, 1841720148, 'mhs_148', 'Tidak Aktif Mengulang TA (Mahasiswa Tidak Jelas)', 2.57, 146),
(149, 1841720149, 'mhs_149', 'Lulus', 3.3, 146),
(150, 1841720150, 'mhs_150', 'Lulus', 3.52, 146),
(151, 1841720151, 'mhs_151', 'Lulus', 3.67, 146),
(152, 1841720152, 'mhs_152', 'Lulus', 3.64, 146),
(153, 1841720153, 'mhs_153', 'Lulus', 3.46, 146),
(154, 1841720154, 'mhs_154', 'Lulus', 3.71, 146),
(155, 1841720155, 'mhs_155', 'Lulus', 3.28, 146),
(156, 1841720156, 'mhs_156', 'Lulus', 3.4, 146),
(157, 1841720157, 'mhs_157', 'Lulus', 3.95, 146),
(158, 1841720158, 'mhs_158', 'Lulus', 3.63, 154),
(159, 1841720159, 'mhs_159', 'Lulus', 3.6, 146),
(160, 1841720160, 'mhs_160', 'Mengulang Karena Tidak Lulus Tugas Akhir', 2.54, 114),
(161, 1841720161, 'mhs_161', 'Lulus', 3.37, 146),
(162, 1841720162, 'mhs_162', 'Lulus', 3.63, 115),
(163, 1841720163, 'mhs_163', 'Lulus', 3.8, 154),
(164, 1841720164, 'mhs_164', 'Lulus', 3.53, 146),
(165, 1841720165, 'mhs_165', 'Lulus', 3.62, 146),
(166, 1841720166, 'mhs_166', 'Lulus', 3.5, 146),
(167, 1841720167, 'mhs_167', 'Lulus', 3.73, 146),
(168, 1841720168, 'mhs_168', 'Lulus', 3.67, 146),
(169, 1841720169, 'mhs_169', 'Lulus', 3.11, 146),
(170, 1841720170, 'mhs_170', 'Lulus', 3.14, 146),
(171, 1841720171, 'mhs_171', 'Lulus', 3.47, 154),
(172, 1841720172, 'mhs_172', 'Lulus', 3.77, 146),
(173, 1841720173, 'mhs_173', 'Mengulang Karena Tidak Lulus Tugas Akhir', 3.13, 146),
(174, 1841720174, 'mhs_174', 'Lulus', 3.72, 146),
(175, 1841720175, 'mhs_175', 'Lulus', 3.6, 154),
(176, 1841720176, 'mhs_176', 'Mengulang Karena Tidak Lulus Tugas Akhir', 3.13, 146),
(177, 1841720177, 'mhs_177', 'Lulus', 3.37, 146),
(178, 1841720178, 'mhs_178', 'Lulus', 3.58, 146),
(179, 1841720179, 'mhs_179', 'Lulus', 3.55, 146),
(180, 1841720180, 'mhs_180', 'Lulus', 2.85, 146),
(181, 1841720181, 'mhs_181', 'Lulus', 3.78, 146),
(182, 1841720182, 'mhs_182', 'Lulus', 3.51, 146),
(183, 1841720183, 'mhs_183', 'Lulus', 3.82, 146),
(184, 1841720184, 'mhs_184', 'Lulus', 3.81, 154),
(185, 1841720185, 'mhs_185', 'Lulus', 3.14, 146),
(186, 1841720186, 'mhs_186', 'Lulus', 3.54, 146),
(187, 1841720187, 'mhs_187', 'Lulus', 3.9, 146),
(188, 1841720188, 'mhs_188', 'Lulus', 3.66, 146),
(189, 1841720189, 'mhs_189', 'Lulus', 3.2, 146),
(190, 1841720190, 'mhs_190', 'Tidak Aktif Mengulang TA (Mahasiswa Tidak Jelas)', 2.86, 146),
(191, 1841720191, 'mhs_191', 'Lulus', 3.75, 146),
(192, 1841720192, 'mhs_192', 'Lulus', 3.36, 146),
(193, 1841720193, 'mhs_193', 'Lulus', 3.86, 146),
(194, 1841720194, 'mhs_194', 'Lulus', 3.5, 146),
(195, 1841720195, 'mhs_195', 'Lulus', 3.23, 146),
(196, 1841720196, 'mhs_196', 'Lulus', 3.62, 146),
(197, 1841720197, 'mhs_197', 'Lulus', 3.59, 146),
(198, 1841720198, 'mhs_198', 'Lulus', 3.47, 146),
(199, 1841720199, 'mhs_199', 'Tidak Aktif Mengulang TA (Mahasiswa Tidak Jelas)', 2.97, 146),
(200, 1841720200, 'mhs_200', 'Lulus', 3.14, 146),
(201, 1841720201, 'mhs_201', 'Lulus', 3.73, 146),
(202, 1841720202, 'mhs_202', 'Keluar/Mengundurkan Diri', 0, 0),
(203, 1841720203, 'mhs_203', 'Keluar/Mengundurkan Diri', 0, 0),
(204, 1841720204, 'mhs_204', 'Lulus', 3.62, 146),
(205, 1841720205, 'mhs_205', 'Keluar/Mengundurkan Diri', 0, 0),
(206, 1841720206, 'mhs_206', 'Lulus', 3.41, 134),
(207, 1841720207, 'mhs_207', 'Lulus', 3.71, 146),
(208, 1841720208, 'mhs_208', 'Lulus', 3.41, 146),
(209, 1841720209, 'mhs_209', 'Lulus', 3.33, 146),
(210, 1841720210, 'mhs_210', 'Lulus', 3.68, 146),
(211, 1841720211, 'mhs_211', 'Lulus', 3.57, 146),
(212, 1841720212, 'mhs_212', 'Lulus', 3.98, 146),
(213, 1841720213, 'mhs_213', 'Keluar/Mengundurkan Diri', 2.94, 113),
(214, 1841720214, 'mhs_214', 'Lulus', 3.62, 146),
(215, 1841720215, 'mhs_215', 'Lulus', 3.73, 146),
(216, 1841720216, 'mhs_216', 'Lulus', 3.81, 154),
(217, 1841720217, 'mhs_217', 'Lulus', 3.56, 146),
(218, 1841720218, 'mhs_218', 'Mengulang Karena Tidak Lulus Tugas Akhir', 2.45, 115),
(219, 1841720219, 'mhs_219', 'Lulus', 3.68, 146),
(220, 1841720220, 'mhs_220', 'Lulus', 3.59, 146),
(221, 1841720221, 'mhs_221', 'Lulus', 3.37, 146),
(222, 1841720222, 'mhs_222', 'Lulus', 3.51, 146),
(223, 1841720223, 'mhs_223', 'Lulus', 3.03, 146),
(224, 1841720224, 'mhs_224', 'Keluar/Mengundurkan Diri', 0, 0),
(225, 1841720225, 'mhs_225', 'Lulus', 3.55, 146);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `login_mhs`
--
ALTER TABLE `login_mhs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `login_mhs`
--
ALTER TABLE `login_mhs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
