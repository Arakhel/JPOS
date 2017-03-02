-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2017 at 07:33 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_akt_aktiva`
--

CREATE TABLE `tbl_akt_aktiva` (
  `id` int(11) NOT NULL,
  `tgl_simpan` date NOT NULL,
  `kode` varchar(50) NOT NULL,
  `keterangan` varchar(160) CHARACTER SET latin1 NOT NULL,
  `debet` decimal(13,2) NOT NULL,
  `kredit` decimal(13,2) NOT NULL,
  `tipe` enum('0','1','2','3','4') CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_akt_aktiva`
--

INSERT INTO `tbl_akt_aktiva` (`id`, `tgl_simpan`, `kode`, `keterangan`, `debet`, `kredit`, `tipe`) VALUES
(4, '2017-02-03', '00001', 'Kendaraan', '0.00', '7000000.00', '0'),
(7, '2017-02-03', '00002', 'Inventaris', '0.00', '2825000.00', '0'),
(12, '2017-02-03', '00001', 'Program', '0.00', '5330000.00', '1'),
(13, '2017-02-03', '00002', 'Amortisasi', '2900000.00', '0.00', '1'),
(14, '2017-02-03', '00003', 'PPTT', '800000.00', '0.00', '0');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_akt_ekuitas`
--

CREATE TABLE `tbl_akt_ekuitas` (
  `id` int(11) NOT NULL,
  `tgl_simpan` date NOT NULL,
  `kode` varchar(50) NOT NULL,
  `keterangan` text NOT NULL,
  `nominal` decimal(32,2) NOT NULL,
  `tipe` enum('0','1','2','3') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_akt_ekuitas`
--

INSERT INTO `tbl_akt_ekuitas` (`id`, `tgl_simpan`, `kode`, `keterangan`, `nominal`, `tipe`) VALUES
(1, '2017-02-03', '00001', 'Laba Tahun Berjalan', '2486136.00', '0');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_akt_kas`
--

CREATE TABLE `tbl_akt_kas` (
  `id` int(11) NOT NULL,
  `tgl_simpan` datetime NOT NULL,
  `kode` varchar(50) NOT NULL,
  `keterangan` varchar(160) NOT NULL,
  `debet` decimal(10,0) NOT NULL,
  `kredit` decimal(10,0) NOT NULL,
  `saldo` decimal(10,0) NOT NULL,
  `status_kas` enum('0','1','2','3') NOT NULL,
  `status_saldo` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_akt_kas`
--

INSERT INTO `tbl_akt_kas` (`id`, `tgl_simpan`, `kode`, `keterangan`, `debet`, `kredit`, `saldo`, `status_kas`, `status_saldo`) VALUES
(1, '2017-02-03 00:00:00', '00001', 'Kas', '13037800', '13037800', '13037800', '0', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_hutang`
--

CREATE TABLE `tbl_hutang` (
  `id` int(5) NOT NULL,
  `tgl` datetime NOT NULL,
  `kode` varchar(160) NOT NULL,
  `hutang` varchar(160) NOT NULL,
  `jumlah` int(100) NOT NULL,
  `nominal` int(100) NOT NULL,
  `debet` decimal(32,2) NOT NULL,
  `kredit` decimal(32,2) NOT NULL,
  `saldo` decimal(32,2) NOT NULL,
  `status_hutang` enum('0','1') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_hutang`
--

INSERT INTO `tbl_hutang` (`id`, `tgl`, `kode`, `hutang`, `jumlah`, `nominal`, `debet`, `kredit`, `saldo`, `status_hutang`) VALUES
(14, '2017-02-03 00:00:00', '00001', 'Hutang Usaha', 0, 21965127, '0.00', '21965127.00', '0.00', '0'),
(15, '2017-02-03 00:00:00', '00002', 'Hutang Lainnya', 0, 3600000, '600000.00', '3000000.00', '3000000.00', '0'),
(16, '2017-02-03 00:00:00', '00003', 'Hutang Antar Unit', 0, 114725000, '0.00', '114725000.00', '0.00', '0'),
(19, '2017-02-18 00:00:00', '00002', 'Bayar Hutang Lainnya', 0, 3600000, '500000.00', '2500000.00', '2500000.00', '0'),
(20, '2017-02-18 00:00:00', '00002', 'Bayar Bayar Hutang Lainnya', 0, 3600000, '2500000.00', '0.00', '0.00', '0');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_inventori`
--

CREATE TABLE `tbl_inventori` (
  `id_inventori` int(11) NOT NULL,
  `kode_barang` int(11) NOT NULL,
  `nama` int(11) NOT NULL,
  `jml` int(11) NOT NULL,
  `status` varchar(160) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ion_groups`
--

CREATE TABLE `tbl_ion_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_ion_groups`
--

INSERT INTO `tbl_ion_groups` (`id`, `name`, `description`) VALUES
(1, 'superadmin', 'Super Administrator'),
(8, 'kasir', 'Bagian Kasir'),
(9, 'gudang', 'Bagian Gudang'),
(11, 'owner', 'Master aplikasi owner');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ion_login_attempts`
--

CREATE TABLE `tbl_ion_login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ion_login_history`
--

CREATE TABLE `tbl_ion_login_history` (
  `id` int(11) NOT NULL,
  `createAt` datetime NOT NULL,
  `updateAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ion_users`
--

CREATE TABLE `tbl_ion_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` text NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_ion_users`
--

INSERT INTO `tbl_ion_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', 'admin1234', '', 'admin@admin.com', '', NULL, NULL, 'n9t1wtr0.dGPLyL9', 1268889823, 1487480792, 1, 'Super Administrator', 'Administrator', 'ADMIN', '0'),
(17, '::1', 'kasir1', '$2y$08$MOU6MNfaM2l7TW34W/8bWuThNHCPxJW293CI/JYTxVqk8Xh7Drmrm', 'ekxkU5ePAgE3IrcZ', 'admin@admin.com', NULL, NULL, NULL, '8eHbau1qyOQIKQx3', 1468046555, 1487296853, 1, 'Kasir Satu', NULL, NULL, NULL),
(18, '127.0.0.1', 'kasir2', '$2y$08$bUSBHgw2XYx5nMSsAH/WG.KO/xAotbD0pG8/.5wA3ElENCWenyjVW', 'AeabnzjO18Tyfmc3', 'admin@admin.com', NULL, NULL, NULL, NULL, 1485330860, NULL, 1, 'kkk', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ion_users_groups`
--

CREATE TABLE `tbl_ion_users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_ion_users_groups`
--

INSERT INTO `tbl_ion_users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(22, 17, 8),
(23, 18, 8);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_karyawan`
--

CREATE TABLE `tbl_karyawan` (
  `id` int(2) NOT NULL,
  `id_jabatan` int(11) NOT NULL,
  `first_name` varchar(160) NOT NULL,
  `last_name` varchar(160) NOT NULL,
  `jns_klm` enum('L','P','O') NOT NULL,
  `alamat` text NOT NULL,
  `foto` varchar(100) NOT NULL,
  `no_hp` varchar(100) NOT NULL,
  `active` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_karyawan_jabatan`
--

CREATE TABLE `tbl_karyawan_jabatan` (
  `id` int(11) NOT NULL,
  `jabatan` varchar(160) NOT NULL,
  `keterangan` varchar(160) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kategori`
--

CREATE TABLE `tbl_kategori` (
  `id_kategori` int(11) NOT NULL,
  `kategori` varchar(160) NOT NULL,
  `ket` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_kategori`
--

INSERT INTO `tbl_kategori` (`id_kategori`, `kategori`, `ket`) VALUES
(10, 'Sembako', '-'),
(11, 'Snack', '-'),
(12, 'Minuman', '-'),
(13, 'rokok', 'Rokok'),
(14, 'Kebersihan', 'Kebersihan');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_meja`
--

CREATE TABLE `tbl_meja` (
  `id` int(2) NOT NULL,
  `no_meja` varchar(10) NOT NULL,
  `foto` varchar(56) NOT NULL,
  `status` int(2) NOT NULL,
  `use_id` varchar(160) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_metode_pemb`
--

CREATE TABLE `tbl_metode_pemb` (
  `no_nota` varchar(160) NOT NULL,
  `metode` enum('cash','credit','debet','lain') NOT NULL,
  `no_card` varchar(160) NOT NULL,
  `bank` varchar(160) NOT NULL,
  `ket` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_metode_pemb`
--

INSERT INTO `tbl_metode_pemb` (`no_nota`, `metode`, `no_card`, `bank`, `ket`) VALUES
('KSU.00001', 'cash', '0', '', ''),
('KSU.00002', 'cash', '0', '', ''),
('KSU.00003', 'cash', '0', '', ''),
('KSU.00004', 'cash', '0', '', ''),
('KSU.00005', 'cash', '0', '', ''),
('KSU.00006', 'cash', '0', '', ''),
('KSU.00007', 'cash', '0', '', ''),
('KSU.00008', 'cash', '0', '', ''),
('KSU.00009', 'cash', '0', '', ''),
('KSU.00010', 'cash', '0', '', ''),
('KSU.00011', 'cash', '0', '', ''),
('KSU.00012', 'cash', '0', '', ''),
('KSU.00013', 'cash', '0', '', ''),
('KSU.00014', 'cash', '0', '', ''),
('KSU.00015', 'cash', '0', '', ''),
('KSU.00016', 'cash', '0', '', ''),
('KSU.00017', 'cash', '0', '', ''),
('KSU.00018', 'cash', '0', '', ''),
('KSU.00019', 'cash', '0', '', ''),
('KSU.00020', 'cash', '0', '', ''),
('KSU.00021', 'cash', '0', '', ''),
('KSU.00022', 'cash', '0', '', ''),
('KSU.00023', 'cash', '0', '', ''),
('KSU.00024', 'cash', '0', '', ''),
('KSU.00025', 'cash', '0', '', ''),
('KSU.00026', 'cash', '0', '', ''),
('KSU.00027', 'cash', '0', '', ''),
('KSU.00028', 'cash', '0', '', ''),
('KSU.00029', 'cash', '0', '', ''),
('KSU.00030', 'cash', '0', '', ''),
('KSU.00031', 'cash', '0', '', ''),
('KSU.00032', 'cash', '0', '', ''),
('KSU.00033', 'cash', '0', '', ''),
('KSU.00034', 'cash', '0', '', ''),
('KSU.00035', 'cash', '0', '', ''),
('KSU.00036', 'cash', '0', '', ''),
('KSU.00037', 'cash', '0', '', ''),
('KSU.00038', 'cash', '0', '', ''),
('KSU.00039', 'cash', '0', '', ''),
('KSU.00040', 'cash', '0', '', ''),
('KSU.00041', 'cash', '0', '', ''),
('KSU.00042', 'cash', '0', '', ''),
('KSU.00043', 'cash', '0', '', ''),
('KSU.00044', 'cash', '0', '', ''),
('KSU.00045', 'cash', '0', '', ''),
('KSU.00047', 'cash', '0', '', ''),
('KSU.00048', 'cash', '0', '', ''),
('KSU.00049', 'cash', '0', '', ''),
('KSU.00050', 'cash', '0', '', ''),
('KSU.00051', 'cash', '0', '', ''),
('KSU.00052', 'cash', '0', '', ''),
('KSU.00053', 'cash', '0', '', ''),
('KSU.00054', 'cash', '0', '', ''),
('KSU.00055', 'cash', '0', '', ''),
('KSU.00056', 'cash', '0', '', ''),
('KSU.00057', 'cash', '0', '', ''),
('KSU.00058', 'cash', '0', '', ''),
('KSU.00059', 'cash', '0', '', ''),
('KSU.00060', 'cash', '0', '', ''),
('KSU.00061', 'cash', '0', '', ''),
('KSU.00062', 'cash', '0', '', ''),
('KSU.00063', 'cash', '0', '', ''),
('KSU.00064', 'cash', '0', '', ''),
('KSU.00065', 'cash', '0', '', ''),
('KSU.00066', 'cash', '0', '', ''),
('KSU.00067', 'cash', '0', '', ''),
('KSU.00068', 'cash', '0', '', ''),
('KSU.00069', 'cash', '0', '', ''),
('KSU.00070', 'cash', '0', '', ''),
('KSU.00071', 'cash', '0', '', ''),
('KSU.00072', 'cash', '0', '', ''),
('KSU.00073', 'cash', '0', '', ''),
('KSU.00074', 'cash', '0', '', ''),
('KSU.00075', 'cash', '0', '', ''),
('KSU.00076', 'cash', '0', '', ''),
('KSU.00077', 'cash', '0', '', ''),
('KSU.00078', 'cash', '0', '', ''),
('KSU.00079', 'cash', '0', '', ''),
('KSU.00080', 'cash', '0', '', ''),
('KSU.00081', 'cash', '0', '', ''),
('KSU.00082', 'cash', '0', '', ''),
('KSU.00083', 'cash', '0', '', ''),
('KSU.00084', 'cash', '0', '', ''),
('KSU.00085', 'cash', '0', '', ''),
('KSU.00086', 'cash', '0', '', ''),
('KSU.00087', 'cash', '0', '', ''),
('KSU.00088', 'cash', '0', '', ''),
('KSU.00089', 'cash', '0', '', ''),
('KSU.00090', 'cash', '0', '', ''),
('KSU.00091', 'cash', '0', '', ''),
('KSU.00092', 'cash', '0', '', ''),
('KSU.00093', 'cash', '0', '', ''),
('KSU.00094', 'cash', '0', '', ''),
('KSU.00095', 'cash', '0', '', ''),
('KSU.00096', 'cash', '0', '', ''),
('KSU.00097', 'cash', '0', '', ''),
('KSU.00098', 'cash', '0', '', ''),
('KSU.00099', 'cash', '0', '', ''),
('KSU.00100', 'cash', '0', '', ''),
('KSU.00101', 'cash', '0', '', ''),
('KSU.00102', 'cash', '0', '', ''),
('KSU.00103', 'cash', '0', '', ''),
('KSU.00104', 'cash', '0', '', ''),
('KSU.00105', 'cash', '0', '', ''),
('KSU.00106', 'cash', '0', '', ''),
('KSU.00107', 'cash', '0', '', ''),
('KSU.00108', 'cash', '0', '', ''),
('KSU.00109', 'cash', '0', '', ''),
('KSU.00110', 'cash', '0', '', ''),
('KSU.00111', 'cash', '0', '', ''),
('KSU.00112', 'cash', '0', '', ''),
('KSU.00113', 'cash', '0', '', ''),
('KSU.00114', 'cash', '0', '', ''),
('KSU.00115', 'cash', '0', '', ''),
('KSU.00116', 'cash', '0', '', ''),
('KSU.00117', 'cash', '0', '', ''),
('KSU.00118', 'cash', '0', '', ''),
('KSU.00119', 'cash', '0', '', ''),
('KSU.00120', 'cash', '0', '', ''),
('KSU.00121', 'cash', '0', '', ''),
('KSU.00122', 'cash', '0', '', ''),
('KSU.00123', 'cash', '0', '', ''),
('KSU.00124', 'cash', '0', '', ''),
('KSU.00125', 'cash', '0', '', ''),
('KSU.00126', 'cash', '0', '', ''),
('KSU.00127', 'cash', '0', '', ''),
('KSU.00128', 'cash', '0', '', ''),
('KSU.00129', 'cash', '0', '', ''),
('KSU.00130', 'cash', '0', '', ''),
('KSU.00131', 'cash', '0', '', ''),
('KSU.00132', 'cash', '0', '', ''),
('KSU.00133', 'cash', '0', '', ''),
('KSU.00134', 'cash', '0', '', ''),
('KSU.00135', 'cash', '0', '', ''),
('KSU.00136', 'cash', '0', '', ''),
('KSU.00137', 'cash', '0', '', ''),
('KSU.00138', 'cash', '0', '', ''),
('KSU.00139', 'cash', '0', '', ''),
('KSU.00140', 'cash', '0', '', ''),
('KSU.00141', 'cash', '0', '', ''),
('KSU.00142', 'cash', '0', '', ''),
('KSU.00143', 'cash', '0', '', ''),
('KSU.00144', 'cash', '0', '', ''),
('KSU.00145', 'cash', '0', '', ''),
('KSU.00146', 'cash', '0', '', ''),
('KSU.00147', 'cash', '0', '', ''),
('KSU.00148', 'cash', '0', '', ''),
('KSU.00149', 'cash', '0', '', ''),
('KSU.00150', 'cash', '0', '', ''),
('KSU.00151', 'cash', '0', '', ''),
('KSU.00152', 'cash', '0', '', ''),
('KSU.00153', 'cash', '0', '', ''),
('KSU.00154', 'cash', '0', '', ''),
('KSU.00155', 'cash', '0', '', ''),
('KSU.00156', 'cash', '0', '', ''),
('KSU.00157', 'cash', '0', '', ''),
('KSU.00158', 'cash', '0', '', ''),
('KSU.00159', 'cash', '0', '', ''),
('KSU.00160', 'cash', '0', '', ''),
('KSU.00161', 'cash', '0', '', ''),
('KSU.00162', 'cash', '0', '', ''),
('KSU.00163', 'cash', '0', '', ''),
('KSU.00164', 'cash', '0', '', ''),
('KSU.00165', 'cash', '0', '', ''),
('KSU.00166', 'cash', '0', '', ''),
('KSU.00167', 'cash', '0', '', ''),
('KSU.00168', 'cash', '0', '', ''),
('KSU.00169', 'cash', '0', '', ''),
('KSU.00170', 'cash', '0', '', ''),
('KSU.00171', 'cash', '0', '', ''),
('KSU.00172', 'cash', '0', '', ''),
('KSU.00173', 'cash', '0', '', ''),
('KSU.00174', 'cash', '0', '', ''),
('KSU.00175', 'cash', '0', '', ''),
('KSU.00176', 'cash', '0', '', ''),
('KSU.00177', 'cash', '0', '', ''),
('KSU.00178', 'cash', '0', '', ''),
('KSU.00179', 'cash', '0', '', ''),
('KSU.00180', 'cash', '0', '', ''),
('KSU.00181', 'cash', '0', '', ''),
('KSU.00182', 'cash', '0', '', ''),
('KSU.00183', 'cash', '0', '', ''),
('KSU.00184', 'cash', '0', '', ''),
('KSU.00185', 'cash', '0', '', ''),
('KSU.00186', 'cash', '0', '', ''),
('KSU.00187', 'cash', '0', '', ''),
('KSU.00188', 'cash', '0', '', ''),
('KSU.00190', 'cash', '0', '', ''),
('KSU.00191', 'cash', '0', '', ''),
('KSU.00192', 'cash', '0', '', ''),
('KSU.00193', 'cash', '0', '', ''),
('KSU.00194', 'cash', '0', '', ''),
('KSU.00195', 'cash', '0', '', ''),
('KSU.00196', 'cash', '0', '', ''),
('KSU.00197', 'cash', '0', '', ''),
('KSU.00198', 'cash', '0', '', ''),
('KSU.00199', 'cash', '0', '', ''),
('KSU.00200', 'cash', '0', '', ''),
('KSU.00201', 'cash', '0', '', ''),
('KSU.00202', 'cash', '0', '', ''),
('KSU.00203', 'cash', '0', '', ''),
('KSU.00204', 'cash', '0', '', ''),
('KSU.00205', 'cash', '0', '', ''),
('KSU.00206', 'cash', '0', '', ''),
('KSU.00207', 'cash', '0', '', ''),
('KSU.00208', 'cash', '0', '', ''),
('KSU.00209', 'cash', '0', '', ''),
('KSU.00210', 'cash', '0', '', ''),
('KSU.00211', 'cash', '0', '', ''),
('KSU.00212', 'cash', '0', '', ''),
('KSU.00213', 'cash', '0', '', ''),
('KSU.00214', 'cash', '0', '', ''),
('KSU.00216', 'cash', '0', '', ''),
('KSU.00217', 'cash', '0', '', ''),
('KSU.00218', 'cash', '0', '', ''),
('KSU.00219', 'cash', '0', '', ''),
('KSU.00220', 'cash', '0', '', ''),
('KSU.00221', 'cash', '0', '', ''),
('KSU.00222', 'cash', '0', '', ''),
('KSU.00223', 'cash', '0', '', ''),
('KSU.00224', 'cash', '0', '', ''),
('KSU.00226', 'cash', '0', '', ''),
('KSU.00227', 'cash', '0', '', ''),
('KSU.00228', 'cash', '0', '', ''),
('KSU.00229', 'cash', '0', '', ''),
('KSU.00230', 'cash', '0', '', ''),
('KSU.00231', 'cash', '0', '', ''),
('KSU.00233', 'cash', '0', '', ''),
('KSU.00234', 'cash', '0', '', ''),
('KSU.00235', 'cash', '0', '', ''),
('KSU.00236', 'cash', '0', '', ''),
('KSU.00237', 'cash', '0', '', ''),
('KSU.00238', 'cash', '0', '', ''),
('KSU.00239', 'cash', '0', '', ''),
('KSU.00240', 'cash', '0', '', ''),
('KSU.00241', 'cash', '0', '', ''),
('KSU.00242', 'cash', '0', '', ''),
('KSU.00243', 'cash', '0', '', ''),
('KSU.00244', 'cash', '0', '', ''),
('KSU.00245', 'cash', '0', '', ''),
('KSU.00247', 'cash', '0', '', ''),
('KSU.00248', 'cash', '0', '', ''),
('KSU.00249', 'cash', '0', '', ''),
('KSU.00250', 'cash', '0', '', ''),
('KSU.00251', 'cash', '0', '', ''),
('KSU.00252', 'cash', '0', '', ''),
('KSU.00253', 'cash', '0', '', ''),
('KSU.00254', 'cash', '0', '', ''),
('KSU.00255', 'cash', '0', '', ''),
('KSU.00256', 'cash', '0', '', ''),
('KSU.00257', 'cash', '0', '', ''),
('KSU.00258', 'cash', '0', '', ''),
('KSU.00259', 'cash', '0', '', ''),
('KSU.00261', 'cash', '0', '', ''),
('KSU.00262', 'cash', '0', '', ''),
('KSU.00263', 'cash', '0', '', ''),
('KSU.00265', 'cash', '0', '', ''),
('KSU.00266', 'cash', '0', '', ''),
('KSU.00267', 'cash', '0', '', ''),
('KSU.00269', 'cash', '0', '', ''),
('KSU.00270', 'cash', '0', '', ''),
('KSU.00271', 'cash', '0', '', ''),
('KSU.00272', 'cash', '0', '', ''),
('KSU.00273', 'cash', '0', '', ''),
('KSU.00274', 'cash', '0', '', ''),
('KSU.00275', 'cash', '0', '', ''),
('KSU.00276', 'cash', '0', '', ''),
('KSU.00277', 'cash', '0', '', ''),
('KSU.00278', 'cash', '0', '', ''),
('KSU.00279', 'cash', '0', '', ''),
('KSU.00280', 'cash', '0', '', ''),
('KSU.00281', 'cash', '0', '', ''),
('KSU.00282', 'cash', '0', '', ''),
('KSU.00283', 'cash', '0', '', ''),
('KSU.00284', 'cash', '0', '', ''),
('KSU.00285', 'cash', '0', '', ''),
('KSU.00286', 'cash', '0', '', ''),
('KSU.00287', 'cash', '0', '', ''),
('KSU.00288', 'cash', '0', '', ''),
('KSU.00289', 'cash', '0', '', ''),
('KSU.00290', 'cash', '0', '', ''),
('KSU.00291', 'cash', '0', '', ''),
('KSU.00292', 'cash', '0', '', ''),
('KSU.00293', 'cash', '0', '', ''),
('KSU.00294', 'cash', '0', '', ''),
('KSU.00295', 'cash', '0', '', ''),
('KSU.00296', 'cash', '0', '', ''),
('KSU.00297', 'cash', '0', '', ''),
('KSU.00298', 'cash', '0', '', ''),
('KSU.00299', 'cash', '0', '', ''),
('KSU.00300', 'cash', '0', '', ''),
('KSU.00301', 'cash', '0', '', ''),
('KSU.00302', 'cash', '0', '', ''),
('KSU.00303', 'cash', '0', '', ''),
('KSU.00304', 'cash', '0', '', ''),
('KSU.00305', 'cash', '0', '', ''),
('KSU.00306', 'cash', '0', '', ''),
('KSU.00307', 'cash', '0', '', ''),
('KSU.00308', 'cash', '0', '', ''),
('KSU.00309', 'cash', '0', '', ''),
('KSU.00310', 'cash', '0', '', ''),
('KSU.00311', 'cash', '0', '', ''),
('KSU.00312', 'cash', '0', '', ''),
('KSU.00313', 'cash', '0', '', ''),
('KSU.00314', 'cash', '0', '', ''),
('KSU.00315', 'cash', '0', '', ''),
('KSU.00316', 'cash', '0', '', ''),
('KSU.00317', 'cash', '0', '', ''),
('KSU.00318', 'cash', '0', '', ''),
('KSU.00319', 'cash', '0', '', ''),
('KSU.00320', 'cash', '0', '', ''),
('KSU.00321', 'cash', '0', '', ''),
('KSU.00322', 'cash', '0', '', ''),
('KSU.00323', 'cash', '0', '', ''),
('KSU.00324', 'cash', '0', '', ''),
('KSU.00325', 'cash', '0', '', ''),
('KSU.00326', 'cash', '0', '', ''),
('KSU.00327', 'cash', '0', '', ''),
('KSU.00328', 'cash', '0', '', ''),
('KSU.00329', 'cash', '0', '', ''),
('KSU.00330', 'cash', '0', '', ''),
('KSU.00331', 'cash', '0', '', ''),
('KSU.00332', 'cash', '0', '', ''),
('KSU.00333', 'cash', '0', '', ''),
('KSU.00334', 'cash', '0', '', ''),
('KSU.00335', 'cash', '0', '', ''),
('KSU.00336', 'cash', '0', '', ''),
('KSU.00337', 'cash', '0', '', ''),
('KSU.00338', 'cash', '0', '', ''),
('KSU.00339', 'cash', '0', '', ''),
('KSU.00340', 'cash', '0', '', ''),
('KSU.00341', 'cash', '0', '', ''),
('KSU.00342', 'cash', '0', '', ''),
('KSU.00343', 'cash', '0', '', ''),
('KSU.00344', 'cash', '0', '', ''),
('KSU.00345', 'cash', '0', '', ''),
('KSU.00346', 'cash', '0', '', ''),
('KSU.00347', 'cash', '0', '', ''),
('KSU.00348', 'cash', '0', '', ''),
('KSU.00349', 'cash', '0', '', ''),
('KSU.00350', 'cash', '0', '', ''),
('KSU.00351', 'cash', '0', '', ''),
('KSU.00352', 'cash', '0', '', ''),
('KSU.00353', 'cash', '0', '', ''),
('KSU.00354', 'cash', '0', '', ''),
('KSU.00355', 'cash', '0', '', ''),
('KSU.00356', 'cash', '0', '', ''),
('KSU.00357', 'cash', '0', '', ''),
('KSU.00358', 'cash', '0', '', ''),
('KSU.00359', 'cash', '0', '', ''),
('KSU.00360', 'cash', '0', '', ''),
('KSU.00361', 'cash', '0', '', ''),
('KSU.00362', 'cash', '0', '', ''),
('KSU.00363', 'cash', '0', '', ''),
('KSU.00365', 'cash', '0', '', ''),
('KSU.00366', 'cash', '0', '', ''),
('KSU.00367', 'cash', '0', '', ''),
('KSU.00368', 'cash', '0', '', ''),
('KSU.00369', 'cash', '0', '', ''),
('KSU.00370', 'cash', '0', '', ''),
('KSU.00371', 'cash', '0', '', ''),
('KSU.00372', 'cash', '0', '', ''),
('KSU.00373', 'cash', '0', '', ''),
('KSU.00374', 'cash', '0', '', ''),
('KSU.00375', 'cash', '0', '', ''),
('KSU.00376', 'cash', '0', '', ''),
('KSU.00377', 'cash', '0', '', ''),
('KSU.00378', 'cash', '0', '', ''),
('KSU.00379', 'cash', '0', '', ''),
('KSU.00380', 'cash', '0', '', ''),
('KSU.00381', 'cash', '0', '', ''),
('KSU.00382', 'cash', '0', '', ''),
('KSU.00383', 'cash', '0', '', ''),
('KSU.00384', 'cash', '0', '', ''),
('KSU.00385', 'cash', '0', '', ''),
('KSU.00386', 'cash', '0', '', ''),
('KSU.00387', 'cash', '0', '', ''),
('KSU.00388', 'cash', '0', '', ''),
('KSU.00389', 'cash', '0', '', ''),
('KSU.00390', 'cash', '0', '', ''),
('KSU.00391', 'cash', '0', '', ''),
('KSU.00392', 'cash', '0', '', ''),
('KSU.00393', 'cash', '0', '', ''),
('KSU.00394', 'cash', '0', '', ''),
('KSU.00395', 'cash', '0', '', ''),
('KSU.00396', 'cash', '0', '', ''),
('KSU.00397', 'cash', '0', '', ''),
('KSU.00398', 'cash', '0', '', ''),
('KSU.00399', 'cash', '0', '', ''),
('KSU.00400', 'cash', '0', '', ''),
('KSU.00401', 'cash', '0', '', ''),
('KSU.00402', 'cash', '0', '', ''),
('KSU.00404', 'cash', '0', '', ''),
('KSU.00405', 'cash', '0', '', ''),
('KSU.00406', 'cash', '0', '', ''),
('KSU.00407', 'cash', '0', '', ''),
('KSU.00408', 'cash', '0', '', ''),
('KSU.00409', 'cash', '0', '', ''),
('KSU.00410', 'cash', '0', '', ''),
('KSU.00411', 'cash', '0', '', ''),
('KSU.00412', 'cash', '0', '', ''),
('KSU.00413', 'cash', '0', '', ''),
('KSU.00414', 'cash', '0', '', ''),
('KSU.00415', 'cash', '0', '', ''),
('KSU.00416', 'cash', '0', '', ''),
('KSU.00417', 'cash', '0', '', ''),
('KSU.00418', 'cash', '0', '', ''),
('KSU.00419', 'cash', '0', '', ''),
('KSU.00420', 'cash', '0', '', ''),
('KSU.00421', 'cash', '0', '', ''),
('KSU.00422', 'cash', '0', '', ''),
('KSU.00423', 'cash', '0', '', ''),
('KSU.00424', 'cash', '0', '', ''),
('KSU.00425', 'cash', '0', '', ''),
('KSU.00426', 'cash', '0', '', ''),
('KSU.00427', 'cash', '0', '', ''),
('KSU.00428', 'cash', '0', '', ''),
('KSU.00429', 'cash', '0', '', ''),
('KSU.00430', 'cash', '0', '', ''),
('KSU.00431', 'cash', '0', '', ''),
('KSU.00432', 'cash', '0', '', ''),
('KSU.00433', 'cash', '0', '', ''),
('KSU.00434', 'cash', '0', '', ''),
('KSU.00435', 'cash', '0', '', ''),
('KSU.00436', 'cash', '0', '', ''),
('KSU.00437', 'cash', '0', '', ''),
('KSU.00438', 'cash', '0', '', ''),
('KSU.00439', 'cash', '0', '', ''),
('KSU.00440', 'cash', '0', '', ''),
('KSU.00441', 'cash', '0', '', ''),
('KSU.00442', 'cash', '0', '', ''),
('KSU.00443', 'cash', '0', '', ''),
('KSU.00444', 'cash', '0', '', ''),
('KSU.00445', 'cash', '0', '', ''),
('KSU.00446', 'cash', '0', '', ''),
('KSU.00447', 'cash', '0', '', ''),
('KSU.00448', 'cash', '0', '', ''),
('KSU.00449', 'cash', '0', '', ''),
('KSU.00450', 'cash', '0', '', ''),
('KSU.00451', 'cash', '0', '', ''),
('KSU.00452', 'cash', '0', '', ''),
('KSU.00453', 'cash', '0', '', ''),
('KSU.00454', 'cash', '0', '', ''),
('KSU.00455', 'cash', '0', '', ''),
('KSU.00456', 'cash', '0', '', ''),
('KSU.00457', 'cash', '0', '', ''),
('KSU.00458', 'cash', '0', '', ''),
('KSU.00459', 'cash', '0', '', ''),
('KSU.00461', 'cash', '0', '', ''),
('KSU.00462', 'cash', '0', '', ''),
('KSU.00463', 'cash', '0', '', ''),
('KSU.00464', 'cash', '0', '', ''),
('KSU.00465', 'cash', '0', '', ''),
('KSU.00466', 'cash', '0', '', ''),
('KSU.00467', 'cash', '0', '', ''),
('KSU.00468', 'cash', '0', '', ''),
('KSU.00469', 'cash', '0', '', ''),
('KSU.00470', 'cash', '0', '', ''),
('KSU.00471', 'cash', '0', '', ''),
('KSU.00472', 'cash', '0', '', ''),
('KSU.00473', 'cash', '0', '', ''),
('KSU.00474', 'cash', '0', '', ''),
('KSU.00475', 'cash', '0', '', ''),
('KSU.00476', 'cash', '0', '', ''),
('KSU.00477', 'cash', '0', '', ''),
('KSU.00479', 'cash', '0', '', ''),
('KSU.00480', 'cash', '0', '', ''),
('KSU.00481', 'cash', '0', '', ''),
('KSU.00482', 'cash', '0', '', ''),
('KSU.00483', 'cash', '0', '', ''),
('KSU.00484', 'cash', '0', '', ''),
('KSU.00485', 'cash', '0', '', ''),
('KSU.00486', 'cash', '0', '', ''),
('KSU.00487', 'cash', '0', '', ''),
('KSU.00488', 'cash', '0', '', ''),
('KSU.00489', 'cash', '0', '', ''),
('KSU.00490', 'cash', '0', '', ''),
('KSU.00491', 'cash', '0', '', ''),
('KSU.00492', 'cash', '0', '', ''),
('KSU.00493', 'cash', '0', '', ''),
('KSU.00494', 'cash', '0', '', ''),
('KSU.00495', 'cash', '0', '', ''),
('KSU.00496', 'cash', '0', '', ''),
('KSU.00497', 'cash', '0', '', ''),
('KSU.00498', 'cash', '0', '', ''),
('KSU.00499', 'cash', '0', '', ''),
('KSU.00500', 'cash', '0', '', ''),
('KSU.00501', 'cash', '0', '', ''),
('KSU.00502', 'cash', '0', '', ''),
('KSU.00503', 'cash', '0', '', ''),
('KSU.00504', 'cash', '0', '', ''),
('KSU.00505', 'cash', '0', '', ''),
('KSU.00506', 'cash', '0', '', ''),
('KSU.00507', 'cash', '0', '', ''),
('KSU.00508', 'cash', '0', '', ''),
('KSU.00509', 'cash', '0', '', ''),
('KSU.00510', 'cash', '0', '', ''),
('KSU.00512', 'cash', '0', '', ''),
('KSU.00513', 'cash', '0', '', ''),
('KSU.00514', 'cash', '0', '', ''),
('KSU.00515', 'cash', '0', '', ''),
('KSU.00516', 'cash', '0', '', ''),
('KSU.00517', 'cash', '0', '', ''),
('KSU.00518', 'cash', '0', '', ''),
('KSU.00519', 'cash', '0', '', ''),
('KSU.00521', 'cash', '0', '', ''),
('KSU.00522', 'cash', '0', '', ''),
('KSU.00523', 'cash', '0', '', ''),
('KSU.00524', 'cash', '0', '', ''),
('KSU.00525', 'cash', '0', '', ''),
('KSU.00526', 'cash', '0', '', ''),
('KSU.00527', 'cash', '0', '', ''),
('KSU.00528', 'cash', '0', '', ''),
('KSU.00529', 'cash', '0', '', ''),
('KSU.00530', 'cash', '0', '', ''),
('KSU.00531', 'cash', '0', '', ''),
('KSU.00532', 'cash', '0', '', ''),
('KSU.00533', 'cash', '0', '', ''),
('KSU.00534', 'cash', '0', '', ''),
('KSU.00535', 'cash', '0', '', ''),
('KSU.00536', 'cash', '0', '', ''),
('KSU.00537', 'cash', '0', '', ''),
('KSU.00538', 'cash', '0', '', ''),
('KSU.00539', 'cash', '0', '', ''),
('KSU.00540', 'cash', '0', '', ''),
('KSU.00541', 'cash', '0', '', ''),
('KSU.00542', 'cash', '0', '', ''),
('KSU.00543', 'cash', '0', '', ''),
('KSU.00544', 'cash', '0', '', ''),
('KSU.00545', 'cash', '0', '', ''),
('KSU.00546', 'cash', '0', '', ''),
('KSU.00547', 'cash', '0', '', ''),
('KSU.00548', 'cash', '0', '', ''),
('KSU.00549', 'cash', '0', '', ''),
('KSU.00550', 'cash', '0', '', ''),
('KSU.00551', 'cash', '0', '', ''),
('KSU.00552', 'cash', '0', '', ''),
('KSU.00553', 'cash', '0', '', ''),
('KSU.00554', 'cash', '0', '', ''),
('KSU.00555', 'cash', '0', '', ''),
('KSU.00556', 'cash', '0', '', ''),
('KSU.00557', 'cash', '0', '', ''),
('KSU.00558', 'cash', '0', '', ''),
('KSU.00559', 'cash', '0', '', ''),
('KSU.00560', 'cash', '0', '', ''),
('KSU.00561', 'cash', '0', '', ''),
('KSU.00562', 'cash', '0', '', ''),
('KSU.00563', 'cash', '0', '', ''),
('KSU.00564', 'cash', '0', '', ''),
('KSU.00565', 'cash', '0', '', ''),
('KSU.00566', 'cash', '0', '', ''),
('KSU.00567', 'cash', '0', '', ''),
('KSU.00568', 'cash', '0', '', ''),
('KSU.00569', 'cash', '0', '', ''),
('KSU.00570', 'cash', '0', '', ''),
('KSU.00571', 'cash', '0', '', ''),
('KSU.00572', 'cash', '0', '', ''),
('KSU.00574', 'cash', '0', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_m_bahan`
--

CREATE TABLE `tbl_m_bahan` (
  `id` int(11) NOT NULL,
  `tgl_simpan` datetime NOT NULL,
  `tgl_modif` datetime NOT NULL,
  `id_satuan` int(11) NOT NULL,
  `kode` varchar(160) NOT NULL,
  `bahan` text NOT NULL,
  `qty_awal` float NOT NULL,
  `qty` double NOT NULL,
  `qty_pemb` double NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `konversi` double NOT NULL,
  `ket` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_m_produk`
--

CREATE TABLE `tbl_m_produk` (
  `id` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `id_satuan` int(11) NOT NULL,
  `tgl_simpan` datetime NOT NULL,
  `tgl_modif` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `kode` varchar(160) NOT NULL,
  `produk` mediumtext NOT NULL,
  `qty_awal` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `qty_pemb` int(11) NOT NULL,
  `harga_dasar` decimal(13,0) NOT NULL,
  `harga` decimal(13,0) NOT NULL,
  `ppn` float NOT NULL,
  `margin` float NOT NULL,
  `ket` mediumtext NOT NULL,
  `file` varchar(1024) NOT NULL,
  `status_produk` int(11) NOT NULL,
  `status_ppn` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_m_produk`
--

INSERT INTO `tbl_m_produk` (`id`, `id_kategori`, `id_satuan`, `tgl_simpan`, `tgl_modif`, `kode`, `produk`, `qty_awal`, `qty`, `qty_pemb`, `harga_dasar`, `harga`, `ppn`, `margin`, `ket`, `file`, `status_produk`, `status_ppn`) VALUES
(2, 10, 3, '2017-01-27 14:24:09', '2017-02-17 05:35:20', '089686010947', 'Indomie goreng', 50, 31, 54, '1963', '2200', 0, 0, '', '', 0, 0),
(3, 10, 3, '2017-01-27 14:24:09', '2017-02-16 07:37:08', '089686010343', 'Indomie soto', 38, 25, 0, '1838', '2000', 0, 0, '', '', 0, 0),
(4, 10, 3, '2017-01-27 14:24:09', '2017-02-17 05:35:20', '089686010046', 'Indomie Spesial', 51, 19, 0, '1888', '2000', 0, 0, '', '', 0, 0),
(5, 10, 3, '2017-01-27 14:24:09', '2017-02-16 07:37:08', '089686010015', 'Indomie ayam bawang', 40, 32, 0, '1838', '2000', 0, 0, '', '', 0, 0),
(6, 10, 3, '2017-01-27 14:24:09', '2017-02-13 05:00:00', '8998866200301', 'Sedap goreng', 139, 106, 0, '1948', '2200', 0, 0, '', '', 0, 0),
(7, 10, 3, '2017-01-27 14:24:09', '2017-02-04 03:35:44', '8998866200509', 'Sedap Ayam spesial', 10, 9, 0, '1812', '2000', 0, 0, '', '', 0, 0),
(8, 10, 3, '2017-01-27 14:24:09', '2017-02-13 05:00:00', '8998866200578', 'SEdap Kari spesial', 60, 48, 0, '1882', '2000', 0, 0, '', '', 0, 0),
(9, 10, 3, '2017-01-27 14:24:09', '2017-02-13 03:42:57', '8998866200325', 'Sedap Soto', 73, 65, 0, '1812', '2000', 0, 0, '', '', 0, 0),
(10, 10, 3, '2017-01-27 14:24:09', '2017-02-13 04:44:25', '8998866200318', 'Sedap AB', 84, 78, 0, '1812', '2000', 0, 0, '', '', 0, 0),
(11, 10, 3, '2017-01-27 14:24:09', '2017-02-09 06:55:36', '8998866200929', 'Sedap Bakso', 62, 55, 0, '1812', '2000', 0, 0, '', '', 0, 0),
(12, 10, 3, '2017-01-27 14:24:09', '2017-02-03 06:32:03', '8998866200332', 'Sedap Kari', 0, 0, 0, '1812', '2000', 0, 0, '', '', 0, 0),
(13, 10, 3, '2017-01-27 14:24:09', '2017-02-03 06:32:28', '8998866201346', 'Sedap White Curry', 8, 8, 0, '1812', '2000', 0, 0, '', '', 0, 0),
(14, 10, 3, '2017-01-27 14:24:09', '2017-02-03 06:32:35', '8998866200882', 'Sukses Goreng', 26, 26, 0, '2459', '3000', 0, 0, '', '', 0, 0),
(15, 10, 3, '2017-01-27 14:24:09', '2017-02-03 06:32:40', '8998866200912', 'Sukses Kari', 0, 0, 0, '2282', '2700', 0, 0, '', '', 0, 0),
(16, 10, 3, '2017-01-27 14:24:09', '2017-02-04 02:31:49', '8992388111206', 'ABC Selera pedas gulai', 7, 6, 0, '1675', '2000', 0, 0, '', '', 0, 0),
(17, 10, 3, '2017-01-27 14:24:09', '2017-02-03 06:32:54', '8992388111237', 'ABC Selera ayam bawang', 8, 8, 0, '1675', '2000', 0, 0, '', '', 0, 0),
(18, 10, 3, '2017-01-27 14:24:09', '2017-02-03 06:32:58', '8992388111145', 'ABC selera Sup  tomat', 17, 17, 0, '1675', '2000', 0, 0, '', '', 0, 0),
(19, 10, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8992388121267', 'ABC Cup Gulai ayam', 2, 2, 0, '3570', '4000', 0, 0, '', '', 0, 0),
(20, 10, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8992388121021', 'ABC Cup Kari Ayam', 2, 2, 0, '3570', '4000', 0, 0, '', '', 0, 0),
(21, 10, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '711844120396', 'Sambel Trasi Kaleng', 3, 3, 0, '15308', '17000', 0, 0, '', '', 0, 0),
(22, 10, 3, '2017-01-27 14:24:09', '2017-02-03 06:33:09', '711844330108', 'Sardine Saus Cabai K', 0, 0, 0, '6466', '7500', 0, 0, '', '', 0, 0),
(23, 10, 3, '2017-01-27 14:24:09', '2017-02-13 03:42:57', '711844330146', 'Sardine Extra Pedas K', 1, 0, 0, '6466', '7500', 0, 0, '', '', 0, 0),
(24, 10, 3, '2017-01-27 14:24:09', '2017-02-03 06:33:24', '711844330115', 'Sardines Saus Cabai B', 0, 0, 0, '15212', '16000', 0, 0, '', '', 0, 0),
(25, 10, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '711844140417', 'Minyak Wijen', 1, 1, 0, '27727', '30000', 0, 0, '', '', 0, 0),
(26, 10, 3, '2017-01-27 14:24:09', '2017-02-03 06:33:34', '711844110700', 'ABC Kecap Pedes', 2, 2, 0, '6271', '7000', 0, 0, '', '', 0, 0),
(27, 10, 3, '2017-01-27 14:24:09', '2017-01-31 14:22:55', '8994297101125', 'Kecap Sukasari Manis', 0, 0, 0, '5100', '5700', 0, 0, '', '', 0, 0),
(28, 10, 3, '2017-01-27 14:24:09', '2017-02-08 04:46:53', '8999999100506', 'Kecap Bango 600ml', 2, 1, 0, '24585', '27000', 0, 0, '', '', 0, 0),
(29, 10, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8994297101972', 'Kecap Sukasari 600ml', 3, 3, 0, '16400', '17500', 0, 0, '', '', 0, 0),
(30, 10, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8998866608084', 'Kecap Sedap 600ml', 2, 2, 0, '15000', '16000', 0, 0, '', '', 0, 0),
(31, 10, 3, '2017-01-27 14:24:09', '2017-02-17 04:18:40', 'k3', 'Kecap Lele 680ml', 10, 7, 10, '18700', '19500', 0, 0, '', '', 0, 0),
(32, 10, 3, '2017-01-27 14:24:09', '2017-02-03 06:34:01', 'M2', 'Motto T ', 14, 14, 0, '1488', '1700', 0, 0, '', '', 0, 0),
(33, 13, 3, '2017-01-27 14:24:09', '2017-02-16 03:02:57', '8998989100120', 'Gudang Garam Filter', 9, 8, 5, '14000', '15000', 0, 0, '', '', 0, 0),
(34, 10, 3, '2017-01-27 14:24:09', '2017-02-10 02:28:51', '8999999046651', 'Royco Sapi', 2, 1, 0, '4800', '5000', 0, 0, '', '', 0, 0),
(35, 10, 3, '2017-01-27 14:24:09', '2017-02-13 04:29:20', '8992770033178', 'Masako Ayam', 1, 16, 16, '4438', '5000', 0, 0, '', '', 0, 0),
(36, 10, 3, '2017-01-27 14:24:09', '2017-02-13 04:44:25', '089686385816', 'Magic Lezat', 5, 2, 0, '2450', '3000', 0, 0, '', '', 0, 0),
(37, 10, 3, '2017-01-27 14:24:09', '2017-02-16 03:19:37', '8993111112507', 'Garam Halus', 57, 48, 0, '1213', '1700', 0, 0, '', '', 0, 0),
(38, 10, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8994297101330', 'Kecap Sukasari Botol B', 1, 1, 0, '17550', '19000', 0, 0, '', '', 0, 0),
(39, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8998866601863', 'Pewangi So klin ungu 450', 1, 1, 0, '4375', '5000', 0, 0, '', '', 0, 0),
(40, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8998866602723', 'Pewangi So Klin biru 450', 1, 1, 0, '4375', '5000', 0, 0, '', '', 0, 0),
(41, 14, 3, '2017-01-27 14:24:09', '2017-01-31 14:22:55', '8998866603416', 'Rapika Refil Pink 450', 0, 0, 0, '4225', '5000', 0, 0, '', '', 0, 0),
(42, 14, 3, '2017-01-27 14:24:09', '2017-02-03 06:36:02', '8998866603409', 'Rapika refil Ungu 450', 2, 2, 0, '4225', '5000', 0, 0, '', '', 0, 0),
(43, 14, 3, '2017-01-27 14:24:09', '2017-02-16 04:41:58', '8993188111120', 'Kingkong', 13, 11, 0, '3050', '4000', 0, 0, '', '', 0, 0),
(44, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8992772191180', 'Kispray sst Pink', 1, 1, 0, '4792', '5000', 0, 0, '', '', 0, 0),
(45, 14, 3, '2017-01-27 14:24:09', '2017-02-03 06:36:15', '8992772011013', 'Soffel pink sst', 5, 5, 0, '4875', '5500', 0, 0, '', '', 0, 0),
(46, 14, 3, '2017-01-27 14:24:09', '2017-02-03 06:36:21', '8992772311014', 'Soffel kuning sst', 3, 3, 0, '4875', '5500', 0, 0, '', '', 0, 0),
(47, 14, 3, '2017-01-27 14:24:09', '2017-02-03 06:36:30', 'R1', 'Rapika Kuning sst', 0, 0, 0, '4562', '5000', 0, 0, '', '', 0, 0),
(49, 14, 3, '2017-01-27 14:24:09', '2017-02-06 05:51:46', 'R 2', 'Rapika hijau sst', 2, 1, 0, '4562', '5000', 0, 0, '', '', 0, 0),
(50, 14, 3, '2017-01-27 14:24:09', '2017-02-06 05:51:46', 'R 3', 'Rapika Merah sst', 3, 2, 0, '4562', '5000', 0, 0, '', '', 0, 0),
(51, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8993417229718', 'Sleek Baby 450 ml', 2, 2, 0, '16150', '18500', 0, 0, '', '', 0, 0),
(52, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8998866659666', 'So klin Softener kuning 900', 1, 1, 0, '9900', '11500', 0, 0, '', '', 0, 0),
(53, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8998866605137', 'Cling Biru 450', 2, 2, 0, '3167', '3500', 0, 0, '', '', 0, 0),
(54, 14, 3, '2017-01-27 14:24:09', '2017-02-17 05:35:20', '8999999706180', 'Pepsodent 190', 0, -4, 0, '9240', '9700', 0, 0, '', '', 0, 0),
(55, 14, 3, '2017-01-27 14:24:09', '2017-02-04 05:34:22', '8999999706173', 'Pepsodent 120', 13, 11, 0, '6050', '6500', 0, 0, '', '', 0, 0),
(56, 14, 3, '2017-01-27 14:24:09', '2017-02-03 06:38:33', '8999999028695', 'Pepsodent 75', 97, 97, 0, '2808', '3750', 0, 0, '', '', 0, 0),
(57, 14, 3, '2017-01-27 14:24:09', '2017-02-06 08:25:27', '8999999707774', 'Pepsodent Whitening 75', 7, 6, 0, '5700', '6500', 0, 0, '', '', 0, 0),
(58, 14, 3, '2017-01-27 14:24:09', '2017-02-03 06:38:41', '8999999713225', 'Pepsodent Complete 170', 0, 0, 0, '12000', '15000', 0, 0, '', '', 0, 0),
(59, 14, 3, '2017-01-27 14:24:09', '2017-02-14 05:20:09', '8991102101813', 'Formula 75', 4, 0, 0, '6500', '7000', 0, 0, '', '', 0, 0),
(60, 14, 3, '2017-01-27 14:24:09', '2017-02-03 06:38:54', '8998866105958', 'Sytema nano', 10, 10, 0, '1700', '5000', 0, 0, '', '', 0, 0),
(61, 14, 3, '2017-01-27 14:24:09', '2017-02-03 06:39:06', '8999999707842', 'Close Up 110', 0, 0, 0, '10120', '11000', 0, 0, '', '', 0, 0),
(62, 14, 3, '2017-01-27 14:24:09', '2017-02-07 03:59:12', '8999999707835', 'Close Up 65', 12, 12, 12, '5279', '6500', 0, 0, '', '', 0, 0),
(63, 14, 3, '2017-01-27 14:24:09', '2017-02-04 03:40:36', '8998866100168', 'Ciptadent  hijau 190', 1, 0, 0, '6700', '7000', 0, 0, '', '', 0, 0),
(64, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8991102100632', 'Formula junior ', 3, 3, 0, '2500', '3500', 0, 0, '', '', 0, 0),
(65, 14, 3, '2017-01-27 14:24:09', '2017-01-31 14:22:55', '8991102100618', 'Formula Junior Vitamin', 0, 0, 0, '2500', '3500', 0, 0, '', '', 0, 0),
(66, 14, 3, '2017-01-27 14:24:09', '2017-02-03 06:39:32', '8999999705985', 'Pesodent Gigi Susu', 0, 0, 0, '2500', '3500', 0, 0, '', '', 0, 0),
(67, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8886030422836', 'Dee dee orange', 2, 2, 0, '2500', '3500', 0, 0, '', '', 0, 0),
(68, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8886030422829', 'Dee dee Grape', 1, 1, 0, '2500', '3500', 0, 0, '', '', 0, 0),
(69, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8998103001579', 'Cussons Kid strawbery', 1, 1, 0, '2500', '3500', 0, 0, '', '', 0, 0),
(71, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8998866100243', 'Kodomo Angur', 13, 13, 0, '2500', '3500', 0, 0, '', '', 0, 0),
(72, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8991111152073', 'Listerin Natural', 3, 3, 0, '7920', '9000', 0, 0, '', '', 0, 0),
(73, 14, 3, '2017-01-27 14:24:09', '2017-02-04 02:59:48', '8992725910400', 'Listerin Cool mint', 1, 0, 0, '7920', '9000', 0, 0, '', '', 0, 0),
(74, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', 'FK 1', 'Formula Paket', 5, 5, 0, '6500', '7500', 0, 0, '', '', 0, 0),
(75, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8998866803649', 'Soklin Liqud Ungu 800', 6, 6, 0, '14255', '15000', 0, 0, '', '', 0, 0),
(76, 14, 3, '2017-01-27 14:24:09', '2017-02-03 06:40:28', '8998866608992', 'Soklin Liquid Biru 800', 4, 4, 0, '14225', '15000', 0, 0, '', '', 0, 0),
(77, 14, 3, '2017-01-27 14:24:09', '2017-02-03 06:40:43', '8998866609180', 'Soklin Liquid Pink 800', 10, 10, 0, '14255', '15000', 0, 0, '', '', 0, 0),
(78, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8993560023126', 'Dettol Bedak original', 2, 2, 0, '9200', '10000', 0, 0, '', '', 0, 0),
(79, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8993560023003', 'Dettol Bedak Mentol', 1, 1, 0, '9200', '10000', 0, 0, '', '', 0, 0),
(80, 14, 3, '2017-01-27 14:24:09', '2017-02-03 06:40:53', '8993560026424', 'Dettol Cair 125', 0, 0, 0, '12626', '13500', 0, 0, '', '', 0, 0),
(81, 14, 3, '2017-01-27 14:24:09', '2017-02-08 04:46:53', '4801010531234', 'Johsons Refil 200', 3, 2, 0, '15840', '17000', 0, 0, '', '', 0, 0),
(82, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8993417489945', 'Elips Hair Mask hijau', 2, 2, 0, '5644', '6500', 0, 0, '', '', 0, 0),
(83, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8993417489921', 'Elips Hair mask orange', 2, 2, 0, '5644', '6500', 0, 0, '', '', 0, 0),
(84, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8993417489914', 'Elips Hair Mask Pink', 3, 3, 0, '5644', '6500', 0, 0, '', '', 0, 0),
(85, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8993417489938', 'Elips Hair Mask Ungu', 2, 2, 0, '5644', '6500', 0, 0, '', '', 0, 0),
(86, 14, 3, '2017-01-27 14:24:09', '2017-02-16 04:26:20', '8993417489952', 'Elips vitamin', 0, -1, 0, '7500', '8000', 0, 0, '', '', 0, 0),
(87, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8994066110112', 'Top Lady', 4, 4, 0, '5750', '6500', 0, 0, '', '', 0, 0),
(88, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8998866106252', 'Emeron putih 340', 3, 3, 0, '21700', '24000', 0, 0, '', '', 0, 0),
(89, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8998866106214', 'Emeron Hitam 340', 3, 3, 0, '21700', '24000', 0, 0, '', '', 0, 0),
(90, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '6901404010814', 'Sabun Tawon', 5, 5, 0, '6500', '7500', 0, 0, '', '', 0, 0),
(91, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8995151120047', 'Sabun Badan Mangir', 2, 2, 0, '15400', '19000', 0, 0, '', '', 0, 0),
(92, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8995151120153', 'Sabun Badan', 3, 3, 0, '16940', '24000', 0, 0, '', '', 0, 0),
(93, 14, 3, '2017-01-27 14:24:09', '2017-01-31 14:22:55', '8992694247163', 'zwitsal natural', 0, 0, 0, '2650', '3500', 0, 0, '', '', 0, 0),
(94, 14, 3, '2017-01-27 14:24:09', '2017-02-03 06:41:29', '8992694242502', 'Zwitsal clasic', 0, 0, 0, '2650', '3500', 0, 0, '', '', 0, 0),
(95, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '4801010561309', 'Johnson Pink', 1, 1, 0, '3740', '4500', 0, 0, '', '', 0, 0),
(96, 14, 3, '2017-01-27 14:24:09', '2017-02-03 06:41:37', '4801010560500', 'Johnson putih', 3, 3, 0, '3740', '4500', 0, 0, '', '', 0, 0),
(97, 14, 3, '2017-01-27 14:24:09', '2017-02-17 05:35:20', '8992946512285', 'Shinzui Kirei', 30, 24, 30, '3041', '3500', 0, 0, '', '', 0, 0),
(98, 14, 3, '2017-01-27 14:24:09', '2017-02-08 05:16:32', '8992946512223', 'Shinzui Hana', 6, 5, 6, '3041', '3500', 0, 0, '', '', 0, 0),
(99, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8998866800204', 'Sabun Fress orange', 51, 51, 0, '1200', '1500', 0, 0, '', '', 0, 0),
(100, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8999999023980', 'Sb citra hijau', 1, 1, 0, '1600', '2000', 0, 0, '', '', 0, 0),
(101, 14, 2, '2017-01-27 14:24:09', '2017-02-13 05:00:00', '4902430504454', 'Downy Hitam sst', 20, 15, 20, '4750', '5500', 0, 0, '', '', 0, 0),
(102, 14, 3, '2017-01-27 14:24:09', '2017-02-06 05:51:45', '8999999057213', 'Molto White musk sst', 2, 1, 0, '4620', '5000', 0, 0, '', '', 0, 0),
(103, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8998866609159', 'Soklin Liquid sst Pink', 3, 3, 0, '2000', '2500', 0, 0, '', '', 0, 0),
(104, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8998866803618', 'Soklin Liquid sst ungu', 3, 3, 0, '2000', '2500', 0, 0, '', '', 0, 0),
(105, 14, 3, '2017-01-27 14:24:09', '2017-02-10 07:52:45', '8998866805407', 'Soklin Liquid sst Parfum', 3, 0, 0, '2000', '2500', 0, 0, '', '', 0, 0),
(106, 14, 3, '2017-01-27 14:24:09', '2017-02-04 05:23:10', '8998866608961', 'Soklin Liquid sst Biru', 6, 4, 0, '2000', '2500', 0, 0, '', '', 0, 0),
(107, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8999999047252', 'Rinso Cair  Hijau 42', 14, 14, 0, '5313', '5800', 0, 0, '', '', 0, 0),
(108, 14, 3, '2017-01-27 14:24:09', '2017-01-31 14:22:55', '8999999047238', 'Rinso Cair  Molto  42', 0, 0, 0, '5313', '5800', 0, 0, '', '', 0, 0),
(109, 14, 3, '2017-01-27 14:24:09', '2017-02-08 03:18:34', '8998866609142', 'Sabun Giv Merah', 16, 12, 0, '1675', '2000', 0, 0, '', '', 0, 0),
(110, 14, 3, '2017-01-27 14:24:09', '2017-02-09 06:49:56', '8998866606417', 'Sabun Giv Putih', 9, 4, 0, '1675', '2000', 0, 0, '', '', 0, 0),
(111, 14, 3, '2017-01-27 14:24:09', '2017-02-03 06:43:04', '8998866608312', 'Sabun Giv Orange', 0, 0, 0, '1675', '2000', 0, 0, '', '', 0, 0),
(112, 14, 3, '2017-01-27 14:24:09', '2017-02-03 06:43:13', '8998866602389', 'Sabun Giv Ungu', 20, 20, 0, '1675', '2000', 0, 0, '', '', 0, 0),
(113, 14, 3, '2017-01-27 14:24:09', '2017-02-17 04:18:40', '8999999036676', 'Sabun Lux biru', 1, 0, 1, '2700', '3500', 0, 0, '', '', 0, 0),
(114, 14, 3, '2017-01-27 14:24:09', '2017-02-17 04:18:40', '8999999036638', 'Sabun Lux putih', 6, 20, 18, '2700', '3500', 0, 0, '', '', 0, 0),
(115, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8999999043667', 'Sabun Lux Putih Kotak', 7, 7, 0, '2700', '3500', 0, 0, '', '', 0, 0),
(116, 14, 3, '2017-01-27 14:24:09', '2017-02-07 02:28:17', '8999999036690', 'Sabun Lux Ungu', 3, 0, 0, '2700', '3500', 0, 0, '', '', 0, 0),
(117, 14, 3, '2017-01-27 14:24:09', '2017-02-08 07:49:53', '8999999036607', 'Sabun Lux Pink', 2, 19, 19, '2700', '3500', 0, 0, '', '', 0, 0),
(118, 14, 3, '2017-01-27 14:24:09', '2017-02-11 05:22:11', '8998866602563', 'Sabun Nuvo Hijau', 84, 81, 0, '1700', '2000', 0, 0, '', '', 0, 0),
(119, 14, 3, '2017-01-27 14:24:09', '2017-02-11 05:22:11', '8998866606158', 'Sabun Nuvo Cool', 20, 11, 0, '1700', '2000', 0, 0, '', '', 0, 0),
(120, 14, 3, '2017-01-27 14:24:09', '2017-02-11 05:22:11', '8998866602570', 'Sabun Nuvo Kuning', 1, 23, 24, '1700', '2000', 0, 0, '', '', 0, 0),
(121, 14, 3, '2017-01-27 14:24:09', '2017-02-11 05:22:11', '8998866602549', 'Sabun Nuvo Caring', 0, -1, 0, '1700', '2000', 0, 0, '', '', 0, 0),
(122, 14, 3, '2017-01-27 14:24:09', '2017-02-11 05:22:11', '8998866602556', 'Sabun Nuvo Merah', 180, 172, 0, '1700', '2000', 0, 0, '', '', 0, 0),
(123, 14, 3, '2017-01-27 14:24:09', '2017-02-17 04:18:40', '8999999059316', 'Sabun Lifboy biru', 30, 22, 0, '2500', '3000', 0, 0, '', '', 0, 0),
(124, 14, 3, '2017-01-27 14:24:09', '2017-02-17 04:18:40', '8999999059309', 'Sabun Lifboy merah', 20, 8, 0, '2500', '3000', 0, 0, '', '', 0, 0),
(125, 14, 3, '2017-01-27 14:24:09', '2017-02-16 02:51:06', '8999999059330', 'Sabun Lifboy Hijau', 40, 39, 0, '2500', '3000', 0, 0, '', '', 0, 0),
(126, 14, 3, '2017-01-27 14:24:09', '2017-02-04 03:19:24', '8993560025243', 'Sabun Dettol ektra timun 65gr', 17, 16, 0, '2900', '3200', 0, 0, '', '', 0, 0),
(127, 14, 3, '2017-01-27 14:24:09', '2017-02-04 03:19:24', '8993560025113', 'Sabun Dettol re- energize 65gr', 1, 0, 0, '2900', '3200', 0, 0, '', '', 0, 0),
(128, 14, 3, '2017-01-27 14:24:09', '2017-02-03 06:44:49', '8993560025014', 'Sabun Dettol cool 65gr', 3, 3, 0, '2900', '3200', 0, 0, '', '', 0, 0),
(129, 14, 3, '2017-01-27 14:24:09', '2017-02-08 07:49:53', '8993560024116', 'Sabun Dettol sensitive 65gr', 8, 9, 1, '2900', '3200', 0, 0, '', '', 0, 0),
(130, 14, 3, '2017-01-27 14:24:09', '2017-02-03 06:44:56', '8993560025069', 'Sabun Dettol Sensitive 105gr', 0, 0, 0, '4600', '5000', 0, 0, '', '', 0, 0),
(131, 14, 3, '2017-01-27 14:24:09', '2017-02-10 02:33:47', '8993560024642', 'Sabun Dettol Active 105gr', 14, 8, 0, '4600', '5000', 0, 0, '', '', 0, 0),
(132, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8998866106122', 'Mama Lemon anti gores', 5, 5, 0, '6700', '7500', 0, 0, '', '', 0, 0),
(133, 14, 3, '2017-01-27 14:24:09', '2017-02-03 06:45:02', '8998866679572', 'So klin lantai pink 800ml', 0, 0, 0, '8400', '9000', 0, 0, '', '', 0, 0),
(134, 14, 3, '2017-01-27 14:24:09', '2017-02-03 06:45:13', '8998866679596', 'So klin lantai biru 800ml', 1, 1, 0, '8400', '9000', 0, 0, '', '', 0, 0),
(135, 14, 3, '2017-01-27 14:24:09', '2017-02-10 02:33:47', '8998866679602', 'So klin lantai hijau 800ml', 3, 2, 3, '8400', '9000', 0, 0, '', '', 0, 0),
(136, 14, 3, '2017-01-27 14:24:09', '2017-02-10 02:33:47', '8998866603539', 'So klin lantai ungu 800ml', 1, 0, 0, '8400', '9000', 0, 0, '', '', 0, 0),
(137, 14, 3, '2017-01-27 14:24:09', '2017-02-04 03:40:36', 'P1', 'Poriklin 1000ml', 3, 2, 0, '14000', '15000', 0, 0, '', '', 0, 0),
(138, 14, 3, '2017-01-27 14:24:09', '2017-02-09 04:30:09', '8998866601788', 'WPC biru', 1, 3, 2, '8500', '9500', 0, 0, '', '', 0, 0),
(139, 14, 3, '2017-01-27 14:24:09', '2017-02-03 06:45:33', '8998866603645', 'WPC hijau', 3, 3, 0, '8500', '9500', 0, 0, '', '', 0, 0),
(140, 14, 3, '2017-01-27 14:24:09', '2017-02-06 07:29:14', '8999999407919', 'Wipol 800ml', 1, 0, 0, '12500', '13500', 0, 0, '', '', 0, 0),
(141, 14, 4, '2017-01-27 14:24:09', '2017-01-30 14:34:03', 'S1', 'shine besar', 2, 2, 0, '6300', '8500', 0, 0, '', '', 0, 0),
(142, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8992745120537', 'HIT refill', 2, 2, 0, '12700', '13500', 0, 0, '', '', 0, 0),
(143, 14, 3, '2017-01-27 14:24:09', '2017-02-03 06:45:50', '8998866670807', 'Wing ember', 0, 0, 0, '25100', '28000', 0, 0, '', '', 0, 0),
(144, 14, 3, '2017-01-27 14:24:09', '2017-02-06 05:51:45', '8998866100564', 'Sampo Emeron hitam ', 2, 1, 0, '11300', '12500', 0, 0, '', '', 0, 0),
(145, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8998866100601', 'Sampo Emeron Hijau 170ml', 1, 1, 0, '11300', '12500', 0, 0, '', '', 0, 0),
(146, 14, 3, '2017-01-27 14:24:09', '2017-02-13 04:44:25', '4902430563864', 'Sampo pantene Sst biru', 10, 9, 10, '8900', '9500', 0, 0, '', '', 0, 0),
(147, 14, 3, '2017-01-27 14:24:09', '2017-02-07 02:58:28', '4902430563888', 'Sampo pantene Sst hitam', 2, 1, 0, '8900', '9500', 0, 0, '', '', 0, 0),
(148, 14, 3, '2017-01-27 14:24:09', '2017-02-03 06:46:13', '4902430720274', 'Sampo pantene Sst pink', 0, 0, 0, '8900', '9500', 0, 0, '', '', 0, 0),
(149, 14, 3, '2017-01-27 14:24:09', '2017-01-31 14:22:55', '8999999045494', 'Sampo Dove sst Nourishment', 0, 0, 0, '9400', '11000', 0, 0, '', '', 0, 0),
(150, 14, 3, '2017-01-27 14:24:09', '2017-02-03 06:46:23', '8998866101097', 'Sampo Zinc Sst Hijau', 4, 4, 0, '2200', '2900', 0, 0, '', '', 0, 0),
(151, 14, 3, '2017-01-27 14:24:09', '2017-02-16 07:02:34', '8998866100793', 'Sampo Zinc Sst biru', 1, 0, 0, '2200', '2900', 0, 0, '', '', 0, 0),
(152, 14, 3, '2017-01-27 14:24:09', '2017-01-31 14:22:55', '8999999027049', 'Sampo Lifboy sst kuning', 0, 0, 0, '4752', '5000', 0, 0, '', '', 0, 0),
(153, 14, 3, '2017-01-27 14:24:09', '2017-01-31 14:22:55', '8999999027056', 'Sampo Lifboy sst biru', 0, 0, 0, '4752', '5000', 0, 0, '', '', 0, 0),
(154, 10, 3, '2017-01-27 14:24:09', '2017-02-13 04:23:58', 'T1', 'Beras Pak tani @5kg', 15, 1, 0, '57000', '60000', 0, 0, '', '', 0, 0),
(155, 10, 3, '2017-01-27 14:24:09', '2017-02-14 08:09:13', 'pr2', 'Beras Premium @2kg', 49, 1, 0, '15400', '15800', 0, 0, '', '', 0, 0),
(156, 10, 3, '2017-01-27 14:24:09', '2017-02-17 04:33:14', 'pr5', 'Beras Premium @5kg', 80, 2, 0, '38500', '39500', 0, 0, '', '', 0, 0),
(157, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8992727003803', 'Sabun Easy 700gr', 1, 1, 0, '13500', '14500', 0, 0, '', '', 0, 0),
(158, 14, 3, '2017-01-27 14:24:09', '2017-02-07 02:28:17', '8999999401238', 'Sabun Rinso 900gr', 12, 10, 0, '14900', '18000', 0, 0, '', '', 0, 0),
(159, 14, 3, '2017-01-27 14:24:09', '2017-02-13 06:58:25', '8998866106160', 'Mama Lemon Anti Bacteri 800ml', 11, 8, 0, '12500', '13500', 0, 0, '', '', 0, 0),
(160, 14, 3, '2017-01-27 14:24:09', '2017-02-17 05:35:20', '8998866803694', 'Sabun So klin softergen ungu 800gr', 2, 12, 14, '13260', '15000', 0, 0, '', '', 0, 0),
(161, 14, 3, '2017-01-27 14:24:09', '2017-02-14 07:17:13', '8998866607315', 'Sabun So klin softergen pink 800gr', 1, 14, 14, '13260', '15000', 0, 0, '', '', 0, 0),
(162, 14, 3, '2017-01-27 14:24:09', '2017-02-03 06:47:33', '8998866606769', 'Sabun Boom', 9, 9, 0, '4500', '5000', 0, 0, '', '', 0, 0),
(163, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8991899201239', ' Para Kamper', 1, 1, 0, '7000', '10000', 0, 0, '', '', 0, 0),
(164, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8993560067229', 'Air Wick citrus', 1, 1, 0, '9850', '11500', 0, 0, '', '', 0, 0),
(165, 14, 3, '2017-01-27 14:24:09', '2017-02-03 06:47:40', '8993560067243', 'Air Wick Peach', 0, 0, 0, '9850', '11500', 0, 0, '', '', 0, 0),
(166, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8993560066154', 'Air Wick Isi ulang aqua', 1, 1, 0, '11950', '12500', 0, 0, '', '', 0, 0),
(167, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8993560066147', 'Air Wick isi ulang lavender', 1, 1, 0, '11950', '12500', 0, 0, '', '', 0, 0),
(168, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8993560066116', 'Air wick komplit', 1, 1, 0, '16787', '17000', 0, 0, '', '', 0, 0),
(169, 10, 3, '2017-01-27 14:24:09', '2017-02-17 04:33:14', '8992946121029', 'Tropical 2lt', 3, 7, 16, '22000', '24000', 0, 0, '', '', 0, 0),
(170, 10, 3, '2017-01-27 14:24:09', '2017-02-17 05:35:20', '8992946121012', 'tropical 1lt', 20, 3, 2, '12000', '13500', 0, 0, '', '', 0, 0),
(171, 10, 3, '2017-01-27 14:24:09', '2017-02-07 05:18:25', '8992946522062', 'Tropical 500ml', 11, 8, 0, '6076', '7000', 0, 0, '', '', 0, 0),
(172, 10, 3, '2017-01-27 14:24:09', '2017-01-31 14:22:55', '8993496106504', 'fortune 1lt', 0, 0, 0, '12417', '13000', 0, 0, '', '', 0, 0),
(173, 10, 3, '2017-01-27 14:24:09', '2017-01-31 14:22:55', '8993496001083', 'sania 1lt', 0, 0, 0, '12000', '13500', 0, 0, '', '', 0, 0),
(174, 10, 3, '2017-01-27 14:24:09', '2017-02-03 06:49:27', '8992628022156', 'Bimoli 1lt', 0, 0, 0, '12000', '13000', 0, 0, '', '', 0, 0),
(175, 10, 3, '2017-01-27 14:24:09', '2017-02-10 08:05:57', '8993379500238', 'Sanco 2lt', 14, 7, 0, '25000', '27000', 0, 0, '', '', 0, 0),
(176, 12, 3, '2017-01-27 14:24:09', '2017-01-30 14:34:03', '749921005908', 'Nutrisari Kardus', 3, 3, 0, '20000', '25000', 0, 0, '', '', 0, 0),
(177, 12, 3, '2017-01-27 14:24:09', '2017-02-04 02:59:48', '8997021405599', 'Susu Gomars Vanila', 5, 3, 0, '20000', '25000', 0, 0, '', '', 0, 0),
(178, 10, 3, '2017-01-27 14:24:09', '2017-02-03 06:49:58', '8992858687408', 'Permen woods merah', 1, 1, 0, '2257', '2500', 0, 0, '', '', 0, 0),
(179, 10, 3, '2017-01-27 14:24:09', '2017-02-16 07:02:34', '8997001240035', 'Pita merah', 40, 29, 40, '6425', '7000', 0, 0, '', '', 0, 0),
(180, 10, 3, '2017-01-27 14:24:09', '2017-02-13 04:44:25', '8993093135006', 'Tepung Ketan', 1, 19, 20, '6809', '7500', 0, 0, '', '', 0, 0),
(181, 10, 3, '2017-01-27 14:24:09', '2017-02-17 06:14:13', '8993093665138', 'Tepung beras 200gr', 24, 19, 0, '2263', '3000', 0, 0, '', '', 0, 0),
(182, 10, 3, '2017-01-27 14:24:09', '2017-02-17 04:18:40', '8993093115008', 'tepung beras 500g', 20, 11, 20, '5325', '6000', 0, 0, '', '', 0, 0),
(183, 10, 3, '2017-01-27 14:24:09', '2017-02-09 04:30:09', '8998866200561', 'Ekomie', 5, 12, 12, '7200', '8500', 0, 0, '', '', 0, 0),
(184, 12, 3, '2017-01-27 14:24:09', '2017-02-07 03:59:12', '8992753101207', 'Susu Kaleng Kental manis', 3, 13, 10, '8700', '9500', 0, 0, '', '', 0, 0),
(185, 12, 3, '2017-01-27 14:24:09', '2017-02-13 04:44:25', '8992753102204', 'Susu Kaleng coklat', 16, 15, 0, '8750', '9500', 0, 0, '', '', 0, 0),
(186, 12, 3, '2017-01-27 14:24:09', '2017-02-16 07:02:34', '8992753031900', 'Bendera putih Sst', 3, 35, 40, '6625', '7500', 0, 0, '', '', 0, 0),
(187, 12, 3, '2017-01-27 14:24:09', '2017-02-16 07:02:34', '8992753102303', 'Bendera Coklat sst', 21, 28, 20, '6625', '7500', 0, 0, '', '', 0, 0),
(188, 10, 3, '2017-01-27 14:24:09', '2017-02-03 06:51:27', '8995177106889', 'Gula ku Heloo kitty', 2, 2, 0, '11000', '12000', 0, 0, '', '', 0, 0),
(189, 10, 3, '2017-01-27 14:24:09', '2017-02-03 06:51:30', '8995177109996', 'Gulaku Hijau 500 gr', 4, 4, 0, '8000', '8500', 0, 0, '', '', 0, 0),
(190, 10, 3, '2017-01-27 14:24:09', '2017-02-07 01:53:24', '8995177101112', 'Gulaku Hijau 1000 gr', 8, 4, 0, '16500', '17000', 0, 0, '', '', 0, 0),
(191, 12, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8992802064033', 'Susu Zee  sak', 3, 3, 0, '32500', '34500', 0, 0, '', '', 0, 0),
(192, 12, 3, '2017-01-27 14:24:09', '2017-02-17 04:57:50', '8992802064019', 'Susu zee Coklat sst', 69, 63, 0, '2473', '3000', 0, 0, '', '', 0, 0),
(193, 12, 3, '2017-01-27 14:24:09', '2017-02-14 03:24:32', '8992802064026', 'Susu zee Putih sst', 6, 0, 0, '2473', '3000', 0, 0, '', '', 0, 0),
(194, 14, 3, '2017-01-27 14:24:09', '2017-02-03 06:51:58', '8886020911609', 'Sikat Tulip', 56, 56, 0, '1500', '2500', 0, 0, '', '', 0, 0),
(195, 14, 3, '2017-01-27 14:24:09', '2017-02-06 05:56:52', '8991102020152', 'Sikat Formula', 21, 20, 0, '2300', '3000', 0, 0, '', '', 0, 0),
(196, 14, 3, '2017-01-27 14:24:09', '2017-02-03 06:52:46', '8998866103961', 'Sikat Ciptadent Medium', 4, 4, 0, '2225', '2500', 0, 0, '', '', 0, 0),
(197, 14, 3, '2017-01-27 14:24:09', '2017-02-03 06:53:10', '8998866103954', 'Sikat Ciptadent Soft', 1, 1, 0, '2225', '2500', 0, 0, '', '', 0, 0),
(198, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8991102102834', 'Sikat Formula anak', 1, 1, 0, '7300', '8500', 0, 0, '', '', 0, 0),
(199, 14, 3, '2017-01-27 14:24:09', '2017-02-03 06:53:17', 'Cmpr', 'Sikat Ciptadent', 6, 6, 0, '2225', '2500', 0, 0, '', '', 0, 0),
(200, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8995151160692', 'Pasta gigi daun Sirih', 3, 3, 0, '18150', '19000', 0, 0, '', '', 0, 0),
(201, 14, 3, '2017-01-27 14:24:09', '2017-02-06 05:51:45', '8995151320102', 'Lulur Kocok', 2, 1, 0, '14905', '15000', 0, 0, '', '', 0, 0),
(202, 12, 3, '2017-01-27 14:24:09', '2017-02-09 07:43:25', '8992761002022', 'Sprite 425', 16, 15, 0, '3375', '4000', 0, 0, '', '', 0, 0),
(203, 12, 3, '2017-01-27 14:24:09', '2017-02-10 04:03:35', '8992761002039', 'Fanta 425', 7, 5, 0, '3375', '4000', 0, 0, '', '', 0, 0),
(204, 12, 3, '2017-01-27 14:24:09', '2017-02-09 07:16:49', '8998866610087', 'Javana', 16, 14, 0, '2083', '3000', 0, 0, '', '', 0, 0),
(206, 12, 3, '2017-01-27 14:24:09', '2017-02-10 04:32:09', '8998866610377', 'Iso Plus', 8, 15, 12, '2250', '3000', 0, 0, '', '', 0, 0),
(207, 12, 3, '2017-01-27 14:24:09', '2017-02-06 07:21:22', '8992388101054', 'Nu Gren Tea less Sugar', 1, 0, 0, '4333', '5000', 0, 0, '', '', 0, 0),
(208, 12, 3, '2017-01-27 14:24:09', '2017-02-06 07:21:22', '8992388101016', 'Nu Green Tea Teh hijau', 1, 0, 0, '4333', '5000', 0, 0, '', '', 0, 0),
(210, 12, 3, '2017-01-27 14:24:09', '2017-02-14 07:12:14', '8992761122331', 'Frestea Apel 500', 1, 12, 12, '4725', '5500', 0, 0, '', '', 0, 0),
(211, 12, 3, '2017-01-27 14:24:09', '2017-02-17 05:02:13', '8992761122430', 'Frestea Madu 500', 2, 10, 12, '4725', '5500', 0, 0, '', '', 0, 0),
(212, 12, 3, '2017-01-27 14:24:09', '2017-02-14 07:12:14', '8992761122324', 'Frestea  Jasmine Melati 500ml', 12, 17, 12, '4725', '5500', 0, 0, '', '', 0, 0),
(213, 12, 3, '2017-01-27 14:24:09', '2017-02-16 08:40:43', '8886008101053', 'Aqua 600', 55, 108, 72, '1640', '2500', 0, 0, '', '', 0, 0),
(214, 12, 3, '2017-01-27 14:24:09', '2017-02-17 05:28:04', '8993278010036', 'Aquaria 600', 51, 38, 0, '1167', '2000', 0, 0, '', '', 0, 0),
(215, 12, 3, '2017-01-27 14:24:09', '2017-02-17 03:49:27', '8992761139018', 'Ades 600', 14, 9, 0, '1875', '3000', 0, 0, '', '', 0, 0),
(216, 12, 3, '2017-01-27 14:24:09', '2017-02-03 06:55:03', '749921010162', 'Nutrisari Mango', 10, 10, 0, '9102', '9700', 0, 0, '', '', 0, 0),
(217, 12, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '749921010445', 'Nutrisari Anggur', 2, 2, 0, '9102', '9700', 0, 0, '', '', 0, 0),
(218, 12, 3, '2017-01-27 14:24:09', '2017-02-06 03:04:43', '749921005946', 'Nutrisari Am Sweet', 8, 7, 0, '9102', '9700', 0, 0, '', '', 0, 0),
(219, 12, 3, '2017-01-27 14:24:09', '2017-02-06 03:04:43', '749921006158', 'Nutrisari Jambu', 7, 6, 0, '9102', '9700', 0, 0, '', '', 0, 0),
(220, 12, 3, '2017-01-27 14:24:09', '2017-02-03 06:55:21', '749921006110', 'Nutrisari Florida', 3, 3, 0, '9102', '9700', 0, 0, '', '', 0, 0),
(221, 12, 3, '2017-01-27 14:24:09', '2017-02-06 03:04:43', '749921010438', 'Nutrisari Sirsat', 12, 11, 0, '9102', '9700', 0, 0, '', '', 0, 0),
(222, 12, 3, '2017-01-27 14:24:09', '2017-02-13 06:32:54', '8991002103931', 'Good Day Carrebian', 12, 9, 0, '9250', '10000', 0, 0, '', '', 0, 0),
(223, 12, 3, '2017-01-27 14:24:09', '2017-02-13 04:44:25', '8991002103337', 'Good Day Vanila', 4, 2, 0, '9250', '10000', 0, 0, '', '', 0, 0),
(224, 12, 3, '2017-01-27 14:24:09', '2017-02-10 02:28:52', '8991002103436', 'Good Day Coolin', 2, -1, 0, '9102', '10000', 0, 0, '', '', 0, 0),
(225, 12, 3, '2017-01-27 14:24:09', '2017-02-10 02:28:51', '8991002103238', 'Good Day Mocacino', 8, 6, 0, '9250', '10000', 0, 0, '', '', 0, 0),
(226, 12, 3, '2017-01-27 14:24:09', '2017-02-03 06:56:53', '8991002101630', 'ABC Susu', 0, 0, 0, '8900', '9500', 0, 0, '', '', 0, 0),
(227, 12, 3, '2017-01-27 14:24:09', '2017-02-13 06:32:54', '8994171101289', 'White Coffe', 4, 20, 20, '9050', '9500', 0, 0, '', '', 0, 0),
(228, 12, 3, '2017-01-27 14:24:09', '2017-02-09 06:49:56', '8998866609234', 'Top White', 3, 2, 0, '7956', '10800', 0, 0, '', '', 0, 0),
(229, 12, 3, '2017-01-27 14:24:09', '2017-02-10 05:02:35', '8998866200745', 'Top Kopi Susu', 3, 2, 0, '7956', '10800', 0, 0, '', '', 0, 0),
(230, 12, 3, '2017-01-27 14:24:09', '2017-02-10 06:15:52', '8992696430204', 'Milo 18 gr', 6, 2, 0, '12750', '14000', 0, 0, '', '', 0, 0),
(231, 12, 3, '2017-01-27 14:24:09', '2017-02-07 03:59:12', '8993371100146', 'Jahe Wangi', 2, 12, 10, '7450', '8500', 0, 0, '', '', 0, 0),
(232, 12, 3, '2017-01-27 14:24:09', '2017-02-03 06:57:35', '8998866200219', 'Segar Dingin', 7, 7, 0, '5400', '6000', 0, 0, '', '', 0, 0),
(233, 12, 3, '2017-01-27 14:24:09', '2017-02-13 05:00:00', '8996001440087', 'Energen Kc Ijo', 2, 1, 1, '10700', '11500', 0, 0, '', '', 0, 0),
(234, 12, 3, '2017-01-27 14:24:09', '2017-02-07 03:59:12', '8996001440049', 'Energen Coklat', 7, 7, 7, '10700', '11500', 0, 0, '', '', 0, 0),
(235, 12, 3, '2017-01-27 14:24:09', '2017-02-13 05:00:00', '8996001440124', 'Energen Vanila', 1, 1, 2, '10700', '11500', 0, 0, '', '', 0, 0),
(236, 12, 3, '2017-01-27 14:24:09', '2017-02-16 04:37:26', '8994171101043', 'Kopi Luwak 165', 15, 6, 15, '8750', '9500', 0, 0, '', '', 0, 0),
(237, 12, 3, '2017-01-27 14:24:09', '2017-02-13 06:34:49', '8998866200646', 'Top Kopi Murni 165 gr', 2, 0, 3, '8600', '9500', 0, 0, '', '', 0, 0),
(238, 12, 3, '2017-01-27 14:24:09', '2017-02-13 06:34:49', '8998866201520', 'Top Kopi Toraja 165 gr', 3, 0, 3, '8600', '9500', 0, 0, '', '', 0, 0),
(239, 12, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8998866200615', 'Top Kopi murni 7 gr', 4, 4, 0, '3570', '4500', 0, 0, '', '', 0, 0),
(240, 12, 3, '2017-01-27 14:24:09', '2017-02-03 06:58:11', '8998866200639', 'Top Kopi Murni 65 gr', 2, 2, 0, '4379', '5500', 0, 0, '', '', 0, 0),
(241, 12, 3, '2017-01-27 14:24:09', '2017-02-03 06:58:18', '8991002105423', 'Kopi Kapal Api 165 gr', 0, 0, 0, '10250', '11000', 0, 0, '', '', 0, 0),
(242, 12, 3, '2017-01-27 14:24:09', '2017-02-16 06:12:54', '8992761166038', 'Pulpy Orange', 19, 17, 0, '5583', '6000', 0, 0, '', '', 0, 0),
(243, 12, 3, '2017-01-27 14:24:09', '2017-02-09 07:16:49', '8886007811113', 'Poci Vanila Clp', 3, 7, 5, '4000', '4500', 0, 0, '', '', 0, 0),
(244, 12, 3, '2017-01-27 14:24:09', '2017-02-07 04:51:16', '8886007811410', 'Poci Asli Clp', 3, 8, 5, '4000', '4500', 0, 0, '', '', 0, 0),
(245, 12, 3, '2017-01-27 14:24:09', '2017-02-03 06:58:45', '8999999195649', 'Sari Wangi 25', 0, 0, 0, '4700', '5500', 0, 0, '', '', 0, 0),
(246, 12, 3, '2017-01-27 14:24:09', '2017-02-03 06:58:50', '8886007811076', 'Sosro Clp', 5, 5, 0, '4400', '5000', 0, 0, '', '', 0, 0),
(247, 12, 3, '2017-01-27 14:24:09', '2017-02-11 03:22:11', '8994144100202', 'Gopek clp', 1, 5, 10, '6100', '6500', 0, 0, '', '', 0, 0),
(248, 12, 3, '2017-01-27 14:24:09', '2017-02-06 05:23:40', '8994144100035', 'Gopek Super', 26, 24, 0, '3809', '4600', 0, 0, '', '', 0, 0),
(249, 12, 3, '2017-01-27 14:24:09', '2017-02-06 08:30:54', '8886007000067', 'Poci Kepyur', 100, 90, 0, '1856', '2500', 0, 0, '', '', 0, 0),
(250, 12, 3, '2017-01-27 14:24:09', '2017-02-04 06:17:59', '8994286120045', 'Dandang kepyur', 84, 64, 0, '2292', '2500', 0, 0, '', '', 0, 0),
(251, 12, 3, '2017-01-27 14:24:09', '2017-02-09 06:49:56', '8994144100042', 'Gopek Kecil', 67, 60, 0, '2100', '2500', 0, 0, '', '', 0, 0),
(253, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8995151220884', 'Parfum putri Ungu', 1, 1, 0, '13200', '15000', 0, 0, '', '', 0, 0),
(254, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8995151220860', 'Parfum Putri Kuning', 1, 1, 0, '13200', '15000', 0, 0, '', '', 0, 0),
(255, 14, 3, '2017-01-27 14:24:09', '2017-02-03 06:59:42', '8995151220839', 'Parfum Putri pink', 2, 2, 0, '13200', '15000', 0, 0, '', '', 0, 0),
(256, 14, 3, '2017-01-27 14:24:09', '2017-02-03 06:59:50', '8995151220846', 'Parfum Putri Merah', 0, 0, 0, '13200', '15000', 0, 0, '', '', 0, 0),
(257, 14, 3, '2017-01-27 14:24:09', '2017-02-13 03:42:57', '8995151221102', 'Parfum Putri Orange rose', 2, 1, 0, '13200', '15000', 0, 0, '', '', 0, 0),
(258, 14, 3, '2017-01-27 14:24:09', '2017-02-03 06:59:59', '8995151220877', 'Parfum Putri Comeli', 1, 1, 0, '13200', '15000', 0, 0, '', '', 0, 0),
(259, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8995151220853', 'Parfum Putri Biru', 2, 2, 0, '13200', '15000', 0, 0, '', '', 0, 0),
(260, 14, 3, '2017-01-27 14:24:09', '2017-01-31 14:22:55', '8851932184564', 'Ponds AM', 0, 0, 0, '25575', '27000', 0, 0, '', '', 0, 0),
(261, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8995151221348', 'Parfum Lovely mood Orange', 2, 2, 0, '22000', '24000', 0, 0, '', '', 0, 0),
(262, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8995151221331', 'Parfum Lovely mood Hijau', 1, 1, 0, '22000', '24000', 0, 0, '', '', 0, 0),
(263, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8995151221355', 'Parfum Lovely mood Ungu', 1, 1, 0, '22000', '24000', 0, 0, '', '', 0, 0),
(264, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8995151130688', 'Cem Ceman', 1, 1, 0, '12250', '13500', 0, 0, '', '', 0, 0),
(265, 14, 3, '2017-01-27 14:24:09', '2017-02-03 07:00:34', '8998866106306', 'Emeron HBL Merah', 4, 4, 0, '4380', '5500', 0, 0, '', '', 0, 0),
(266, 14, 3, '2017-01-27 14:24:09', '2017-02-04 05:41:11', '8998866105484', 'Emeron HBL Pink', 3, 2, 0, '4380', '5500', 0, 0, '', '', 0, 0),
(267, 14, 3, '2017-01-27 14:24:09', '2017-02-03 07:00:51', '8993417164132', 'Resi V extra', 1, 1, 0, '5750', '8500', 0, 0, '', '', 0, 0),
(268, 14, 3, '2017-01-27 14:24:09', '2017-01-31 14:22:55', '8993417212178', 'Eskulin Sunday', 0, 0, 0, '5999', '7000', 0, 0, '', '', 0, 0),
(269, 14, 3, '2017-01-27 14:24:09', '2017-02-03 07:01:06', '8993417212147', 'Eskulin Thurday', 10, 10, 0, '5999', '7000', 0, 0, '', '', 0, 0),
(270, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8999999717520', 'Ponds White Beauty', 2, 2, 0, '12200', '16000', 0, 0, '', '', 0, 0),
(271, 14, 3, '2017-01-27 14:24:09', '2017-01-31 14:22:55', '8999999052973', 'Ponds FF Pure White', 0, 0, 0, '12800', '16500', 0, 0, '', '', 0, 0),
(272, 14, 3, '2017-01-27 14:24:09', '2017-02-16 03:11:05', '8999999048228', 'Sunslik coundisener 70', 1, 0, 0, '8305', '9500', 0, 0, '', '', 0, 0),
(273, 14, 3, '2017-01-27 14:24:09', '2017-02-04 03:40:36', '8999999043797', 'Clear AD ', 1, 0, 0, '9460', '10000', 0, 0, '', '', 0, 0),
(274, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '4902430313490', 'Pantene Countidisiner 85', 1, 1, 0, '7875', '9500', 0, 0, '', '', 0, 0),
(275, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8995151140823', 'Pelembab  Sekar ', 5, 5, 0, '10050', '13500', 0, 0, '', '', 0, 0),
(276, 14, 3, '2017-01-27 14:24:09', '2017-02-07 02:58:28', '8995151140830', 'Alas Bedak Tasik', 2, 1, 0, '13650', '14500', 0, 0, '', '', 0, 0),
(277, 14, 3, '2017-01-27 14:24:09', '2017-02-03 07:01:26', '8995151110437', 'Krem Masker', 2, 2, 0, '14750', '15500', 0, 0, '', '', 0, 0),
(278, 14, 3, '2017-01-27 14:24:09', '2017-02-10 07:52:45', '8934868015031', 'Rexona sst Men', 6, 4, 0, '1600', '2000', 0, 0, '', '', 0, 0),
(279, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8999999004262', 'Citra Mutiara 60', 3, 3, 0, '5280', '7000', 0, 0, '', '', 0, 0),
(280, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8999999004194', 'Citra Bengkoang 60', 4, 4, 0, '5280', '7000', 0, 0, '', '', 0, 0),
(281, 14, 3, '2017-01-27 14:24:09', '2017-02-03 07:01:44', '8999999003722', 'Citra mutiara 120', 10, 10, 0, '9680', '11000', 0, 0, '', '', 0, 0),
(282, 14, 3, '2017-01-27 14:24:09', '2017-02-04 05:08:37', '8999999003753', 'Citra bengkoang 250', 1, 0, 0, '14900', '18500', 0, 0, '', '', 0, 0),
(283, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8992832601185', 'Casablanca Romantic 100', 2, 2, 0, '13000', '14500', 0, 0, '', '', 0, 0),
(284, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '9556006012086', 'Johnson Top To', 3, 3, 0, '9824', '11500', 0, 0, '', '', 0, 0),
(285, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8991111101736', 'Johnson Cologne Beaven', 1, 1, 0, '15829', '17000', 0, 0, '', '', 0, 0),
(286, 14, 3, '2017-01-27 14:24:09', '2017-02-08 04:46:53', '8991111111971', 'Clean & Clear 100', 1, 0, 0, '15840', '19000', 0, 0, '', '', 0, 0),
(287, 14, 3, '2017-01-27 14:24:09', '2017-02-03 07:02:04', '8991111111964', 'Clean & Clear 50ml', 3, 3, 0, '10300', '12500', 0, 0, '', '', 0, 0),
(288, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8993560022006', 'Dettol anti septik 50ml', 1, 1, 0, '5300', '6500', 0, 0, '', '', 0, 0),
(289, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8993560022020', 'Dettol anti septik 100ml', 1, 1, 0, '10900', '12000', 0, 0, '', '', 0, 0),
(290, 14, 3, '2017-01-27 14:24:09', '2017-02-06 05:51:45', '8999999049461', 'Rexona Women', 2, 1, 0, '14200', '16000', 0, 0, '', '', 0, 0),
(291, 14, 3, '2017-01-27 14:24:09', '2017-02-03 07:02:15', '8999999049669', 'Rexona Men', 2, 2, 0, '14200', '16000', 0, 0, '', '', 0, 0),
(292, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8995151220273', 'Rexona Putri ungu', 1, 1, 0, '15000', '16000', 0, 0, '', '', 0, 0),
(293, 14, 3, '2017-01-27 14:24:09', '2017-02-10 02:33:46', '8995151220266', 'Rexona Putri biru', 3, 2, 0, '15000', '16000', 0, 0, '', '', 0, 0),
(294, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8993176110081', 'Minyak Kayu Putih 30ml', 1, 1, 0, '8500', '10000', 0, 0, '', '', 0, 0),
(295, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8997021870236', 'Frescare Sport', 1, 1, 0, '11000', '12000', 0, 0, '', '', 0, 0),
(296, 14, 3, '2017-01-27 14:24:09', '2017-01-31 14:22:55', '8997021870137', 'Frescare Splass', 0, 0, 0, '11000', '12000', 0, 0, '', '', 0, 0),
(297, 14, 3, '2017-01-27 14:24:09', '2017-02-10 02:52:00', '8998866602273', 'Hers Protex 8', 3, 2, 0, '3500', '2418', 0, 0, '', '', 0, 0),
(298, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8998866500135', 'Hers Protex Maxi wing', 2, 2, 0, '4290', '5000', 0, 0, '', '', 0, 0),
(299, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8998866500746', 'Hers Protex Non ', 2, 2, 0, '2400', '3000', 0, 0, '', '', 0, 0),
(300, 14, 3, '2017-01-27 14:24:09', '2017-01-31 14:22:55', '8992727000048', 'Laurier maxi 8', 0, 0, 0, '2917', '3500', 0, 0, '', '', 0, 0),
(301, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8992959117569', 'Softex Daun Sirih', 4, 4, 0, '3902', '4500', 0, 0, '', '', 0, 0),
(302, 14, 3, '2017-01-27 14:24:09', '2017-02-04 04:17:11', '8992959117583', 'Softex Daun Sirih Wing', 1, 0, 0, '4253', '5000', 0, 0, '', '', 0, 0),
(303, 14, 3, '2017-01-27 14:24:09', '2017-02-10 08:05:57', '8992727002714', 'Laurier maxi 30', 2, 0, 0, '9500', '11000', 0, 0, '', '', 0, 0),
(304, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8851111400324', 'Mamy Poko S', 1, 1, 0, '20000', '21000', 0, 0, '', '', 0, 0),
(305, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8998866602655', 'Protex 60', 1, 1, 0, '16538', '17500', 0, 0, '', '', 0, 0),
(306, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8997006830118', 'Fitti Day Pant', 2, 2, 0, '10000', '12000', 0, 0, '', '', 0, 0),
(307, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', 'SW1', 'Sweety Sst', 4, 4, 0, '1500', '3000', 0, 0, '', '', 0, 0),
(308, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', 'Tas tw20', 'TW 20', 1, 1, 0, '60000', '80000', 0, 0, '', '', 0, 0),
(309, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', 'Tas Tw7', 'TW 07', 1, 1, 0, '60000', '80000', 0, 0, '', '', 0, 0),
(310, 14, 3, '2017-01-27 14:24:09', '2017-02-03 07:06:29', 'Tas Tw02', 'TW 02', 1, 1, 0, '100000', '120000', 0, 0, '', '', 0, 0),
(311, 14, 3, '2017-01-27 14:24:09', '2017-01-31 14:22:55', 'Tas Tw03', 'TW 03', 0, 0, 0, '80000', '100000', 0, 0, '', '', 0, 0),
(312, 14, 3, '2017-01-27 14:24:09', '2017-02-03 07:06:56', 'Tas Tk2', 'TK  02', 0, 0, 0, '235000', '270000', 0, 0, '', '', 0, 0),
(313, 14, 3, '2017-01-27 14:24:09', '2017-02-03 07:06:51', 'Tas Tk10', 'Tk 10', 0, 0, 0, '250000', '300000', 0, 0, '', '', 0, 0),
(314, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', 'SJ1', 'Seprei Jepang', 1, 1, 0, '250000', '300000', 0, 0, '', '', 0, 0),
(315, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', 'Sp2', 'Seprei No.2', 10, 10, 0, '170000', '215000', 0, 0, '', '', 0, 0),
(316, 14, 3, '2017-01-27 14:24:09', '2017-02-17 05:14:46', 'Sp1', 'Seprei No.1', 12, 10, 0, '175000', '225000', 0, 0, '', '', 0, 0),
(317, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', 'Sp3', 'Seprei No.3', 5, 5, 0, '145000', '165000', 0, 0, '', '', 0, 0),
(318, 14, 3, '2017-01-27 14:24:09', '2017-02-16 03:11:05', '8992931025608', 'Multi 600 gr', 3, 1, 0, '16786', '19000', 0, 0, '', '', 0, 0),
(319, 14, 3, '2017-01-27 14:24:09', '2017-02-10 06:15:52', '8992931025110', 'Multi 250', 5, 3, 0, '9263', '11000', 0, 0, '', '', 0, 0),
(320, 14, 3, '2017-01-27 14:24:09', '2017-01-31 14:22:55', '8992931025011', 'Multi 260', 0, 0, 0, '11000', '12000', 0, 0, '', '', 0, 0),
(321, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8992931027015', 'Multi Serbet', 1, 1, 0, '3088', '4000', 0, 0, '', '', 0, 0),
(322, 14, 3, '2017-01-27 14:24:09', '2017-02-03 07:08:04', '8992931025202', 'Multi Putih Refil', 0, 0, 0, '5083', '6500', 0, 0, '', '', 0, 0),
(323, 14, 3, '2017-01-27 14:24:09', '2017-02-17 04:31:48', '8992931025035', 'Multi Biru Refil', 4, 1, 0, '5350', '6500', 0, 0, '', '', 0, 0),
(324, 14, 3, '2017-01-27 14:24:09', '2017-02-03 07:08:19', '8992931005068', 'Tessa 200', 2, 2, 0, '10600', '11500', 0, 0, '', '', 0, 0),
(325, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8992931002050', 'Tessa Kotak 120', 3, 3, 0, '9500', '11500', 0, 0, '', '', 0, 0),
(326, 14, 3, '2017-01-27 14:24:09', '2017-02-09 04:53:16', '8992931005099', 'Tessa rolingstone  150', 1, 0, 0, '3583', '4500', 0, 0, '', '', 0, 0),
(327, 14, 3, '2017-01-27 14:24:09', '2017-02-03 07:08:47', '8992931005112', 'Tessa 50', 50, 50, 0, '2090', '3000', 0, 0, '', '', 0, 0),
(328, 14, 3, '2017-01-27 14:24:09', '2017-02-13 03:43:47', '8992931005181', 'Tessa Top Brand', 6, 5, 0, '2090', '3000', 0, 0, '', '', 0, 0),
(329, 14, 3, '2017-01-27 14:24:09', '2017-02-09 04:53:16', '8992931025073', 'Multi Travel 70', 4, 3, 0, '3183', '4500', 0, 0, '', '', 0, 0),
(330, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', 'Pul1', 'Tissu Pulpies', 5, 5, 0, '4000', '4500', 0, 0, '', '', 0, 0),
(331, 14, 3, '2017-01-27 14:24:09', '2017-02-04 05:41:11', '8991038774976', 'Kapas Cinderela', 12, 11, 0, '1792', '2500', 0, 0, '', '', 0, 0),
(332, 14, 3, '2017-01-27 14:24:09', '2017-02-14 04:02:09', '8991038110354', 'Kapas Selection', 7, 4, 0, '3225', '4500', 0, 0, '', '', 0, 0),
(333, 14, 3, '2017-01-27 14:24:09', '2017-02-03 07:09:17', '8992931006256', 'Tessa Saku', 12, 12, 0, '910', '1500', 0, 0, '', '', 0, 0),
(334, 14, 3, '2017-01-27 14:24:09', '2017-02-03 07:10:10', 'Tisu1', 'Tissu Gulung Putih', 14, 14, 0, '1750', '2500', 0, 0, '', '', 0, 0),
(335, 14, 3, '2017-01-27 14:24:09', '2017-02-03 07:10:44', '8992931029521', 'Multi Gulung', 10, 10, 0, '2000', '3000', 0, 0, '', '', 0, 0),
(336, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8992931009547', 'Tessa Gulung', 5, 5, 0, '3895', '4500', 0, 0, '', '', 0, 0),
(337, 14, 3, '2017-01-27 14:24:09', '2017-02-16 07:57:41', '8998866500128', 'Hers Protex Wing 5', 14, 12, 0, '2175', '3000', 0, 0, '', '', 0, 0),
(338, 10, 3, '2017-01-27 14:24:09', '2017-02-10 06:15:52', '8998866200837', 'Sedap Cup soto', 1, 1, 3, '3272', '5000', 0, 0, '', '', 0, 0),
(339, 10, 3, '2017-01-27 14:24:09', '2017-02-03 07:11:20', '8998866200844', 'Sedap Cup Kari Spesial', 3, 3, 0, '3600', '5000', 0, 0, '', '', 0, 0),
(340, 14, 3, '2017-01-27 14:24:09', '2017-01-31 14:22:55', '8998866607360', 'Daia biru', 0, 0, 0, '4700', '5000', 0, 0, '', '', 0, 0),
(341, 14, 3, '2017-01-27 14:24:09', '2017-02-03 07:11:43', '8998866610230', 'Daia Ungu', 1, 1, 0, '4700', '5000', 0, 0, '', '', 0, 0),
(342, 14, 3, '2017-01-27 14:24:09', '2017-02-03 07:11:49', '8998866803700', 'So klin sst ungu', 3, 3, 0, '4700', '5500', 0, 0, '', '', 0, 0),
(343, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8999999023942', 'Rinso sst kecil', 9, 9, 0, '2400', '2700', 0, 0, '', '', 0, 0),
(344, 14, 3, '2017-01-27 14:24:09', '2017-02-04 03:40:35', '8999999396749', 'Sunlight Cream', 2, 1, 0, '5300', '6500', 0, 0, '', '', 0, 0),
(345, 14, 3, '2017-01-27 14:24:09', '2017-02-10 08:05:57', '8993189270284', 'Charm 8', 4, 2, 0, '2900', '4500', 0, 0, '', '', 0, 0),
(346, 14, 3, '2017-01-27 14:24:09', '2017-02-03 07:12:02', '8998866670722', 'Wing Biru', 15, 15, 0, '1700', '2000', 0, 0, '', '', 0, 0),
(347, 14, 3, '2017-01-27 14:24:09', '2017-02-09 04:30:09', '8998866607872', 'Ekonomi', 10, 40, 30, '1700', '2000', 0, 0, '', '', 0, 0),
(348, 14, 3, '2017-01-27 14:24:09', '2017-02-03 07:12:22', '8998866608848', 'Dangdut Putih', 6, 6, 0, '800', '1000', 0, 0, '', '', 0, 0),
(349, 14, 3, '2017-01-27 14:24:09', '2017-02-03 07:12:23', '8999999047245', 'Rinso sst Molto', 1, 1, 0, '4800', '5500', 0, 0, '', '', 0, 0),
(350, 12, 3, '2017-01-27 14:24:09', '2017-02-07 08:34:40', 'FB', 'Frestea beleng', 23, 21, 0, '1750', '2000', 0, 0, '', '', 0, 0),
(351, 12, 3, '2017-01-27 14:24:09', '2017-02-07 07:27:47', 'teh botol', 'Teh botol sosro', 27, 24, 0, '1875', '3000', 0, 0, '', '', 0, 0),
(352, 12, 3, '2017-01-27 14:24:09', '2017-02-03 07:13:00', 'Tebs', 'Tebs', 2, 2, 0, '1875', '3000', 0, 0, '', '', 0, 0),
(353, 12, 3, '2017-01-27 14:24:09', '2017-02-17 04:45:46', 'yakult', 'Yakult', 10, 6, 0, '1540', '2000', 0, 0, '', '', 0, 0),
(354, 12, 3, '2017-01-27 14:24:09', '2017-02-03 07:13:22', 'Fruit tea', 'Fruit tea', 20, 20, 0, '1875', '3000', 0, 0, '', '', 0, 0),
(355, 14, 3, '2017-01-27 14:24:09', '2017-02-13 07:26:55', 'korek kayu', 'Korek kayu', 317, 309, 0, '200', '500', 0, 0, '', '', 0, 0),
(356, 13, 3, '2017-01-27 14:24:09', '2017-02-16 02:30:49', '8991906101019', 'Djarum 12', 40, 37, 40, '14200', '15500', 0, 0, '', '', 0, 0),
(357, 13, 3, '2017-01-27 14:24:09', '2017-02-16 07:02:34', '8991906101026', 'Djarum 16', 30, 23, 30, '18300', '20000', 0, 0, '', '', 0, 0),
(358, 13, 3, '2017-01-27 14:24:09', '2017-02-04 01:56:25', '76239878', 'Malboro putih', 4, 3, 0, '20000', '22000', 0, 0, '', '', 0, 0),
(360, 13, 3, '2017-01-27 14:24:09', '2017-02-03 07:13:42', '8991906101309', '76 filter', 14, 14, 0, '11000', '12500', 0, 0, '', '', 0, 0),
(361, 13, 3, '2017-01-27 14:24:09', '2017-02-14 07:03:13', '8991906101668', '76 kretek', 11, 6, 0, '10500', '11800', 0, 0, '', '', 0, 0),
(362, 13, 3, '2017-01-27 14:24:09', '2017-02-16 04:26:20', '76164217', 'Malboro Merah', 10, 6, 10, '20000', '22000', 0, 0, '', '', 0, 0);
INSERT INTO `tbl_m_produk` (`id`, `id_kategori`, `id_satuan`, `tgl_simpan`, `tgl_modif`, `kode`, `produk`, `qty_awal`, `qty`, `qty_pemb`, `harga_dasar`, `harga`, `ppn`, `margin`, `ket`, `file`, `status_produk`, `status_ppn`) VALUES
(363, 13, 3, '2017-01-27 14:24:09', '2017-02-09 07:43:25', '8991906101057', 'LA merah', 7, 6, 0, '16200', '17000', 0, 0, '', '', 0, 0),
(364, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', 'Batu abc', 'Batu abc K', 0, 0, 0, '2000', '2500', 0, 0, '', '', 0, 0),
(365, 13, 3, '2017-01-27 14:24:09', '2017-02-11 02:24:46', '8998989110167', 'Surya 16', 5, 2, 5, '18200', '19000', 0, 0, '', '', 0, 0),
(366, 10, 3, '2017-01-27 14:24:09', '2017-02-14 07:00:33', 'gula jawa 1/2', 'Gula jawa 1/2', 11, 0, 0, '6000', '6500', 0, 0, '', '', 0, 0),
(367, 10, 3, '2017-01-27 14:24:09', '2017-02-17 05:35:20', 'Gula pasir 1kg', 'Gula Pasir 1kg', 50, 91, 150, '12300', '13000', 0, 0, '', '', 0, 0),
(368, 10, 3, '2017-01-27 14:24:09', '2017-02-17 04:18:40', 'Gula pasir 1/2', 'Gula pasir 1/2', 200, 0, 0, '6200', '6750', 0, 0, '', '', 0, 0),
(369, 13, 3, '2017-01-27 14:24:09', '2017-02-17 05:20:18', '8999909096004', 'Sampoerna Mild 16', 10, 4, 10, '18100', '19000', 0, 0, '', '', 0, 0),
(370, 13, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8998127127132', 'Sejati', 3, 3, 0, '9850', '10500', 0, 0, '', '', 0, 0),
(371, 13, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8998989300230', 'Gudang Garam Mild', 3, 3, 0, '12800', '13500', 0, 0, '', '', 0, 0),
(372, 13, 3, '2017-01-27 14:24:09', '2017-02-16 05:29:17', '8998989300155', 'Signatur', 10, 6, 10, '12200', '13000', 0, 0, '', '', 0, 0),
(373, 13, 3, '2017-01-27 14:24:09', '2017-02-03 07:15:05', '8998127912264', 'Lucky Strike', 1, 1, 0, '11800', '12500', 0, 0, '', '', 0, 0),
(374, 13, 3, '2017-01-27 14:24:09', '2017-02-08 07:26:55', '8998989300391', 'Surya Pro', 5, 5, 5, '11400', '13000', 0, 0, '', '', 0, 0),
(375, 13, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8995078803078', 'U mild', 2, 2, 0, '13500', '14500', 0, 0, '', '', 0, 0),
(376, 13, 3, '2017-01-27 14:24:09', '2017-02-07 02:03:00', '8999909001909', 'Magnum', 4, 3, 0, '13900', '15500', 0, 0, '', '', 0, 0),
(377, 13, 3, '2017-01-27 14:24:09', '2017-02-16 04:29:39', '8993587518889', 'Tuton Filter', 10, 7, 10, '7500', '8000', 0, 0, '', '', 0, 0),
(378, 13, 3, '2017-01-27 14:24:09', '2017-02-14 07:03:13', '8999909085114', 'Sampoerna Kretek', 11, 5, 0, '10400', '11000', 0, 0, '', '', 0, 0),
(379, 13, 3, '2017-01-27 14:24:09', '2017-02-08 04:10:33', '8991906101071', 'LA hijau', 10, 9, 10, '16200', '17000', 0, 0, '', '', 0, 0),
(380, 10, 3, '2017-01-27 14:24:09', '2017-02-03 07:15:39', '8999908000200', 'Bodrek', 42, 42, 0, '450', '500', 0, 0, '', '', 0, 0),
(381, 10, 3, '2017-01-27 14:24:09', '2017-02-14 06:34:49', '8998667100206', 'Paramex', 5, 4, 0, '2000', '2500', 0, 0, '', '', 0, 0),
(382, 10, 3, '2017-01-27 14:24:09', '2017-02-03 07:15:46', '8993058301200', 'Komix OBH', 4, 4, 0, '900', '1000', 0, 0, '', '', 0, 0),
(383, 10, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8993058300401', 'Komix Papermint', 1, 1, 0, '900', '1000', 0, 0, '', '', 0, 0),
(384, 10, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8993058300500', 'Komix Jahe', 3, 3, 0, '900', '1000', 0, 0, '', '', 0, 0),
(385, 10, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8993058300807', 'Komix Jeruk nipis', 7, 7, 0, '900', '1000', 0, 0, '', '', 0, 0),
(386, 10, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8993058105013', 'Extrajoss', 48, 48, 0, '775', '1000', 0, 0, '', '', 0, 0),
(387, 10, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8999908045805', 'Hemaviton Jreng', 4, 4, 0, '800', '1000', 0, 0, '', '', 0, 0),
(388, 10, 3, '2017-01-27 14:24:09', '2017-02-03 07:16:05', '8992858664713', 'Promax', 138, 138, 0, '450', '500', 0, 0, '', '', 0, 0),
(389, 10, 3, '2017-01-27 14:24:09', '2017-02-10 07:49:03', '8992695110206', 'Panadol Merah', 40, 38, 0, '750', '1000', 0, 0, '', '', 0, 0),
(390, 10, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8992695100207', 'Panadol Biru', 70, 70, 0, '670', '1000', 0, 0, '', '', 0, 0),
(391, 10, 3, '2017-01-27 14:24:09', '2017-02-16 05:41:10', '8992112014018', 'Neosep', 7, 6, 0, '2100', '2500', 0, 0, '', '', 0, 0),
(392, 12, 3, '2017-01-27 14:24:09', '2017-02-07 03:59:12', '8992772122245', 'Ademsari', 3, 51, 48, '1500', '2000', 0, 0, '', '', 0, 0),
(393, 12, 3, '2017-01-27 14:24:09', '2017-02-07 06:32:55', '8992858690200', 'Xonce', 12, 11, 0, '1200', '2000', 0, 0, '', '', 0, 0),
(394, 10, 3, '2017-01-27 14:24:09', '2017-02-10 07:49:45', '4987176600554', 'Vic Vorup', 1, 0, 0, '5500', '6500', 0, 0, '', '', 0, 0),
(395, 10, 3, '2017-01-27 14:24:09', '2017-02-16 03:36:33', '8995227500872', 'Balsem Kaki tiga', 1, 0, 0, '9200', '10000', 0, 0, '', '', 0, 0),
(396, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8995201800011', 'Counterpain', 1, 1, 0, '18300', '19500', 0, 0, '', '', 0, 0),
(397, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', 'Batu abc B', 'Batu abc Besar', 22, 22, 0, '4900', '5500', 0, 0, '', '', 0, 0),
(398, 14, 3, '2017-01-27 14:24:09', '2017-02-03 07:16:40', '8995151160029', 'Slimming tea', 1, 1, 0, '20000', '25000', 0, 0, '', '', 0, 0),
(399, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8995151140748', 'Bedak Refil Mustika', 1, 1, 0, '15000', '17000', 0, 0, '', '', 0, 0),
(400, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8995151140380', 'Bedak Padat Mustika', 1, 1, 0, '15500', '17500', 0, 0, '', '', 0, 0),
(401, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8995151140199', 'Bedak tabur Mustika', 1, 1, 0, '15500', '17500', 0, 0, '', '', 0, 0),
(402, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8995151240257', 'Bedak Puteri kuning langsat', 1, 1, 0, '14000', '15500', 0, 0, '', '', 0, 0),
(403, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8995151240240', 'Bedak Puteri Transparan', 1, 1, 0, '14000', '15500', 0, 0, '', '', 0, 0),
(404, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8995151240264', 'Bedak Puteri Kuning Gading', 1, 1, 0, '14000', '15500', 0, 0, '', '', 0, 0),
(405, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8995151120016', 'Lulur badan', 3, 3, 0, '7500', '8500', 0, 0, '', '', 0, 0),
(406, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8995151110116', 'Masker Bengkoang', 2, 2, 0, '8600', '9500', 0, 0, '', '', 0, 0),
(407, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8995151110154', 'Feling Pundisari', 1, 1, 0, '8600', '9500', 0, 0, '', '', 0, 0),
(408, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', 'Keset', 'Keset besar', 2, 2, 0, '6000', '7500', 0, 0, '', '', 0, 0),
(409, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', 'Sapu tebah', 'Sapu tebah', 2, 2, 0, '10000', '11500', 0, 0, '', '', 0, 0),
(410, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', 'Sapu miring', 'Sapu 2 macan miring', 3, 3, 0, '27000', '30000', 0, 0, '', '', 0, 0),
(411, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', 'Gantungan baju', 'Gantungan baju', 1, 1, 0, '15000', '17000', 0, 0, '', '', 0, 0),
(412, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', 'Kranjang sampah', 'Kranjang sampah', 3, 3, 0, '10000', '12000', 0, 0, '', '', 0, 0),
(413, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', 'Engkrak', 'Engkrak', 1, 1, 0, '5000', '6000', 0, 0, '', '', 0, 0),
(414, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', 'Sulak', 'Sulak', 3, 3, 0, '15000', '17000', 0, 0, '', '', 0, 0),
(415, 12, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8992761005016', 'Frestea besar', 6, 6, 0, '7700', '8500', 0, 0, '', '', 0, 0),
(416, 12, 3, '2017-01-27 14:24:09', '2017-02-16 05:50:54', '8886008101091', 'Aqua 1.5', 15, 2, 0, '3400', '5000', 0, 0, '', '', 0, 0),
(417, 12, 3, '2017-01-27 14:24:09', '2017-02-03 07:18:04', '8992767010113', 'Sirup Fress', 1, 1, 0, '16500', '17500', 0, 0, '', '', 0, 0),
(418, 12, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8994297101798', 'Sirup Delicio Jambu', 4, 4, 0, '16500', '17500', 0, 0, '', '', 0, 0),
(419, 12, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8994297101408', 'Sirup delicio Leci', 3, 3, 0, '16500', '17500', 0, 0, '', '', 0, 0),
(420, 12, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8994297101392', 'Sirup Delicio orange', 3, 3, 0, '16500', '17500', 0, 0, '', '', 0, 0),
(421, 12, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8994297101385', 'Sirup Delicio Melon', 3, 3, 0, '16500', '17500', 0, 0, '', '', 0, 0),
(422, 12, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8994297101422', 'Sirup delicio strawberry', 5, 5, 0, '16500', '17500', 0, 0, '', '', 0, 0),
(423, 12, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '711844162419', 'ABC kacang ijo', 0, 0, 0, '3250', '4500', 0, 0, '', '', 0, 0),
(424, 12, 3, '2017-01-27 14:24:09', '2017-02-13 08:05:32', '8993278020219', 'Aquaria 1.5', 8, 6, 0, '2350', '4000', 0, 0, '', '', 0, 0),
(425, 12, 3, '2017-01-27 14:24:09', '2017-02-16 06:12:54', '8886008101336', 'Aqua 330ml', 36, 34, 0, '1600', '2000', 0, 0, '', '', 0, 0),
(426, 10, 3, '2017-01-27 14:24:09', '2017-02-08 06:46:36', '8999999502393', 'Royco ayam', 3, 2, 0, '4600', '5000', 0, 0, '', '', 0, 0),
(427, 10, 3, '2017-01-27 14:24:09', '2017-02-03 07:19:38', '8992770033130', 'Masako Ayam', 3, 3, 0, '4500', '5000', 0, 0, '', '', 0, 0),
(428, 12, 3, '2017-01-27 14:24:09', '2017-01-31 14:22:55', '8886029101049', 'Ultraflu', 0, 0, 0, '2500', '3000', 0, 0, '', '', 0, 0),
(429, 14, 3, '2017-01-27 14:24:09', '2017-02-10 02:33:47', '8994357010015', 'Mia atom bulan', 8, 4, 0, '4000', '4500', 0, 0, '', '', 0, 0),
(430, 10, 3, '2017-01-27 14:24:09', '2017-02-03 07:21:16', 'cimin', 'Cimin', 0, 0, 0, '400', '500', 0, 0, '', '', 0, 0),
(431, 10, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '69024894', 'Snikers besar', 0, 0, 0, '3250', '4500', 0, 0, '', '', 0, 0),
(432, 10, 3, '2017-01-27 14:24:09', '2017-02-03 07:20:50', '69025310', 'Snikers Kecil', 0, 0, 0, '2000', '2500', 0, 0, '', '', 0, 0),
(433, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', 'Pembersih kaca', 'Pembersih kaca', 1, 1, 0, '15000', '17000', 0, 0, '', '', 0, 0),
(434, 10, 3, '2017-01-27 14:24:09', '2017-02-03 07:21:29', '69029783', 'Dove coklat', 0, 0, 0, '2400', '3000', 0, 0, '', '', 0, 0),
(435, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', 'Bed cover', 'Bed cover', 1, 1, 0, '530000', '570000', 0, 0, '', '', 0, 0),
(436, 13, 3, '2017-01-27 14:24:09', '2017-01-31 14:22:55', '8999909982000', 'Sampoerna Mild 12', 0, 0, 0, '11800', '13500', 0, 0, '', '', 0, 0),
(437, 12, 3, '2017-01-27 14:24:09', '2017-02-03 07:21:40', 'Vit gelas', 'Vit Gelas', 1, 1, 0, '16000', '17000', 0, 0, '', '', 0, 0),
(438, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8995151110420', 'Peliing Pundisari', 1, 1, 0, '14400', '16000', 0, 0, '', '', 0, 0),
(439, 10, 3, '2017-01-27 14:24:09', '2017-02-17 03:37:09', 'Beras Organik', 'Beras Organik', 23, 17, 0, '65000', '67500', 0, 0, '', '', 0, 0),
(440, 12, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8995227500957', 'Obat batuk Madu', 1, 1, 0, '21250', '23000', 0, 0, '', '', 0, 0),
(441, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8995151121631', 'Handbody Rose mawar', 1, 1, 0, '22350', '25000', 0, 0, '', '', 0, 0),
(442, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8995151120405', 'Handbody Mangir putih', 1, 1, 0, '22350', '25000', 0, 0, '', '', 0, 0),
(443, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8995151121624', 'Handbody Jasmine Melati', 1, 1, 0, '22350', '25000', 0, 0, '', '', 0, 0),
(444, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8995151120559', 'Handbody Mangir kuning', 1, 1, 0, '22350', '25000', 0, 0, '', '', 0, 0),
(445, 14, 3, '2017-01-27 14:24:09', '2017-02-03 07:22:22', '8995151121587', 'Handbody Lily & honey', 1, 1, 0, '22350', '25000', 0, 0, '', '', 0, 0),
(446, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8995151121648', 'Handbody Papaya', 1, 1, 0, '22350', '25000', 0, 0, '', '', 0, 0),
(447, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8995151130060', 'Sampo Mustika ratu bayam', 1, 1, 0, '18500', '20000', 0, 0, '', '', 0, 0),
(448, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8995151130497', 'Sampo Mustika ratu teh hijau', 1, 1, 0, '18500', '20000', 0, 0, '', '', 0, 0),
(449, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8995151130015', 'Sampo Mustika Daun waru', 2, 2, 0, '18500', '20000', 0, 0, '', '', 0, 0),
(450, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8995151130114', 'Bilasan Santaan Ms', 1, 1, 0, '21000', '23000', 0, 0, '', '', 0, 0),
(451, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8999999719395', 'Vaselin B3 100 ml', 1, 1, 0, '11220', '13000', 0, 0, '', '', 0, 0),
(452, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8999999003074', 'Vaselin Aloe Vera 100 ml', 2, 2, 0, '11220', '13000', 0, 0, '', '', 0, 0),
(453, 14, 3, '2017-01-27 14:24:09', '2017-02-03 07:22:42', '8995151140687', 'Pelembab Whitening', 2, 2, 0, '11000', '13500', 0, 0, '', '', 0, 0),
(454, 14, 3, '2017-01-27 14:24:09', '2017-02-03 07:22:44', '4902430400602', 'Pantene Total Damage 170 ', 0, 0, 0, '20000', '21000', 0, 0, '', '', 0, 0),
(455, 14, 3, '2017-01-27 14:24:09', '2017-02-03 07:22:47', '4902430400947', 'Pantene anti dandruf 170', 0, 0, 0, '20000', '21000', 0, 0, '', '', 0, 0),
(456, 13, 3, '2017-01-27 14:24:09', '2017-02-04 05:16:57', '8999909000346', 'U bold', 1, 0, 0, '10100', '11500', 0, 0, '', '', 0, 0),
(457, 13, 3, '2017-01-27 14:24:09', '2017-02-10 06:07:16', '8999909028234', 'Dji Samsoe', 9, 8, 0, '13600', '14500', 0, 0, '', '', 0, 0),
(458, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8999999008918', 'Sunlig Cair Anti bacteria 800', 1, 1, 0, '13000', '14500', 0, 0, '', '', 0, 0),
(459, 14, 3, '2017-01-27 14:24:09', '2017-02-03 07:23:48', '8999999038090', 'Sunlig Cair Clean & Soft 800', 1, 1, 0, '13000', '14500', 0, 0, '', '', 0, 0),
(460, 14, 3, '2017-01-27 14:24:09', '2017-02-03 07:23:52', '8993417172229', 'B & B Kid', 2, 2, 0, '7500', '9000', 0, 0, '', '', 0, 0),
(461, 14, 3, '2017-01-27 14:24:09', '2017-02-13 03:42:57', '8992832601451', 'Casablanca Kaleng Femme 100', 1, 0, 0, '16000', '18000', 0, 0, '', '', 0, 0),
(462, 14, 3, '2017-01-27 14:24:09', '2017-02-13 05:00:00', '711844130111', 'ABC saus Tomat 135 ml', 4, 1, 0, '4833', '6000', 0, 0, '', '', 0, 0),
(463, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8998866574044', 'Hers Protex Reguler', 3, 3, 0, '2950', '3500', 0, 0, '', '', 0, 0),
(464, 13, 3, '2017-01-27 14:24:09', '2017-02-07 03:59:12', '8998181941132', 'Dunhil Hitam', 1, 5, 5, '14800', '15500', 0, 0, '', '', 0, 0),
(465, 12, 3, '2017-01-27 14:24:09', '2017-02-10 02:28:51', '8994286110015', 'Dandang Biru', 10, 16, 20, '2350', '3000', 0, 0, '', '', 0, 0),
(466, 12, 3, '2017-01-27 14:24:09', '2017-02-11 05:15:34', '8992753100309', 'Bendera Gold sst', 2, 1, 0, '9600', '10500', 0, 0, '', '', 0, 0),
(467, 12, 3, '2017-01-27 14:24:09', '2017-02-03 07:24:25', '8999988778860', 'Lasegar Leci', 0, 0, 0, '4350', '5000', 0, 0, '', '', 0, 0),
(468, 12, 3, '2017-01-27 14:24:09', '2017-02-03 07:24:31', '8999988778846', 'Lasegar Jambu', 0, 0, 0, '4350', '5000', 0, 0, '', '', 0, 0),
(469, 12, 3, '2017-01-27 14:24:09', '2017-02-03 07:24:35', '8999988778877', 'Lasegar Jeruk Nipis', 0, 0, 0, '4350', '5000', 0, 0, '', '', 0, 0),
(470, 12, 3, '2017-01-27 14:24:09', '2017-01-31 14:22:55', '8999988778822', 'Lasegar Strawberi', 0, 0, 0, '4350', '5000', 0, 0, '', '', 0, 0),
(471, 14, 3, '2017-01-27 14:24:09', '2017-02-04 05:34:22', '8992727005272', 'Jazz1 SSt pink', 4, 2, 0, '4600', '5200', 0, 0, '', '', 0, 0),
(472, 14, 3, '2017-01-27 14:24:09', '2017-02-04 05:34:22', '8992727005296', 'Jazz1 SSt Lavender', 3, 1, 0, '4600', '5200', 0, 0, '', '', 0, 0),
(473, 10, 3, '2017-01-27 14:24:09', '2017-02-16 03:19:37', '8999999034153', 'Blue Band 200 gr', 8, 5, 0, '6000', '7000', 0, 0, '', '', 0, 0),
(475, 14, 3, '2017-01-27 14:24:09', '2017-02-03 07:25:11', '8998866102001', 'Sampo Zinc Sst Merah', 3, 3, 0, '2160', '2900', 0, 0, '', '', 0, 0),
(476, 10, 3, '2017-01-27 14:24:09', '2017-02-03 07:25:16', '8992770096135', 'Saori saus tiram275 ml', 0, 0, 0, '16495', '17500', 0, 0, '', '', 0, 0),
(477, 14, 3, '2017-01-27 14:24:09', '2017-02-03 07:25:18', '8999777888367', 'Nivea Men 100 ml', 0, 0, 0, '22495', '24000', 0, 0, '', '', 0, 0),
(478, 14, 3, '2017-01-27 14:24:09', '2017-02-03 07:25:19', '8993417001376', 'Oval Whitening 200 ml', 0, 0, 0, '20495', '22000', 0, 0, '', '', 0, 0),
(479, 14, 3, '2017-01-27 14:24:09', '2017-02-08 04:10:33', '8999999504038', 'Molto all in 1 Biru sst', 2, 0, 0, '4700', '5500', 0, 0, '', '', 0, 0),
(480, 14, 3, '2017-01-27 14:24:09', '2017-02-04 05:34:22', '8999999057633', 'Molto Elegant sst', 2, 0, 0, '4700', '5500', 0, 0, '', '', 0, 0),
(481, 14, 3, '2017-01-27 14:24:09', '2017-02-16 04:56:13', '8999999057190', 'Molto Anri Bacteri', 3, 6, 4, '4675', '5500', 0, 0, '', '', 0, 0),
(482, 14, 3, '2017-01-27 14:24:09', '2017-02-03 07:25:41', '4902430557122', 'Downy Biru sst', 0, 0, 0, '4700', '5500', 0, 0, '', '', 0, 0),
(483, 14, 3, '2017-01-27 14:24:09', '2017-01-31 14:22:55', '8999999041151', 'sampo Dove Daily shine', 0, 0, 0, '9400', '10000', 0, 0, '', '', 0, 0),
(484, 14, 3, '2017-01-27 14:24:09', '2017-02-14 07:17:14', '8999999390198', 'Sunlig Jeruk Nipis 800', 18, 24, 12, '13250', '14500', 0, 0, '', '', 0, 0),
(485, 14, 3, '2017-01-27 14:24:09', '2017-02-07 02:28:17', '8992753100101', 'Bendera Gold', 15, 6, 0, '12990', '13800', 0, 0, '', '', 0, 0),
(486, 14, 3, '2017-01-27 14:24:09', '2017-02-13 04:37:57', '8998866605199', 'Boom Merah', 12, 8, 0, '4500', '5000', 0, 0, '', '', 0, 0),
(487, 12, 3, '2017-01-27 14:24:09', '2017-02-16 02:30:49', '8992761166229', 'Frestea Markisa 350 ml', 11, 5, 0, '3250', '4000', 0, 0, '', '', 0, 0),
(488, 12, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8997021670089', 'Sirup Kartika melon', 0, 0, 0, '14875', '16500', 0, 0, '', '', 0, 0),
(489, 10, 3, '2017-01-27 14:24:09', '2017-02-03 07:26:05', '8998866200899', 'Sukses AB', 19, 19, 0, '2282', '2500', 0, 0, '', '', 0, 0),
(490, 10, 3, '2017-01-27 14:24:09', '2017-02-10 07:54:28', '8993118936557', 'Beras Maknyus', 10, 8, 10, '62000', '65000', 0, 0, '', '', 0, 0),
(491, 14, 3, '2017-01-27 14:24:09', '2017-02-10 08:05:57', '8998866608725', 'Daia Softener Pink', 4, 0, 0, '12900', '14000', 0, 0, '', '', 0, 0),
(492, 14, 3, '2017-01-27 14:24:09', '2017-02-10 08:05:57', '8998866604932', 'Daia Lemon', 4, 0, 0, '12900', '14000', 0, 0, '', '', 0, 0),
(493, 14, 3, '2017-01-27 14:24:09', '2017-02-08 04:46:53', '8998866610223', 'Daia Ungu 800', 2, 0, 0, '12900', '14000', 0, 0, '', '', 0, 0),
(494, 14, 3, '2017-01-27 14:24:09', '2017-02-10 08:05:57', '8998866601436', 'Daia Bunga 800', 4, 0, 0, '12900', '14000', 0, 0, '', '', 0, 0),
(495, 14, 3, '2017-01-27 14:24:09', '2017-02-04 05:41:11', '8998866605809', 'Soklin Smart White 800', 5, 4, 0, '16995', '18000', 0, 0, '', '', 0, 0),
(496, 14, 3, '2017-01-27 14:24:09', '2017-02-13 04:44:25', '8998866100144', 'Ciptadent Cool Mint 75', 10, 8, 0, '2600', '2800', 0, 0, '', '', 0, 0),
(497, 14, 3, '2017-01-27 14:24:09', '2017-02-03 07:26:46', '8998866181068', 'Ciptadent Fresh mint 75 gr', 10, 10, 0, '2600', '2800', 0, 0, '', '', 0, 0),
(498, 14, 3, '2017-01-27 14:24:09', '2017-02-07 08:34:40', '8998866181082', 'Ciptadent Fresh Mint 190 gr', 12, 11, 0, '6700', '7500', 0, 0, '', '', 0, 0),
(499, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8998866605649', 'Rapika Refil Biru 450', 1, 1, 0, '4225', '5000', 0, 0, '', '', 0, 0),
(500, 10, 4, '2017-01-27 14:24:09', '2017-02-11 05:09:34', '8998225800043', 'Fortune 2lt', 6, 1, 0, '21900', '24000', 0, 0, '', '', 0, 0),
(501, 10, 3, '2017-01-27 14:24:09', '2017-02-13 06:32:54', '8991002103832', 'Good day chococino', 7, -1, 0, '9400', '10000', 0, 0, '', '', 0, 0),
(502, 12, 3, '2017-01-27 14:24:09', '2017-02-03 07:27:00', '8998866200691', 'Top Kopi Gula', 2, 2, 0, '6800', '10800', 0, 0, '', '', 0, 0),
(503, 12, 3, '2017-01-27 14:24:09', '2017-02-06 07:29:14', '8998866201001', 'Top kopi susu kental manis', 8, 7, 0, '7800', '10800', 0, 0, '', '', 0, 0),
(504, 12, 3, '2017-01-27 14:24:09', '2017-02-10 02:28:51', '9311931024036', 'Coffemic', 4, 20, 20, '9670', '10700', 0, 0, '', '', 0, 0),
(505, 12, 3, '2017-01-27 14:24:09', '2017-02-16 06:13:59', '8998866500708', 'Floridina', 5, 18, 24, '2400', '3000', 0, 0, '', '', 0, 0),
(506, 10, 3, '2017-01-27 14:24:09', '2017-02-03 07:27:22', 'Tissu polos', 'Tessa gulung putih', 4, 4, 0, '2500', '3500', 0, 0, '', '', 0, 0),
(507, 10, 3, '2017-01-27 14:24:09', '2017-02-11 03:22:11', 'kecap lele 340', 'Kecap lele 340', 4, 7, 9, '9200', '10500', 0, 0, '', '', 0, 0),
(508, 10, 3, '2017-01-27 14:24:09', '2017-02-10 02:33:46', 'kecap lele sst', 'kecap lele sst', 10, 7, 10, '17500', '18500', 0, 0, '', '', 0, 0),
(509, 10, 3, '2017-01-27 14:24:09', '2017-02-06 08:25:27', 'Motto 1/4', 'motto 1/4', 3, 0, 0, '7600', '8000', 0, 0, '', '', 0, 0),
(510, 10, 3, '2017-01-27 14:24:09', '2017-02-16 04:37:26', '8992770033185', 'Masako sapi', 16, 8, 16, '4712', '5000', 0, 0, '', '', 0, 0),
(511, 12, 3, '2017-01-27 14:24:09', '2017-02-14 03:11:18', '8992003782354', 'Antangin ', 18, 12, 0, '1690', '2000', 0, 0, '', '', 0, 0),
(512, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8998866104913', 'Sampo Zinc Hitam', 4, 4, 0, '2160', '2900', 0, 0, '', '', 0, 0),
(513, 14, 3, '2017-01-27 14:24:09', '2017-02-10 08:05:57', '8998866100700', 'Mama Lemon kuning 800', 9, 6, 0, '10000', '12500', 0, 0, '', '', 0, 0),
(514, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8999999016128', 'Rinso Cair molto pink 800 ml', 1, 1, 0, '12900', '16000', 0, 0, '', '', 0, 0),
(515, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8999999056957', 'Rinso Cair molto  biru 800 ml', 3, 3, 0, '12900', '16000', 0, 0, '', '', 0, 0),
(516, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8999999006006', 'Rinso Cair Anti noda 800 ml', 1, 1, 0, '12900', '16000', 0, 0, '', '', 0, 0),
(517, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8999999042608', 'Rinso Cair Parfum 800 ml', 2, 2, 0, '12900', '16000', 0, 0, '', '', 0, 0),
(518, 14, 3, '2017-01-27 14:24:09', '2017-02-03 07:28:38', '8992772191197', 'Kispray sst Biru', 4, 4, 0, '4700', '5000', 0, 0, '', '', 0, 0),
(519, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8998866607322', 'Soklin Softener pink sst', 12, 12, 0, '4680', '5200', 0, 0, '', '', 0, 0),
(520, 14, 3, '2017-01-27 14:24:09', '2017-02-10 07:52:45', '8998866608701', 'Daia Softener Pink sst', 11, 9, 0, '4620', '5200', 0, 0, '', '', 0, 0),
(521, 10, 5, '2017-01-27 14:24:09', '2017-02-17 04:18:40', 'Beras RM', 'Beras Rejo Mulya @5kg', 21, 54, 80, '47500', '51000', 0, 0, '', '', 0, 0),
(522, 14, 3, '2017-01-27 14:24:09', '2017-02-10 02:33:46', '8886012800225', 'Kapur Barus Dahlia', 2, 1, 0, '10000', '11000', 0, 0, '', '', 0, 0),
(523, 14, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', '8886012800331', 'Kapur Barus toliet', 4, 4, 0, '15000', '16000', 0, 0, '', '', 0, 0),
(524, 10, 5, '2017-01-27 14:24:09', '2017-01-27 14:24:09', 'Beras ketan', 'Beras Ketan', 0, 0, 0, '262500', '278500', 0, 0, '', '', 0, 0),
(526, 10, 3, '2017-01-27 14:24:09', '2017-01-27 14:24:09', 'abon', 'Abon', 0, 0, 0, '55000', '60000', 0, 0, '', '', 0, 0),
(527, 10, 3, '2017-01-27 14:24:09', '2017-02-03 07:29:55', 'krupuk', 'krupuk Udang', 0, 0, 0, '60000', '65000', 0, 0, '', '', 0, 0),
(528, 10, 1, '2017-01-27 14:24:09', '2017-01-27 14:24:09', 'telor', 'Telor', 0, 0, 0, '17500', '20000', 0, 0, '', '', 0, 0),
(529, 12, 9, '2017-01-27 14:24:09', '2017-02-03 07:30:01', '18993278020131', 'aquaria gelas', 4, 4, 0, '18000', '20000', 0, 0, '', '', 0, 0),
(530, 14, 3, '2017-01-27 14:24:09', '2017-01-31 14:22:55', 'Tas sella', 'Tas sella D', 0, 0, 0, '425000', '470000', 0, 0, '', '', 0, 0),
(531, 14, 3, '2017-01-27 14:24:09', '2017-01-31 14:22:55', 'Tas Kotak', 'Tas Kotak biru', 0, 0, 0, '350000', '420000', 0, 0, '', '', 0, 0),
(532, 14, 3, '2017-01-27 14:24:09', '2017-01-31 14:22:55', 'Tas rangsel', 'Tas Rangsel', 0, 0, 0, '85000', '110000', 0, 0, '', '', 0, 0),
(533, 12, 9, '2017-01-27 14:24:09', '2017-01-31 14:22:55', 'Dancow', 'Dancow Madu 3+ 800', 0, 0, 0, '79000', '84000', 0, 0, '', '', 0, 0),
(534, 13, 3, '2017-01-27 14:24:09', '2017-02-03 07:30:10', '8991906101361', 'Rokok MLD', 2, 2, 0, '16600', '17600', 0, 0, '', '', 0, 0),
(535, 12, 3, '2017-01-27 14:24:09', '2017-02-03 07:31:52', 'Aqua Gelas', 'Aqua Gelas', 5, 5, 0, '21850', '24500', 0, 0, '', '', 0, 0),
(536, 10, 3, '2017-01-27 14:24:09', '2017-02-11 05:15:34', 'beras anak terbang', 'Beras Anak Terbang', 3, 2, 10, '55250', '59000', 0, 0, '', '', 0, 0),
(537, 10, 3, '2017-01-27 14:24:09', '2017-02-13 05:00:00', 'Rm sak', 'Beras Rejomulyo Sak', 6, 2, 0, '237500', '255000', 0, 0, '', '', 0, 0),
(538, 12, 3, '2017-01-27 14:24:09', '2017-02-10 02:28:52', '8991002104303', 'Good day White Frape', 2, 1, 0, '9260', '10000', 0, 0, '', '', 0, 0),
(539, 12, 3, '2017-02-01 11:26:44', '2017-02-01 11:26:44', '8992388133277', 'NU grentea Rock sugar', 2, 2, 0, '3939', '5000', 0, 0, '', '', 0, 0),
(540, 10, 3, '2017-02-01 11:28:47', '2017-02-11 05:15:34', '8992388112401', 'Mie Goreng ayam pedes limau', 21, 17, 0, '1815', '2000', 0, 0, '', '', 0, 0),
(541, 12, 3, '2017-02-03 14:57:20', '2017-02-03 07:57:20', '8999988888859', 'Larutan Badak Anggur', 6, 6, 0, '4380', '5500', 0, 0, '', '', 0, 0),
(542, 12, 3, '2017-02-03 14:58:48', '2017-02-06 08:19:14', '8999988888842', 'Larutan Badak Jambu', 6, 5, 0, '4380', '5500', 0, 0, '', '', 0, 0),
(543, 12, 3, '2017-02-03 14:59:50', '2017-02-09 04:53:17', '8999988888811', 'Larutan Badak  Jeruk', 6, 4, 0, '4380', '5500', 0, 0, '', '', 0, 0),
(544, 12, 3, '2017-02-03 15:01:33', '2017-02-03 08:01:33', '8999988888828', 'Larutan Badak Strobery', 6, 6, 0, '4350', '5500', 0, 0, '', '', 0, 0),
(545, 12, 9, '2017-02-03 15:04:17', '2017-02-03 08:04:17', '8991102022231', 'Crystaline Gelas ', 1, 1, 0, '20832', '23000', 0, 0, '', '', 0, 0),
(546, 12, 3, '2017-02-03 15:05:24', '2017-02-06 07:02:54', '8991102026352', 'Crystaline 600ml', 6, 6, 0, '1562', '2000', 0, 0, '', '', 0, 0),
(547, 14, 3, '2017-02-03 15:07:19', '2017-02-03 08:07:19', '8886022971298', 'Batrai Alkaline AA', 3, 3, 0, '8262', '9500', 0, 0, '', '', 0, 0),
(548, 14, 3, '2017-02-03 15:09:05', '2017-02-04 02:45:46', '8886022962159', 'Aromatic Pegel Linu', 4, 3, 0, '6600', '7500', 0, 0, '', '', 0, 0),
(549, 14, 3, '2017-02-03 15:10:06', '2017-02-04 03:19:24', '8886022962166', 'Aromatic Pegel Masuk Angin', 3, 2, 0, '5600', '7500', 0, 0, '', '', 0, 0),
(550, 14, 3, '2017-02-06 14:39:20', '2017-02-06 07:39:20', '8999999407858', 'Wipol Karbol Wangi', 4, 4, 0, '12000', '13500', 0, 0, '', '', 0, 0),
(551, 14, 3, '2017-02-06 14:45:58', '2017-02-06 07:45:58', '8998866805353', 'So Klin Liquid Perfume 800ml', 3, 3, 0, '12000', '14500', 0, 0, '', '', 0, 0),
(552, 14, 3, '2017-02-07 11:00:56', '2017-02-07 04:00:56', '8999999707859', 'Close Up 160g', 12, 12, 0, '12400', '13500', 0, 0, '', '', 0, 0),
(553, 12, 3, '2017-02-07 11:03:34', '2017-02-13 05:00:00', '8996001440520', 'Energen Jagung', 4, 1, 0, '10650', '11500', 0, 0, '', '', 0, 0),
(554, 12, 3, '2017-02-07 11:04:36', '2017-02-07 04:04:36', '8996001440353', 'Energen Jahe', 2, 2, 0, '10650', '11500', 0, 0, '', '', 0, 0),
(555, 14, 3, '2017-02-07 11:13:37', '2017-02-16 03:11:05', '8999999041205', 'Sampo Dove Dandruff Care', 10, 7, 0, '9400', '10000', 0, 0, '', '', 0, 0),
(556, 14, 3, '2017-02-07 11:32:56', '2017-02-07 04:32:56', '8999999052140', 'Sabun Citra 80g Beras Jepang', 1, 1, 0, '18083', '2000', 0, 0, '', '', 0, 0),
(557, 14, 3, '2017-02-07 11:34:58', '2017-02-16 04:37:26', '8999999052133', 'Sabun Citra 80g Lulur Pearly white', 23, 20, 0, '18083', '2000', 0, 0, '', '', 0, 0),
(558, 14, 3, '2017-02-07 14:17:23', '2017-02-07 07:17:23', '8999999503970', 'Molto Pure', 6, 6, 0, '4700', '5500', 0, 0, '', '', 0, 0),
(559, 14, 3, '2017-02-08 14:45:36', '2017-02-14 08:24:45', '8998866608305', 'Sabun Giv Bengkoang', 3, 24, 24, '1800', '2000', 0, 0, '', '', 0, 0),
(560, 14, 3, '2017-02-08 14:47:01', '2017-02-17 04:18:40', '8999999031107', 'Sabun Lux Hijau', 2, 0, 0, '2800', '3500', 0, 0, '', '', 0, 0),
(561, 14, 3, '2017-02-08 14:50:52', '2017-02-08 07:50:52', '8993560024635', 'Dettol activ 65gr', 4, 4, 0, '2800', '3200', 0, 0, '', '', 0, 0),
(562, 13, 3, '2017-02-08 14:52:24', '2017-02-10 06:07:16', '8998989300087', 'GG Mild', 3, 2, 0, '13400', '14500', 0, 0, '', '', 0, 0),
(563, 10, 3, '2017-02-09 11:31:28', '2017-02-09 04:33:07', '8998866200813', 'Sedap Cup Goreng', 3, 3, 0, '3588', '4500', 0, 0, '', '', 0, 0),
(564, 10, 3, '2017-02-09 11:32:53', '2017-02-09 04:32:53', '8998866200851', 'Sedap Cup Bakso', 3, 3, 0, '3359', '4500', 0, 0, '', '', 0, 0),
(565, 14, 3, '2017-02-09 11:34:38', '2017-02-09 04:34:38', 'Rapi Ungu', 'Rapika sst Ungu', 2, 2, 0, '4560', '5500', 0, 0, '', '', 0, 0),
(566, 14, 3, '2017-02-09 11:35:21', '2017-02-09 04:35:21', 'Rapi Biru', 'Rapika sst Biru', 2, 2, 0, '4560', '5500', 0, 0, '', '', 0, 0),
(567, 14, 3, '2017-02-09 11:43:18', '2017-02-09 06:49:56', '8998866608602', 'Sabun Giv Pearl Scrub', 24, 22, 0, '1675', '2000', 0, 0, '', '', 0, 0),
(568, 10, 3, '2017-02-18 22:54:40', '2017-02-18 15:55:23', 'ass', 'TEST', 128, 123, 0, '56000', '106000', 0, 0, 'sdasdsad', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_m_produk_harga`
--

CREATE TABLE `tbl_m_produk_harga` (
  `id_produk` int(11) NOT NULL,
  `tgl_simpan` datetime NOT NULL,
  `tgl_modif` datetime NOT NULL,
  `harga_lama` decimal(13,4) NOT NULL,
  `harga_baru` decimal(13,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_m_produk_item`
--

CREATE TABLE `tbl_m_produk_item` (
  `id` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `bahan` varchar(160) CHARACTER SET latin1 NOT NULL,
  `stok_awal` double NOT NULL,
  `qty` double NOT NULL,
  `stok_akhir` double NOT NULL,
  `ket` text CHARACTER SET latin1 NOT NULL,
  `id_satuan` int(11) NOT NULL,
  `id_bahan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_m_satuan`
--

CREATE TABLE `tbl_m_satuan` (
  `id` int(11) NOT NULL,
  `kode` varchar(64) NOT NULL,
  `satuan` varchar(64) NOT NULL,
  `value` varchar(50) NOT NULL,
  `ket` varchar(160) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_m_satuan`
--

INSERT INTO `tbl_m_satuan` (`id`, `kode`, `satuan`, `value`, `ket`) VALUES
(1, 'SAT.00001', 'kg', '', 'Kilogram'),
(2, 'SAT.00002', 'gram', '', 'Gram'),
(3, 'SAT.00003', 'pcs', '', 'Pieces'),
(4, 'SAT.00004', 'ltr', '', 'Liter'),
(5, 'SAT.00005', 'bks', '', 'Bungkus'),
(6, 'SAT.00006', 'unit', '', 'Unit'),
(7, 'SAT.00007', 'btg', '', 'Batang'),
(8, 'SAT.00008', 'koli', '', 'Koli'),
(9, 'SAT.00009', 'dos', '', 'Dos');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_m_supplier`
--

CREATE TABLE `tbl_m_supplier` (
  `id` int(11) NOT NULL,
  `kode` varchar(160) NOT NULL,
  `nama` varchar(160) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orderlist`
--

CREATE TABLE `tbl_orderlist` (
  `no_nota` varchar(160) NOT NULL,
  `tgl_simpan` datetime NOT NULL,
  `tgl_modif` datetime NOT NULL,
  `id_meja` int(11) NOT NULL,
  `id_grup_pelanggan` int(11) NOT NULL,
  `no_meja` varchar(160) NOT NULL,
  `kode` varchar(160) NOT NULL,
  `nama` varchar(360) NOT NULL,
  `no_hp` varchar(160) NOT NULL,
  `alamat` text NOT NULL,
  `jml_bayar` int(15) NOT NULL,
  `jml_ppn` int(15) NOT NULL,
  `jml_gtotal` int(15) NOT NULL,
  `diskon` decimal(3,0) NOT NULL,
  `tot_bayar` decimal(32,0) NOT NULL,
  `tot_kembali` decimal(32,0) NOT NULL,
  `tot_kurang` decimal(32,0) NOT NULL,
  `pelayan` varchar(160) NOT NULL,
  `status_order` enum('pend','complete','confirm','batal','shipment','delivered') NOT NULL,
  `status_payment` enum('unpaid','paid') NOT NULL,
  `status_resto` enum('1','2','3') NOT NULL,
  `status_meja` enum('active','inactive') NOT NULL,
  `ket` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_orderlist`
--

INSERT INTO `tbl_orderlist` (`no_nota`, `tgl_simpan`, `tgl_modif`, `id_meja`, `id_grup_pelanggan`, `no_meja`, `kode`, `nama`, `no_hp`, `alamat`, `jml_bayar`, `jml_ppn`, `jml_gtotal`, `diskon`, `tot_bayar`, `tot_kembali`, `tot_kurang`, `pelayan`, `status_order`, `status_payment`, `status_resto`, `status_meja`, `ket`) VALUES
('KSU.00001', '2017-01-17 12:58:41', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 31500, 0, 31185, '1', '100000', '68815', '0', '1', 'complete', 'paid', '1', 'active', ''),
('KSU.00002', '2017-01-18 15:19:18', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 33000, 0, 33000, '0', '35000', '2000', '0', '1', 'complete', 'paid', '1', 'active', ''),
('KSU.00003', '2017-01-18 15:29:12', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 86400, 0, 86400, '0', '86400', '0', '0', '1', 'complete', 'paid', '1', 'active', ''),
('KSU.00004', '2017-01-18 15:42:41', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 217000, 0, 217000, '0', '217000', '0', '0', '1', 'complete', 'paid', '1', 'active', ''),
('KSU.00005', '2017-01-19 09:20:25', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 543200, 0, 543200, '0', '543200', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00006', '2017-01-19 09:33:43', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 158000, 0, 158000, '0', '158000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00007', '2017-01-19 09:37:42', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 6500, 0, 6500, '0', '10000', '3500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00008', '2017-01-19 09:48:06', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 1000, 0, 1000, '0', '2000', '1000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00009', '2017-01-19 11:10:38', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 52500, 0, 52500, '0', '53000', '500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00010', '2017-01-19 11:14:38', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 3000, 0, 3000, '0', '3000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00011', '2017-01-19 11:15:20', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 150000, 0, 150000, '0', '150000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00012', '2017-01-19 11:18:47', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 51500, 0, 51500, '0', '52000', '500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00013', '2017-01-19 11:28:30', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 50000, 0, 50000, '0', '50000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00014', '2017-01-19 12:04:07', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 71500, 0, 71500, '0', '72000', '500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00015', '2017-01-19 12:15:24', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 23000, 0, 23000, '0', '23000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00016', '2017-01-19 12:24:32', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 8000, 0, 8000, '0', '50000', '42000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00017', '2017-01-19 12:44:16', '2017-01-19 12:45:12', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 289500, 0, 289500, '0', '289500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00018', '2017-01-19 12:49:19', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 308500, 0, 308500, '0', '308500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00019', '2017-01-19 12:52:26', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 30000, 0, 30000, '0', '50000', '20000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00020', '2017-01-19 13:13:02', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 144700, 0, 144700, '0', '150000', '5300', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00021', '2017-01-19 13:39:01', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 20500, 0, 20500, '0', '22000', '1500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00022', '2017-01-19 13:43:39', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 16000, 0, 16000, '0', '17000', '1000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00023', '2017-01-19 13:59:00', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2837500, 0, 2837500, '0', '2837500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00024', '2017-01-19 14:48:02', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 9000, 0, 9000, '0', '9000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00025', '2017-01-20 08:54:28', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 52500, 0, 52500, '0', '52500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00026', '2017-01-20 08:54:53', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 17500, 0, 17500, '0', '18000', '500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00027', '2017-01-20 09:11:05', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 80000, 0, 80000, '0', '100000', '20000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00028', '2017-01-20 09:15:22', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 8000, 0, 8000, '0', '20000', '12000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00029', '2017-01-20 09:17:50', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 470000, 0, 470000, '0', '470000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00030', '2017-01-20 09:19:01', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 420000, 0, 420000, '0', '420000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00031', '2017-01-20 09:19:36', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 168000, 0, 168000, '0', '168000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00032', '2017-01-20 09:28:45', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 10000, 0, 10000, '0', '50000', '40000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00033', '2017-01-20 09:31:29', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 22700, 0, 22700, '0', '30000', '7300', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00034', '2017-01-20 09:38:45', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 118500, 0, 118500, '0', '120000', '1500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00035', '2017-01-20 09:43:42', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 1700, 0, 1700, '0', '2000', '300', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00036', '2017-01-20 09:48:40', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 15500, 0, 15500, '0', '20000', '4500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00037', '2017-01-20 09:50:34', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 47400, 0, 47400, '0', '50000', '2600', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00038', '2017-01-20 09:51:55', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 51000, 0, 51000, '0', '51000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00039', '2017-01-20 10:39:37', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 9000, 0, 9000, '0', '10000', '1000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00040', '2017-01-20 12:03:27', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 49000, 0, 49000, '0', '49000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00041', '2017-01-20 12:07:17', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 13000, 0, 13000, '0', '15000', '2000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00042', '2017-01-20 12:34:46', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 8000, 0, 8000, '0', '10000', '2000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00043', '2017-01-20 12:38:37', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 31600, 0, 31600, '0', '50000', '18400', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00044', '2017-01-20 13:24:17', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 38000, 0, 38000, '0', '38000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00045', '2017-01-20 13:59:48', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 22250, 0, 22250, '0', '22250', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00047', '2017-01-20 14:17:28', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 135000, 0, 135000, '0', '135000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00048', '2017-01-20 14:57:05', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 293000, 0, 293000, '0', '293000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00049', '2017-01-20 14:57:50', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 250000, 0, 250000, '0', '250000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00050', '2017-01-20 14:59:32', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 3000, 0, 3000, '0', '5000', '2000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00051', '2017-01-21 08:50:55', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2500, 0, 2500, '0', '10000', '7500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00052', '2017-01-21 09:16:42', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 73100, 0, 73100, '0', '100000', '26900', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00053', '2017-01-21 09:37:42', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 158000, 0, 158000, '0', '158000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00054', '2017-01-21 09:38:29', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 5000, 0, 5000, '0', '100000', '95000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00055', '2017-01-21 09:44:14', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2500, 0, 2500, '0', '5000', '2500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00056', '2017-01-21 10:00:11', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2500, 0, 2500, '0', '2500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00057', '2017-01-21 10:09:09', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 67300, 0, 67300, '0', '100000', '32700', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00058', '2017-01-21 10:19:03', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 150000, 0, 150000, '0', '150000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00059', '2017-01-21 10:21:08', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 46000, 0, 46000, '0', '46000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00060', '2017-01-21 10:24:17', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 20000, 0, 20000, '0', '20000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00061', '2017-01-21 10:43:29', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 16500, 0, 16500, '0', '21500', '5000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00062', '2017-01-21 11:01:34', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 6000, 0, 6000, '0', '10000', '4000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00063', '2017-01-21 11:06:14', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 7000, 0, 7000, '0', '10000', '3000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00064', '2017-01-21 11:24:07', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 8000, 0, 8000, '0', '10000', '2000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00065', '2017-01-21 11:39:19', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 136900, 0, 136900, '0', '150000', '13100', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00066', '2017-01-21 11:41:16', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 58000, 0, 58000, '0', '58000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00067', '2017-01-21 11:52:40', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 6000, 0, 6000, '0', '6000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00068', '2017-01-21 11:54:39', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 66000, 0, 66000, '0', '66000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00069', '2017-01-21 11:56:30', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 3000, 0, 3000, '0', '3000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00070', '2017-01-21 12:02:49', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 6750, 0, 6750, '0', '6750', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00071', '2017-01-21 12:10:37', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 119800, 0, 119800, '0', '119800', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00072', '2017-01-21 12:17:24', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 36500, 0, 36500, '0', '36500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00073', '2017-01-21 12:19:56', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 100000, 0, 100000, '0', '100000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00074', '2017-01-21 12:28:43', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 5000, 0, 5000, '0', '5000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00075', '2017-01-21 12:37:13', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 63200, 0, 63200, '0', '63200', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00076', '2017-01-21 12:37:35', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 27500, 0, 27500, '0', '27500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00077', '2017-01-21 13:40:37', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 13000, 0, 13000, '0', '13000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00078', '2017-01-23 08:54:16', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 100000, 0, 100000, '0', '0', '14900000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00079', '2017-01-23 08:54:59', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 3000, 0, 3000, '0', '5000', '2000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00080', '2017-01-23 08:59:58', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 31400, 0, 31400, '0', '31400', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00081', '2017-01-23 09:02:11', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 6750, 0, 6750, '0', '6750', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00082', '2017-01-23 10:00:23', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 31600, 0, 31600, '0', '31700', '100', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00083', '2017-01-23 10:03:01', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 337500, 0, 337500, '0', '337500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00084', '2017-01-23 10:14:22', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 9700, 0, 9700, '0', '10000', '300', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00085', '2017-01-23 10:15:51', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 11000, 0, 11000, '0', '11000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00086', '2017-01-23 10:16:21', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2000, 0, 2000, '0', '2000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00087', '2017-01-23 10:28:44', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 20000, 0, 20000, '0', '20000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00088', '2017-01-23 11:22:46', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 81900, 0, 81900, '0', '81900', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00089', '2017-01-23 12:02:20', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 3000, 0, 3000, '0', '4000', '1000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00090', '2017-01-23 12:03:09', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2500, 0, 2500, '0', '2500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00091', '2017-01-23 12:39:16', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 1000, 0, 1000, '0', '1000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00092', '2017-01-23 12:51:30', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 325000, 0, 325000, '0', '325000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00093', '2017-01-23 12:57:25', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 13500, 0, 13500, '0', '50000', '36500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00094', '2017-01-23 13:07:33', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 45000, 0, 45000, '0', '45000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00095', '2017-01-23 13:34:56', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 15500, 0, 15500, '0', '15500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00096', '2017-01-23 15:02:19', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2500, 0, 2500, '0', '2500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00097', '2017-01-23 15:10:25', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 11000, 0, 11000, '0', '15000', '4000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00098', '2017-01-23 15:31:28', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 34500, 0, 34500, '0', '100000', '65500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00099', '2017-01-23 15:32:45', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2500, 0, 2500, '0', '2500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00100', '2017-01-23 15:33:17', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 303000, 0, 303000, '0', '303000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00101', '2017-01-23 15:36:16', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 15500, 0, 15500, '0', '15500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00102', '2017-01-24 08:56:09', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 408900, 0, 408900, '0', '408900', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00103', '2017-01-24 09:16:19', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2500, 0, 2500, '0', '2500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00104', '2017-01-24 09:25:38', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 19000, 0, 19000, '0', '20000', '1000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00105', '2017-01-24 09:36:36', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2000, 0, 2000, '0', '2000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00106', '2017-01-24 09:37:42', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 30000, 0, 30000, '0', '50000', '20000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00107', '2017-01-24 09:53:05', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 22000, 0, 22000, '0', '22000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00108', '2017-01-24 09:54:05', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 31200, 0, 31200, '0', '100000', '68800', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00109', '2017-01-24 10:10:23', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 203100, 0, 203100, '0', '203100', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00110', '2017-01-24 10:14:32', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 3000, 0, 3000, '0', '20000', '17000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00111', '2017-01-24 10:15:46', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 27000, 0, 27000, '0', '27000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00112', '2017-01-24 10:19:39', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 197500, 0, 197500, '0', '197500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00113', '2017-01-24 10:21:25', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 82600, 0, 82600, '0', '82600', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00114', '2017-01-24 10:33:33', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 15000, 0, 15000, '0', '15000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00115', '2017-01-24 10:42:41', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 56000, 0, 56000, '0', '60000', '4000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00116', '2017-01-24 10:45:45', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 30000, 0, 30000, '0', '30000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00117', '2017-01-24 10:54:18', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 153000, 0, 153000, '0', '153000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00118', '2017-01-24 11:08:33', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 4000, 0, 4000, '0', '4000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00119', '2017-01-24 11:27:07', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 5500, 0, 5500, '0', '20000', '14500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00120', '2017-01-24 11:38:25', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 51000, 0, 51000, '0', '51000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00121', '2017-01-24 12:07:43', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 13500, 0, 13500, '0', '13500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00122', '2017-01-24 12:08:12', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 15000, 0, 15000, '0', '15000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00123', '2017-01-24 14:19:43', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 55300, 0, 55300, '0', '55300', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00124', '2017-01-24 14:52:26', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 39500, 0, 39500, '0', '50000', '10500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00125', '2017-01-24 15:34:16', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 141600, 0, 141600, '0', '141600', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00126', '2017-01-24 15:38:47', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 15000, 0, 15000, '0', '15000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00127', '2017-01-25 08:56:29', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 234000, 0, 234000, '0', '234000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00128', '2017-01-25 09:37:07', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 35500, 0, 35500, '0', '35500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00129', '2017-01-25 09:57:44', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 3000, 0, 3000, '0', '3000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00130', '2017-01-25 09:58:32', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 10000, 0, 10000, '0', '10000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00131', '2017-01-25 10:24:48', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 4000, 0, 4000, '0', '20000', '16000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00132', '2017-01-25 10:35:56', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 40500, 0, 40500, '0', '40500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00133', '2017-01-25 11:04:24', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 19750, 0, 19750, '0', '20000', '250', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00134', '2017-01-25 11:06:48', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 5000, 0, 5000, '0', '5000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00135', '2017-01-25 12:10:45', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 11000, 0, 11000, '0', '11000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00136', '2017-01-25 13:07:58', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 3000, 0, 3000, '0', '5000', '2000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00137', '2017-01-25 13:08:29', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 3000, 0, 3000, '0', '5000', '2000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00138', '2017-01-25 13:11:44', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 51000, 0, 51000, '0', '51000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00139', '2017-01-25 13:27:09', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 8500, 0, 8500, '0', '8500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00140', '2017-01-26 09:00:25', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 38800, 0, 38800, '0', '40000', '1200', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00141', '2017-01-26 09:10:25', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 26000, 0, 26000, '0', '30000', '4000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00142', '2017-01-26 09:11:54', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2500, 0, 2500, '0', '2500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00143', '2017-01-26 09:17:59', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 5500, 0, 5500, '0', '5500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00144', '2017-01-26 09:22:00', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 13500, 0, 13500, '0', '50000', '36500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00145', '2017-01-26 09:28:05', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 10000, 0, 10000, '0', '50000', '40000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00146', '2017-01-26 09:35:01', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 8000, 0, 8000, '0', '10000', '2000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00147', '2017-01-26 09:37:56', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 15500, 0, 15500, '0', '20000', '4500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00148', '2017-01-26 09:50:42', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 209000, 0, 209000, '0', '210000', '1000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00149', '2017-01-26 10:14:19', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 112500, 0, 112500, '0', '112500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00150', '2017-01-26 10:15:36', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 124250, 0, 124250, '0', '124250', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00151', '2017-01-26 10:51:11', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 12450, 0, 12450, '0', '12500', '50', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00152', '2017-01-26 10:53:45', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 71100, 0, 71100, '0', '100500', '29400', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00153', '2017-01-26 11:07:45', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 5000, 0, 5000, '0', '5000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00154', '2017-01-26 11:10:08', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2000, 0, 2000, '0', '2000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00155', '2017-01-26 11:19:38', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 221000, 0, 221000, '0', '221000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00156', '2017-01-26 11:21:01', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 8000, 0, 8000, '0', '10000', '2000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00157', '2017-01-26 11:25:04', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 9500, 0, 9500, '0', '9500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00158', '2017-01-26 11:26:36', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 28000, 0, 28000, '0', '50000', '22000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00159', '2017-01-26 12:00:39', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 91000, 0, 91000, '0', '101000', '10000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00160', '2017-01-26 12:03:52', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 3000, 0, 3000, '0', '3000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00161', '2017-01-26 12:07:25', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 182000, 0, 182000, '0', '200000', '18000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00162', '2017-01-26 12:31:30', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 3000, 0, 3000, '0', '5000', '2000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00163', '2017-01-26 12:44:15', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 12500, 0, 12500, '0', '100000', '87500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00164', '2017-01-26 12:55:54', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 10500, 0, 10500, '0', '10500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00165', '2017-01-26 13:02:33', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 200900, 0, 200900, '0', '200900', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00166', '2017-01-26 13:16:59', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 20000, 0, 20000, '0', '20000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00167', '2017-01-26 13:19:33', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 3000, 0, 3000, '0', '3000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00168', '2017-01-26 13:46:31', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 30500, 0, 30500, '0', '30500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00169', '2017-01-26 13:48:32', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 7000, 0, 7000, '0', '7000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00170', '2017-01-26 13:54:58', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 5500, 0, 5500, '0', '20000', '14500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00171', '2017-01-26 14:27:20', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2000, 0, 2000, '0', '2000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00172', '2017-01-26 14:30:18', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 15000, 0, 15000, '0', '20000', '5000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00173', '2017-01-27 08:57:53', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 15500, 0, 15500, '0', '20000', '4500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00174', '2017-01-27 09:18:31', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 822000, 0, 822000, '0', '822000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00175', '2017-01-27 09:34:21', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 6000, 0, 6000, '0', '6000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00176', '2017-01-27 09:53:23', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 8000, 0, 8000, '0', '10000', '2000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00177', '2017-01-27 10:18:57', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 8000, 0, 8000, '0', '10000', '2000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00178', '2017-01-27 10:19:56', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2000, 0, 2000, '0', '2000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00179', '2017-01-27 11:17:02', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 4000, 0, 4000, '0', '4000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00180', '2017-01-27 11:22:53', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 79000, 0, 79000, '0', '79000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00181', '2017-01-27 11:23:41', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 42000, 0, 42000, '0', '100000', '58000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00182', '2017-01-27 11:40:53', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 28500, 0, 28500, '0', '50000', '21500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00183', '2017-01-27 11:54:34', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2500, 0, 2500, '0', '2500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00184', '2017-01-27 11:55:04', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 1700, 0, 1700, '0', '1700', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00185', '2017-01-27 12:11:23', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2500, 0, 2500, '0', '2500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00186', '2017-01-27 12:23:07', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 26300, 0, 26300, '0', '50000', '23700', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00187', '2017-01-27 13:20:35', '2017-01-27 13:23:09', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 17600, 0, 17600, '0', '20000', '2400', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00188', '2017-01-27 13:24:45', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 47400, 0, 47400, '0', '47400', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00191', '2017-01-27 14:33:04', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 22000, 0, 22000, '0', '50000', '28000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00192', '2017-01-27 14:39:05', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 19000, 0, 19000, '0', '50000', '31000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00193', '2017-01-27 14:51:42', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 130000, 0, 130000, '0', '130000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00194', '2017-01-27 14:54:22', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 6000, 0, 6000, '0', '6000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00195', '2017-01-30 09:02:24', '2017-01-30 09:07:15', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 261200, 0, 261200, '0', '261200', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00196', '2017-01-30 09:08:20', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 451300, 0, 451300, '0', '451300', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00197', '2017-01-30 09:11:56', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 10800, 0, 10800, '0', '10800', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00198', '2017-01-30 09:16:25', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 13000, 0, 13000, '0', '13000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00199', '2017-01-30 09:35:23', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 12000, 0, 12000, '0', '20000', '8000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00200', '2017-01-30 09:42:17', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 79000, 0, 79000, '0', '80000', '1000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00201', '2017-01-30 09:49:05', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 18000, 0, 18000, '0', '20000', '2000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00202', '2017-01-30 10:01:22', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 158000, 0, 158000, '0', '158000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00203', '2017-01-30 10:08:40', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2500, 0, 2500, '0', '2500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00204', '2017-01-30 10:15:14', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 15500, 0, 15500, '0', '20000', '4500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00205', '2017-01-30 10:15:54', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 5000, 0, 5000, '0', '5000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00206', '2017-01-30 10:16:28', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 17000, 0, 17000, '0', '100000', '83000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00207', '2017-01-30 10:28:26', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2000, 0, 2000, '0', '2000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00208', '2017-01-30 11:37:24', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 9000, 0, 9000, '0', '10000', '1000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00209', '2017-01-30 12:01:09', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 79000, 0, 79000, '0', '100000', '21000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00210', '2017-01-30 12:04:06', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 15500, 0, 15500, '0', '20000', '4500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00211', '2017-01-30 12:29:25', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 36250, 0, 36250, '0', '36250', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00212', '2017-01-30 12:31:32', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 15500, 0, 15500, '0', '16000', '500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00213', '2017-01-30 12:33:36', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 1172900, 0, 1172900, '0', '1165700', '0', '0', '17', 'pend', 'paid', '1', 'active', ''),
('KSU.00214', '2017-01-30 12:53:04', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 14000, 0, 14000, '0', '14000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00216', '2017-01-30 12:58:32', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 10000, 0, 10000, '0', '10000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00217', '2017-01-30 13:00:17', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 86200, 0, 86200, '0', '86200', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00218', '2017-01-30 13:13:39', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 110000, 0, 110000, '0', '110000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00219', '2017-01-30 13:16:52', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 39500, 0, 39500, '0', '39500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00220', '2017-01-30 13:17:28', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2000, 0, 2000, '0', '50000', '48000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00221', '2017-01-30 13:18:09', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 357350, 0, 357350, '0', '357350', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00222', '2017-01-30 13:26:14', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 31600, 0, 31600, '0', '35000', '3400', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00223', '2017-01-30 13:28:29', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 13000, 0, 13000, '0', '20000', '7000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00224', '2017-01-30 13:29:05', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 29000, 0, 29000, '0', '50000', '21000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00226', '2017-01-30 13:53:30', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 65000, 0, 65000, '0', '65000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00227', '2017-01-30 13:54:43', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 8000, 0, 8000, '0', '10000', '2000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00228', '2017-01-30 14:13:45', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 15500, 0, 15500, '0', '15500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00229', '2017-01-30 15:19:51', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 198600, 0, 198600, '0', '198600', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00230', '2017-01-30 15:29:35', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 215200, 0, 215200, '0', '215200', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00231', '2017-01-30 15:32:47', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 15000, 0, 15000, '0', '15000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00233', '2017-01-31 09:05:30', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 67500, 0, 67500, '0', '67500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00234', '2017-01-31 11:07:49', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 138250, 0, 138250, '0', '138250', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00235', '2017-01-31 11:08:06', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 51000, 0, 51000, '0', '51000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00236', '2017-01-31 11:08:31', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 68300, 0, 68300, '0', '100000', '31700', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00237', '2017-01-31 11:10:20', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2000, 0, 2000, '0', '10000', '8000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00238', '2017-01-31 11:16:37', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 153000, 0, 153000, '0', '153000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00239', '2017-01-31 11:29:15', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 3000, 0, 3000, '0', '5000', '2000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00240', '2017-01-31 12:20:07', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 83200, 0, 83200, '0', '83200', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00241', '2017-01-31 12:23:00', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2000, 0, 2000, '0', '2000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00242', '2017-01-31 12:36:34', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 144400, 0, 144400, '0', '144400', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00243', '2017-01-31 12:45:26', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 8000, 0, 8000, '0', '8000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00244', '2017-01-31 12:46:20', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 75500, 0, 75500, '0', '75500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00245', '2017-01-31 12:47:28', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 19000, 0, 19000, '0', '50000', '31000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00247', '2017-01-31 13:49:52', '2017-01-31 13:55:56', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 8400, 0, 8400, '0', '10000', '1600', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00248', '2017-01-31 15:34:30', '2017-01-31 15:34:36', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 23000, 0, 23000, '0', '100000', '77000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00249', '2017-02-01 09:01:05', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 17500, 0, 17500, '0', '17500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00250', '2017-02-01 09:01:53', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 149500, 0, 149500, '0', '149500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00251', '2017-02-01 09:03:46', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 102000, 0, 102000, '0', '102000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00252', '2017-02-01 09:04:43', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 135000, 0, 135000, '0', '135000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00253', '2017-02-01 09:05:12', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 234500, 0, 234500, '0', '234500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00254', '2017-02-01 09:26:47', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 485100, 0, 485100, '0', '485100', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00255', '2017-02-01 09:28:17', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 55500, 0, 55500, '0', '55500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00256', '2017-02-01 09:42:04', '2017-02-01 09:42:43', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 79100, 0, 79100, '0', '80100', '1000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00257', '2017-02-01 09:46:04', '2017-02-01 10:06:56', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 163500, 0, 163500, '0', '163500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00258', '2017-02-01 09:57:51', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2500, 0, 2500, '0', '2500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00259', '2017-02-01 10:08:15', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 3000, 0, 3000, '0', '3000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00261', '2017-02-01 10:18:05', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 24000, 0, 24000, '0', '23000', '0', '0', '17', 'pend', 'paid', '1', 'active', ''),
('KSU.00262', '2017-02-01 10:19:12', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 24000, 0, 24000, '0', '23000', '0', '0', '17', 'pend', 'paid', '1', 'active', ''),
('KSU.00263', '2017-02-01 10:29:07', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 24100, 0, 24100, '0', '50000', '25900', '0', '17', 'complete', 'paid', '1', 'active', '');
INSERT INTO `tbl_orderlist` (`no_nota`, `tgl_simpan`, `tgl_modif`, `id_meja`, `id_grup_pelanggan`, `no_meja`, `kode`, `nama`, `no_hp`, `alamat`, `jml_bayar`, `jml_ppn`, `jml_gtotal`, `diskon`, `tot_bayar`, `tot_kembali`, `tot_kurang`, `pelayan`, `status_order`, `status_payment`, `status_resto`, `status_meja`, `ket`) VALUES
('KSU.00265', '2017-02-01 10:31:48', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 34000, 0, 34000, '0', '34000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00266', '2017-02-01 10:45:10', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 6750, 0, 6750, '0', '10000', '3250', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00267', '2017-02-01 11:07:07', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 24000, 0, 24000, '0', '25000', '1000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00269', '2017-02-01 11:29:09', '2017-02-01 13:38:15', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 394500, 0, 394500, '0', '394500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00270', '2017-02-01 12:04:28', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 5000, 0, 5000, '0', '5000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00271', '2017-02-01 13:36:57', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 20000, 0, 20000, '0', '20000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00272', '2017-02-01 13:37:38', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 51000, 0, 51000, '0', '51000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00273', '2017-02-01 13:57:10', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 60000, 0, 60000, '0', '100000', '40000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00274', '2017-02-01 13:57:55', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 158000, 0, 158000, '0', '158000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00275', '2017-02-01 14:03:53', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 187000, 0, 187000, '0', '184000', '0', '0', '17', 'pend', 'paid', '1', 'active', ''),
('KSU.00276', '2017-02-01 14:48:48', '2017-02-02 09:15:17', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 510200, 0, 510200, '0', '510200', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00277', '2017-02-02 09:10:25', '2017-02-02 09:20:34', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 232000, 0, 232000, '0', '232000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00278', '2017-02-02 09:22:16', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 161000, 0, 161000, '0', '161000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00279', '2017-02-02 09:23:31', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2000, 0, 2000, '0', '2000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00280', '2017-02-02 09:50:34', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2500, 0, 2500, '0', '2500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00281', '2017-02-02 10:06:01', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 8500, 0, 8500, '0', '8500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00282', '2017-02-02 10:12:23', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 15500, 0, 15500, '0', '15500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00283', '2017-02-02 10:26:55', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 51250, 0, 51250, '0', '51250', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00284', '2017-02-02 10:28:56', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 19500, 0, 19500, '0', '19500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00285', '2017-02-02 10:40:34', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 32500, 0, 32500, '0', '32500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00286', '2017-02-02 11:42:25', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 5500, 0, 5500, '0', '10000', '4500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00287', '2017-02-02 11:44:08', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 5500, 0, 5500, '0', '5500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00288', '2017-02-02 12:08:33', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 3000, 0, 3000, '0', '3000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00289', '2017-02-02 12:09:37', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 10800, 0, 10800, '0', '11000', '200', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00290', '2017-02-02 12:11:20', '2017-02-02 12:14:12', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 14500, 0, 14500, '0', '14500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00291', '2017-02-02 12:15:15', '2017-02-02 12:15:23', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 30250, 0, 30250, '0', '32000', '1750', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00292', '2017-02-02 12:16:22', '2017-02-02 12:18:25', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 30700, 0, 30700, '0', '30700', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00293', '2017-02-02 12:36:45', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 10500, 0, 10500, '0', '10500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00294', '2017-02-02 12:37:11', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 5500, 0, 5500, '0', '5500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00295', '2017-02-02 12:44:47', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 12000, 0, 12000, '0', '22000', '10000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00296', '2017-02-02 12:55:35', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 3000, 0, 3000, '0', '4000', '1000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00297', '2017-02-02 13:05:20', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 15500, 0, 15500, '0', '50500', '35000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00298', '2017-02-02 13:05:43', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2500, 0, 2500, '0', '5000', '2500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00299', '2017-02-02 13:22:45', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 29000, 0, 29000, '0', '29000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00300', '2017-02-02 13:23:15', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 69750, 0, 69750, '0', '69750', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00301', '2017-02-02 13:45:09', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 7000, 0, 7000, '0', '7000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00302', '2017-02-02 14:00:49', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 120000, 0, 120000, '0', '110000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00303', '2017-02-02 14:17:39', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 4000, 0, 4000, '0', '4000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00304', '2017-02-02 14:19:18', '2017-02-02 14:21:09', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 6000, 0, 6000, '0', '6000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00305', '2017-02-02 14:23:36', '2017-02-02 14:51:33', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 20000, 0, 20000, '0', '20000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00306', '2017-02-02 15:04:51', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2000, 0, 2000, '0', '2000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00307', '2017-02-02 15:05:23', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 15000, 0, 15000, '0', '15000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00308', '2017-02-02 15:16:27', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 11500, 0, 11500, '0', '12000', '500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00309', '2017-02-02 15:19:44', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 5500, 0, 5500, '0', '5500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00310', '2017-02-02 15:25:34', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2000, 0, 2000, '0', '20000', '18000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00311', '2017-02-02 15:31:27', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 12500, 0, 12500, '0', '50000', '37500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00312', '2017-02-02 15:33:13', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2500, 0, 2500, '0', '2500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00313', '2017-02-02 15:36:40', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 4000, 0, 4000, '0', '4000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00314', '2017-02-03 10:06:18', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 11000, 0, 11000, '0', '11000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00315', '2017-02-03 10:39:54', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 5500, 0, 5500, '0', '20000', '14500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00316', '2017-02-04 08:55:55', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 22000, 0, 22000, '0', '25000', '3000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00317', '2017-02-04 08:57:21', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 17800, 0, 17800, '0', '17800', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00318', '2017-02-04 09:24:10', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 195000, 0, 195000, '0', '195000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00319', '2017-02-04 09:28:44', '2017-02-04 09:31:27', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 128500, 0, 128500, '0', '128500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00320', '2017-02-04 09:32:01', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 216000, 0, 216000, '0', '212000', '0', '0', '17', 'pend', 'paid', '1', 'active', ''),
('KSU.00321', '2017-02-04 09:36:12', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 64500, 0, 64500, '0', '64500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00322', '2017-02-04 09:38:00', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 3000, 0, 3000, '0', '3000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00323', '2017-02-04 09:42:02', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2000, 0, 2000, '0', '5000', '3000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00324', '2017-02-04 09:42:34', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 7500, 0, 7500, '0', '12500', '5000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00325', '2017-02-04 09:46:44', '2017-02-04 09:58:19', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 3000, 0, 3000, '0', '3000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00326', '2017-02-04 09:58:44', '2017-02-04 09:59:22', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 59000, 0, 59000, '0', '60000', '1000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00327', '2017-02-04 10:00:59', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 109500, 0, 109500, '0', '110000', '500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00328', '2017-02-04 10:17:26', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 5500, 0, 5500, '0', '5500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00329', '2017-02-04 10:18:08', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 42400, 0, 42400, '0', '50000', '7600', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00330', '2017-02-04 10:27:20', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2500, 0, 2500, '0', '5000', '2500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00331', '2017-02-04 10:28:13', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 5500, 0, 5500, '0', '6000', '500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00332', '2017-02-04 10:29:08', '2017-02-04 10:29:29', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 35000, 0, 35000, '0', '35000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00333', '2017-02-04 10:31:13', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 119000, 0, 119000, '0', '119000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00334', '2017-02-04 10:34:06', '2017-02-04 10:34:44', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 14150, 0, 14150, '0', '100000', '85850', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00335', '2017-02-04 10:37:09', '2017-02-04 10:40:03', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 210000, 0, 210000, '0', '210000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00336', '2017-02-04 10:41:00', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 70000, 0, 70000, '0', '70000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00337', '2017-02-04 10:44:58', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 67800, 0, 67800, '0', '65800', '0', '0', '17', 'pend', 'paid', '1', 'active', ''),
('KSU.00338', '2017-02-04 11:17:16', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 13500, 0, 13500, '0', '14000', '500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00339', '2017-02-04 11:33:41', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 72000, 0, 72000, '0', '72000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00340', '2017-02-04 11:34:18', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 255500, 0, 255500, '0', '255500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00341', '2017-02-04 11:55:44', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 11500, 0, 11500, '0', '12000', '500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00342', '2017-02-04 12:05:45', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 3000, 0, 3000, '0', '20000', '17000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00343', '2017-02-04 12:09:40', '2017-02-04 12:09:53', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 17000, 0, 17000, '0', '17000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00344', '2017-02-04 12:10:22', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 27000, 0, 27000, '0', '50000', '23000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00345', '2017-02-04 12:18:53', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 158000, 0, 158000, '0', '158000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00346', '2017-02-04 12:20:30', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 108700, 0, 108700, '0', '108700', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00347', '2017-02-04 12:27:01', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 338000, 0, 338000, '0', '338000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00348', '2017-02-04 12:32:57', '2017-02-04 12:33:44', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 135800, 0, 135800, '0', '135800', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00349', '2017-02-04 12:41:23', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 73500, 0, 73500, '0', '73500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00350', '2017-02-04 12:46:33', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 25000, 0, 25000, '0', '24000', '0', '0', '17', 'pend', 'paid', '1', 'active', ''),
('KSU.00351', '2017-02-04 13:03:21', '2017-02-04 13:03:42', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2500, 0, 2500, '0', '2500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00352', '2017-02-04 13:07:37', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 452500, 0, 452500, '0', '452500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00353', '2017-02-04 13:08:58', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 7000, 0, 7000, '0', '7000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00354', '2017-02-04 13:11:29', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 12100, 0, 12100, '0', '12100', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00355', '2017-02-06 08:58:12', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 3000, 0, 3000, '0', '20000', '17000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00356', '2017-02-06 09:28:32', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 54500, 0, 54500, '0', '55000', '500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00357', '2017-02-06 09:32:54', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 248500, 0, 248500, '0', '248500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00358', '2017-02-06 09:59:18', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 428000, 0, 428000, '0', '428000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00359', '2017-02-06 10:02:12', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 294100, 0, 294100, '0', '294100', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00360', '2017-02-06 10:04:49', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 13000, 0, 13000, '0', '13000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00361', '2017-02-06 10:59:34', '2017-02-06 11:00:59', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 10000, 0, 10000, '0', '10000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00362', '2017-02-06 11:00:43', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 15500, 0, 15500, '0', '15500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00363', '2017-02-06 11:08:14', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 158000, 0, 158000, '0', '160000', '2000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00365', '2017-02-06 11:15:30', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 19750, 0, 19750, '0', '50000', '30250', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00366', '2017-02-06 11:17:45', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 39000, 0, 39000, '0', '39000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00367', '2017-02-06 11:32:41', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2000, 0, 2000, '0', '2000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00368', '2017-02-06 11:48:22', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 11350, 0, 11350, '0', '12000', '650', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00369', '2017-02-06 12:05:17', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 120000, 0, 120000, '0', '120000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00370', '2017-02-06 12:17:06', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 13250, 0, 13250, '0', '20000', '6750', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00371', '2017-02-06 12:23:45', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 15700, 0, 15700, '0', '20000', '4300', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00372', '2017-02-06 12:56:57', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 510000, 0, 510000, '0', '510000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00373', '2017-02-06 13:19:10', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 5000, 0, 5000, '0', '5000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00374', '2017-02-06 13:25:21', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 10000, 0, 10000, '0', '10000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00375', '2017-02-06 14:25:55', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 45300, 0, 45300, '0', '45300', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00376', '2017-02-06 14:29:19', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 5000, 0, 5000, '0', '5000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00377', '2017-02-06 15:18:12', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 84500, 0, 84500, '0', '84500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00378', '2017-02-06 15:19:58', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 95000, 0, 95000, '0', '100000', '5000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00379', '2017-02-06 15:25:32', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 492550, 0, 492550, '0', '488300', '0', '0', '17', 'pend', 'paid', '1', 'active', ''),
('KSU.00380', '2017-02-06 15:34:09', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 254000, 0, 254000, '0', '254000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00381', '2017-02-06 15:51:28', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 135000, 0, 135000, '0', '130000', '0', '0', '17', 'pend', 'paid', '1', 'active', ''),
('KSU.00382', '2017-02-07 08:52:02', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 23500, 0, 23500, '0', '25000', '1500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00383', '2017-02-07 09:02:24', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 15500, 0, 15500, '0', '15500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00384', '2017-02-07 09:03:05', '2017-02-07 09:18:35', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 312800, 0, 312800, '0', '312800', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00385', '2017-02-07 09:28:41', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 44250, 0, 44250, '0', '104250', '60000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00386', '2017-02-07 09:34:33', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 8500, 0, 8500, '0', '10000', '1500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00387', '2017-02-07 09:55:53', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 25000, 0, 25000, '0', '25000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00388', '2017-02-07 10:13:38', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 13500, 0, 13500, '0', '13500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00389', '2017-02-07 10:39:29', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 67500, 0, 67500, '0', '67500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00390', '2017-02-07 12:15:29', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 3000, 0, 3000, '0', '3000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00391', '2017-02-07 12:17:44', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 20500, 0, 20500, '0', '20500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00392', '2017-02-07 12:21:29', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 31600, 0, 31600, '0', '35000', '3400', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00393', '2017-02-07 12:22:17', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 4000, 0, 4000, '0', '4000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00394', '2017-02-07 13:07:31', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 7500, 0, 7500, '0', '20000', '12500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00395', '2017-02-07 13:32:02', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 56750, 0, 56750, '0', '56750', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00396', '2017-02-07 13:45:23', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2000, 0, 2000, '0', '5000', '3000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00397', '2017-02-07 14:20:44', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 9000, 0, 9000, '0', '9000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00398', '2017-02-07 14:41:37', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 9500, 0, 9500, '0', '9500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00399', '2017-02-08 08:55:27', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 5000, 0, 5000, '0', '5000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00400', '2017-02-08 09:06:30', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 3000, 0, 3000, '0', '3000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00401', '2017-02-08 09:06:57', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 120000, 0, 120000, '0', '120000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00402', '2017-02-08 09:32:02', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2000, 0, 2000, '0', '2000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00404', '2017-02-08 09:56:12', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 8800, 0, 8800, '0', '8800', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00405', '2017-02-08 09:58:28', '2017-02-08 10:16:28', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 45500, 0, 45500, '0', '50000', '4500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00406', '2017-02-08 11:10:00', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 22500, 0, 22500, '0', '22500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00407', '2017-02-08 11:12:50', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 3000, 0, 3000, '0', '10000', '7000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00408', '2017-02-08 11:21:56', '2017-02-08 11:44:59', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 385500, 0, 385500, '0', '385500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00409', '2017-02-08 11:47:11', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 8000, 0, 8000, '0', '8000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00410', '2017-02-08 12:12:23', '2017-02-08 12:13:54', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 184500, 0, 184500, '0', '184500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00411', '2017-02-08 12:14:30', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 253500, 0, 253500, '0', '253500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00412', '2017-02-08 12:15:24', '2017-02-08 12:16:12', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 29900, 0, 29900, '0', '29900', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00413', '2017-02-08 12:18:06', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 20000, 0, 20000, '0', '20000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00414', '2017-02-08 12:21:09', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 198500, 0, 198500, '0', '195000', '0', '0', '17', 'pend', 'paid', '1', 'active', ''),
('KSU.00415', '2017-02-08 12:23:42', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 4000, 0, 4000, '0', '5000', '1000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00416', '2017-02-08 12:24:06', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 6500, 0, 6500, '0', '8992946121012', '8992946114512', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00417', '2017-02-08 13:19:29', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 21000, 0, 21000, '0', '21000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00418', '2017-02-08 13:20:26', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 237000, 0, 237000, '0', '237000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00419', '2017-02-08 13:31:32', '2017-02-08 13:45:06', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 63000, 0, 63000, '0', '65000', '2000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00420', '2017-02-08 13:43:06', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 55300, 0, 55300, '0', '65300', '10000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00421', '2017-02-08 13:46:41', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 3000, 0, 3000, '0', '3000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00422', '2017-02-08 14:57:43', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2000, 0, 2000, '0', '2000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00423', '2017-02-08 15:03:56', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 208500, 0, 208500, '0', '208500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00424', '2017-02-08 15:05:40', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2500, 0, 2500, '0', '2500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00425', '2017-02-08 15:11:09', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 158000, 0, 158000, '0', '158000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00426', '2017-02-09 09:00:21', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2000, 0, 2000, '0', '2000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00427', '2017-02-09 10:52:44', '2017-02-09 11:51:54', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 54000, 0, 54000, '0', '54000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00428', '2017-02-09 11:23:37', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 14500, 0, 14500, '0', '50000', '35500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00429', '2017-02-09 11:39:22', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 39500, 0, 39500, '0', '50000', '10500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00430', '2017-02-09 11:48:51', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 39500, 0, 39500, '0', '50000', '10500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00431', '2017-02-09 11:56:32', '2017-02-09 13:39:23', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 280600, 0, 280600, '0', '280600', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00432', '2017-02-09 11:57:27', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 142500, 0, 142500, '0', '142500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00433', '2017-02-09 12:27:07', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 11500, 0, 11500, '0', '11500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00434', '2017-02-09 12:57:49', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 43000, 0, 43000, '0', '42500', '0', '0', '17', 'pend', 'paid', '1', 'active', ''),
('KSU.00435', '2017-02-09 12:59:48', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 15800, 0, 15800, '0', '20000', '4200', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00436', '2017-02-09 14:01:38', '2017-02-09 14:15:51', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 33200, 0, 33200, '0', '33200', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00437', '2017-02-09 14:09:24', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 21000, 0, 21000, '0', '21000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00438', '2017-02-09 14:25:30', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2000, 0, 2000, '0', '2000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00439', '2017-02-09 14:36:46', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 53500, 0, 53500, '0', '53500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00440', '2017-02-09 15:41:28', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 51000, 0, 51000, '0', '51000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00441', '2017-02-09 15:42:17', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 43300, 0, 43300, '0', '43300', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00442', '2017-02-10 09:08:29', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 15000, 0, 15000, '0', '20000', '5000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00443', '2017-02-10 09:23:16', '2017-02-10 09:28:36', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 716900, 0, 716900, '0', '716900', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00444', '2017-02-10 09:29:38', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 337000, 0, 337000, '0', '337000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00445', '2017-02-10 09:34:17', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 10500, 0, 10500, '0', '10500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00446', '2017-02-10 09:34:40', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 62918, 0, 62918, '0', '63000', '82', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00447', '2017-02-10 09:35:17', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 10000, 0, 10000, '0', '10000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00448', '2017-02-10 09:40:52', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 6000, 0, 6000, '0', '7000', '1000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00449', '2017-02-10 09:42:20', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 15800, 0, 15800, '0', '15800', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00450', '2017-02-10 09:51:45', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 6500, 0, 6500, '0', '7000', '500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00451', '2017-02-10 10:26:03', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 19000, 0, 19000, '0', '20000', '1000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00452', '2017-02-10 10:52:27', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 19500, 0, 19500, '0', '50000', '30500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00453', '2017-02-10 11:02:52', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 3000, 0, 3000, '0', '3000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00454', '2017-02-10 11:32:16', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 12000, 0, 12000, '0', '12000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00455', '2017-02-10 12:01:58', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 13800, 0, 13800, '0', '20000', '6200', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00456', '2017-02-10 12:02:40', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2000, 0, 2000, '0', '2000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00457', '2017-02-10 12:07:09', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 29000, 0, 29000, '0', '100000', '71000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00458', '2017-02-10 12:08:46', '2017-02-10 13:15:15', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 95000, 0, 95000, '0', '100000', '11000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00459', '2017-02-10 12:09:10', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2000, 0, 2000, '0', '2000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00461', '2017-02-10 13:26:09', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 3000, 0, 3000, '0', '3000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00462', '2017-02-10 13:26:32', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 38500, 0, 38500, '0', '38500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00463', '2017-02-10 13:39:33', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2000, 0, 2000, '0', '2000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00464', '2017-02-10 14:49:12', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 9000, 0, 9000, '0', '10000', '1000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00465', '2017-02-10 14:50:34', '2017-02-10 14:52:15', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 11700, 0, 11700, '0', '15000', '3300', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00466', '2017-02-10 14:52:49', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 167000, 0, 167000, '0', '167000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00467', '2017-02-10 14:56:14', '2017-02-10 15:03:10', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 38000, 0, 38000, '0', '50000', '12000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00468', '2017-02-10 15:03:46', '2017-02-10 15:04:20', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 178500, 0, 178500, '0', '178500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00469', '2017-02-10 15:06:37', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 22000, 0, 22000, '0', '50000', '28000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00470', '2017-02-10 15:13:42', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 17500, 0, 17500, '0', '17500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00471', '2017-02-10 15:19:06', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 19000, 0, 19000, '0', '20000', '1000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00472', '2017-02-10 15:21:39', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 500, 0, 500, '0', '5000', '4500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00473', '2017-02-11 08:56:52', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 19000, 0, 19000, '0', '50000', '31000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00474', '2017-02-11 09:25:24', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 197500, 0, 197500, '0', '197500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00475', '2017-02-11 09:52:50', '2017-02-11 10:20:52', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 284750, 0, 284750, '0', '284750', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00476', '2017-02-11 10:23:43', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2000, 0, 2000, '0', '2000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00477', '2017-02-11 11:08:11', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2000, 0, 2000, '0', '2000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00479', '2017-02-11 11:39:41', '2017-02-11 12:08:19', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 158000, 0, 158000, '0', '147000', '0', '0', '17', 'pend', 'paid', '1', 'active', ''),
('KSU.00480', '2017-02-11 12:07:45', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 136500, 0, 136500, '0', '151500', '15000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00481', '2017-02-11 12:15:39', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 83500, 0, 83500, '0', '85000', '1500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00482', '2017-02-11 12:24:08', '2017-02-11 13:29:59', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 65000, 0, 65000, '0', '65000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00483', '2017-02-13 09:58:08', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2500, 0, 2500, '0', '10000', '7500', '0', '1', 'complete', 'paid', '1', 'active', ''),
('KSU.00484', '2017-02-13 09:59:03', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2500, 0, 2500, '0', '2500', '0', '0', '1', 'complete', 'paid', '1', 'active', ''),
('KSU.00485', '2017-02-13 10:01:10', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2500, 0, 2500, '0', '2500', '0', '0', '1', 'complete', 'paid', '1', 'active', ''),
('KSU.00486', '2017-02-13 10:17:44', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 120000, 0, 120000, '0', '120000', '0', '0', '1', 'complete', 'paid', '1', 'active', ''),
('KSU.00487', '2017-02-13 10:32:24', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 79500, 0, 79500, '0', '79500', '0', '0', '1', 'complete', 'paid', '1', 'active', ''),
('KSU.00488', '2017-02-13 10:43:19', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 3000, 0, 3000, '0', '4000', '1000', '0', '1', 'complete', 'paid', '1', 'active', ''),
('KSU.00489', '2017-02-13 10:46:24', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 13000, 0, 13000, '0', '14000', '1000', '0', '1', 'complete', 'paid', '1', 'active', ''),
('KSU.00490', '2017-02-13 10:48:12', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 302800, 0, 302800, '0', '301500', '0', '0', '1', 'pend', 'paid', '1', 'active', ''),
('KSU.00491', '2017-02-13 10:58:33', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 3000, 0, 3000, '0', '3000', '0', '0', '1', 'complete', 'paid', '1', 'active', ''),
('KSU.00492', '2017-02-13 10:58:55', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 207000, 0, 207000, '0', '207000', '0', '0', '1', 'complete', 'paid', '1', 'active', ''),
('KSU.00493', '2017-02-13 11:27:23', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 14700, 0, 14700, '0', '50000', '35300', '0', '1', 'complete', 'paid', '1', 'active', ''),
('KSU.00494', '2017-02-13 11:32:31', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 61000, 0, 61000, '0', '100000', '39000', '0', '1', 'complete', 'paid', '1', 'active', ''),
('KSU.00495', '2017-02-13 11:40:01', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 129700, 0, 129700, '0', '129700', '0', '0', '1', 'complete', 'paid', '1', 'active', ''),
('KSU.00496', '2017-02-13 11:50:25', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 6750, 0, 6750, '0', '10000', '3500', '0', '1', 'complete', 'paid', '1', 'active', ''),
('KSU.00497', '2017-02-13 11:51:53', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 16500, 0, 16500, '0', '20000', '3500', '0', '1', 'complete', 'paid', '1', 'active', ''),
('KSU.00498', '2017-02-13 11:55:04', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 401800, 0, 401800, '0', '401800', '0', '0', '1', 'complete', 'paid', '1', 'active', ''),
('KSU.00499', '2017-02-13 12:04:00', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 4000, 0, 4000, '0', '4000', '0', '0', '1', 'complete', 'paid', '1', 'active', ''),
('KSU.00500', '2017-02-13 12:28:15', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 19800, 0, 19800, '0', '20000', '200', '0', '1', 'complete', 'paid', '1', 'active', ''),
('KSU.00501', '2017-02-13 12:57:45', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 50500, 0, 50500, '0', '50000', '0', '0', '1', 'pend', 'paid', '1', 'active', ''),
('KSU.00502', '2017-02-13 13:33:47', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 19000, 0, 19000, '0', '19000', '0', '0', '1', 'complete', 'paid', '1', 'active', ''),
('KSU.00503', '2017-02-13 13:43:44', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 154000, 0, 154000, '0', '149000', '0', '0', '1', 'pend', 'paid', '1', 'active', ''),
('KSU.00504', '2017-02-13 13:58:53', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 15000, 0, 15000, '0', '15000', '0', '0', '1', 'complete', 'paid', '1', 'active', ''),
('KSU.00505', '2017-02-13 14:21:25', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 158000, 0, 158000, '0', '158000', '0', '0', '1', 'complete', 'paid', '1', 'active', ''),
('KSU.00506', '2017-02-13 14:25:41', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 500, 0, 500, '0', '500', '0', '0', '1', 'complete', 'paid', '1', 'active', ''),
('KSU.00507', '2017-02-13 14:28:32', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 122100, 0, 122100, '0', '122100', '0', '0', '1', 'complete', 'paid', '1', 'active', ''),
('KSU.00508', '2017-02-13 15:00:20', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 8000, 0, 8000, '0', '8000', '0', '0', '1', 'complete', 'paid', '1', 'active', ''),
('KSU.00509', '2017-02-13 15:07:19', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 9500, 0, 9500, '0', '9500', '0', '0', '1', 'complete', 'paid', '1', 'active', ''),
('KSU.00510', '2017-02-13 15:12:47', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 3000, 0, 3000, '0', '3000', '0', '0', '1', 'complete', 'paid', '1', 'active', ''),
('KSU.00511', '2017-02-13 15:27:44', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 0, 0, 0, '0', '0', '0', '0', '1', 'pend', 'unpaid', '1', 'active', ''),
('KSU.00512', '2017-02-14 09:28:07', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 13000, 0, 13000, '0', '13000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00513', '2017-02-14 09:31:54', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 12000, 0, 12000, '0', '12000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00514', '2017-02-14 09:32:59', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 18000, 0, 18000, '0', '50000', '32000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00515', '2017-02-14 10:10:08', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 3000, 0, 3000, '0', '3000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00516', '2017-02-14 10:23:25', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 31600, 0, 31600, '0', '50000', '18400', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00517', '2017-02-14 10:35:01', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 6750, 0, 6750, '0', '6500', '0', '0', '17', 'pend', 'paid', '1', 'active', ''),
('KSU.00518', '2017-02-14 10:52:00', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 4500, 0, 4500, '0', '5000', '500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00519', '2017-02-14 11:02:41', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 102000, 0, 102000, '0', '102000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00521', '2017-02-14 11:22:31', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 17000, 0, 17000, '0', '50000', '33000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00522', '2017-02-14 11:28:37', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2500, 0, 2500, '0', '2500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00523', '2017-02-14 11:49:06', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2500, 0, 2500, '0', '2500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00524', '2017-02-14 11:49:28', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 33500, 0, 33500, '0', '33000', '0', '0', '17', 'pend', 'paid', '1', 'active', ''),
('KSU.00525', '2017-02-14 11:50:04', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 6500, 0, 6500, '0', '6500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00526', '2017-02-14 11:53:41', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 114000, 0, 114000, '0', '109000', '0', '0', '17', 'pend', 'paid', '1', 'active', '');
INSERT INTO `tbl_orderlist` (`no_nota`, `tgl_simpan`, `tgl_modif`, `id_meja`, `id_grup_pelanggan`, `no_meja`, `kode`, `nama`, `no_hp`, `alamat`, `jml_bayar`, `jml_ppn`, `jml_gtotal`, `diskon`, `tot_bayar`, `tot_kembali`, `tot_kurang`, `pelayan`, `status_order`, `status_payment`, `status_resto`, `status_meja`, `ket`) VALUES
('KSU.00527', '2017-02-14 12:07:40', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 198200, 0, 198200, '0', '193200', '0', '0', '17', 'pend', 'paid', '1', 'active', ''),
('KSU.00528', '2017-02-14 15:24:00', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 10000, 0, 10000, '0', '10000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00529', '2017-02-14 15:25:23', '2017-02-16 09:50:56', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 9000, 0, 9000, '0', '9000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00530', '2017-02-14 15:27:17', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2500, 0, 2500, '0', '2500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00531', '2017-02-14 15:54:59', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 180000, 0, 180000, '0', '180000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00532', '2017-02-16 09:04:11', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 197500, 0, 197500, '0', '197500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00533', '2017-02-16 09:41:16', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 26000, 0, 26000, '0', '26000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00534', '2017-02-16 10:01:55', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 15000, 0, 15000, '0', '50000', '35000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00535', '2017-02-16 10:03:25', '2017-02-16 10:10:07', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 303500, 0, 303500, '0', '303500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00536', '2017-02-16 10:11:09', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 158000, 0, 158000, '0', '158000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00537', '2017-02-16 10:18:42', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 19900, 0, 19900, '0', '20000', '100', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00538', '2017-02-16 10:21:50', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 10000, 0, 10000, '0', '10000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00539', '2017-02-16 10:29:19', '2017-02-16 11:26:10', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 50400, 0, 50400, '0', '50400', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00540', '2017-02-16 11:05:16', '2017-02-16 11:29:26', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 16000, 0, 16000, '0', '16000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00541', '2017-02-16 11:33:47', '2017-02-16 11:37:18', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 152500, 0, 152500, '0', '152500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00542', '2017-02-16 11:37:30', '2017-02-16 11:37:38', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 26000, 0, 26000, '0', '50000', '24000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00543', '2017-02-16 11:40:37', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 4000, 0, 4000, '0', '5000', '1000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00544', '2017-02-16 11:48:01', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 650000, 0, 650000, '0', '650000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00545', '2017-02-16 11:55:32', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 20500, 0, 20500, '0', '50000', '29500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00546', '2017-02-16 11:56:18', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 13000, 0, 13000, '0', '50000', '37000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00547', '2017-02-16 12:30:03', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2500, 0, 2500, '0', '2500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00548', '2017-02-16 12:40:47', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2500, 0, 2500, '0', '2500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00549', '2017-02-16 12:41:17', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 5000, 0, 5000, '0', '5000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00550', '2017-02-16 13:11:49', '2017-02-16 13:12:20', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 21500, 0, 21500, '0', '100000', '78500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00551', '2017-02-16 13:12:59', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 3000, 0, 3000, '0', '4000', '1000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00552', '2017-02-16 13:18:16', '2017-02-16 14:00:11', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 65400, 0, 65400, '0', '64900', '0', '0', '17', 'pend', 'paid', '1', 'active', ''),
('KSU.00553', '2017-02-16 14:09:09', '2017-02-16 14:35:17', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 98200, 0, 98200, '0', '98200', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00554', '2017-02-16 14:37:16', '2017-02-16 14:56:52', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 6000, 0, 6000, '0', '10000', '4000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00555', '2017-02-16 15:40:25', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2500, 0, 2500, '0', '2500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00556', '2017-02-16 15:40:47', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 197500, 0, 197500, '0', '197500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00557', '2017-02-17 09:00:58', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 102000, 0, 102000, '0', '110000', '8000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00558', '2017-02-17 10:16:12', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 39500, 0, 39500, '0', '50000', '10500', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00559', '2017-02-17 10:21:11', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 69500, 0, 69500, '0', '69500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00560', '2017-02-17 10:39:32', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 3000, 0, 3000, '0', '5000', '2000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00561', '2017-02-17 10:49:36', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 181500, 0, 181500, '0', '181500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00562', '2017-02-17 11:18:45', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 5500, 0, 5500, '0', '5500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00563', '2017-02-17 11:20:09', '2017-02-17 11:31:39', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 12500, 0, 12500, '0', '12500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00564', '2017-02-17 11:31:52', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 63500, 0, 63500, '0', '63500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00565', '2017-02-17 11:35:50', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2000, 0, 2000, '0', '2000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00566', '2017-02-17 11:45:51', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 18000, 0, 18000, '0', '8991389258392', '8991389240392', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00567', '2017-02-17 11:58:09', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 5500, 0, 5500, '0', '5500', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00568', '2017-02-17 12:02:20', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 450000, 0, 450000, '0', '450000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00569', '2017-02-17 12:20:04', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 19000, 0, 19000, '0', '20000', '1000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00570', '2017-02-17 12:27:49', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 2000, 0, 2000, '0', '2000', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00571', '2017-02-17 12:30:32', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 79200, 0, 79200, '0', '79200', '0', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00572', '2017-02-17 12:35:27', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 3000, 0, 3000, '0', '5000', '2000', '0', '17', 'complete', 'paid', '1', 'active', ''),
('KSU.00573', '2017-02-17 13:14:26', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 0, 0, 0, '0', '0', '0', '0', '17', 'pend', 'unpaid', '1', 'active', ''),
('KSU.00574', '2017-02-19 12:05:52', '0000-00-00 00:00:00', 0, 0, '', 'PLGN.00000', 'Umum', 'Umum', 'Umum', 0, 0, 0, '0', '0', '0', '0', '1', 'pend', 'unpaid', '1', 'active', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orderlist_det`
--

CREATE TABLE `tbl_orderlist_det` (
  `id` int(11) NOT NULL,
  `tgl` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_produk` int(11) NOT NULL,
  `no_nota` varchar(160) CHARACTER SET latin1 NOT NULL,
  `produk` varchar(360) CHARACTER SET latin1 NOT NULL,
  `keterangan` varchar(120) CHARACTER SET latin1 NOT NULL,
  `tambahan` enum('yes','no') CHARACTER SET latin1 NOT NULL,
  `harga` int(11) NOT NULL,
  `diskon` int(11) NOT NULL,
  `jml` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `status` varchar(50) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_orderlist_det`
--

INSERT INTO `tbl_orderlist_det` (`id`, `tgl`, `id_produk`, `no_nota`, `produk`, `keterangan`, `tambahan`, `harga`, `diskon`, `jml`, `subtotal`, `status`) VALUES
(1, '2017-01-17 13:59:48', 222, 'KSU.00001', 'Good Day Carrebian', '-', 'yes', 10000, 0, 1, 10000, ''),
(2, '2017-01-17 14:01:15', 367, 'KSU.00001', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 1, 13000, ''),
(3, '2017-01-17 14:02:12', 231, 'KSU.00001', 'Jahe Wangi', '-', 'yes', 8500, 0, 1, 8500, ''),
(4, '2017-01-18 15:20:15', 367, 'KSU.00002', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 1, 13000, ''),
(5, '2017-01-18 15:20:38', 360, 'KSU.00002', '76 filter', '-', 'yes', 12500, 0, 1, 12500, ''),
(6, '2017-01-18 15:20:44', 5, 'KSU.00002', 'Indomie ayam bawang', '-', 'yes', 2000, 0, 1, 2000, ''),
(7, '2017-01-18 15:21:23', 215, 'KSU.00002', 'Ades 600', '-', 'yes', 3000, 0, 1, 3000, ''),
(8, '2017-01-18 15:21:29', 213, 'KSU.00002', 'Aqua 600', '-', 'yes', 2500, 0, 1, 2500, ''),
(12, '2017-01-18 15:29:25', 367, 'KSU.00003', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 2, 26000, ''),
(13, '2017-01-18 15:29:52', 174, 'KSU.00003', 'Bimoli 1lt', '-', 'yes', 13000, 0, 1, 13000, ''),
(14, '2017-01-18 15:30:19', 155, 'KSU.00003', 'Beras Premium @2kg', '-', 'yes', 15800, 0, 3, 47400, ''),
(18, '2017-01-18 15:42:59', 367, 'KSU.00004', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 2, 26000, ''),
(19, '2017-01-18 15:43:35', 521, 'KSU.00004', 'Beras Rejo Mulya @5kg', '-', 'yes', 50000, 0, 2, 100000, ''),
(21, '2017-01-18 15:44:07', 342, 'KSU.00004', 'So klin sst ungu', '-', 'yes', 5500, 0, 2, 11000, ''),
(22, '2017-01-18 15:44:26', 5, 'KSU.00004', 'Indomie ayam bawang', '-', 'yes', 2000, 0, 40, 80000, ''),
(23, '2017-01-19 09:20:35', 521, 'KSU.00005', 'Beras Rejo Mulya @5kg', '-', 'yes', 50000, 0, 5, 250000, ''),
(25, '2017-01-19 09:21:06', 365, 'KSU.00005', 'Surya 16', '-', 'yes', 19000, 0, 2, 38000, ''),
(26, '2017-01-19 09:21:20', 357, 'KSU.00005', 'Djarum 16', '-', 'yes', 20000, 0, 2, 40000, ''),
(27, '2017-01-19 09:21:34', 227, 'KSU.00005', 'White Coffe', '-', 'yes', 9500, 0, 1, 9500, ''),
(28, '2017-01-19 09:21:40', 225, 'KSU.00005', 'Good Day Mocacino', '-', 'yes', 10000, 0, 1, 10000, ''),
(29, '2017-01-19 09:21:45', 501, 'KSU.00005', 'Good day chococino', '-', 'yes', 10500, 0, 1, 10500, ''),
(30, '2017-01-19 09:21:50', 218, 'KSU.00005', 'Nutrisari Am Sweet', '-', 'yes', 9700, 0, 1, 9700, ''),
(31, '2017-01-19 09:22:32', 510, 'KSU.00005', 'Masako sapi', '-', 'yes', 5000, 0, 2, 10000, ''),
(32, '2017-01-19 09:22:51', 187, 'KSU.00005', 'Bendera Coklat sst', '-', 'yes', 7500, 0, 1, 7500, ''),
(33, '2017-01-19 09:23:10', 186, 'KSU.00005', 'Bendera putih Sst', '-', 'yes', 7500, 0, 1, 7500, ''),
(35, '2017-01-19 09:23:37', 179, 'KSU.00005', 'Pita merah', '-', 'yes', 7000, 0, 3, 21000, ''),
(36, '2017-01-19 09:23:49', 429, 'KSU.00005', 'Mia atom bulan', '-', 'yes', 4500, 0, 4, 18000, ''),
(37, '2017-01-19 09:24:14', 367, 'KSU.00005', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 5, 65000, ''),
(38, '2017-01-19 09:24:31', 335, 'KSU.00005', 'Multi Gulung', '-', 'yes', 3000, 0, 2, 6000, ''),
(39, '2017-01-19 09:24:56', 511, 'KSU.00005', 'Antangin ', '-', 'yes', 2000, 0, 2, 4000, ''),
(41, '2017-01-19 09:25:40', 509, 'KSU.00005', 'motto 1/4', '-', 'yes', 8000, 0, 1, 8000, ''),
(42, '2017-01-19 09:25:56', 508, 'KSU.00005', 'kecap lele sst', '-', 'yes', 18500, 0, 1, 18500, ''),
(43, '2017-01-19 09:27:03', 416, 'KSU.00005', 'Aqua 1.5', '-', 'yes', 5000, 0, 2, 10000, ''),
(44, '2017-01-19 09:34:11', 156, 'KSU.00006', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 4, 158000, ''),
(45, '2017-01-19 09:40:54', 323, 'KSU.00007', 'Multi Biru Refil', '-', 'yes', 6500, 0, 1, 6500, ''),
(46, '2017-01-19 11:07:05', 388, 'KSU.00008', 'Promax', '-', 'yes', 500, 0, 2, 1000, ''),
(47, '2017-01-19 11:10:46', 187, 'KSU.00009', 'Bendera Coklat sst', '-', 'yes', 7500, 0, 1, 7500, ''),
(48, '2017-01-19 11:10:53', 186, 'KSU.00009', 'Bendera putih Sst', '-', 'yes', 7500, 0, 1, 7500, ''),
(49, '2017-01-19 11:11:40', 368, 'KSU.00009', 'Gula pasir 1/2', '-', 'yes', 13000, 0, 1, 13000, ''),
(50, '2017-01-19 11:11:51', 147, 'KSU.00009', 'Sampo pantene Sst hitam', '-', 'yes', 9500, 0, 1, 9500, ''),
(51, '2017-01-19 11:12:09', 6, 'KSU.00009', 'Sedap goreng', '-', 'yes', 2200, 0, 5, 11000, ''),
(52, '2017-01-19 11:12:46', 119, 'KSU.00009', 'Sabun Nuvo Cool', '-', 'yes', 2000, 0, 2, 4000, ''),
(53, '2017-01-19 11:14:41', 505, 'KSU.00010', 'Floridina', '-', 'yes', 3000, 0, 1, 3000, ''),
(54, '2017-01-19 11:15:44', 521, 'KSU.00011', 'Beras Rejo Mulya @5kg', '-', 'yes', 50000, 0, 3, 150000, ''),
(55, '2017-01-19 11:22:36', 138, 'KSU.00012', 'WPC biru', '-', 'yes', 9500, 0, 1, 9500, ''),
(56, '2017-01-19 11:22:49', 16, 'KSU.00012', 'ABC Selera pedas gulai', '-', 'yes', 2000, 0, 1, 2000, ''),
(57, '2017-01-19 11:22:51', 18, 'KSU.00012', 'ABC selera Sup  tomat', '-', 'yes', 2000, 0, 1, 2000, ''),
(58, '2017-01-19 11:23:10', 367, 'KSU.00012', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 1, 13000, ''),
(59, '2017-01-19 11:23:26', 366, 'KSU.00012', 'Gula jawa 1/2', '-', 'yes', 6500, 0, 1, 6500, ''),
(60, '2017-01-19 11:23:37', 210, 'KSU.00012', 'Frestea Apel 500', '-', 'yes', 5500, 0, 1, 5500, ''),
(61, '2017-01-19 11:24:09', 174, 'KSU.00012', 'Bimoli 1lt', '-', 'yes', 13000, 0, 1, 13000, ''),
(62, '2017-01-19 11:33:12', 521, 'KSU.00013', 'Beras Rejo Mulya @5kg', '-', 'yes', 50000, 0, 1, 50000, ''),
(63, '2017-01-19 12:04:25', 368, 'KSU.00014', 'Gula pasir 1/2', '-', 'yes', 13000, 0, 3, 39000, ''),
(64, '2017-01-19 12:04:53', 175, 'KSU.00014', 'Sanco 2lt', '-', 'yes', 27000, 0, 1, 27000, ''),
(65, '2017-01-19 12:05:06', 210, 'KSU.00014', 'Frestea Apel 500', '-', 'yes', 5500, 0, 1, 5500, ''),
(66, '2017-01-19 12:15:36', 215, 'KSU.00015', 'Ades 600', '-', 'yes', 3000, 0, 1, 3000, ''),
(67, '2017-01-19 12:16:30', 425, 'KSU.00015', 'Aqua 330ml', '-', 'yes', 2000, 0, 1, 2000, ''),
(68, '2017-01-19 12:17:55', 214, 'KSU.00015', 'Aquaria 600', '-', 'yes', 2000, 0, 1, 2000, ''),
(69, '2017-01-19 12:18:06', 505, 'KSU.00015', 'Floridina', '-', 'yes', 3000, 0, 1, 3000, ''),
(70, '2017-01-19 12:22:41', 374, 'KSU.00015', 'Surya Pro', '-', 'yes', 13000, 0, 1, 13000, ''),
(71, '2017-01-19 12:29:48', 377, 'KSU.00016', 'Tuton Filter', '-', 'yes', 8000, 0, 1, 8000, ''),
(83, '2017-01-19 12:44:42', 367, 'KSU.00017', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 2, 26000, ''),
(84, '2017-01-19 12:45:12', 368, 'KSU.00017', 'Gula pasir 1/2', '-', 'yes', 13000, 0, 8, 104000, ''),
(85, '2017-01-19 12:45:30', 507, 'KSU.00017', 'Kecap lele 340', '-', 'yes', 10500, 0, 3, 31500, ''),
(86, '2017-01-19 12:46:02', 183, 'KSU.00017', 'Ekomie', '-', 'yes', 8500, 0, 2, 17000, ''),
(87, '2017-01-19 12:46:09', 179, 'KSU.00017', 'Pita merah', '-', 'yes', 7000, 0, 2, 14000, ''),
(88, '2017-01-19 12:46:18', 500, 'KSU.00017', 'Fortune 2lt', '-', 'yes', 24000, 0, 1, 24000, ''),
(89, '2017-01-19 12:46:30', 346, 'KSU.00017', 'Wing Biru', '-', 'yes', 2000, 0, 3, 6000, ''),
(90, '2017-01-19 12:46:58', 366, 'KSU.00017', 'Gula jawa 1/2', '-', 'yes', 6500, 0, 2, 13000, ''),
(91, '2017-01-19 12:47:26', 510, 'KSU.00017', 'Masako sapi', '-', 'yes', 5000, 0, 2, 10000, ''),
(92, '2017-01-19 12:47:46', 110, 'KSU.00017', 'Sabun Giv Putih', '-', 'yes', 2000, 0, 2, 4000, ''),
(93, '2017-01-19 12:47:56', 112, 'KSU.00017', 'Sabun Giv Ungu', '-', 'yes', 2000, 0, 2, 4000, ''),
(94, '2017-01-19 12:48:04', 109, 'KSU.00017', 'Sabun Giv Merah', '-', 'yes', 2000, 0, 2, 4000, ''),
(95, '2017-01-19 12:48:24', 55, 'KSU.00017', 'Pepsodent 120', '-', 'yes', 6500, 0, 1, 6500, ''),
(96, '2017-01-19 12:48:30', 149, 'KSU.00017', 'Sampo Dove sst Nourishment', '-', 'yes', 11000, 0, 1, 11000, ''),
(97, '2017-01-19 12:48:33', 152, 'KSU.00017', 'Sampo Lifboy sst kuning', '-', 'yes', 5000, 0, 1, 5000, ''),
(98, '2017-01-19 12:48:56', 227, 'KSU.00017', 'White Coffe', '-', 'yes', 9500, 0, 1, 9500, ''),
(99, '2017-01-19 12:49:30', 186, 'KSU.00018', 'Bendera putih Sst', '-', 'yes', 7500, 0, 2, 15000, ''),
(100, '2017-01-19 12:49:53', 4, 'KSU.00018', 'Indomie Spesial', '-', 'yes', 2000, 0, 15, 30000, ''),
(101, '2017-01-19 12:50:15', 6, 'KSU.00018', 'Sedap goreng', '-', 'yes', 2200, 0, 5, 11000, ''),
(102, '2017-01-19 12:50:28', 14, 'KSU.00018', 'Sukses Goreng', '-', 'yes', 3000, 0, 6, 18000, ''),
(103, '2017-01-19 12:50:44', 5, 'KSU.00018', 'Indomie ayam bawang', '-', 'yes', 2000, 0, 5, 10000, ''),
(104, '2017-01-19 12:50:54', 101, 'KSU.00018', 'Downy Hitam sst', '-', 'yes', 5500, 0, 3, 16500, ''),
(105, '2017-01-19 12:51:20', 156, 'KSU.00018', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 4, 158000, ''),
(106, '2017-01-19 12:51:31', 521, 'KSU.00018', 'Beras Rejo Mulya @5kg', '-', 'yes', 50000, 0, 1, 50000, ''),
(107, '2017-01-19 13:11:35', 4, 'KSU.00019', 'Indomie Spesial', '-', 'yes', 2000, 0, 15, 30000, ''),
(108, '2017-01-19 13:14:36', 250, 'KSU.00020', 'Dandang kepyur', '-', 'yes', 2500, 0, 2, 5000, ''),
(109, '2017-01-19 13:14:47', 247, 'KSU.00020', 'Gopek clp', '-', 'yes', 6500, 0, 1, 6500, ''),
(111, '2017-01-19 13:15:15', 184, 'KSU.00020', 'Susu Kaleng Kental manis', '-', 'yes', 9500, 0, 2, 19000, ''),
(112, '2017-01-19 13:15:48', 368, 'KSU.00020', 'Gula pasir 1/2', '-', 'yes', 13000, 0, 1, 13000, ''),
(113, '2017-01-19 13:16:12', 32, 'KSU.00020', 'Motto T ', '-', 'yes', 1700, 0, 1, 1700, ''),
(114, '2017-01-19 13:17:01', 193, 'KSU.00020', 'Susu zee Putih sst', '-', 'yes', 3000, 0, 10, 30000, ''),
(115, '2017-01-19 13:17:11', 273, 'KSU.00020', 'Clear AD ', '-', 'yes', 10000, 0, 1, 10000, ''),
(116, '2017-01-19 13:17:20', 139, 'KSU.00020', 'WPC hijau', '-', 'yes', 9500, 0, 1, 9500, ''),
(117, '2017-01-19 13:17:37', 521, 'KSU.00020', 'Beras Rejo Mulya @5kg', '-', 'yes', 50000, 0, 1, 50000, ''),
(118, '2017-01-19 13:39:16', 368, 'KSU.00021', 'Gula pasir 1/2', '-', 'yes', 13000, 0, 1, 13000, ''),
(119, '2017-01-19 13:39:46', 187, 'KSU.00021', 'Bendera Coklat sst', '-', 'yes', 7500, 0, 1, 7500, ''),
(121, '2017-01-19 13:44:05', 9, 'KSU.00022', 'Sedap Soto', '-', 'yes', 2000, 0, 2, 4000, ''),
(122, '2017-01-19 13:44:26', 13, 'KSU.00022', 'Sedap White Curry', '-', 'yes', 2000, 0, 2, 4000, ''),
(123, '2017-01-19 13:46:05', 377, 'KSU.00022', 'Tuton Filter', '-', 'yes', 8000, 0, 1, 8000, ''),
(124, '2017-01-19 13:59:16', 521, 'KSU.00023', 'Beras Rejo Mulya @5kg', '-', 'yes', 50000, 0, 20, 1000000, ''),
(125, '2017-01-19 13:59:38', 529, 'KSU.00023', 'aquaria gelas', '-', 'yes', 20000, 0, 10, 200000, ''),
(126, '2017-01-19 13:59:56', 367, 'KSU.00023', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 20, 260000, ''),
(127, '2017-01-19 14:01:37', 180, 'KSU.00023', 'Tepung Ketan', '-', 'yes', 7500, 0, 20, 150000, ''),
(128, '2017-01-19 14:02:41', 182, 'KSU.00023', 'tepung beras 500g', '-', 'yes', 6000, 0, 20, 120000, ''),
(129, '2017-01-19 14:03:12', 524, 'KSU.00023', 'Beras Ketan', '-', 'yes', 278500, 0, 1, 278500, ''),
(130, '2017-01-19 14:03:26', 528, 'KSU.00023', 'Telor', '-', 'yes', 20000, 0, 20, 400000, ''),
(131, '2017-01-19 14:03:37', 526, 'KSU.00023', 'Abon', '-', 'yes', 60000, 0, 1, 60000, ''),
(132, '2017-01-19 14:04:04', 527, 'KSU.00023', 'krupuk Udang', '-', 'yes', 65000, 0, 1, 65000, ''),
(133, '2017-01-19 14:04:24', 31, 'KSU.00023', 'Kecap Lele 680ml', '-', 'yes', 0, 0, 5, 0, ''),
(134, '2017-01-19 14:04:34', 509, 'KSU.00023', 'motto 1/4', '-', 'yes', 8000, 0, 2, 16000, ''),
(135, '2017-01-19 14:04:52', 250, 'KSU.00023', 'Dandang kepyur', '-', 'yes', 2500, 0, 10, 25000, ''),
(136, '2017-01-19 14:05:40', 366, 'KSU.00023', 'Gula jawa 1/2', '-', 'yes', 6500, 0, 10, 65000, ''),
(137, '2017-01-19 14:05:59', 488, 'KSU.00023', 'Sirup Kartika melon', '-', 'yes', 16500, 0, 12, 198000, ''),
(138, '2017-01-19 14:50:19', 202, 'KSU.00024', 'Sprite 425', '-', 'yes', 4000, 0, 1, 4000, ''),
(139, '2017-01-19 15:24:58', 206, 'KSU.00024', 'Iso Plus', '-', 'yes', 3000, 0, 1, 3000, ''),
(140, '2017-01-19 15:25:13', 214, 'KSU.00024', 'Aquaria 600', '-', 'yes', 2000, 0, 1, 2000, ''),
(141, '2017-01-20 08:56:37', 356, 'KSU.00026', 'Djarum 12', '-', 'yes', 15500, 0, 1, 15500, ''),
(142, '2017-01-20 08:56:58', 278, 'KSU.00026', 'Rexona sst Men', '-', 'yes', 2000, 0, 1, 2000, ''),
(143, '2017-01-20 09:11:14', 177, 'KSU.00027', 'Susu Gomars Vanila', '-', 'yes', 25000, 0, 3, 75000, ''),
(144, '2017-01-20 09:11:52', 35, 'KSU.00027', 'Masako Ayam', '-', 'yes', 5000, 0, 1, 5000, ''),
(145, '2017-01-20 09:16:44', 377, 'KSU.00028', 'Tuton Filter', '-', 'yes', 8000, 0, 1, 8000, ''),
(146, '2017-01-20 09:18:01', 530, 'KSU.00029', 'Tas sella D', '-', 'yes', 470000, 0, 1, 470000, ''),
(147, '2017-01-20 09:19:10', 531, 'KSU.00030', 'Tas Kotak biru', '-', 'yes', 420000, 0, 1, 420000, ''),
(148, '2017-01-20 09:20:46', 533, 'KSU.00031', 'Dancow Madu 3+ 800', '-', 'yes', 84000, 0, 2, 168000, ''),
(150, '2017-01-20 09:30:24', 339, 'KSU.00032', 'Sedap Cup Kari Spesial', '-', 'yes', 5000, 0, 2, 10000, ''),
(151, '2017-01-20 09:38:59', 374, 'KSU.00033', 'Surya Pro', '-', 'yes', 13000, 0, 1, 13000, ''),
(152, '2017-01-20 09:39:06', 220, 'KSU.00033', 'Nutrisari Florida', '-', 'yes', 9700, 0, 1, 9700, ''),
(153, '2017-01-20 09:41:17', 213, 'KSU.00025', 'Aqua 600', '-', 'yes', 2500, 0, 1, 2500, ''),
(154, '2017-01-20 09:41:34', 521, 'KSU.00025', 'Beras Rejo Mulya @5kg', '-', 'yes', 50000, 0, 1, 50000, ''),
(155, '2017-01-20 09:42:26', 156, 'KSU.00034', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 3, 118500, ''),
(156, '2017-01-20 09:48:45', 324, 'KSU.00036', 'Tessa 200', '-', 'yes', 11500, 0, 1, 11500, ''),
(157, '2017-01-20 09:49:18', 350, 'KSU.00036', 'Frestea beleng', '-', 'yes', 2000, 0, 2, 4000, ''),
(158, '2017-01-20 09:50:47', 155, 'KSU.00037', 'Beras Premium @2kg', '-', 'yes', 15800, 0, 3, 47400, ''),
(159, '2017-01-20 10:42:25', 135, 'KSU.00039', 'So klin lantai hijau 800ml', '-', 'yes', 9000, 0, 1, 9000, ''),
(160, '2017-01-20 11:18:19', 32, 'KSU.00035', 'Motto T ', '-', 'yes', 1700, 0, 1, 1700, ''),
(161, '2017-01-20 12:00:04', 98, 'KSU.00038', 'Shinzui Orange', '-', 'yes', 3500, 0, 1, 3500, ''),
(162, '2017-01-20 12:00:19', 62, 'KSU.00038', 'Close Up 65', '-', 'yes', 6500, 0, 1, 6500, ''),
(163, '2017-01-20 12:00:43', 367, 'KSU.00038', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 1, 13000, ''),
(164, '2017-01-20 12:01:00', 158, 'KSU.00038', 'Sabun Rinso 900gr', '-', 'yes', 18000, 0, 1, 18000, ''),
(165, '2017-01-20 12:01:58', 366, 'KSU.00038', 'Gula jawa 1/2', '-', 'yes', 6500, 0, 1, 6500, ''),
(166, '2017-01-20 12:02:08', 97, 'KSU.00038', 'Shinzui Ungu', '-', 'yes', 3500, 0, 1, 3500, ''),
(167, '2017-01-20 12:05:56', 291, 'KSU.00040', 'Rexona Men', '-', 'yes', 16000, 0, 1, 16000, ''),
(168, '2017-01-20 12:06:06', 161, 'KSU.00040', 'Sabun So klin softergen pink 800gr', '-', 'yes', 15000, 0, 1, 15000, ''),
(169, '2017-01-20 12:06:19', 352, 'KSU.00040', 'Tebs', '-', 'yes', 3000, 0, 1, 3000, ''),
(170, '2017-01-20 12:06:32', 137, 'KSU.00040', 'Poriklin 1000ml', '-', 'yes', 15000, 0, 1, 15000, ''),
(171, '2017-01-20 12:34:03', 372, 'KSU.00041', 'Signatur', '-', 'yes', 13000, 0, 1, 13000, ''),
(172, '2017-01-20 12:37:40', 377, 'KSU.00042', 'Tuton Filter', '-', 'yes', 8000, 0, 1, 8000, ''),
(173, '2017-01-20 13:22:54', 155, 'KSU.00043', 'Beras Premium @2kg', '-', 'yes', 15800, 0, 2, 31600, ''),
(175, '2017-01-20 13:34:35', 369, 'KSU.00044', 'Sampoerna Mild 16', '-', 'yes', 19000, 0, 2, 38000, ''),
(176, '2017-01-20 14:00:07', 368, 'KSU.00045', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 1, 6750, ''),
(177, '2017-01-20 14:00:36', 356, 'KSU.00045', 'Djarum 12', '-', 'yes', 15500, 0, 1, 15500, ''),
(179, '2017-01-20 14:38:45', 439, 'KSU.00047', 'Beras Organik', '-', 'yes', 13500, 0, 10, 135000, ''),
(180, '2017-01-21 09:14:52', 155, 'KSU.00048', 'Beras Premium @2kg', '-', 'yes', 15800, 0, 10, 158000, ''),
(181, '2017-01-21 09:15:17', 368, 'KSU.00048', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 20, 135000, ''),
(182, '2017-01-21 09:17:25', 521, 'KSU.00049', 'Beras Rejo Mulya @5kg', '-', 'yes', 50000, 0, 5, 250000, ''),
(183, '2017-01-21 09:28:57', 204, 'KSU.00050', 'Javana', '-', 'yes', 3000, 0, 1, 3000, ''),
(184, '2017-01-21 09:32:04', 213, 'KSU.00051', 'Aqua 600', '-', 'yes', 2500, 0, 1, 2500, ''),
(186, '2017-01-21 09:34:03', 464, 'KSU.00052', 'Dunhil Hitam', '-', 'yes', 15500, 0, 1, 15500, ''),
(187, '2017-01-21 09:34:10', 248, 'KSU.00052', 'Gopek Super', '-', 'yes', 4600, 0, 1, 4600, ''),
(188, '2017-01-21 09:34:20', 173, 'KSU.00052', 'sania 1lt', '-', 'yes', 13500, 0, 2, 27000, ''),
(189, '2017-01-21 09:34:41', 367, 'KSU.00052', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 2, 26000, ''),
(190, '2017-01-21 09:37:59', 155, 'KSU.00053', 'Beras Premium @2kg', '-', 'yes', 15800, 0, 10, 158000, ''),
(191, '2017-01-21 09:43:45', 393, 'KSU.00054', 'Xonce', '-', 'yes', 2000, 0, 1, 2000, ''),
(192, '2017-01-21 09:43:51', 215, 'KSU.00054', 'Ades 600', '-', 'yes', 3000, 0, 1, 3000, ''),
(193, '2017-01-21 09:54:57', 213, 'KSU.00055', 'Aqua 600', '-', 'yes', 2500, 0, 1, 2500, ''),
(194, '2017-01-21 10:08:36', 213, 'KSU.00056', 'Aqua 600', '-', 'yes', 2500, 0, 1, 2500, ''),
(195, '2017-01-21 10:14:03', 222, 'KSU.00057', 'Good Day Carrebian', '-', 'yes', 10000, 0, 1, 10000, ''),
(196, '2017-01-21 10:14:09', 223, 'KSU.00057', 'Good Day Vanila', '-', 'yes', 10000, 0, 1, 10000, ''),
(197, '2017-01-21 10:14:29', 186, 'KSU.00057', 'Bendera putih Sst', '-', 'yes', 7500, 0, 1, 7500, ''),
(198, '2017-01-21 10:14:51', 367, 'KSU.00057', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 1, 13000, ''),
(199, '2017-01-21 10:15:09', 155, 'KSU.00057', 'Beras Premium @2kg', '-', 'yes', 15800, 0, 1, 15800, ''),
(200, '2017-01-21 10:15:20', 509, 'KSU.00057', 'motto 1/4', '-', 'yes', 8000, 0, 1, 8000, ''),
(201, '2017-01-21 10:15:29', 14, 'KSU.00057', 'Sukses Goreng', '-', 'yes', 3000, 0, 1, 3000, ''),
(202, '2017-01-21 10:19:29', 521, 'KSU.00058', 'Beras Rejo Mulya @5kg', '-', 'yes', 50000, 0, 3, 150000, ''),
(204, '2017-01-21 10:21:23', 436, 'KSU.00059', 'Sampoerna Mild 12', '-', 'yes', 13500, 0, 2, 27000, ''),
(205, '2017-01-21 10:21:28', 369, 'KSU.00059', 'Sampoerna Mild 16', '-', 'yes', 19000, 0, 1, 19000, ''),
(206, '2017-01-21 10:38:53', 529, 'KSU.00060', 'aquaria gelas', '-', 'yes', 20000, 0, 1, 20000, ''),
(208, '2017-01-21 10:55:02', 210, 'KSU.00061', 'Frestea Apel 500', '-', 'yes', 5500, 0, 3, 16500, ''),
(210, '2017-01-21 11:13:18', 124, 'KSU.00062', 'Sabun Lifboy merah', '-', 'yes', 3000, 0, 2, 6000, ''),
(211, '2017-01-21 11:22:02', 179, 'KSU.00063', 'Pita merah', '-', 'yes', 7000, 0, 1, 7000, ''),
(212, '2017-01-21 11:34:12', 350, 'KSU.00064', 'Frestea beleng', '-', 'yes', 2000, 0, 4, 8000, ''),
(213, '2017-01-21 11:39:33', 156, 'KSU.00065', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 2, 79000, ''),
(214, '2017-01-21 11:39:44', 507, 'KSU.00065', 'Kecap lele 340', '-', 'yes', 10500, 0, 1, 10500, ''),
(215, '2017-01-21 11:40:52', 155, 'KSU.00065', 'Beras Premium @2kg', '-', 'yes', 15800, 0, 3, 47400, ''),
(216, '2017-01-21 11:52:08', 190, 'KSU.00066', 'Gulaku Hijau 1000 gr', '-', 'yes', 17000, 0, 2, 34000, ''),
(217, '2017-01-21 11:52:19', 169, 'KSU.00066', 'Tropical 2lt', '-', 'yes', 24000, 0, 1, 24000, ''),
(218, '2017-01-21 11:53:10', 511, 'KSU.00067', 'Antangin ', '-', 'yes', 2000, 0, 3, 6000, ''),
(219, '2017-01-21 11:54:57', 367, 'KSU.00068', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 1, 13000, ''),
(220, '2017-01-21 11:55:02', 158, 'KSU.00068', 'Sabun Rinso 900gr', '-', 'yes', 18000, 0, 1, 18000, ''),
(221, '2017-01-21 11:55:13', 4, 'KSU.00068', 'Indomie Spesial', '-', 'yes', 2000, 0, 10, 20000, ''),
(222, '2017-01-21 11:55:23', 101, 'KSU.00068', 'Downy Hitam sst', '-', 'yes', 5500, 0, 2, 11000, ''),
(223, '2017-01-21 11:55:38', 346, 'KSU.00068', 'Wing Biru', '-', 'yes', 2000, 0, 2, 4000, ''),
(224, '2017-01-21 12:01:46', 215, 'KSU.00069', 'Ades 600', '-', 'yes', 3000, 0, 1, 3000, ''),
(225, '2017-01-21 12:10:23', 368, 'KSU.00070', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 1, 6750, ''),
(226, '2017-01-21 12:11:14', 521, 'KSU.00071', 'Beras Rejo Mulya @5kg', '-', 'yes', 50000, 0, 1, 50000, ''),
(227, '2017-01-21 12:11:20', 97, 'KSU.00071', 'Shinzui Ungu', '-', 'yes', 3500, 0, 1, 3500, ''),
(228, '2017-01-21 12:11:33', 510, 'KSU.00071', 'Masako sapi', '-', 'yes', 5000, 0, 1, 5000, ''),
(229, '2017-01-21 12:11:50', 175, 'KSU.00071', 'Sanco 2lt', '-', 'yes', 27000, 0, 1, 27000, ''),
(230, '2017-01-21 12:12:03', 352, 'KSU.00071', 'Tebs', '-', 'yes', 3000, 0, 1, 3000, ''),
(231, '2017-01-21 12:12:36', 368, 'KSU.00071', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 2, 13500, ''),
(234, '2017-01-21 12:16:28', 179, 'KSU.00071', 'Pita merah', '-', 'yes', 7000, 0, 1, 7000, ''),
(235, '2017-01-21 12:16:34', 503, 'KSU.00071', 'Top kopi susu kental manis', '-', 'yes', 10800, 0, 1, 10800, ''),
(236, '2017-01-21 12:18:36', 181, 'KSU.00072', 'Tepung beras 200gr', '-', 'yes', 3000, 0, 1, 3000, ''),
(237, '2017-01-21 12:18:44', 186, 'KSU.00072', 'Bendera putih Sst', '-', 'yes', 7500, 0, 1, 7500, ''),
(238, '2017-01-21 12:18:59', 507, 'KSU.00072', 'Kecap lele 340', '-', 'yes', 10500, 0, 1, 10500, ''),
(239, '2017-01-21 12:19:10', 368, 'KSU.00072', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 2, 13500, ''),
(240, '2017-01-21 12:19:26', 350, 'KSU.00072', 'Frestea beleng', '-', 'yes', 2000, 0, 1, 2000, ''),
(241, '2017-01-21 12:28:16', 521, 'KSU.00073', 'Beras Rejo Mulya @5kg', '-', 'yes', 50000, 0, 2, 100000, ''),
(242, '2017-01-21 12:36:26', 505, 'KSU.00074', 'Floridina', '-', 'yes', 3000, 0, 1, 3000, ''),
(243, '2017-01-21 12:36:41', 214, 'KSU.00074', 'Aquaria 600', '-', 'yes', 2000, 0, 1, 2000, ''),
(244, '2017-01-21 12:37:24', 155, 'KSU.00075', 'Beras Premium @2kg', '-', 'yes', 15800, 0, 4, 63200, ''),
(245, '2017-01-21 13:38:41', 326, 'KSU.00076', 'Tessa rolingstone  150', '-', 'yes', 4500, 0, 1, 4500, ''),
(246, '2017-01-21 13:38:59', 377, 'KSU.00076', 'Tuton Filter', '-', 'yes', 8000, 0, 1, 8000, ''),
(247, '2017-01-21 13:39:22', 372, 'KSU.00076', 'Signatur', '-', 'yes', 13000, 0, 1, 13000, ''),
(248, '2017-01-21 13:39:35', 425, 'KSU.00076', 'Aqua 330ml', '-', 'yes', 2000, 0, 1, 2000, ''),
(249, '2017-01-23 08:54:25', 372, 'KSU.00077', 'Signatur', '-', 'yes', 13000, 0, 1, 13000, ''),
(250, '2017-01-23 08:57:30', 311, 'KSU.00078', 'TW 03', '-', 'yes', 100000, 0, 1, 100000, ''),
(251, '2017-01-23 09:04:19', 204, 'KSU.00079', 'Javana', '-', 'yes', 3000, 0, 1, 3000, ''),
(252, '2017-01-23 10:00:36', 260, 'KSU.00080', 'Ponds AM', '-', 'yes', 27000, 0, 1, 27000, ''),
(253, '2017-01-23 10:01:28', 2, 'KSU.00080', 'Indomie goreng', '-', 'yes', 2200, 0, 2, 4400, ''),
(254, '2017-01-23 10:03:23', 368, 'KSU.00081', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 1, 6750, ''),
(255, '2017-01-23 10:08:47', 155, 'KSU.00082', 'Beras Premium @2kg', '-', 'yes', 15800, 0, 2, 31600, ''),
(256, '2017-01-23 10:17:25', 439, 'KSU.00083', 'Beras Organik', '-', 'yes', 13500, 0, 25, 337500, ''),
(257, '2017-01-23 10:51:30', 221, 'KSU.00084', 'Nutrisari Sirsat', '-', 'yes', 9700, 0, 1, 9700, ''),
(258, '2017-01-23 10:52:54', 241, 'KSU.00085', 'Kopi Kapal Api 165 gr', '-', 'yes', 11000, 0, 1, 11000, ''),
(259, '2017-01-23 11:17:43', 353, 'KSU.00086', 'Yakult', '-', 'yes', 2000, 0, 1, 2000, ''),
(260, '2017-01-23 11:19:40', 225, 'KSU.00087', 'Good Day Mocacino', '-', 'yes', 10000, 0, 2, 20000, ''),
(261, '2017-01-23 11:56:19', 6, 'KSU.00088', 'Sedap goreng', '-', 'yes', 2200, 0, 10, 22000, ''),
(262, '2017-01-23 11:56:44', 8, 'KSU.00088', 'SEdap Kari spesial', '-', 'yes', 2000, 0, 5, 10000, ''),
(263, '2017-01-23 11:56:50', 434, 'KSU.00088', 'Dove coklat', '-', 'yes', 3000, 0, 1, 3000, ''),
(264, '2017-01-23 11:57:42', 14, 'KSU.00088', 'Sukses Goreng', '-', 'yes', 3000, 0, 5, 15000, ''),
(265, '2017-01-23 11:58:04', 202, 'KSU.00088', 'Sprite 425', '-', 'yes', 4000, 0, 1, 4000, ''),
(266, '2017-01-23 11:58:12', 150, 'KSU.00088', 'Sampo Zinc Sst Hijau', '-', 'yes', 2900, 0, 1, 2900, ''),
(267, '2017-01-23 11:58:19', 398, 'KSU.00088', 'Slimming tea', '-', 'yes', 25000, 0, 1, 25000, ''),
(268, '2017-01-23 12:02:27', 505, 'KSU.00089', 'Floridina', '-', 'yes', 3000, 0, 1, 3000, ''),
(269, '2017-01-23 12:39:02', 213, 'KSU.00090', 'Aqua 600', '-', 'yes', 2500, 0, 1, 2500, ''),
(270, '2017-01-23 12:50:52', 380, 'KSU.00091', 'Bodrek', '-', 'yes', 500, 0, 2, 1000, ''),
(271, '2017-01-23 12:56:39', 367, 'KSU.00092', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 25, 325000, ''),
(272, '2017-01-23 13:06:20', 436, 'KSU.00093', 'Sampoerna Mild 12', '-', 'yes', 13500, 0, 1, 13500, ''),
(274, '2017-01-23 14:12:15', 225, 'KSU.00094', 'Good Day Mocacino', '-', 'yes', 10000, 0, 1, 10000, ''),
(275, '2017-01-23 14:12:22', 357, 'KSU.00094', 'Djarum 16', '-', 'yes', 20000, 0, 1, 20000, ''),
(276, '2017-01-23 14:12:43', 367, 'KSU.00094', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 1, 13000, ''),
(277, '2017-01-23 14:12:53', 393, 'KSU.00094', 'Xonce', '-', 'yes', 2000, 0, 1, 2000, ''),
(278, '2017-01-23 15:01:18', 464, 'KSU.00095', 'Dunhil Hitam', '-', 'yes', 15500, 0, 1, 15500, ''),
(279, '2017-01-23 15:10:00', 213, 'KSU.00096', 'Aqua 600', '-', 'yes', 2500, 0, 1, 2500, ''),
(280, '2017-01-23 15:26:38', 241, 'KSU.00097', 'Kopi Kapal Api 165 gr', '-', 'yes', 11000, 0, 1, 11000, ''),
(281, '2017-01-23 15:31:31', 357, 'KSU.00098', 'Djarum 16', '-', 'yes', 20000, 0, 1, 20000, ''),
(282, '2017-01-23 15:31:40', 457, 'KSU.00098', 'Dji Samsoe', '-', 'yes', 14500, 0, 1, 14500, ''),
(283, '2017-01-23 15:36:32', 356, 'KSU.00101', 'Djarum 12', '-', 'yes', 15500, 0, 1, 15500, ''),
(284, '2017-01-24 09:06:17', 213, 'KSU.00099', 'Aqua 600', '-', 'yes', 2500, 0, 1, 2500, ''),
(285, '2017-01-24 09:07:14', 357, 'KSU.00100', 'Djarum 16', '-', 'yes', 20000, 0, 2, 40000, ''),
(286, '2017-01-24 09:07:33', 365, 'KSU.00100', 'Surya 16', '-', 'yes', 19000, 0, 2, 38000, ''),
(287, '2017-01-24 09:07:47', 319, 'KSU.00100', 'Multi 250', '-', 'yes', 11000, 0, 1, 11000, ''),
(288, '2017-01-24 09:07:53', 300, 'KSU.00100', 'Laurier maxi 8', '-', 'yes', 3500, 0, 1, 3500, ''),
(289, '2017-01-24 09:08:26', 353, 'KSU.00100', 'Yakult', '-', 'yes', 2000, 0, 5, 10000, ''),
(290, '2017-01-24 09:08:43', 509, 'KSU.00100', 'motto 1/4', '-', 'yes', 8000, 0, 2, 16000, ''),
(291, '2017-01-24 09:09:09', 510, 'KSU.00100', 'Masako sapi', '-', 'yes', 5000, 0, 2, 10000, ''),
(293, '2017-01-24 09:09:46', 429, 'KSU.00100', 'Mia atom bulan', '-', 'yes', 4500, 0, 4, 18000, ''),
(294, '2017-01-24 09:10:03', 500, 'KSU.00100', 'Fortune 2lt', '-', 'yes', 24000, 0, 1, 24000, ''),
(295, '2017-01-24 09:10:24', 55, 'KSU.00100', 'Pepsodent 120', '-', 'yes', 6500, 0, 1, 6500, ''),
(296, '2017-01-24 09:10:29', 41, 'KSU.00100', 'Rapika Refil Pink 450', '-', 'yes', 5000, 0, 1, 5000, ''),
(297, '2017-01-24 09:10:56', 508, 'KSU.00100', 'kecap lele sst', '-', 'yes', 18500, 0, 2, 37000, ''),
(298, '2017-01-24 09:11:16', 465, 'KSU.00100', 'Dandang Biru', '-', 'yes', 3000, 0, 5, 15000, ''),
(299, '2017-01-24 09:11:49', 179, 'KSU.00100', 'Pita merah', '-', 'yes', 7000, 0, 4, 28000, ''),
(300, '2017-01-24 09:13:31', 186, 'KSU.00100', 'Bendera putih Sst', '-', 'yes', 7500, 0, 2, 15000, ''),
(301, '2017-01-24 09:13:43', 187, 'KSU.00100', 'Bendera Coklat sst', '-', 'yes', 7500, 0, 2, 15000, ''),
(302, '2017-01-24 09:13:51', 504, 'KSU.00100', 'Coffemic', '-', 'yes', 11000, 0, 1, 11000, ''),
(303, '2017-01-24 09:14:18', 221, 'KSU.00102', 'Nutrisari Sirsat', '-', 'yes', 9700, 0, 1, 9700, ''),
(304, '2017-01-24 09:14:28', 220, 'KSU.00102', 'Nutrisari Florida', '-', 'yes', 9700, 0, 1, 9700, ''),
(305, '2017-01-24 09:14:34', 236, 'KSU.00102', 'Kopi Luwakl 165', '-', 'yes', 9500, 0, 1, 9500, ''),
(306, '2017-01-24 09:14:43', 130, 'KSU.00102', 'Sabun Dettol Sensitive 105gr', '-', 'yes', 5000, 0, 2, 10000, ''),
(307, '2017-01-24 09:14:52', 161, 'KSU.00102', 'Sabun So klin softergen pink 800gr', '-', 'yes', 15000, 0, 1, 15000, ''),
(308, '2017-01-24 09:14:58', 225, 'KSU.00102', 'Good Day Mocacino', '-', 'yes', 10000, 0, 1, 10000, ''),
(309, '2017-01-24 09:15:07', 230, 'KSU.00102', 'Milo 18 gr', '-', 'yes', 14000, 0, 1, 14000, ''),
(310, '2017-01-24 09:15:13', 504, 'KSU.00102', 'Coffemic', '-', 'yes', 11000, 0, 1, 11000, ''),
(311, '2017-01-24 09:15:19', 231, 'KSU.00102', 'Jahe Wangi', '-', 'yes', 8500, 0, 1, 8500, ''),
(312, '2017-01-24 09:15:30', 513, 'KSU.00102', 'Mama Lemon kuning 800', '-', 'yes', 12500, 0, 2, 25000, ''),
(313, '2017-01-24 09:17:16', 366, 'KSU.00102', 'Gula jawa 1/2', '-', 'yes', 6500, 0, 1, 6500, ''),
(314, '2017-01-24 09:17:31', 367, 'KSU.00102', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 10, 130000, ''),
(315, '2017-01-24 09:17:41', 521, 'KSU.00102', 'Beras Rejo Mulya @5kg', '-', 'yes', 50000, 0, 3, 150000, ''),
(316, '2017-01-24 09:25:20', 213, 'KSU.00103', 'Aqua 600', '-', 'yes', 2500, 0, 1, 2500, ''),
(317, '2017-01-24 09:36:00', 365, 'KSU.00104', 'Surya 16', '-', 'yes', 19000, 0, 1, 19000, ''),
(318, '2017-01-24 09:37:22', 214, 'KSU.00105', 'Aquaria 600', '-', 'yes', 2000, 0, 1, 2000, ''),
(319, '2017-01-24 09:38:54', 4, 'KSU.00106', 'Indomie Spesial', '-', 'yes', 2000, 0, 2, 4000, ''),
(320, '2017-01-24 09:38:58', 271, 'KSU.00106', 'Ponds FF Pure White', '-', 'yes', 16500, 0, 1, 16500, ''),
(321, '2017-01-24 09:39:19', 62, 'KSU.00106', 'Close Up 65', '-', 'yes', 6500, 0, 1, 6500, ''),
(322, '2017-01-24 09:39:36', 195, 'KSU.00106', 'Sikat Formula', '-', 'yes', 3000, 0, 1, 3000, ''),
(323, '2017-01-24 10:06:44', 362, 'KSU.00107', 'Malboro Merah', '-', 'yes', 22000, 0, 1, 22000, ''),
(324, '2017-01-24 10:07:32', 37, 'KSU.00108', 'Garam Halus', '-', 'yes', 1700, 0, 2, 3400, ''),
(325, '2017-01-24 10:07:53', 137, 'KSU.00108', 'Poriklin 1000ml', '-', 'yes', 15000, 0, 1, 15000, ''),
(326, '2017-01-24 10:08:09', 2, 'KSU.00108', 'Indomie goreng', '-', 'yes', 2200, 0, 4, 8800, ''),
(327, '2017-01-24 10:08:19', 4, 'KSU.00108', 'Indomie Spesial', '-', 'yes', 2000, 0, 2, 4000, ''),
(328, '2017-01-24 10:10:34', 170, 'KSU.00109', 'tropical 1lt', '-', 'yes', 13500, 0, 1, 13500, ''),
(329, '2017-01-24 10:10:54', 63, 'KSU.00109', 'Ciptadent  hijau 190', '-', 'yes', 7000, 0, 2, 14000, ''),
(330, '2017-01-24 10:11:06', 122, 'KSU.00109', 'Sabun Nuvo Merah', '-', 'yes', 2000, 0, 2, 4000, ''),
(331, '2017-01-24 10:11:24', 119, 'KSU.00109', 'Sabun Nuvo Cool', '-', 'yes', 2000, 0, 2, 4000, ''),
(332, '2017-01-24 10:11:38', 118, 'KSU.00109', 'Sabun Nuvo Hijau', '-', 'yes', 2000, 0, 2, 4000, ''),
(333, '2017-01-24 10:11:54', 184, 'KSU.00109', 'Susu Kaleng Kental manis', '-', 'yes', 9500, 0, 2, 19000, ''),
(335, '2017-01-24 10:12:24', 2, 'KSU.00109', 'Indomie goreng', '-', 'yes', 2200, 0, 3, 6600, ''),
(336, '2017-01-24 10:12:49', 368, 'KSU.00109', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 4, 27000, ''),
(337, '2017-01-24 10:13:02', 3, 'KSU.00109', 'Indomie soto', '-', 'yes', 2000, 0, 3, 6000, ''),
(338, '2017-01-24 10:13:17', 35, 'KSU.00109', 'Masako Ayam', '-', 'yes', 5000, 0, 1, 5000, ''),
(339, '2017-01-24 10:13:59', 521, 'KSU.00109', 'Beras Rejo Mulya @5kg', '-', 'yes', 50000, 0, 2, 100000, ''),
(340, '2017-01-24 10:15:17', 333, 'KSU.00110', 'Tessa Saku', '-', 'yes', 1500, 0, 2, 3000, ''),
(341, '2017-01-24 10:18:01', 345, 'KSU.00111', 'Charm 8', '-', 'yes', 4500, 0, 1, 4500, ''),
(342, '2017-01-24 10:18:12', 323, 'KSU.00111', 'Multi Biru Refil', '-', 'yes', 6500, 0, 2, 13000, ''),
(343, '2017-01-24 10:18:22', 236, 'KSU.00111', 'Kopi Luwakl 165', '-', 'yes', 9500, 0, 1, 9500, ''),
(344, '2017-01-24 10:28:25', 156, 'KSU.00112', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 5, 197500, ''),
(345, '2017-01-24 10:33:58', 521, 'KSU.00113', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 1, 51000, ''),
(346, '2017-01-24 10:34:14', 155, 'KSU.00113', 'Beras Premium @2kg', '-', 'yes', 15800, 0, 2, 31600, ''),
(347, '2017-01-24 10:40:48', 193, 'KSU.00114', 'Susu zee Putih sst', '-', 'yes', 3000, 0, 5, 15000, ''),
(348, '2017-01-24 10:43:50', 521, 'KSU.00115', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 1, 51000, ''),
(349, '2017-01-24 10:43:59', 391, 'KSU.00115', 'Neosep', '-', 'yes', 2500, 0, 1, 2500, ''),
(350, '2017-01-24 10:44:02', 381, 'KSU.00115', 'Paramex', '-', 'yes', 2500, 0, 1, 2500, ''),
(351, '2017-01-24 11:07:29', 183, 'KSU.00116', 'Ekomie', '-', 'yes', 8500, 0, 1, 8500, ''),
(352, '2017-01-24 11:07:40', 121, 'KSU.00116', 'Sabun Nuvo Caring', '-', 'yes', 2000, 0, 3, 6000, ''),
(353, '2017-01-24 11:07:45', 348, 'KSU.00116', 'Dangdut Putih', '-', 'yes', 1000, 0, 1, 1000, ''),
(354, '2017-01-24 11:07:49', 180, 'KSU.00116', 'Tepung Ketan', '-', 'yes', 7500, 0, 1, 7500, ''),
(355, '2017-01-24 11:07:56', 179, 'KSU.00116', 'Pita merah', '-', 'yes', 7000, 0, 1, 7000, ''),
(356, '2017-01-24 11:25:50', 521, 'KSU.00117', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 3, 153000, ''),
(357, '2017-01-24 11:27:53', 203, 'KSU.00118', 'Fanta 425', '-', 'yes', 4000, 0, 1, 4000, ''),
(358, '2017-01-24 13:09:41', 212, 'KSU.00119', 'Frestea Melati 500', '-', 'yes', 5500, 0, 1, 5500, ''),
(359, '2017-01-24 13:34:03', 521, 'KSU.00120', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 1, 51000, ''),
(360, '2017-01-24 14:19:23', 436, 'KSU.00121', 'Sampoerna Mild 12', '-', 'yes', 13500, 0, 1, 13500, ''),
(361, '2017-01-24 14:46:18', 33, 'KSU.00122', 'Gudang Garam Filter', '-', 'yes', 15000, 0, 1, 15000, ''),
(362, '2017-01-24 14:47:30', 357, 'KSU.00123', 'Djarum 16', '-', 'yes', 20000, 0, 1, 20000, ''),
(363, '2017-01-24 14:47:50', 367, 'KSU.00123', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 1, 13000, ''),
(364, '2017-01-24 14:48:00', 366, 'KSU.00123', 'Gula jawa 1/2', '-', 'yes', 6500, 0, 1, 6500, ''),
(365, '2017-01-24 14:48:12', 155, 'KSU.00123', 'Beras Premium @2kg', '-', 'yes', 15800, 0, 1, 15800, ''),
(366, '2017-01-24 15:00:33', 156, 'KSU.00124', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 1, 39500, ''),
(367, '2017-01-24 15:34:55', 521, 'KSU.00125', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 1, 51000, ''),
(368, '2017-01-24 15:35:07', 155, 'KSU.00125', 'Beras Premium @2kg', '-', 'yes', 15800, 0, 2, 31600, ''),
(369, '2017-01-24 15:36:04', 361, 'KSU.00125', '76 kretek', '-', 'yes', 11800, 0, 5, 59000, ''),
(370, '2017-01-25 09:23:02', 33, 'KSU.00126', 'Gudang Garam Filter', '-', 'yes', 15000, 0, 1, 15000, ''),
(371, '2017-01-25 09:29:09', 439, 'KSU.00127', 'Beras Organik', '-', 'yes', 13500, 0, 10, 135000, ''),
(372, '2017-01-25 09:29:28', 368, 'KSU.00127', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 4, 27000, ''),
(373, '2017-01-25 09:30:00', 181, 'KSU.00127', 'Tepung beras 200gr', '-', 'yes', 3000, 0, 2, 6000, ''),
(374, '2017-01-25 09:30:32', 182, 'KSU.00127', 'tepung beras 500g', '-', 'yes', 6000, 0, 1, 6000, ''),
(375, '2017-01-25 09:31:00', 366, 'KSU.00127', 'Gula jawa 1/2', '-', 'yes', 6500, 0, 3, 19500, ''),
(376, '2017-01-25 09:31:40', 170, 'KSU.00127', 'tropical 1lt', '-', 'yes', 13500, 0, 3, 40500, ''),
(377, '2017-01-25 09:54:45', 179, 'KSU.00128', 'Pita merah', '-', 'yes', 7000, 0, 1, 7000, ''),
(378, '2017-01-25 09:54:54', 349, 'KSU.00128', 'Rinso sst Molto', '-', 'yes', 5500, 0, 1, 5500, ''),
(379, '2017-01-25 09:56:32', 346, 'KSU.00128', 'Wing Biru', '-', 'yes', 2000, 0, 5, 10000, ''),
(380, '2017-01-25 09:56:54', 174, 'KSU.00128', 'Bimoli 1lt', '-', 'yes', 13000, 0, 1, 13000, ''),
(381, '2017-01-25 09:57:50', 505, 'KSU.00129', 'Floridina', '-', 'yes', 3000, 0, 1, 3000, ''),
(382, '2017-01-25 09:59:30', 162, 'KSU.00130', 'Sabun Boom', '-', 'yes', 5000, 0, 2, 10000, ''),
(383, '2017-01-25 11:07:01', 202, 'KSU.00131', 'Sprite 425', '-', 'yes', 4000, 0, 1, 4000, ''),
(384, '2017-01-25 11:08:24', 173, 'KSU.00132', 'sania 1lt', '-', 'yes', 13500, 0, 1, 13500, ''),
(385, '2017-01-25 11:08:48', 175, 'KSU.00132', 'Sanco 2lt', '-', 'yes', 27000, 0, 1, 27000, ''),
(387, '2017-01-25 11:31:00', 367, 'KSU.00133', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 1, 13000, ''),
(388, '2017-01-25 11:31:09', 368, 'KSU.00133', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 1, 6750, ''),
(389, '2017-01-25 12:07:20', 425, 'KSU.00134', 'Aqua 330ml', '-', 'yes', 2000, 0, 1, 2000, ''),
(390, '2017-01-25 12:10:23', 215, 'KSU.00134', 'Ades 600', '-', 'yes', 3000, 0, 1, 3000, ''),
(391, '2017-01-25 12:26:29', 192, 'KSU.00135', 'Susu zee Coklat sst', '-', 'yes', 3000, 0, 1, 3000, ''),
(392, '2017-01-25 12:26:42', 353, 'KSU.00135', 'Yakult', '-', 'yes', 2000, 0, 4, 8000, ''),
(393, '2017-01-25 13:08:04', 206, 'KSU.00136', 'Iso Plus', '-', 'yes', 3000, 0, 1, 3000, ''),
(395, '2017-01-25 13:23:38', 337, 'KSU.00137', 'Hers Protex Wing 5', '-', 'yes', 3000, 0, 1, 3000, ''),
(396, '2017-01-25 13:27:30', 367, 'KSU.00138', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 1, 13000, ''),
(397, '2017-01-25 13:27:41', 351, 'KSU.00138', 'Teh botol sosro', '-', 'yes', 3000, 0, 1, 3000, ''),
(398, '2017-01-25 13:27:52', 187, 'KSU.00138', 'Bendera Coklat sst', '-', 'yes', 7500, 0, 1, 7500, ''),
(399, '2017-01-25 13:28:00', 227, 'KSU.00138', 'White Coffe', '-', 'yes', 9500, 0, 1, 9500, ''),
(400, '2017-01-25 13:28:14', 495, 'KSU.00138', 'Soklin Smart White 800', '-', 'yes', 18000, 0, 1, 18000, ''),
(401, '2017-01-26 09:01:06', 113, 'KSU.00139', 'Sabun Lux biru', '-', 'yes', 3500, 0, 1, 3500, ''),
(402, '2017-01-26 09:01:22', 213, 'KSU.00139', 'Aqua 600', '-', 'yes', 2500, 0, 2, 5000, ''),
(403, '2017-01-26 09:04:28', 507, 'KSU.00140', 'Kecap lele 340', '-', 'yes', 10500, 0, 1, 10500, ''),
(404, '2017-01-26 09:04:35', 108, 'KSU.00140', 'Rinso Cair  Molto  42', '-', 'yes', 5800, 0, 1, 5800, ''),
(405, '2017-01-26 09:04:42', 230, 'KSU.00140', 'Milo 18 gr', '-', 'yes', 14000, 0, 1, 14000, ''),
(406, '2017-01-26 09:04:53', 231, 'KSU.00140', 'Jahe Wangi', '-', 'yes', 8500, 0, 1, 8500, ''),
(407, '2017-01-26 09:10:34', 367, 'KSU.00141', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 2, 26000, ''),
(408, '2017-01-26 09:17:44', 213, 'KSU.00142', 'Aqua 600', '-', 'yes', 2500, 0, 1, 2500, ''),
(409, '2017-01-26 09:20:42', 213, 'KSU.00143', 'Aqua 600', '-', 'yes', 2500, 0, 1, 2500, ''),
(410, '2017-01-26 09:21:46', 204, 'KSU.00143', 'Javana', '-', 'yes', 3000, 0, 1, 3000, ''),
(411, '2017-01-26 09:22:17', 170, 'KSU.00144', 'tropical 1lt', '-', 'yes', 13500, 0, 1, 13500, ''),
(412, '2017-01-26 09:33:40', 506, 'KSU.00145', 'Tessa gulung putih', '-', 'yes', 3500, 0, 1, 3500, ''),
(413, '2017-01-26 09:33:45', 344, 'KSU.00145', 'Sunlight Cream', '-', 'yes', 6500, 0, 1, 6500, ''),
(414, '2017-01-26 09:37:19', 377, 'KSU.00146', 'Tuton Filter', '-', 'yes', 8000, 0, 1, 8000, ''),
(415, '2017-01-26 10:02:01', 464, 'KSU.00147', 'Dunhil Hitam', '-', 'yes', 15500, 0, 1, 15500, ''),
(416, '2017-01-26 10:11:57', 521, 'KSU.00148', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 1, 51000, ''),
(417, '2017-01-26 10:12:07', 156, 'KSU.00148', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 4, 158000, ''),
(418, '2017-01-26 10:14:30', 180, 'KSU.00149', 'Tepung Ketan', '-', 'yes', 7500, 0, 2, 15000, ''),
(419, '2017-01-26 10:14:41', 368, 'KSU.00149', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 2, 13500, ''),
(420, '2017-01-26 10:14:50', 250, 'KSU.00149', 'Dandang kepyur', '-', 'yes', 2500, 0, 2, 5000, ''),
(421, '2017-01-26 10:46:58', 247, 'KSU.00150', 'Gopek clp', '-', 'yes', 6500, 0, 1, 6500, ''),
(422, '2017-01-26 10:47:10', 241, 'KSU.00150', 'Kopi Kapal Api 165 gr', '-', 'yes', 11000, 0, 1, 11000, ''),
(423, '2017-01-26 10:47:23', 188, 'KSU.00150', 'Gula ku Heloo kitty', '-', 'yes', 12000, 0, 1, 12000, ''),
(424, '2017-01-26 10:47:31', 320, 'KSU.00150', 'Multi 260', '-', 'yes', 12000, 0, 1, 12000, ''),
(425, '2017-01-26 10:47:48', 181, 'KSU.00150', 'Tepung beras 200gr', '-', 'yes', 3000, 0, 2, 6000, ''),
(426, '2017-01-26 10:48:10', 368, 'KSU.00150', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 1, 6750, ''),
(427, '2017-01-26 10:48:16', 329, 'KSU.00150', 'Multi Travel 70', '-', 'yes', 4500, 0, 1, 4500, ''),
(428, '2017-01-26 10:48:22', 484, 'KSU.00150', 'Sunlig Jeruk Nipis 800', '-', 'yes', 14500, 0, 1, 14500, ''),
(429, '2017-01-26 10:48:30', 41, 'KSU.00150', 'Rapika Refil Pink 450', '-', 'yes', 5000, 0, 1, 5000, ''),
(430, '2017-01-26 10:48:37', 140, 'KSU.00150', 'Wipol 800ml', '-', 'yes', 13500, 0, 1, 13500, ''),
(431, '2017-01-26 10:48:44', 348, 'KSU.00150', 'Dangdut Putih', '-', 'yes', 1000, 0, 1, 1000, ''),
(432, '2017-01-26 10:48:54', 426, 'KSU.00150', 'Royco ayam', '-', 'yes', 5000, 0, 1, 5000, ''),
(433, '2017-01-26 10:49:06', 473, 'KSU.00150', 'Blue Band 200 gr', '-', 'yes', 7000, 0, 1, 7000, ''),
(435, '2017-01-26 10:50:43', 31, 'KSU.00150', 'Kecap Lele 680ml', '-', 'yes', 19500, 0, 1, 19500, ''),
(436, '2017-01-26 10:51:15', 27, 'KSU.00151', 'Kecap Sukasari Manis', '-', 'yes', 5700, 0, 1, 5700, ''),
(438, '2017-01-26 10:51:48', 368, 'KSU.00151', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 1, 6750, ''),
(439, '2017-01-26 11:05:36', 155, 'KSU.00152', 'Beras Premium @2kg', '-', 'yes', 15800, 0, 2, 31600, ''),
(440, '2017-01-26 11:05:45', 156, 'KSU.00152', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 1, 39500, ''),
(441, '2017-01-26 11:07:55', 215, 'KSU.00153', 'Ades 600', '-', 'yes', 3000, 0, 1, 3000, ''),
(442, '2017-01-26 11:08:04', 511, 'KSU.00153', 'Antangin ', '-', 'yes', 2000, 0, 1, 2000, ''),
(443, '2017-01-26 11:12:11', 156, 'KSU.00149', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 2, 79000, ''),
(444, '2017-01-26 11:14:36', 425, 'KSU.00154', 'Aqua 330ml', '-', 'yes', 2000, 0, 1, 2000, ''),
(445, '2017-01-26 11:21:09', 377, 'KSU.00156', 'Tuton Filter', '-', 'yes', 8000, 0, 1, 8000, ''),
(446, '2017-01-26 11:23:12', 521, 'KSU.00155', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 2, 102000, ''),
(447, '2017-01-26 11:23:28', 6, 'KSU.00155', 'Sedap goreng', '-', 'yes', 2200, 0, 40, 88000, ''),
(448, '2017-01-26 11:23:55', 169, 'KSU.00155', 'Tropical 2lt', '-', 'yes', 24000, 0, 1, 24000, ''),
(449, '2017-01-26 11:24:24', 26, 'KSU.00155', 'ABC Kecap Pedes', '-', 'yes', 7000, 0, 1, 7000, ''),
(450, '2017-01-26 11:49:22', 237, 'KSU.00157', 'Top Kopi Murni 165 gr', '-', 'yes', 9500, 0, 1, 9500, ''),
(451, '2017-01-26 11:58:36', 206, 'KSU.00158', 'Iso Plus', '-', 'yes', 3000, 0, 1, 3000, ''),
(452, '2017-01-26 11:58:50', 55, 'KSU.00158', 'Pepsodent 120', '-', 'yes', 6500, 0, 1, 6500, ''),
(453, '2017-01-26 11:59:06', 4, 'KSU.00158', 'Indomie Spesial', '-', 'yes', 2000, 0, 4, 8000, ''),
(454, '2017-01-26 11:59:19', 507, 'KSU.00158', 'Kecap lele 340', '-', 'yes', 10500, 0, 1, 10500, ''),
(455, '2017-01-26 12:00:49', 521, 'KSU.00159', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 1, 51000, ''),
(456, '2017-01-26 12:00:58', 366, 'KSU.00159', 'Gula jawa 1/2', '-', 'yes', 6500, 0, 1, 6500, ''),
(457, '2017-01-26 12:01:08', 227, 'KSU.00159', 'White Coffe', '-', 'yes', 9500, 0, 1, 9500, ''),
(458, '2017-01-26 12:01:21', 500, 'KSU.00159', 'Fortune 2lt', '-', 'yes', 24000, 0, 1, 24000, ''),
(459, '2017-01-26 12:06:21', 204, 'KSU.00160', 'Javana', '-', 'yes', 3000, 0, 1, 3000, ''),
(460, '2017-01-26 12:28:56', 521, 'KSU.00161', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 1, 51000, ''),
(461, '2017-01-26 12:29:09', 190, 'KSU.00161', 'Gulaku Hijau 1000 gr', '-', 'yes', 17000, 0, 3, 51000, ''),
(462, '2017-01-26 12:30:15', 5, 'KSU.00161', 'Indomie ayam bawang', '-', 'yes', 2000, 0, 40, 80000, ''),
(463, '2017-01-26 12:42:59', 382, 'KSU.00162', 'Komix OBH', '-', 'yes', 1000, 0, 3, 3000, ''),
(464, '2017-01-26 12:53:38', 466, 'KSU.00163', 'Bendera Gold sst', '-', 'yes', 10500, 0, 1, 10500, ''),
(465, '2017-01-26 12:53:45', 122, 'KSU.00163', 'Sabun Nuvo Merah', '-', 'yes', 2000, 0, 1, 2000, ''),
(466, '2017-01-26 12:56:05', 507, 'KSU.00164', 'Kecap lele 340', '-', 'yes', 10500, 0, 1, 10500, ''),
(467, '2017-01-26 13:14:26', 234, 'KSU.00165', 'Energen Coklat', '-', 'yes', 11500, 0, 1, 11500, ''),
(468, '2017-01-26 13:14:39', 521, 'KSU.00165', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 2, 102000, ''),
(469, '2017-01-26 13:14:47', 248, 'KSU.00165', 'Gopek Super', '-', 'yes', 4600, 0, 1, 4600, ''),
(470, '2017-01-26 13:14:54', 485, 'KSU.00165', 'Bendera Gold', '-', 'yes', 13800, 0, 1, 13800, ''),
(471, '2017-01-26 13:15:03', 134, 'KSU.00165', 'So klin lantai biru 800ml', '-', 'yes', 9000, 0, 1, 9000, ''),
(472, '2017-01-26 13:15:12', 43, 'KSU.00165', 'Kingkong', '-', 'yes', 4000, 0, 1, 4000, ''),
(473, '2017-01-26 13:15:21', 112, 'KSU.00165', 'Sabun Giv Ungu', '-', 'yes', 2000, 0, 1, 2000, ''),
(474, '2017-01-26 13:15:25', 109, 'KSU.00165', 'Sabun Giv Merah', '-', 'yes', 2000, 0, 1, 2000, ''),
(475, '2017-01-26 13:15:32', 63, 'KSU.00165', 'Ciptadent  hijau 190', '-', 'yes', 7000, 0, 1, 7000, ''),
(476, '2017-01-26 13:16:16', 13, 'KSU.00165', 'Sedap White Curry', '-', 'yes', 2000, 0, 5, 10000, ''),
(477, '2017-01-26 13:16:29', 6, 'KSU.00165', 'Sedap goreng', '-', 'yes', 2200, 0, 5, 11000, ''),
(478, '2017-01-26 13:16:38', 500, 'KSU.00165', 'Fortune 2lt', '-', 'yes', 24000, 0, 1, 24000, ''),
(479, '2017-01-26 13:19:13', 357, 'KSU.00166', 'Djarum 16', '-', 'yes', 20000, 0, 1, 20000, ''),
(480, '2017-01-26 13:19:38', 206, 'KSU.00167', 'Iso Plus', '-', 'yes', 3000, 0, 1, 3000, ''),
(481, '2017-01-26 13:46:43', 222, 'KSU.00168', 'Good Day Carrebian', '-', 'yes', 10000, 0, 1, 10000, ''),
(482, '2017-01-26 13:46:51', 187, 'KSU.00168', 'Bendera Coklat sst', '-', 'yes', 7500, 0, 1, 7500, ''),
(483, '2017-01-26 13:47:03', 367, 'KSU.00168', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 1, 13000, ''),
(484, '2017-01-26 13:50:31', 179, 'KSU.00169', 'Pita merah', '-', 'yes', 7000, 0, 1, 7000, ''),
(485, '2017-01-26 14:28:21', 45, 'KSU.00170', 'Soffel pink sst', '-', 'yes', 5500, 0, 1, 5500, ''),
(486, '2017-01-27 08:58:20', 214, 'KSU.00171', 'Aquaria 600', '-', 'yes', 2000, 0, 1, 2000, ''),
(487, '2017-01-27 09:03:07', 33, 'KSU.00172', 'Gudang Garam Filter', '-', 'yes', 15000, 0, 1, 15000, ''),
(488, '2017-01-27 09:17:32', 356, 'KSU.00173', 'Djarum 12', '-', 'yes', 15500, 0, 1, 15500, ''),
(489, '2017-01-27 09:33:50', 537, 'KSU.00174', 'Beras Rejomulyo Sak', '-', 'yes', 255000, 0, 2, 510000, ''),
(490, '2017-01-27 09:34:00', 367, 'KSU.00174', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 24, 312000, ''),
(491, '2017-01-27 09:52:28', 202, 'KSU.00175', 'Sprite 425', '-', 'yes', 4000, 0, 1, 4000, ''),
(492, '2017-01-27 09:52:51', 214, 'KSU.00175', 'Aquaria 600', '-', 'yes', 2000, 0, 1, 2000, ''),
(493, '2017-01-27 10:15:45', 377, 'KSU.00176', 'Tuton Filter', '-', 'yes', 8000, 0, 1, 8000, ''),
(494, '2017-01-27 10:19:01', 213, 'KSU.00177', 'Aqua 600', '-', 'yes', 2500, 0, 1, 2500, ''),
(495, '2017-01-27 10:19:07', 211, 'KSU.00177', 'Frestea Madu 500', '-', 'yes', 5500, 0, 1, 5500, ''),
(496, '2017-01-27 10:28:55', 214, 'KSU.00178', 'Aquaria 600', '-', 'yes', 2000, 0, 1, 2000, ''),
(497, '2017-01-27 11:17:24', 350, 'KSU.00179', 'Frestea beleng', '-', 'yes', 2000, 0, 2, 4000, ''),
(498, '2017-01-27 11:23:28', 156, 'KSU.00180', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 2, 79000, ''),
(499, '2017-01-27 11:39:28', 357, 'KSU.00181', 'Djarum 16', '-', 'yes', 20000, 0, 1, 20000, ''),
(500, '2017-01-27 11:39:33', 362, 'KSU.00181', 'Malboro Merah', '-', 'yes', 22000, 0, 1, 22000, ''),
(501, '2017-01-27 11:52:43', 250, 'KSU.00182', 'Dandang kepyur', '-', 'yes', 2500, 0, 1, 2500, ''),
(502, '2017-01-27 11:52:56', 367, 'KSU.00182', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 2, 26000, ''),
(503, '2017-01-27 11:54:40', 250, 'KSU.00183', 'Dandang kepyur', '-', 'yes', 2500, 0, 1, 2500, ''),
(504, '2017-01-27 11:57:10', 37, 'KSU.00184', 'Garam Halus', '-', 'yes', 1700, 0, 1, 1700, ''),
(505, '2017-01-27 12:22:58', 213, 'KSU.00185', 'Aqua 600', '-', 'yes', 2500, 0, 1, 2500, ''),
(506, '2017-01-27 13:18:13', 356, 'KSU.00186', 'Djarum 12', '-', 'yes', 15500, 0, 1, 15500, ''),
(507, '2017-01-27 13:18:37', 229, 'KSU.00186', 'Top Kopi Susu', '-', 'yes', 10800, 0, 1, 10800, ''),
(509, '2017-01-27 13:23:32', 2, 'KSU.00187', 'Indomie goreng', '-', 'yes', 2200, 0, 8, 17600, ''),
(510, '2017-01-27 13:46:49', 155, 'KSU.00188', 'Beras Premium @2kg', '-', 'yes', 15800, 0, 3, 47400, ''),
(512, '2017-01-27 14:33:17', 362, 'KSU.00191', 'Malboro Merah', '-', 'yes', 22000, 0, 1, 22000, ''),
(513, '2017-01-27 14:39:08', 369, 'KSU.00192', 'Sampoerna Mild 16', '-', 'yes', 19000, 0, 1, 19000, ''),
(516, '2017-01-27 14:51:52', 521, 'KSU.00193', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 1, 51000, ''),
(517, '2017-01-27 14:52:01', 156, 'KSU.00193', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 2, 79000, ''),
(518, '2017-01-27 14:54:32', 215, 'KSU.00194', 'Ades 600', '-', 'yes', 3000, 0, 1, 3000, ''),
(519, '2017-01-27 14:54:43', 354, 'KSU.00194', 'Fruit tea', '-', 'yes', 3000, 0, 1, 3000, ''),
(520, '2017-01-30 09:03:05', 491, 'KSU.00195', 'Daia Softener Pink', '-', 'yes', 14000, 0, 2, 28000, ''),
(521, '2017-01-30 09:03:19', 493, 'KSU.00195', 'Daia Ungu 800', '-', 'yes', 14000, 0, 2, 28000, ''),
(522, '2017-01-30 09:03:26', 97, 'KSU.00195', 'Shinzui Ungu', '-', 'yes', 3500, 0, 1, 3500, ''),
(523, '2017-01-30 09:03:40', 124, 'KSU.00195', 'Sabun Lifboy merah', '-', 'yes', 3000, 0, 2, 6000, ''),
(524, '2017-01-30 09:03:51', 125, 'KSU.00195', 'Sabun Lifboy Hijau', '-', 'yes', 3000, 0, 2, 6000, ''),
(525, '2017-01-30 09:04:05', 496, 'KSU.00195', 'Ciptadent Cool Mint 75', '-', 'yes', 2800, 0, 2, 5600, ''),
(526, '2017-01-30 09:04:16', 497, 'KSU.00195', 'Ciptadent Fresh mint 75 gr', '-', 'yes', 2800, 0, 2, 5600, ''),
(527, '2017-01-30 09:05:03', 483, 'KSU.00195', 'sampo Dove Daily shine', '-', 'yes', 10000, 0, 4, 40000, ''),
(528, '2017-01-30 09:05:50', 500, 'KSU.00195', 'Fortune 2lt', '-', 'yes', 24000, 0, 2, 48000, ''),
(529, '2017-01-30 09:06:06', 186, 'KSU.00195', 'Bendera putih Sst', '-', 'yes', 7500, 0, 2, 15000, ''),
(530, '2017-01-30 09:06:11', 179, 'KSU.00195', 'Pita merah', '-', 'yes', 7000, 0, 1, 7000, ''),
(531, '2017-01-30 09:06:14', 502, 'KSU.00195', 'Top Kopi Gula', '-', 'yes', 10800, 0, 1, 10800, ''),
(533, '2017-01-30 09:06:57', 368, 'KSU.00195', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 6, 40500, ''),
(534, '2017-01-30 09:07:09', 219, 'KSU.00195', 'Nutrisari Jambu', '-', 'yes', 9700, 0, 1, 9700, ''),
(535, '2017-01-30 09:07:24', 23, 'KSU.00195', 'Sardine Extra Pedas K', '-', 'yes', 7500, 0, 1, 7500, ''),
(536, '2017-01-30 09:08:29', 3, 'KSU.00196', 'Indomie soto', '-', 'yes', 2000, 0, 2, 4000, ''),
(537, '2017-01-30 09:08:40', 11, 'KSU.00196', 'Sedap Bakso', '-', 'yes', 2000, 0, 1, 2000, ''),
(538, '2017-01-30 09:08:55', 2, 'KSU.00196', 'Indomie goreng', '-', 'yes', 2200, 0, 5, 11000, ''),
(539, '2017-01-30 09:09:07', 4, 'KSU.00196', 'Indomie Spesial', '-', 'yes', 2000, 0, 5, 10000, ''),
(540, '2017-01-30 09:09:16', 224, 'KSU.00196', 'Good Day Coolin', '-', 'yes', 10000, 0, 1, 10000, ''),
(541, '2017-01-30 09:09:28', 243, 'KSU.00196', 'Poci Vanila Clp', '-', 'yes', 4500, 0, 2, 9000, ''),
(542, '2017-01-30 09:09:42', 37, 'KSU.00196', 'Garam Halus', '-', 'yes', 1700, 0, 3, 5100, ''),
(543, '2017-01-30 09:10:14', 35, 'KSU.00196', 'Masako Ayam', '-', 'yes', 5000, 0, 3, 15000, ''),
(544, '2017-01-30 09:10:22', 27, 'KSU.00196', 'Kecap Sukasari Manis', '-', 'yes', 5700, 0, 1, 5700, ''),
(545, '2017-01-30 09:10:35', 507, 'KSU.00196', 'Kecap lele 340', '-', 'yes', 10500, 0, 1, 10500, ''),
(546, '2017-01-30 09:10:51', 214, 'KSU.00196', 'Aquaria 600', '-', 'yes', 2000, 0, 3, 6000, ''),
(547, '2017-01-30 09:10:58', 242, 'KSU.00196', 'Pulpy Orange', '-', 'yes', 6000, 0, 1, 6000, ''),
(548, '2017-01-30 09:11:27', 521, 'KSU.00196', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 7, 357000, ''),
(549, '2017-01-30 09:15:59', 502, 'KSU.00197', 'Top Kopi Gula', '-', 'yes', 10800, 0, 1, 10800, '');
INSERT INTO `tbl_orderlist_det` (`id`, `tgl`, `id_produk`, `no_nota`, `produk`, `keterangan`, `tambahan`, `harga`, `diskon`, `jml`, `subtotal`, `status`) VALUES
(550, '2017-01-30 09:42:25', 372, 'KSU.00198', 'Signatur', '-', 'yes', 13000, 0, 1, 13000, ''),
(552, '2017-01-30 09:49:39', 189, 'KSU.00201', 'Gulaku Hijau 500 gr', '-', 'yes', 8500, 0, 1, 8500, ''),
(553, '2017-01-30 09:49:51', 227, 'KSU.00201', 'White Coffe', '-', 'yes', 9500, 0, 1, 9500, ''),
(554, '2017-01-30 09:56:48', 511, 'KSU.00199', 'Antangin ', '-', 'yes', 2000, 0, 6, 12000, ''),
(555, '2017-01-30 09:58:35', 156, 'KSU.00200', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 2, 79000, ''),
(556, '2017-01-30 10:02:46', 156, 'KSU.00202', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 4, 158000, ''),
(557, '2017-01-30 10:15:25', 213, 'KSU.00203', 'Aqua 600', '-', 'yes', 2500, 0, 1, 2500, ''),
(558, '2017-01-30 10:28:37', 356, 'KSU.00204', 'Djarum 12', '-', 'yes', 15500, 0, 1, 15500, ''),
(559, '2017-01-30 10:52:36', 470, 'KSU.00205', 'Lasegar Strawberi', '-', 'yes', 5000, 0, 1, 5000, ''),
(560, '2017-01-30 11:32:29', 4, 'KSU.00206', 'Indomie Spesial', '-', 'yes', 2000, 0, 2, 4000, ''),
(561, '2017-01-30 11:32:38', 138, 'KSU.00206', 'WPC biru', '-', 'yes', 9500, 0, 1, 9500, ''),
(562, '2017-01-30 11:33:32', 93, 'KSU.00206', 'zwitsal natural', '-', 'yes', 3500, 0, 1, 3500, ''),
(563, '2017-01-30 11:36:57', 5, 'KSU.00207', 'Indomie ayam bawang', '-', 'yes', 2000, 0, 1, 2000, ''),
(564, '2017-01-30 12:03:01', 206, 'KSU.00208', 'Iso Plus', '-', 'yes', 3000, 0, 3, 9000, ''),
(565, '2017-01-30 12:08:47', 464, 'KSU.00210', 'Dunhil Hitam', '-', 'yes', 15500, 0, 1, 15500, ''),
(566, '2017-01-30 12:24:52', 156, 'KSU.00209', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 2, 79000, ''),
(567, '2017-01-30 12:29:29', 500, 'KSU.00211', 'Fortune 2lt', '-', 'yes', 24000, 0, 1, 24000, ''),
(568, '2017-01-30 12:29:49', 368, 'KSU.00211', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 1, 6750, ''),
(569, '2017-01-30 12:30:03', 210, 'KSU.00211', 'Frestea Apel 500', '-', 'yes', 5500, 0, 1, 5500, ''),
(570, '2017-01-30 12:31:50', 125, 'KSU.00212', 'Sabun Lifboy Hijau', '-', 'yes', 3000, 0, 2, 6000, ''),
(571, '2017-01-30 12:31:57', 146, 'KSU.00212', 'Sampo pantene Sst biru', '-', 'yes', 9500, 0, 1, 9500, ''),
(573, '2017-01-30 12:41:55', 521, 'KSU.00213', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 2, 102000, ''),
(574, '2017-01-30 12:42:21', 227, 'KSU.00213', 'White Coffe', '-', 'yes', 9500, 0, 2, 19000, ''),
(575, '2017-01-30 12:42:35', 504, 'KSU.00213', 'Coffemic', '-', 'yes', 11000, 0, 2, 22000, ''),
(576, '2017-01-30 12:42:41', 234, 'KSU.00213', 'Energen Coklat', '-', 'yes', 11500, 0, 1, 11500, ''),
(577, '2017-01-30 12:43:10', 340, 'KSU.00213', 'Daia biru', '-', 'yes', 5000, 0, 2, 10000, ''),
(579, '2017-01-30 12:44:05', 508, 'KSU.00213', 'kecap lele sst', '-', 'yes', 18500, 0, 2, 37000, ''),
(580, '2017-01-30 12:46:01', 156, 'KSU.00213', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 19, 750500, ''),
(581, '2017-01-30 12:46:19', 172, 'KSU.00213', 'fortune 1lt', '-', 'yes', 13000, 0, 1, 13000, ''),
(582, '2017-01-30 12:46:29', 173, 'KSU.00213', 'sania 1lt', '-', 'yes', 13500, 0, 1, 13500, ''),
(584, '2017-01-30 12:48:59', 348, 'KSU.00213', 'Dangdut Putih', '-', 'yes', 1000, 600, 12, 12000, ''),
(585, '2017-01-30 12:49:25', 170, 'KSU.00213', 'tropical 1lt', '-', 'yes', 13500, 0, 12, 162000, ''),
(586, '2017-01-30 12:52:26', 32, 'KSU.00213', 'Motto T ', '-', 'yes', 1700, 0, 12, 20400, ''),
(588, '2017-01-30 12:54:40', 214, 'KSU.00214', 'Aquaria 600', '-', 'yes', 2000, 0, 7, 14000, ''),
(591, '2017-01-30 12:59:28', 393, 'KSU.00216', 'Xonce', '-', 'yes', 2000, 0, 5, 10000, ''),
(592, '2017-01-30 13:14:43', 35, 'KSU.00217', 'Masako Ayam', '-', 'yes', 5000, 0, 2, 10000, ''),
(593, '2017-01-30 13:14:52', 238, 'KSU.00217', 'Top Kopi Toraja 165 gr', '-', 'yes', 9500, 0, 1, 9500, ''),
(594, '2017-01-30 13:15:09', 520, 'KSU.00217', 'Daia Softener Pink sst', '-', 'yes', 5200, 0, 1, 5200, ''),
(595, '2017-01-30 13:15:29', 341, 'KSU.00217', 'Daia Ungu', '-', 'yes', 5000, 0, 1, 5000, ''),
(596, '2017-01-30 13:15:38', 291, 'KSU.00217', 'Rexona Men', '-', 'yes', 16000, 0, 1, 16000, ''),
(597, '2017-01-30 13:16:04', 368, 'KSU.00217', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 6, 40500, ''),
(598, '2017-01-30 13:17:13', 532, 'KSU.00218', 'Tas Rangsel', '-', 'yes', 110000, 0, 1, 110000, ''),
(599, '2017-01-30 13:17:50', 156, 'KSU.00219', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 1, 39500, ''),
(600, '2017-01-30 13:24:47', 214, 'KSU.00220', 'Aquaria 600', '-', 'yes', 2000, 0, 1, 2000, ''),
(601, '2017-01-30 13:26:44', 521, 'KSU.00221', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 4, 204000, ''),
(602, '2017-01-30 13:26:52', 156, 'KSU.00221', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 1, 39500, ''),
(603, '2017-01-30 13:27:02', 155, 'KSU.00221', 'Beras Premium @2kg', '-', 'yes', 15800, 0, 1, 15800, ''),
(604, '2017-01-30 13:27:13', 190, 'KSU.00221', 'Gulaku Hijau 1000 gr', '-', 'yes', 17000, 0, 2, 34000, ''),
(605, '2017-01-30 13:27:19', 244, 'KSU.00221', 'Poci Asli Clp', '-', 'yes', 4500, 0, 1, 4500, ''),
(606, '2017-01-30 13:27:24', 230, 'KSU.00221', 'Milo 18 gr', '-', 'yes', 14000, 0, 1, 14000, ''),
(607, '2017-01-30 13:27:30', 228, 'KSU.00221', 'Top White', '-', 'yes', 10800, 0, 1, 10800, ''),
(608, '2017-01-30 13:27:39', 186, 'KSU.00221', 'Bendera putih Sst', '-', 'yes', 7500, 0, 2, 15000, ''),
(609, '2017-01-30 13:27:51', 368, 'KSU.00221', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 1, 6750, ''),
(610, '2017-01-30 13:28:02', 367, 'KSU.00221', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 1, 13000, ''),
(611, '2017-01-30 13:28:45', 155, 'KSU.00222', 'Beras Premium @2kg', '-', 'yes', 15800, 0, 2, 31600, ''),
(612, '2017-01-30 14:00:37', 372, 'KSU.00223', 'Signatur', '-', 'yes', 13000, 0, 1, 13000, ''),
(613, '2017-01-30 14:09:12', 487, 'KSU.00224', 'Frestea Markisa 350 ml', '-', 'yes', 4000, 0, 1, 4000, ''),
(614, '2017-01-30 14:09:29', 177, 'KSU.00224', 'Susu Gomars Vanila', '-', 'yes', 25000, 0, 1, 25000, ''),
(621, '2017-01-30 14:14:17', 187, 'KSU.00226', 'Bendera Coklat sst', '-', 'yes', 7500, 0, 2, 15000, ''),
(622, '2017-01-30 14:14:28', 227, 'KSU.00226', 'White Coffe', '-', 'yes', 9500, 0, 1, 9500, ''),
(623, '2017-01-30 14:14:55', 186, 'KSU.00226', 'Bendera putih Sst', '-', 'yes', 7500, 0, 1, 7500, ''),
(624, '2017-01-30 14:15:01', 357, 'KSU.00226', 'Djarum 16', '-', 'yes', 20000, 0, 1, 20000, ''),
(625, '2017-01-30 14:15:15', 367, 'KSU.00226', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 1, 13000, ''),
(626, '2017-01-30 14:27:09', 377, 'KSU.00227', 'Tuton Filter', '-', 'yes', 8000, 0, 1, 8000, ''),
(627, '2017-01-30 15:19:24', 416, 'KSU.00228', 'Aqua 1.5', '-', 'yes', 5000, 0, 2, 10000, ''),
(628, '2017-01-30 15:19:41', 210, 'KSU.00228', 'Frestea Apel 500', '-', 'yes', 5500, 0, 1, 5500, ''),
(629, '2017-01-30 15:26:29', 170, 'KSU.00229', 'tropical 1lt', '-', 'yes', 13500, 0, 2, 27000, ''),
(630, '2017-01-30 15:26:39', 238, 'KSU.00229', 'Top Kopi Toraja 165 gr', '-', 'yes', 9500, 0, 1, 9500, ''),
(631, '2017-01-30 15:27:00', 472, 'KSU.00229', 'Jazz1 SSt Lavender', '-', 'yes', 5200, 0, 1, 5200, ''),
(632, '2017-01-30 15:27:07', 482, 'KSU.00229', 'Downy Biru sst', '-', 'yes', 5500, 0, 1, 5500, ''),
(633, '2017-01-30 15:27:12', 101, 'KSU.00229', 'Downy Hitam sst', '-', 'yes', 5500, 0, 1, 5500, ''),
(634, '2017-01-30 15:27:37', 60, 'KSU.00229', 'Sytema nano', '-', 'yes', 5000, 0, 1, 5000, ''),
(635, '2017-01-30 15:27:42', 65, 'KSU.00229', 'Formula Junior Vitamin', '-', 'yes', 3500, 0, 1, 3500, ''),
(636, '2017-01-30 15:27:52', 265, 'KSU.00229', 'Emeron HBL Merah', '-', 'yes', 5500, 0, 1, 5500, ''),
(637, '2017-01-30 15:27:58', 267, 'KSU.00229', 'Resi V extra', '-', 'yes', 8500, 0, 1, 8500, ''),
(638, '2017-01-30 15:28:15', 250, 'KSU.00229', 'Dandang kepyur', '-', 'yes', 2500, 0, 2, 5000, ''),
(639, '2017-01-30 15:28:25', 507, 'KSU.00229', 'Kecap lele 340', '-', 'yes', 10500, 0, 1, 10500, ''),
(640, '2017-01-30 15:28:31', 475, 'KSU.00229', 'Sampo Zinc Sst Merah', '-', 'yes', 2900, 0, 1, 2900, ''),
(641, '2017-01-30 15:28:41', 36, 'KSU.00229', 'Magic Lezat', '-', 'yes', 3000, 0, 1, 3000, ''),
(642, '2017-01-30 15:29:07', 521, 'KSU.00229', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 2, 102000, ''),
(643, '2017-01-30 15:30:41', 521, 'KSU.00230', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 2, 102000, ''),
(644, '2017-01-30 15:31:08', 471, 'KSU.00230', 'Jazz1 SSt pink', '-', 'yes', 5200, 0, 1, 5200, ''),
(645, '2017-01-30 15:31:25', 158, 'KSU.00230', 'Sabun Rinso 900gr', '-', 'yes', 18000, 0, 2, 36000, ''),
(646, '2017-01-30 15:31:37', 55, 'KSU.00230', 'Pepsodent 120', '-', 'yes', 6500, 0, 3, 19500, ''),
(647, '2017-01-30 15:31:46', 500, 'KSU.00230', 'Fortune 2lt', '-', 'yes', 24000, 0, 1, 24000, ''),
(648, '2017-01-30 15:31:52', 258, 'KSU.00230', 'Parfum Putri Comeli', '-', 'yes', 15000, 0, 1, 15000, ''),
(649, '2017-01-30 15:32:09', 368, 'KSU.00230', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 2, 13500, ''),
(650, '2017-01-31 11:02:58', 33, 'KSU.00231', 'Gudang Garam Filter', '-', 'yes', 15000, 0, 1, 15000, ''),
(651, '2017-01-31 11:34:49', 170, 'KSU.00233', 'tropical 1lt', '-', 'yes', 13500, 0, 2, 27000, ''),
(652, '2017-01-31 11:35:04', 368, 'KSU.00233', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 6, 40500, ''),
(653, '2017-01-31 11:45:16', 521, 'KSU.00234', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 2, 102000, ''),
(654, '2017-01-31 11:45:28', 368, 'KSU.00234', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 2, 13500, ''),
(655, '2017-01-31 11:45:36', 318, 'KSU.00234', 'Multi 600 gr', '-', 'yes', 19000, 0, 1, 19000, ''),
(656, '2017-01-31 11:45:49', 56, 'KSU.00234', 'Pepsodent 75', '-', 'yes', 3750, 0, 1, 3750, ''),
(657, '2017-01-31 11:52:33', 521, 'KSU.00235', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 1, 51000, ''),
(658, '2017-01-31 11:55:58', 534, 'KSU.00236', 'Rokok MLD', '-', 'yes', 17600, 0, 3, 52800, ''),
(659, '2017-01-31 11:56:03', 356, 'KSU.00236', 'Djarum 12', '-', 'yes', 15500, 0, 1, 15500, ''),
(660, '2017-01-31 12:07:08', 350, 'KSU.00237', 'Frestea beleng', '-', 'yes', 2000, 0, 1, 2000, ''),
(661, '2017-01-31 12:09:47', 521, 'KSU.00238', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 3, 153000, ''),
(662, '2017-01-31 12:16:31', 215, 'KSU.00239', 'Ades 600', '-', 'yes', 3000, 0, 1, 3000, ''),
(663, '2017-01-31 12:20:14', 461, 'KSU.00240', 'Casablanca Kaleng Femme 100', '-', 'yes', 18000, 0, 1, 18000, ''),
(664, '2017-01-31 12:20:28', 332, 'KSU.00240', 'Kapas Selection', '-', 'yes', 4500, 0, 1, 4500, ''),
(665, '2017-01-31 12:20:36', 235, 'KSU.00240', 'Energen Vanila', '-', 'yes', 11500, 0, 1, 11500, ''),
(666, '2017-01-31 12:20:43', 216, 'KSU.00240', 'Nutrisari Mango', '-', 'yes', 9700, 0, 1, 9700, ''),
(667, '2017-01-31 12:20:54', 14, 'KSU.00240', 'Sukses Goreng', '-', 'yes', 3000, 0, 1, 3000, ''),
(668, '2017-01-31 12:20:58', 489, 'KSU.00240', 'Sukses AB', '-', 'yes', 2500, 0, 1, 2500, ''),
(669, '2017-01-31 12:21:03', 268, 'KSU.00240', 'Eskulin Sunday', '-', 'yes', 7000, 0, 1, 7000, ''),
(670, '2017-01-31 12:21:08', 153, 'KSU.00240', 'Sampo Lifboy sst biru', '-', 'yes', 5000, 0, 1, 5000, ''),
(671, '2017-01-31 12:21:20', 225, 'KSU.00240', 'Good Day Mocacino', '-', 'yes', 10000, 0, 1, 10000, ''),
(672, '2017-01-31 12:21:34', 505, 'KSU.00240', 'Floridina', '-', 'yes', 3000, 0, 2, 6000, ''),
(673, '2017-01-31 12:21:47', 206, 'KSU.00240', 'Iso Plus', '-', 'yes', 3000, 0, 2, 6000, ''),
(674, '2017-01-31 12:24:33', 425, 'KSU.00241', 'Aqua 330ml', '-', 'yes', 2000, 0, 1, 2000, ''),
(687, '2017-01-31 12:36:46', 368, 'KSU.00242', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 6, 40500, ''),
(688, '2017-01-31 12:36:58', 202, 'KSU.00242', 'Sprite 425', '-', 'yes', 4000, 0, 1, 4000, ''),
(689, '2017-01-31 12:37:03', 179, 'KSU.00242', 'Pita merah', '-', 'yes', 7000, 0, 1, 7000, ''),
(690, '2017-01-31 12:37:07', 332, 'KSU.00242', 'Kapas Selection', '-', 'yes', 4500, 0, 1, 4500, ''),
(691, '2017-01-31 12:37:25', 186, 'KSU.00242', 'Bendera putih Sst', '-', 'yes', 7500, 0, 1, 7500, ''),
(692, '2017-01-31 12:37:31', 457, 'KSU.00242', 'Dji Samsoe', '-', 'yes', 14500, 0, 1, 14500, ''),
(693, '2017-01-31 12:37:35', 241, 'KSU.00242', 'Kopi Kapal Api 165 gr', '-', 'yes', 11000, 0, 1, 11000, ''),
(694, '2017-01-31 12:37:43', 169, 'KSU.00242', 'Tropical 2lt', '-', 'yes', 24000, 0, 1, 24000, ''),
(695, '2017-01-31 12:37:59', 509, 'KSU.00242', 'motto 1/4', '-', 'yes', 8000, 0, 1, 8000, ''),
(696, '2017-01-31 12:38:19', 6, 'KSU.00242', 'Sedap goreng', '-', 'yes', 2200, 0, 2, 4400, ''),
(698, '2017-01-31 12:38:59', 10, 'KSU.00242', 'Sedap AB', '-', 'yes', 2000, 0, 2, 4000, ''),
(699, '2017-01-31 12:39:09', 246, 'KSU.00242', 'Sosro Clp', '-', 'yes', 5000, 0, 3, 15000, ''),
(701, '2017-01-31 12:45:41', 377, 'KSU.00243', 'Tuton Filter', '-', 'yes', 8000, 0, 1, 8000, ''),
(702, '2017-01-31 12:57:34', 296, 'KSU.00244', 'Frescare Splass', '-', 'yes', 12000, 0, 1, 12000, ''),
(704, '2017-01-31 12:58:38', 428, 'KSU.00244', 'Ultraflu', '-', 'yes', 3000, 0, 1, 3000, ''),
(707, '2017-01-31 13:01:34', 77, 'KSU.00244', 'Soklin Liquid Pink 800', '-', 'yes', 15000, 0, 3, 45000, ''),
(708, '2017-01-31 13:02:11', 113, 'KSU.00244', 'Sabun Lux biru', '-', 'yes', 3500, 0, 3, 10500, ''),
(709, '2017-01-31 13:02:50', 213, 'KSU.00244', 'Aqua 600', '-', 'yes', 2500, 0, 2, 5000, ''),
(710, '2017-01-31 13:28:02', 369, 'KSU.00245', 'Sampoerna Mild 16', '-', 'yes', 19000, 0, 1, 19000, ''),
(714, '2017-01-31 13:56:53', 3, 'KSU.00247', 'Indomie soto', '-', 'yes', 2000, 0, 2, 4000, ''),
(715, '2017-01-31 13:57:04', 2, 'KSU.00247', 'Indomie goreng', '-', 'yes', 2200, 0, 2, 4400, ''),
(718, '2017-01-31 15:34:36', 456, 'KSU.00248', 'U bold', '-', 'yes', 11500, 0, 2, 23000, ''),
(719, '2017-02-01 09:01:24', 159, 'KSU.00249', 'Mama Lemon Anti Bacteri 800ml', '-', 'yes', 13500, 0, 1, 13500, ''),
(720, '2017-02-01 09:01:38', 350, 'KSU.00249', 'Frestea beleng', '-', 'yes', 2000, 0, 2, 4000, ''),
(721, '2017-02-01 09:02:23', 521, 'KSU.00250', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 2, 102000, ''),
(722, '2017-02-01 09:02:36', 227, 'KSU.00250', 'White Coffe', '-', 'yes', 9500, 0, 1, 9500, ''),
(723, '2017-02-01 09:02:48', 504, 'KSU.00250', 'Coffemic', '-', 'yes', 11000, 0, 1, 11000, ''),
(724, '2017-02-01 09:03:04', 26, 'KSU.00250', 'ABC Kecap Pedes', '-', 'yes', 7000, 0, 1, 7000, ''),
(725, '2017-02-01 09:03:15', 4, 'KSU.00250', 'Indomie Spesial', '-', 'yes', 2000, 0, 10, 20000, ''),
(726, '2017-02-01 09:04:13', 521, 'KSU.00251', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 2, 102000, ''),
(727, '2017-02-01 09:04:54', 439, 'KSU.00252', 'Beras Organik', '-', 'yes', 13500, 0, 10, 135000, ''),
(728, '2017-02-01 09:05:55', 368, 'KSU.00253', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 8, 54000, ''),
(729, '2017-02-01 09:16:56', 63, 'KSU.00253', 'Ciptadent  hijau 190', '-', 'yes', 7000, 0, 1, 7000, ''),
(730, '2017-02-01 09:17:11', 244, 'KSU.00253', 'Poci Asli Clp', '-', 'yes', 4500, 0, 1, 4500, ''),
(731, '2017-02-01 09:17:27', 4, 'KSU.00253', 'Indomie Spesial', '-', 'yes', 2000, 0, 3, 6000, ''),
(732, '2017-02-01 09:17:36', 484, 'KSU.00253', 'Sunlig Jeruk Nipis 800', '-', 'yes', 14500, 0, 1, 14500, ''),
(733, '2017-02-01 09:17:52', 170, 'KSU.00253', 'tropical 1lt', '-', 'yes', 13500, 0, 2, 27000, ''),
(734, '2017-02-01 09:18:03', 231, 'KSU.00253', 'Jahe Wangi', '-', 'yes', 8500, 0, 1, 8500, ''),
(735, '2017-02-01 09:18:13', 521, 'KSU.00253', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 2, 102000, ''),
(736, '2017-02-01 09:18:25', 241, 'KSU.00253', 'Kopi Kapal Api 165 gr', '-', 'yes', 11000, 0, 1, 11000, ''),
(740, '2017-02-01 09:27:01', 170, 'KSU.00254', 'tropical 1lt', '-', 'yes', 13500, 0, 3, 40500, ''),
(741, '2017-02-01 09:27:14', 537, 'KSU.00254', 'Beras Rejomulyo Sak', '-', 'yes', 255000, 0, 1, 255000, ''),
(742, '2017-02-01 09:27:25', 155, 'KSU.00254', 'Beras Premium @2kg', '-', 'yes', 15800, 0, 12, 189600, ''),
(743, '2017-02-01 09:28:25', 505, 'KSU.00255', 'Floridina', '-', 'yes', 3000, 0, 1, 3000, ''),
(744, '2017-02-01 09:28:53', 215, 'KSU.00255', 'Ades 600', '-', 'yes', 3000, 0, 1, 3000, ''),
(745, '2017-02-01 09:29:05', 367, 'KSU.00255', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 1, 13000, ''),
(746, '2017-02-01 09:31:06', 179, 'KSU.00255', 'Pita merah', '-', 'yes', 7000, 0, 1, 7000, ''),
(747, '2017-02-01 09:31:25', 238, 'KSU.00255', 'Top Kopi Toraja 165 gr', '-', 'yes', 9500, 0, 1, 9500, ''),
(748, '2017-02-01 09:33:48', 224, 'KSU.00255', 'Good Day Coolin', '-', 'yes', 10000, 0, 1, 10000, ''),
(749, '2017-02-01 09:34:06', 222, 'KSU.00255', 'Good Day Carrebian', '-', 'yes', 10000, 0, 1, 10000, ''),
(751, '2017-02-01 09:42:13', 4, 'KSU.00256', 'Indomie Spesial', '-', 'yes', 2000, 0, 3, 6000, ''),
(752, '2017-02-01 09:42:28', 3, 'KSU.00256', 'Indomie soto', '-', 'yes', 2000, 0, 3, 6000, ''),
(753, '2017-02-01 09:42:43', 2, 'KSU.00256', 'Indomie goreng', '-', 'yes', 2200, 0, 3, 6600, ''),
(754, '2017-02-01 09:42:59', 251, 'KSU.00256', 'Gopek Kecil', '-', 'yes', 2500, 0, 5, 12500, ''),
(755, '2017-02-01 09:43:10', 333, 'KSU.00256', 'Tessa Saku', '-', 'yes', 1500, 0, 6, 9000, ''),
(756, '2017-02-01 09:43:30', 367, 'KSU.00256', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 3, 39000, ''),
(757, '2017-02-01 10:06:05', 367, 'KSU.00257', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 4, 52000, ''),
(758, '2017-02-01 10:06:14', 344, 'KSU.00257', 'Sunlight Cream', '-', 'yes', 6500, 0, 1, 6500, ''),
(759, '2017-02-01 10:06:22', 46, 'KSU.00257', 'Soffel kuning sst', '-', 'yes', 5500, 0, 1, 5500, ''),
(760, '2017-02-01 10:06:31', 120, 'KSU.00257', 'Sabun Nuvo Kuning', '-', 'yes', 2000, 0, 2, 4000, ''),
(761, '2017-02-01 10:06:42', 122, 'KSU.00257', 'Sabun Nuvo Merah', '-', 'yes', 2000, 0, 3, 6000, ''),
(762, '2017-02-01 10:06:48', 148, 'KSU.00257', 'Sampo pantene Sst pink', '-', 'yes', 9500, 0, 1, 9500, ''),
(763, '2017-02-01 10:06:56', 479, 'KSU.00257', 'Molto all in 1 Biru sst', '-', 'yes', 5500, 0, 2, 11000, ''),
(764, '2017-02-01 10:07:09', 255, 'KSU.00257', 'Parfum Putri pink', '-', 'yes', 15000, 0, 1, 15000, ''),
(765, '2017-02-01 10:07:24', 162, 'KSU.00257', 'Sabun Boom', '-', 'yes', 5000, 0, 1, 5000, ''),
(766, '2017-02-01 10:07:33', 500, 'KSU.00257', 'Fortune 2lt', '-', 'yes', 24000, 0, 1, 24000, ''),
(767, '2017-02-01 10:07:44', 4, 'KSU.00257', 'Indomie Spesial', '-', 'yes', 2000, 0, 5, 10000, ''),
(768, '2017-02-01 10:07:56', 193, 'KSU.00257', 'Susu zee Putih sst', '-', 'yes', 3000, 0, 5, 15000, ''),
(769, '2017-02-01 10:08:33', 505, 'KSU.00259', 'Floridina', '-', 'yes', 3000, 0, 1, 3000, ''),
(770, '2017-02-01 10:18:30', 213, 'KSU.00258', 'Aqua 600', '-', 'yes', 2500, 0, 1, 2500, ''),
(773, '2017-02-01 10:32:06', 169, 'KSU.00261', 'Tropical 2lt', '-', 'yes', 24000, 1000, 1, 24000, ''),
(774, '2017-02-01 10:32:57', 169, 'KSU.00262', 'Tropical 2lt', '-', 'yes', 24000, 1000, 1, 24000, ''),
(775, '2017-02-01 11:23:43', 190, 'KSU.00265', 'Gulaku Hijau 1000 gr', '-', 'yes', 17000, 0, 2, 34000, ''),
(776, '2017-02-01 11:36:28', 2, 'KSU.00263', 'Indomie goreng', '-', 'yes', 2200, 0, 3, 6600, ''),
(777, '2017-02-01 11:36:40', 4, 'KSU.00263', 'Indomie Spesial', '-', 'yes', 2000, 0, 2, 4000, ''),
(778, '2017-02-01 11:36:47', 62, 'KSU.00263', 'Close Up 65', '-', 'yes', 6500, 0, 1, 6500, ''),
(779, '2017-02-01 11:36:54', 171, 'KSU.00263', 'Tropical 500ml', '-', 'yes', 7000, 0, 1, 7000, ''),
(780, '2017-02-01 12:18:57', 368, 'KSU.00266', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 1, 6750, ''),
(781, '2017-02-01 12:39:41', 500, 'KSU.00267', 'Fortune 2lt', '-', 'yes', 24000, 0, 1, 24000, ''),
(785, '2017-02-01 13:37:53', 481, 'KSU.00269', 'Molto Anri Bacteri', '-', 'yes', 5500, 0, 2, 11000, ''),
(786, '2017-02-01 13:38:07', 479, 'KSU.00269', 'Molto all in 1 Biru sst', '-', 'yes', 5500, 0, 1, 5500, ''),
(787, '2017-02-01 13:38:15', 480, 'KSU.00269', 'Molto Elegant sst', '-', 'yes', 5500, 0, 2, 11000, ''),
(788, '2017-02-01 13:38:32', 482, 'KSU.00269', 'Downy Biru sst', '-', 'yes', 5500, 0, 5, 27500, ''),
(789, '2017-02-01 13:38:56', 465, 'KSU.00269', 'Dandang Biru', '-', 'yes', 3000, 0, 10, 30000, ''),
(790, '2017-02-01 13:39:09', 250, 'KSU.00269', 'Dandang kepyur', '-', 'yes', 2500, 0, 10, 25000, ''),
(791, '2017-02-01 13:39:22', 368, 'KSU.00269', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 20, 135000, ''),
(792, '2017-02-01 13:39:31', 367, 'KSU.00269', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 5, 65000, ''),
(793, '2017-02-01 13:40:22', 535, 'KSU.00269', 'Aqua Gelas', '-', 'yes', 24500, 0, 1, 24500, ''),
(796, '2017-02-01 13:42:41', 213, 'KSU.00269', 'Aqua 600', '-', 'yes', 2500, 0, 24, 60000, ''),
(797, '2017-02-01 13:43:17', 215, 'KSU.00270', 'Ades 600', '-', 'yes', 3000, 0, 1, 3000, ''),
(798, '2017-02-01 13:43:26', 392, 'KSU.00270', 'Ademsari', '-', 'yes', 2000, 0, 1, 2000, ''),
(799, '2017-02-01 13:54:41', 357, 'KSU.00271', 'Djarum 16', '-', 'yes', 20000, 0, 1, 20000, ''),
(800, '2017-02-01 13:57:27', 190, 'KSU.00272', 'Gulaku Hijau 1000 gr', '-', 'yes', 17000, 0, 3, 51000, ''),
(801, '2017-02-01 14:01:34', 357, 'KSU.00273', 'Djarum 16', '-', 'yes', 20000, 0, 1, 20000, ''),
(802, '2017-02-01 14:01:45', 501, 'KSU.00273', 'Good day chococino', '-', 'yes', 10000, 0, 1, 10000, ''),
(803, '2017-02-01 14:01:52', 187, 'KSU.00273', 'Bendera Coklat sst', '-', 'yes', 7500, 0, 1, 7500, ''),
(804, '2017-02-01 14:02:06', 367, 'KSU.00273', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 1, 13000, ''),
(805, '2017-02-01 14:02:19', 227, 'KSU.00273', 'White Coffe', '-', 'yes', 9500, 0, 1, 9500, ''),
(808, '2017-02-01 14:07:15', 535, 'KSU.00274', 'Aqua Gelas', '-', 'yes', 24500, 0, 4, 98000, ''),
(810, '2017-02-01 14:11:07', 416, 'KSU.00274', 'Aqua 1.5', '-', 'yes', 5000, 0, 12, 60000, ''),
(811, '2017-02-01 15:56:55', 521, 'KSU.00275', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 2, 102000, ''),
(812, '2017-02-01 15:57:30', 169, 'KSU.00275', 'Tropical 2lt', '-', 'yes', 24000, 1000, 3, 72000, ''),
(813, '2017-02-01 16:00:02', 367, 'KSU.00275', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 1, 13000, ''),
(815, '2017-02-02 09:11:22', 537, 'KSU.00276', 'Beras Rejomulyo Sak', '-', 'yes', 255000, 0, 1, 255000, ''),
(816, '2017-02-02 09:11:30', 319, 'KSU.00276', 'Multi 250', '-', 'yes', 11000, 0, 1, 11000, ''),
(817, '2017-02-02 09:11:46', 187, 'KSU.00276', 'Bendera Coklat sst', '-', 'yes', 7500, 0, 2, 15000, ''),
(818, '2017-02-02 09:11:59', 186, 'KSU.00276', 'Bendera putih Sst', '-', 'yes', 7500, 0, 2, 15000, ''),
(819, '2017-02-02 09:12:08', 222, 'KSU.00276', 'Good Day Carrebian', '-', 'yes', 10000, 0, 1, 10000, ''),
(820, '2017-02-02 09:12:31', 501, 'KSU.00276', 'Good day chococino', '-', 'yes', 10000, 0, 2, 20000, ''),
(821, '2017-02-02 09:12:37', 225, 'KSU.00276', 'Good Day Mocacino', '-', 'yes', 10000, 0, 1, 10000, ''),
(822, '2017-02-02 09:12:41', 538, 'KSU.00276', 'Good day White Frape', '-', 'yes', 10000, 0, 1, 10000, ''),
(823, '2017-02-02 09:12:48', 223, 'KSU.00276', 'Good Day Vanila', '-', 'yes', 10000, 0, 1, 10000, ''),
(824, '2017-02-02 09:13:11', 224, 'KSU.00276', 'Good Day Coolin', '-', 'yes', 10000, 0, 1, 10000, ''),
(825, '2017-02-02 09:13:42', 231, 'KSU.00276', 'Jahe Wangi', '-', 'yes', 8500, 0, 1, 8500, ''),
(826, '2017-02-02 09:14:01', 465, 'KSU.00276', 'Dandang Biru', '-', 'yes', 3000, 0, 10, 30000, ''),
(827, '2017-02-02 09:14:31', 366, 'KSU.00276', 'Gula jawa 1/2', '-', 'yes', 6500, 0, 2, 13000, ''),
(828, '2017-02-02 09:14:47', 227, 'KSU.00276', 'White Coffe', '-', 'yes', 9500, 0, 2, 19000, ''),
(829, '2017-02-02 09:15:17', 504, 'KSU.00276', 'Coffemic', '-', 'yes', 11000, 0, 2, 22000, ''),
(830, '2017-02-02 09:15:28', 232, 'KSU.00276', 'Segar Dingin', '-', 'yes', 6000, 0, 1, 6000, ''),
(831, '2017-02-02 09:15:41', 220, 'KSU.00276', 'Nutrisari Florida', '-', 'yes', 9700, 0, 1, 9700, ''),
(832, '2017-02-02 09:15:55', 509, 'KSU.00276', 'motto 1/4', '-', 'yes', 8000, 0, 1, 8000, ''),
(833, '2017-02-02 09:16:08', 507, 'KSU.00276', 'Kecap lele 340', '-', 'yes', 10500, 0, 1, 10500, ''),
(834, '2017-02-02 09:16:21', 417, 'KSU.00276', 'Sirup Fress', '-', 'yes', 17500, 0, 1, 17500, ''),
(835, '2017-02-02 09:17:25', 464, 'KSU.00277', 'Dunhil Hitam', '-', 'yes', 15500, 0, 2, 31000, ''),
(836, '2017-02-02 09:17:40', 356, 'KSU.00277', 'Djarum 12', '-', 'yes', 15500, 0, 3, 46500, ''),
(837, '2017-02-02 09:17:48', 33, 'KSU.00277', 'Gudang Garam Filter', '-', 'yes', 15000, 0, 3, 45000, ''),
(838, '2017-02-02 09:18:00', 181, 'KSU.00277', 'Tepung beras 200gr', '-', 'yes', 3000, 0, 1, 3000, ''),
(839, '2017-02-02 09:18:14', 509, 'KSU.00277', 'motto 1/4', '-', 'yes', 8000, 0, 2, 16000, ''),
(840, '2017-02-02 09:18:22', 508, 'KSU.00277', 'kecap lele sst', '-', 'yes', 18500, 0, 1, 18500, ''),
(841, '2017-02-02 09:18:57', 507, 'KSU.00277', 'Kecap lele 340', '-', 'yes', 10500, 0, 1, 10500, ''),
(842, '2017-02-02 09:19:03', 34, 'KSU.00277', 'Royco Sapi', '-', 'yes', 5000, 0, 2, 10000, ''),
(843, '2017-02-02 09:19:47', 429, 'KSU.00277', 'Mia atom bulan', '-', 'yes', 4500, 0, 4, 18000, ''),
(844, '2017-02-02 09:20:06', 179, 'KSU.00277', 'Pita merah', '-', 'yes', 7000, 0, 1, 7000, ''),
(845, '2017-02-02 09:20:22', 346, 'KSU.00277', 'Wing Biru', '-', 'yes', 2000, 0, 2, 4000, ''),
(846, '2017-02-02 09:20:34', 130, 'KSU.00277', 'Sabun Dettol Sensitive 105gr', '-', 'yes', 5000, 0, 2, 10000, ''),
(847, '2017-02-02 09:20:54', 513, 'KSU.00277', 'Mama Lemon kuning 800', '-', 'yes', 12500, 0, 1, 12500, ''),
(850, '2017-02-02 09:22:56', 42, 'KSU.00278', 'Rapika refil Ungu 450', '-', 'yes', 5000, 0, 1, 5000, ''),
(851, '2017-02-02 09:23:02', 479, 'KSU.00278', 'Molto all in 1 Biru sst', '-', 'yes', 5500, 0, 1, 5500, ''),
(852, '2017-02-02 09:23:06', 161, 'KSU.00278', 'Sabun So klin softergen pink 800gr', '-', 'yes', 15000, 0, 1, 15000, ''),
(854, '2017-02-02 09:24:34', 481, 'KSU.00278', 'Molto Anri Bacteri', '-', 'yes', 5500, 0, 1, 5500, ''),
(855, '2017-02-02 09:25:29', 367, 'KSU.00278', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 10, 130000, ''),
(856, '2017-02-02 09:37:42', 425, 'KSU.00279', 'Aqua 330ml', '-', 'yes', 2000, 0, 1, 2000, ''),
(857, '2017-02-02 10:12:32', 213, 'KSU.00280', 'Aqua 600', '-', 'yes', 2500, 0, 1, 2500, ''),
(858, '2017-02-02 10:27:03', 393, 'KSU.00281', 'Xonce', '-', 'yes', 2000, 0, 1, 2000, ''),
(859, '2017-02-02 10:27:09', 322, 'KSU.00281', 'Multi Putih Refil', '-', 'yes', 6500, 0, 1, 6500, ''),
(860, '2017-02-02 10:40:38', 356, 'KSU.00282', 'Djarum 12', '-', 'yes', 15500, 0, 1, 15500, ''),
(861, '2017-02-02 11:22:36', 11, 'KSU.00283', 'Sedap Bakso', '-', 'yes', 2000, 0, 3, 6000, ''),
(862, '2017-02-02 11:22:53', 180, 'KSU.00283', 'Tepung Ketan', '-', 'yes', 7500, 0, 4, 30000, ''),
(863, '2017-02-02 11:23:01', 183, 'KSU.00283', 'Ekomie', '-', 'yes', 8500, 0, 1, 8500, ''),
(864, '2017-02-02 11:23:12', 368, 'KSU.00283', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 1, 6750, ''),
(865, '2017-02-02 11:25:33', 356, 'KSU.00284', 'Djarum 12', '-', 'yes', 15500, 0, 1, 15500, ''),
(866, '2017-02-02 11:26:42', 203, 'KSU.00284', 'Fanta 425', '-', 'yes', 4000, 0, 1, 4000, ''),
(867, '2017-02-02 11:39:41', 368, 'KSU.00285', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 4, 27000, ''),
(868, '2017-02-02 11:40:17', 212, 'KSU.00285', 'Frestea  Jasmine Melati 500ml', '-', 'yes', 5500, 0, 1, 5500, ''),
(869, '2017-02-02 11:43:27', 210, 'KSU.00286', 'Frestea Apel 500', '-', 'yes', 5500, 0, 1, 5500, ''),
(870, '2017-02-02 11:46:22', 213, 'KSU.00287', 'Aqua 600', '-', 'yes', 2500, 0, 1, 2500, ''),
(871, '2017-02-02 11:46:44', 206, 'KSU.00287', 'Iso Plus', '-', 'yes', 3000, 0, 1, 3000, ''),
(872, '2017-02-02 12:09:01', 206, 'KSU.00288', 'Iso Plus', '-', 'yes', 3000, 0, 1, 3000, ''),
(874, '2017-02-02 12:10:03', 503, 'KSU.00289', 'Top kopi susu kental manis', '-', 'yes', 10800, 0, 1, 10800, ''),
(875, '2017-02-02 12:14:12', 505, 'KSU.00290', 'Floridina', '-', 'yes', 3000, 0, 2, 6000, ''),
(876, '2017-02-02 12:13:30', 206, 'KSU.00290', 'Iso Plus', '-', 'yes', 3000, 0, 1, 3000, ''),
(877, '2017-02-02 12:13:38', 212, 'KSU.00290', 'Frestea  Jasmine Melati 500ml', '-', 'yes', 5500, 0, 1, 5500, ''),
(878, '2017-02-02 12:15:23', 538, 'KSU.00291', 'Good day White Frape', '-', 'yes', 10000, 0, 2, 20000, ''),
(879, '2017-02-02 12:15:32', 97, 'KSU.00291', 'Shinzui Ungu', '-', 'yes', 3500, 0, 1, 3500, ''),
(880, '2017-02-02 12:15:36', 125, 'KSU.00291', 'Sabun Lifboy Hijau', '-', 'yes', 3000, 0, 1, 3000, ''),
(881, '2017-02-02 12:15:42', 56, 'KSU.00291', 'Pepsodent 75', '-', 'yes', 3750, 0, 1, 3750, ''),
(882, '2017-02-02 12:17:47', 6, 'KSU.00292', 'Sedap goreng', '-', 'yes', 2200, 0, 6, 13200, ''),
(883, '2017-02-02 12:18:12', 170, 'KSU.00292', 'tropical 1lt', '-', 'yes', 13500, 0, 1, 13500, ''),
(884, '2017-02-02 12:18:25', 7, 'KSU.00292', 'Sedap Ayam spesial', '-', 'yes', 2000, 0, 2, 4000, ''),
(885, '2017-02-02 12:36:54', 507, 'KSU.00293', 'Kecap lele 340', '-', 'yes', 10500, 0, 1, 10500, ''),
(886, '2017-02-02 12:44:12', 210, 'KSU.00294', 'Frestea Apel 500', '-', 'yes', 5500, 0, 1, 5500, ''),
(887, '2017-02-02 12:55:15', 511, 'KSU.00295', 'Antangin ', '-', 'yes', 2000, 0, 6, 12000, ''),
(888, '2017-02-02 13:00:24', 215, 'KSU.00296', 'Ades 600', '-', 'yes', 3000, 0, 1, 3000, ''),
(889, '2017-02-02 13:05:26', 376, 'KSU.00297', 'Magnum', '-', 'yes', 15500, 0, 1, 15500, ''),
(890, '2017-02-02 13:06:39', 213, 'KSU.00298', 'Aqua 600', '-', 'yes', 2500, 0, 1, 2500, ''),
(891, '2017-02-02 13:22:48', 356, 'KSU.00299', 'Djarum 12', '-', 'yes', 15500, 0, 1, 15500, ''),
(892, '2017-02-02 13:23:01', 368, 'KSU.00299', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 2, 13500, ''),
(893, '2017-02-02 13:39:49', 521, 'KSU.00300', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 1, 51000, ''),
(894, '2017-02-02 13:44:38', 56, 'KSU.00300', 'Pepsodent 75', '-', 'yes', 3750, 0, 1, 3750, ''),
(895, '2017-02-02 13:44:49', 137, 'KSU.00300', 'Poriklin 1000ml', '-', 'yes', 15000, 0, 1, 15000, ''),
(896, '2017-02-02 13:48:53', 96, 'KSU.00301', 'Johnson putih', '-', 'yes', 4500, 0, 1, 4500, ''),
(897, '2017-02-02 13:49:03', 213, 'KSU.00301', 'Aqua 600', '-', 'yes', 2500, 0, 1, 2500, ''),
(901, '2017-02-02 14:16:08', 310, 'KSU.00302', 'TW 02', '-', 'yes', 120000, 10000, 1, 120000, ''),
(903, '2017-02-02 14:18:34', 203, 'KSU.00303', 'Fanta 425', '-', 'yes', 4000, 0, 1, 4000, ''),
(904, '2017-02-02 14:21:09', 505, 'KSU.00304', 'Floridina', '-', 'yes', 3000, 0, 2, 6000, ''),
(905, '2017-02-02 14:50:38', 4, 'KSU.00305', 'Indomie Spesial', '-', 'yes', 2000, 0, 3, 6000, ''),
(906, '2017-02-02 14:51:06', 206, 'KSU.00305', 'Iso Plus', '-', 'yes', 3000, 0, 2, 6000, ''),
(907, '2017-02-02 14:51:33', 392, 'KSU.00305', 'Ademsari', '-', 'yes', 2000, 0, 4, 8000, ''),
(908, '2017-02-02 15:05:02', 350, 'KSU.00306', 'Frestea beleng', '-', 'yes', 2000, 0, 1, 2000, ''),
(909, '2017-02-02 15:15:08', 33, 'KSU.00307', 'Gudang Garam Filter', '-', 'yes', 15000, 0, 1, 15000, ''),
(910, '2017-02-02 15:18:40', 456, 'KSU.00308', 'U bold', '-', 'yes', 11500, 0, 1, 11500, ''),
(911, '2017-02-02 15:23:39', 210, 'KSU.00309', 'Frestea Apel 500', '-', 'yes', 5500, 0, 1, 5500, ''),
(912, '2017-02-02 15:30:23', 350, 'KSU.00310', 'Frestea beleng', '-', 'yes', 2000, 0, 1, 2000, ''),
(913, '2017-02-02 15:35:43', 360, 'KSU.00311', '76 filter', '-', 'yes', 12500, 0, 1, 12500, ''),
(914, '2017-02-03 08:52:36', 213, 'KSU.00312', 'Aqua 600', '-', 'yes', 2500, 0, 1, 2500, ''),
(915, '2017-02-03 09:24:31', 203, 'KSU.00313', 'Fanta 425', '-', 'yes', 4000, 0, 1, 4000, ''),
(916, '2017-02-03 03:06:55', 211, 'KSU.00314', 'Frestea Madu 500', '-', 'yes', 5500, 0, 2, 11000, ''),
(917, '2017-02-03 03:39:58', 210, 'KSU.00315', 'Frestea Apel 500', '-', 'yes', 5500, 0, 1, 5500, ''),
(918, '2017-02-04 01:56:10', 358, 'KSU.00316', 'Malboro putih', '-', 'yes', 22000, 0, 1, 22000, ''),
(919, '2017-02-04 02:25:32', 155, 'KSU.00317', 'Beras Premium @2kg', '-', 'yes', 15800, 0, 1, 15800, ''),
(920, '2017-02-04 02:25:53', 350, 'KSU.00317', 'Frestea beleng', '-', 'yes', 2000, 0, 1, 2000, ''),
(921, '2017-02-04 02:28:24', 367, 'KSU.00318', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 15, 195000, ''),
(922, '2017-02-04 02:29:21', 156, 'KSU.00319', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 3, 118500, ''),
(923, '2017-02-04 02:31:01', 16, 'KSU.00319', 'ABC Selera pedas gulai', '-', 'yes', 2000, 0, 1, 2000, ''),
(924, '2017-02-04 02:31:13', 3, 'KSU.00319', 'Indomie soto', '-', 'yes', 2000, 0, 2, 4000, ''),
(925, '2017-02-04 02:31:27', 5, 'KSU.00319', 'Indomie ayam bawang', '-', 'yes', 2000, 0, 2, 4000, ''),
(927, '2017-02-04 02:33:24', 521, 'KSU.00320', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 2, 102000, ''),
(928, '2017-02-04 02:34:07', 367, 'KSU.00320', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 2, 26000, ''),
(930, '2017-02-04 02:35:11', 2, 'KSU.00320', 'Indomie goreng', '-', 'yes', 2200, 100, 40, 88000, ''),
(931, '2017-02-04 02:37:11', 521, 'KSU.00321', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 1, 51000, ''),
(932, '2017-02-04 02:37:32', 170, 'KSU.00321', 'tropical 1lt', '-', 'yes', 13500, 0, 1, 13500, ''),
(933, '2017-02-04 02:42:23', 505, 'KSU.00322', 'Floridina', '-', 'yes', 3000, 0, 1, 3000, ''),
(934, '2017-02-04 02:42:54', 214, 'KSU.00323', 'Aquaria 600', '-', 'yes', 2000, 0, 1, 2000, ''),
(935, '2017-02-04 02:43:57', 548, 'KSU.00324', 'Aromatic Pegel Linu', '-', 'yes', 7500, 0, 1, 7500, ''),
(936, '2017-02-04 02:49:14', 505, 'KSU.00325', 'Floridina', '-', 'yes', 3000, 0, 1, 3000, ''),
(938, '2017-02-04 02:59:12', 73, 'KSU.00326', 'Listerin Cool mint', '-', 'yes', 9000, 0, 1, 9000, ''),
(939, '2017-02-04 02:59:22', 177, 'KSU.00326', 'Susu Gomars Vanila', '-', 'yes', 25000, 0, 2, 50000, ''),
(940, '2017-02-04 03:02:29', 367, 'KSU.00327', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 4, 52000, ''),
(941, '2017-02-04 03:02:44', 366, 'KSU.00327', 'Gula jawa 1/2', '-', 'yes', 6500, 0, 1, 6500, ''),
(942, '2017-02-04 03:03:06', 521, 'KSU.00327', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 1, 51000, ''),
(943, '2017-02-04 03:17:58', 211, 'KSU.00328', 'Frestea Madu 500', '-', 'yes', 5500, 0, 1, 5500, ''),
(944, '2017-02-04 03:18:41', 127, 'KSU.00329', 'Sabun Dettol re- energize 65gr', '-', 'yes', 3200, 0, 1, 3200, ''),
(945, '2017-02-04 03:18:44', 126, 'KSU.00329', 'Sabun Dettol ektra timun 65gr', '-', 'yes', 3200, 0, 1, 3200, ''),
(946, '2017-02-04 03:18:49', 160, 'KSU.00329', 'Sabun So klin softergen ungu 800gr', '-', 'yes', 15000, 0, 1, 15000, ''),
(947, '2017-02-04 03:18:55', 170, 'KSU.00329', 'tropical 1lt', '-', 'yes', 13500, 0, 1, 13500, ''),
(948, '2017-02-04 03:19:12', 549, 'KSU.00329', 'Aromatic Pegel Masuk Angin', '-', 'yes', 7500, 0, 1, 7500, ''),
(949, '2017-02-04 03:27:26', 213, 'KSU.00330', 'Aqua 600', '-', 'yes', 2500, 0, 1, 2500, ''),
(950, '2017-02-04 03:28:17', 210, 'KSU.00331', 'Frestea Apel 500', '-', 'yes', 5500, 0, 1, 5500, ''),
(951, '2017-02-04 03:29:16', 160, 'KSU.00332', 'Sabun So klin softergen ungu 800gr', '-', 'yes', 15000, 0, 1, 15000, ''),
(952, '2017-02-04 03:29:29', 110, 'KSU.00332', 'Sabun Giv Putih', '-', 'yes', 2000, 0, 2, 4000, ''),
(953, '2017-02-04 03:29:44', 507, 'KSU.00332', 'Kecap lele 340', '-', 'yes', 10500, 0, 1, 10500, ''),
(954, '2017-02-04 03:29:53', 212, 'KSU.00332', 'Frestea  Jasmine Melati 500ml', '-', 'yes', 5500, 0, 1, 5500, ''),
(955, '2017-02-04 03:31:25', 190, 'KSU.00333', 'Gulaku Hijau 1000 gr', '-', 'yes', 17000, 0, 1, 17000, ''),
(956, '2017-02-04 03:32:16', 521, 'KSU.00333', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 2, 102000, ''),
(957, '2017-02-04 03:34:32', 355, 'KSU.00334', 'Korek kayu', '-', 'yes', 500, 0, 2, 1000, ''),
(958, '2017-02-04 03:34:44', 2, 'KSU.00334', 'Indomie goreng', '-', 'yes', 2200, 0, 2, 4400, ''),
(959, '2017-02-04 03:34:53', 7, 'KSU.00334', 'Sedap Ayam spesial', '-', 'yes', 2000, 0, 1, 2000, ''),
(960, '2017-02-04 03:35:05', 368, 'KSU.00334', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 1, 6750, ''),
(961, '2017-02-04 03:37:24', 509, 'KSU.00335', 'motto 1/4', '-', 'yes', 8000, 0, 1, 8000, ''),
(962, '2017-02-04 03:37:35', 368, 'KSU.00335', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 2, 13500, ''),
(963, '2017-02-04 03:37:44', 169, 'KSU.00335', 'Tropical 2lt', '-', 'yes', 24000, 0, 1, 24000, ''),
(964, '2017-02-04 03:37:51', 344, 'KSU.00335', 'Sunlight Cream', '-', 'yes', 6500, 0, 1, 6500, ''),
(965, '2017-02-04 03:38:02', 521, 'KSU.00335', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 1, 51000, ''),
(966, '2017-02-04 03:38:12', 211, 'KSU.00335', 'Frestea Madu 500', '-', 'yes', 5500, 0, 1, 5500, ''),
(967, '2017-02-04 03:38:49', 6, 'KSU.00335', 'Sedap goreng', '-', 'yes', 2200, 0, 10, 22000, ''),
(968, '2017-02-04 03:38:56', 484, 'KSU.00335', 'Sunlig Jeruk Nipis 800', '-', 'yes', 14500, 0, 1, 14500, ''),
(969, '2017-02-04 03:39:20', 137, 'KSU.00335', 'Poriklin 1000ml', '-', 'yes', 15000, 0, 1, 15000, ''),
(970, '2017-02-04 03:39:33', 493, 'KSU.00335', 'Daia Ungu 800', '-', 'yes', 14000, 0, 1, 14000, ''),
(971, '2017-02-04 03:39:39', 332, 'KSU.00335', 'Kapas Selection', '-', 'yes', 4500, 0, 1, 4500, ''),
(972, '2017-02-04 03:39:44', 273, 'KSU.00335', 'Clear AD ', '-', 'yes', 10000, 0, 1, 10000, ''),
(973, '2017-02-04 03:39:49', 63, 'KSU.00335', 'Ciptadent  hijau 190', '-', 'yes', 7000, 0, 1, 7000, ''),
(974, '2017-02-04 03:39:53', 124, 'KSU.00335', 'Sabun Lifboy merah', '-', 'yes', 3000, 0, 1, 3000, ''),
(975, '2017-02-04 03:40:03', 119, 'KSU.00335', 'Sabun Nuvo Cool', '-', 'yes', 2000, 0, 2, 4000, ''),
(976, '2017-02-04 03:40:14', 187, 'KSU.00335', 'Bendera Coklat sst', '-', 'yes', 7500, 0, 1, 7500, ''),
(977, '2017-02-04 03:44:24', 521, 'KSU.00336', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 1, 51000, ''),
(978, '2017-02-04 03:44:33', 183, 'KSU.00336', 'Ekomie', '-', 'yes', 8500, 0, 1, 8500, ''),
(979, '2017-02-04 03:44:41', 507, 'KSU.00336', 'Kecap lele 340', '-', 'yes', 10500, 0, 1, 10500, ''),
(982, '2017-02-04 04:15:51', 170, 'KSU.00337', 'tropical 1lt', '-', 'yes', 13500, 1500, 1, 13500, ''),
(984, '2017-02-04 04:16:22', 187, 'KSU.00337', 'Bendera Coklat sst', '-', 'yes', 7500, 500, 1, 7500, ''),
(985, '2017-02-04 04:16:30', 302, 'KSU.00337', 'Softex Daun Sirih Wing', '-', 'yes', 5000, 0, 1, 5000, ''),
(986, '2017-02-04 04:16:45', 367, 'KSU.00337', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 2, 26000, ''),
(987, '2017-02-04 04:16:55', 155, 'KSU.00337', 'Beras Premium @2kg', '-', 'yes', 15800, 0, 1, 15800, ''),
(988, '2017-02-04 04:22:04', 159, 'KSU.00338', 'Mama Lemon Anti Bacteri 800ml', '-', 'yes', 13500, 0, 1, 13500, ''),
(989, '2017-02-04 05:03:42', 183, 'KSU.00339', 'Ekomie', '-', 'yes', 8500, 0, 1, 8500, ''),
(990, '2017-02-04 05:04:00', 169, 'KSU.00339', 'Tropical 2lt', '-', 'yes', 24000, 0, 1, 24000, ''),
(991, '2017-02-04 05:04:46', 156, 'KSU.00339', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 1, 39500, ''),
(992, '2017-02-04 05:06:07', 215, 'KSU.00342', 'Ades 600', '-', 'yes', 3000, 0, 1, 3000, ''),
(993, '2017-02-04 05:07:32', 155, 'KSU.00340', 'Beras Premium @2kg', '-', 'yes', 15800, 0, 15, 237000, ''),
(994, '2017-02-04 05:07:53', 282, 'KSU.00340', 'Citra bengkoang 250', '-', 'yes', 18500, 0, 1, 18500, ''),
(995, '2017-02-04 05:09:53', 183, 'KSU.00343', 'Ekomie', '-', 'yes', 8500, 0, 2, 17000, ''),
(996, '2017-02-04 05:16:43', 456, 'KSU.00341', 'U bold', '-', 'yes', 11500, 0, 1, 11500, ''),
(997, '2017-02-04 05:19:19', 156, 'KSU.00345', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 4, 158000, ''),
(998, '2017-02-04 05:20:52', 169, 'KSU.00346', 'Tropical 2lt', '-', 'yes', 24000, 0, 1, 24000, ''),
(999, '2017-02-04 05:21:05', 480, 'KSU.00346', 'Molto Elegant sst', '-', 'yes', 5500, 0, 1, 5500, ''),
(1000, '2017-02-04 05:21:20', 520, 'KSU.00346', 'Daia Softener Pink sst', '-', 'yes', 5200, 0, 1, 5200, ''),
(1001, '2017-02-04 05:22:06', 106, 'KSU.00346', 'Soklin Liquid sst Biru', '-', 'yes', 2500, 0, 2, 5000, ''),
(1002, '2017-02-04 05:22:33', 3, 'KSU.00346', 'Indomie soto', '-', 'yes', 2000, 0, 5, 10000, ''),
(1003, '2017-02-04 05:22:53', 536, 'KSU.00346', 'Beras Anak Terbang', '-', 'yes', 59000, 0, 1, 59000, ''),
(1004, '2017-02-04 05:27:45', 368, 'KSU.00344', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 2, 13500, ''),
(1005, '2017-02-04 05:28:03', 170, 'KSU.00344', 'tropical 1lt', '-', 'yes', 13500, 0, 1, 13500, ''),
(1018, '2017-02-04 05:33:06', 368, 'KSU.00348', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 6, 40500, ''),
(1019, '2017-02-04 05:33:25', 472, 'KSU.00348', 'Jazz1 SSt Lavender', '-', 'yes', 5200, 0, 2, 10400, ''),
(1020, '2017-02-04 05:33:32', 471, 'KSU.00348', 'Jazz1 SSt pink', '-', 'yes', 5200, 0, 2, 10400, ''),
(1021, '2017-02-04 05:33:38', 480, 'KSU.00348', 'Molto Elegant sst', '-', 'yes', 5500, 0, 1, 5500, ''),
(1022, '2017-02-04 05:33:44', 55, 'KSU.00348', 'Pepsodent 120', '-', 'yes', 6500, 0, 2, 13000, ''),
(1023, '2017-02-04 05:33:49', 500, 'KSU.00348', 'Fortune 2lt', '-', 'yes', 24000, 0, 1, 24000, ''),
(1024, '2017-02-04 05:33:59', 479, 'KSU.00348', 'Molto all in 1 Biru sst', '-', 'yes', 5500, 0, 1, 5500, ''),
(1025, '2017-02-04 05:34:07', 124, 'KSU.00348', 'Sabun Lifboy merah', '-', 'yes', 3000, 0, 4, 12000, ''),
(1026, '2017-02-04 05:34:12', 484, 'KSU.00348', 'Sunlig Jeruk Nipis 800', '-', 'yes', 14500, 0, 1, 14500, ''),
(1027, '2017-02-04 05:37:24', 368, 'KSU.00347', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 4, 27000, ''),
(1028, '2017-02-04 05:37:30', 181, 'KSU.00347', 'Tepung beras 200gr', '-', 'yes', 3000, 0, 1, 3000, ''),
(1029, '2017-02-04 05:37:36', 43, 'KSU.00347', 'Kingkong', '-', 'yes', 4000, 0, 1, 4000, ''),
(1030, '2017-02-04 05:37:53', 266, 'KSU.00347', 'Emeron HBL Pink', '-', 'yes', 5500, 0, 1, 5500, ''),
(1031, '2017-02-04 05:38:06', 509, 'KSU.00347', 'motto 1/4', '-', 'yes', 8000, 0, 1, 8000, ''),
(1032, '2017-02-04 05:38:52', 507, 'KSU.00347', 'Kecap lele 340', '-', 'yes', 10500, 0, 1, 10500, ''),
(1033, '2017-02-04 05:38:58', 495, 'KSU.00347', 'Soklin Smart White 800', '-', 'yes', 18000, 0, 1, 18000, ''),
(1034, '2017-02-04 05:39:08', 131, 'KSU.00347', 'Sabun Dettol Active 105gr', '-', 'yes', 5000, 0, 4, 20000, ''),
(1035, '2017-02-04 05:39:15', 500, 'KSU.00347', 'Fortune 2lt', '-', 'yes', 24000, 0, 1, 24000, ''),
(1036, '2017-02-04 05:39:30', 366, 'KSU.00347', 'Gula jawa 1/2', '-', 'yes', 6500, 0, 1, 6500, ''),
(1037, '2017-02-04 05:39:41', 331, 'KSU.00347', 'Kapas Cinderela', '-', 'yes', 2500, 0, 1, 2500, ''),
(1038, '2017-02-04 05:40:04', 156, 'KSU.00347', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 4, 158000, ''),
(1039, '2017-02-04 05:40:12', 521, 'KSU.00347', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 1, 51000, ''),
(1040, '2017-02-04 05:45:53', 367, 'KSU.00349', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 5, 65000, ''),
(1041, '2017-02-04 05:46:18', 183, 'KSU.00349', 'Ekomie', '-', 'yes', 8500, 0, 1, 8500, ''),
(1042, '2017-02-04 05:47:21', 250, 'KSU.00350', 'Dandang kepyur', '-', 'yes', 2500, 100, 10, 25000, ''),
(1044, '2017-02-04 06:03:57', 213, 'KSU.00351', 'Aqua 600', '-', 'yes', 2500, 0, 1, 2500, ''),
(1045, '2017-02-04 06:08:03', 156, 'KSU.00352', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 5, 197500, ''),
(1046, '2017-02-04 06:08:11', 521, 'KSU.00352', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 5, 255000, ''),
(1047, '2017-02-04 06:10:46', 171, 'KSU.00353', 'Tropical 500ml', '-', 'yes', 7000, 0, 1, 7000, ''),
(1048, '2017-02-06 02:11:50', 251, 'KSU.00354', 'Gopek Kecil', '-', 'yes', 2500, 0, 3, 7500, ''),
(1049, '2017-02-06 02:12:02', 248, 'KSU.00354', 'Gopek Super', '-', 'yes', 4600, 0, 1, 4600, ''),
(1050, '2017-02-06 02:28:40', 206, 'KSU.00355', 'Iso Plus', '-', 'yes', 3000, 0, 1, 3000, ''),
(1051, '2017-02-06 02:32:23', 521, 'KSU.00356', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 1, 51000, ''),
(1052, '2017-02-06 02:32:28', 116, 'KSU.00356', 'Sabun Lux Ungu', '-', 'yes', 3500, 0, 1, 3500, ''),
(1053, '2017-02-06 02:59:50', 156, 'KSU.00357', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 5, 197500, ''),
(1054, '2017-02-06 02:59:59', 521, 'KSU.00357', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 1, 51000, ''),
(1055, '2017-02-06 03:01:42', 156, 'KSU.00358', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 4, 158000, ''),
(1056, '2017-02-06 03:01:56', 439, 'KSU.00358', 'Beras Organik', '-', 'yes', 67500, 0, 4, 270000, ''),
(1057, '2017-02-06 03:02:48', 368, 'KSU.00359', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 20, 135000, ''),
(1058, '2017-02-06 03:03:01', 367, 'KSU.00359', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 5, 65000, ''),
(1059, '2017-02-06 03:03:12', 230, 'KSU.00359', 'Milo 18 gr', '-', 'yes', 14000, 0, 1, 14000, ''),
(1060, '2017-02-06 03:03:22', 224, 'KSU.00359', 'Good Day Coolin', '-', 'yes', 10000, 0, 1, 10000, ''),
(1061, '2017-02-06 03:03:28', 504, 'KSU.00359', 'Coffemic', '-', 'yes', 11000, 0, 1, 11000, ''),
(1062, '2017-02-06 03:03:34', 219, 'KSU.00359', 'Nutrisari Jambu', '-', 'yes', 9700, 0, 1, 9700, ''),
(1063, '2017-02-06 03:03:41', 218, 'KSU.00359', 'Nutrisari Am Sweet', '-', 'yes', 9700, 0, 1, 9700, ''),
(1064, '2017-02-06 03:03:47', 501, 'KSU.00359', 'Good day chococino', '-', 'yes', 10000, 0, 1, 10000, ''),
(1065, '2017-02-06 03:03:53', 222, 'KSU.00359', 'Good Day Carrebian', '-', 'yes', 10000, 0, 1, 10000, ''),
(1066, '2017-02-06 03:03:58', 225, 'KSU.00359', 'Good Day Mocacino', '-', 'yes', 10000, 0, 1, 10000, ''),
(1067, '2017-02-06 03:04:06', 221, 'KSU.00359', 'Nutrisari Sirsat', '-', 'yes', 9700, 0, 1, 9700, ''),
(1068, '2017-02-06 03:59:46', 367, 'KSU.00360', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 1, 13000, ''),
(1069, '2017-02-06 04:00:51', 122, 'KSU.00361', 'Sabun Nuvo Merah', '-', 'yes', 2000, 0, 2, 4000, ''),
(1070, '2017-02-06 04:00:53', 120, 'KSU.00361', 'Sabun Nuvo Kuning', '-', 'yes', 2000, 0, 1, 2000, ''),
(1071, '2017-02-06 04:00:59', 119, 'KSU.00361', 'Sabun Nuvo Cool', '-', 'yes', 2000, 0, 2, 4000, ''),
(1072, '2017-02-06 04:09:19', 464, 'KSU.00362', 'Dunhil Hitam', '-', 'yes', 15500, 0, 1, 15500, ''),
(1073, '2017-02-06 04:15:37', 368, 'KSU.00365', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 1, 6750, ''),
(1074, '2017-02-06 04:15:47', 366, 'KSU.00365', 'Gula jawa 1/2', '-', 'yes', 6500, 0, 2, 13000, ''),
(1075, '2017-02-06 04:17:57', 156, 'KSU.00363', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 4, 158000, ''),
(1076, '2017-02-06 04:32:58', 367, 'KSU.00366', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 3, 39000, ''),
(1077, '2017-02-06 04:48:04', 425, 'KSU.00367', 'Aqua 330ml', '-', 'yes', 2000, 0, 1, 2000, ''),
(1078, '2017-02-06 05:23:00', 368, 'KSU.00368', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 1, 6750, ''),
(1079, '2017-02-06 05:23:07', 248, 'KSU.00368', 'Gopek Super', '-', 'yes', 4600, 0, 1, 4600, ''),
(1081, '2017-02-06 05:46:21', 144, 'KSU.00369', 'Sampo Emeron hitam ', '-', 'yes', 12500, 0, 1, 12500, ''),
(1082, '2017-02-06 05:46:37', 11, 'KSU.00369', 'Sedap Bakso', '-', 'yes', 2000, 0, 3, 6000, ''),
(1083, '2017-02-06 05:46:43', 212, 'KSU.00369', 'Frestea  Jasmine Melati 500ml', '-', 'yes', 5500, 0, 1, 5500, ''),
(1084, '2017-02-06 05:46:54', 36, 'KSU.00369', 'Magic Lezat', '-', 'yes', 3000, 0, 1, 3000, ''),
(1085, '2017-02-06 05:46:59', 338, 'KSU.00369', 'Sedap Cup soto', '-', 'yes', 5000, 0, 1, 5000, ''),
(1086, '2017-02-06 05:47:08', 102, 'KSU.00369', 'Molto White musk sst', '-', 'yes', 5000, 0, 1, 5000, ''),
(1087, '2017-02-06 05:47:13', 201, 'KSU.00369', 'Lulur Kocok', '-', 'yes', 15000, 0, 1, 15000, ''),
(1088, '2017-02-06 05:47:19', 290, 'KSU.00369', 'Rexona Women', '-', 'yes', 16000, 0, 1, 16000, ''),
(1089, '2017-02-06 05:47:32', 486, 'KSU.00369', 'Boom Merah', '-', 'yes', 5000, 0, 1, 5000, ''),
(1090, '2017-02-06 05:47:58', 50, 'KSU.00369', 'Rapika Merah sst', '-', 'yes', 5000, 0, 1, 5000, ''),
(1091, '2017-02-06 05:48:07', 49, 'KSU.00369', 'Rapika hijau sst', '-', 'yes', 5000, 0, 1, 5000, ''),
(1092, '2017-02-06 05:48:14', 501, 'KSU.00369', 'Good day chococino', '-', 'yes', 10000, 0, 1, 10000, ''),
(1093, '2017-02-06 05:48:22', 170, 'KSU.00369', 'tropical 1lt', '-', 'yes', 13500, 0, 1, 13500, ''),
(1094, '2017-02-06 05:48:32', 368, 'KSU.00369', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 2, 13500, ''),
(1095, '2017-02-06 05:53:31', 247, 'KSU.00370', 'Gopek clp', '-', 'yes', 6500, 0, 1, 6500, ''),
(1096, '2017-02-06 05:53:44', 368, 'KSU.00370', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 1, 6750, ''),
(1097, '2017-02-06 05:55:41', 195, 'KSU.00371', 'Sikat Formula', '-', 'yes', 3000, 0, 1, 3000, ''),
(1098, '2017-02-06 05:55:47', 212, 'KSU.00371', 'Frestea  Jasmine Melati 500ml', '-', 'yes', 5500, 0, 1, 5500, ''),
(1099, '2017-02-06 05:55:54', 2, 'KSU.00371', 'Indomie goreng', '-', 'yes', 2200, 0, 1, 2200, ''),
(1100, '2017-02-06 05:56:02', 3, 'KSU.00371', 'Indomie soto', '-', 'yes', 2000, 0, 1, 2000, ''),
(1101, '2017-02-06 05:56:09', 124, 'KSU.00371', 'Sabun Lifboy merah', '-', 'yes', 3000, 0, 1, 3000, ''),
(1102, '2017-02-06 06:18:50', 537, 'KSU.00372', 'Beras Rejomulyo Sak', '-', 'yes', 255000, 0, 2, 510000, ''),
(1103, '2017-02-06 07:20:00', 208, 'KSU.00374', 'Nu Green Tea Teh hijau', '-', 'yes', 5000, 0, 1, 5000, ''),
(1104, '2017-02-06 07:21:13', 207, 'KSU.00374', 'Nu Gren Tea less Sugar', '-', 'yes', 5000, 0, 1, 5000, ''),
(1106, '2017-02-06 07:23:24', 214, 'KSU.00373', 'Aquaria 600', '-', 'yes', 2000, 0, 1, 2000, ''),
(1107, '2017-02-06 07:23:41', 215, 'KSU.00373', 'Ades 600', '-', 'yes', 3000, 0, 1, 3000, ''),
(1108, '2017-02-06 07:26:06', 462, 'KSU.00375', 'ABC saus Tomat 135 ml', '-', 'yes', 6000, 0, 1, 6000, ''),
(1109, '2017-02-06 07:26:11', 140, 'KSU.00375', 'Wipol 800ml', '-', 'yes', 13500, 0, 1, 13500, ''),
(1110, '2017-02-06 07:26:16', 161, 'KSU.00375', 'Sabun So klin softergen pink 800gr', '-', 'yes', 15000, 0, 1, 15000, ''),
(1111, '2017-02-06 07:27:39', 503, 'KSU.00375', 'Top kopi susu kental manis', '-', 'yes', 10800, 0, 1, 10800, ''),
(1112, '2017-02-06 08:17:50', 206, 'KSU.00376', 'Iso Plus', '-', 'yes', 3000, 0, 1, 3000, ''),
(1113, '2017-02-06 08:18:02', 214, 'KSU.00376', 'Aquaria 600', '-', 'yes', 2000, 0, 1, 2000, ''),
(1114, '2017-02-06 08:18:24', 156, 'KSU.00377', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 2, 79000, ''),
(1115, '2017-02-06 08:19:02', 542, 'KSU.00377', 'Larutan Badak Jambu', '-', 'yes', 5500, 0, 1, 5500, ''),
(1116, '2017-02-06 08:20:35', 367, 'KSU.00378', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 1, 13000, ''),
(1117, '2017-02-06 08:20:51', 237, 'KSU.00378', 'Top Kopi Murni 165 gr', '-', 'yes', 9500, 0, 1, 9500, ''),
(1118, '2017-02-06 08:21:18', 235, 'KSU.00378', 'Energen Vanila', '-', 'yes', 11500, 0, 1, 11500, ''),
(1119, '2017-02-06 08:22:12', 187, 'KSU.00378', 'Bendera Coklat sst', '-', 'yes', 7500, 0, 2, 15000, ''),
(1120, '2017-02-06 08:23:28', 224, 'KSU.00378', 'Good Day Coolin', '-', 'yes', 10000, 0, 1, 10000, ''),
(1121, '2017-02-06 08:23:45', 509, 'KSU.00378', 'motto 1/4', '-', 'yes', 8000, 0, 1, 8000, ''),
(1122, '2017-02-06 08:24:02', 507, 'KSU.00378', 'Kecap lele 340', '-', 'yes', 10500, 0, 1, 10500, ''),
(1123, '2017-02-06 08:24:51', 378, 'KSU.00378', 'Sampoerna Kretek', '-', 'yes', 11000, 0, 1, 11000, ''),
(1124, '2017-02-06 08:25:01', 57, 'KSU.00378', 'Pepsodent Whitening 75', '-', 'yes', 6500, 0, 1, 6500, ''),
(1126, '2017-02-06 08:37:29', 521, 'KSU.00379', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 3, 153000, ''),
(1127, '2017-02-06 08:37:39', 156, 'KSU.00379', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 2, 79000, '');
INSERT INTO `tbl_orderlist_det` (`id`, `tgl`, `id_produk`, `no_nota`, `produk`, `keterangan`, `tambahan`, `harga`, `diskon`, `jml`, `subtotal`, `status`) VALUES
(1128, '2017-02-06 08:37:49', 155, 'KSU.00379', 'Beras Premium @2kg', '-', 'yes', 15800, 0, 1, 15800, ''),
(1129, '2017-02-06 08:38:14', 368, 'KSU.00379', 'Gula pasir 1/2', '-', 'yes', 6750, 250, 5, 33750, ''),
(1130, '2017-02-06 08:38:29', 5, 'KSU.00379', 'Indomie ayam bawang', '-', 'yes', 2000, 0, 5, 10000, ''),
(1131, '2017-02-06 08:38:41', 4, 'KSU.00379', 'Indomie Spesial', '-', 'yes', 2000, 0, 5, 10000, ''),
(1132, '2017-02-06 08:39:11', 190, 'KSU.00379', 'Gulaku Hijau 1000 gr', '-', 'yes', 17000, 500, 2, 34000, ''),
(1133, '2017-02-06 08:39:32', 186, 'KSU.00379', 'Bendera putih Sst', '-', 'yes', 7500, 500, 2, 15000, ''),
(1134, '2017-02-06 08:39:48', 169, 'KSU.00379', 'Tropical 2lt', '-', 'yes', 24000, 1000, 1, 24000, ''),
(1135, '2017-02-06 08:40:02', 536, 'KSU.00379', 'Beras Anak Terbang', '-', 'yes', 59000, 0, 2, 118000, ''),
(1136, '2017-02-06 08:48:32', 154, 'KSU.00380', 'Beras Pak tani @5kg', '-', 'yes', 60000, 0, 3, 180000, ''),
(1137, '2017-02-06 08:48:49', 367, 'KSU.00380', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 2, 26000, ''),
(1138, '2017-02-06 08:48:57', 169, 'KSU.00380', 'Tropical 2lt', '-', 'yes', 24000, 0, 2, 48000, ''),
(1140, '2017-02-06 08:52:58', 368, 'KSU.00381', 'Gula pasir 1/2', '-', 'yes', 6750, 250, 20, 135000, ''),
(1141, '2017-02-07 01:52:47', 190, 'KSU.00382', 'Gulaku Hijau 1000 gr', '-', 'yes', 17000, 0, 1, 17000, ''),
(1142, '2017-02-07 01:52:55', 323, 'KSU.00382', 'Multi Biru Refil', '-', 'yes', 6500, 0, 1, 6500, ''),
(1143, '2017-02-07 02:02:38', 376, 'KSU.00383', 'Magnum', '-', 'yes', 15500, 0, 1, 15500, ''),
(1144, '2017-02-07 02:15:48', 485, 'KSU.00384', 'Bendera Gold', '-', 'yes', 13800, 0, 9, 124200, ''),
(1145, '2017-02-07 02:16:01', 303, 'KSU.00384', 'Laurier maxi 30', '-', 'yes', 11000, 0, 1, 11000, ''),
(1146, '2017-02-07 02:16:34', 158, 'KSU.00384', 'Sabun Rinso 900gr', '-', 'yes', 18000, 0, 2, 36000, ''),
(1147, '2017-02-07 02:16:41', 484, 'KSU.00384', 'Sunlig Jeruk Nipis 800', '-', 'yes', 14500, 0, 1, 14500, ''),
(1148, '2017-02-07 02:16:56', 116, 'KSU.00384', 'Sabun Lux Ungu', '-', 'yes', 3500, 0, 2, 7000, ''),
(1149, '2017-02-07 02:17:11', 117, 'KSU.00384', 'Sabun Lux Pink', '-', 'yes', 3500, 0, 2, 7000, ''),
(1150, '2017-02-07 02:17:22', 114, 'KSU.00384', 'Sabun Lux putih', '-', 'yes', 3500, 0, 2, 7000, ''),
(1151, '2017-02-07 02:18:35', 123, 'KSU.00384', 'Sabun Lifboy biru', '-', 'yes', 3000, 0, 2, 6000, ''),
(1152, '2017-02-07 02:19:17', 37, 'KSU.00384', 'Garam Halus', '-', 'yes', 1700, 0, 3, 5100, ''),
(1153, '2017-02-07 02:19:34', 230, 'KSU.00384', 'Milo 18 gr', '-', 'yes', 14000, 0, 1, 14000, ''),
(1154, '2017-02-07 02:19:51', 175, 'KSU.00384', 'Sanco 2lt', '-', 'yes', 27000, 0, 3, 81000, ''),
(1155, '2017-02-07 02:56:10', 368, 'KSU.00385', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 3, 20250, ''),
(1156, '2017-02-07 02:56:35', 147, 'KSU.00385', 'Sampo pantene Sst hitam', '-', 'yes', 9500, 0, 1, 9500, ''),
(1158, '2017-02-07 02:56:52', 276, 'KSU.00385', 'Alas Bedak Tasik', '-', 'yes', 14500, 0, 1, 14500, ''),
(1159, '2017-02-07 03:12:23', 215, 'KSU.00386', 'Ades 600', '-', 'yes', 3000, 0, 1, 3000, ''),
(1160, '2017-02-07 03:12:56', 543, 'KSU.00386', 'Larutan Badak  Jeruk', '-', 'yes', 5500, 0, 1, 5500, ''),
(1161, '2017-02-07 03:14:39', 171, 'KSU.00387', 'Tropical 500ml', '-', 'yes', 7000, 0, 1, 7000, ''),
(1162, '2017-02-07 03:14:44', 491, 'KSU.00387', 'Daia Softener Pink', '-', 'yes', 14000, 0, 1, 14000, ''),
(1163, '2017-02-07 03:15:19', 203, 'KSU.00387', 'Fanta 425', '-', 'yes', 4000, 0, 1, 4000, ''),
(1164, '2017-02-07 03:39:14', 368, 'KSU.00388', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 2, 13500, ''),
(1165, '2017-02-07 04:11:41', 439, 'KSU.00389', 'Beras Organik', '-', 'yes', 67500, 0, 1, 67500, ''),
(1166, '2017-02-07 05:16:30', 206, 'KSU.00390', 'Iso Plus', '-', 'yes', 3000, 0, 1, 3000, ''),
(1167, '2017-02-07 05:17:55', 171, 'KSU.00391', 'Tropical 500ml', '-', 'yes', 7000, 0, 1, 7000, ''),
(1168, '2017-02-07 05:18:14', 368, 'KSU.00391', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 2, 13500, ''),
(1169, '2017-02-07 05:23:29', 155, 'KSU.00392', 'Beras Premium @2kg', '-', 'yes', 15800, 0, 2, 31600, ''),
(1170, '2017-02-07 06:07:12', 487, 'KSU.00393', 'Frestea Markisa 350 ml', '-', 'yes', 4000, 0, 1, 4000, ''),
(1171, '2017-02-07 06:32:17', 393, 'KSU.00394', 'Xonce', '-', 'yes', 2000, 0, 1, 2000, ''),
(1172, '2017-02-07 06:32:24', 212, 'KSU.00394', 'Frestea  Jasmine Melati 500ml', '-', 'yes', 5500, 0, 1, 5500, ''),
(1173, '2017-02-07 06:57:24', 357, 'KSU.00395', 'Djarum 16', '-', 'yes', 20000, 0, 1, 20000, ''),
(1174, '2017-02-07 06:57:29', 501, 'KSU.00395', 'Good day chococino', '-', 'yes', 10000, 0, 1, 10000, ''),
(1175, '2017-02-07 06:57:41', 368, 'KSU.00395', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 3, 20250, ''),
(1176, '2017-02-07 06:57:47', 366, 'KSU.00395', 'Gula jawa 1/2', '-', 'yes', 6500, 0, 1, 6500, ''),
(1177, '2017-02-07 07:21:09', 214, 'KSU.00396', 'Aquaria 600', '-', 'yes', 2000, 0, 1, 2000, ''),
(1178, '2017-02-07 07:27:42', 351, 'KSU.00397', 'Teh botol sosro', '-', 'yes', 3000, 0, 3, 9000, ''),
(1179, '2017-02-07 08:33:53', 350, 'KSU.00398', 'Frestea beleng', '-', 'yes', 2000, 0, 1, 2000, ''),
(1180, '2017-02-07 08:34:31', 498, 'KSU.00398', 'Ciptadent Fresh Mint 190 gr', '-', 'yes', 7500, 0, 1, 7500, ''),
(1181, '2017-02-08 01:55:43', 510, 'KSU.00399', 'Masako sapi', '-', 'yes', 5000, 0, 1, 5000, ''),
(1182, '2017-02-08 02:06:40', 204, 'KSU.00400', 'Javana', '-', 'yes', 3000, 0, 1, 3000, ''),
(1184, '2017-02-08 02:56:40', 2, 'KSU.00404', 'Indomie goreng', '-', 'yes', 2200, 0, 4, 8800, ''),
(1185, '2017-02-08 03:06:08', 109, 'KSU.00405', 'Sabun Giv Merah', '-', 'yes', 2000, 0, 4, 8000, ''),
(1186, '2017-02-08 03:07:28', 10, 'KSU.00405', 'Sedap AB', '-', 'yes', 2000, 0, 1, 2000, ''),
(1187, '2017-02-08 03:07:40', 11, 'KSU.00405', 'Sedap Bakso', '-', 'yes', 2000, 0, 2, 4000, ''),
(1188, '2017-02-08 03:08:17', 9, 'KSU.00405', 'Sedap Soto', '-', 'yes', 2000, 0, 2, 4000, ''),
(1189, '2017-02-08 03:08:39', 366, 'KSU.00405', 'Gula jawa 1/2', '-', 'yes', 6500, 0, 1, 6500, ''),
(1190, '2017-02-08 03:16:28', 59, 'KSU.00405', 'Formula 75', '-', 'yes', 7000, 0, 3, 21000, ''),
(1191, '2017-02-08 03:32:55', 214, 'KSU.00402', 'Aquaria 600', '-', 'yes', 2000, 0, 1, 2000, ''),
(1192, '2017-02-08 04:01:47', 154, 'KSU.00401', 'Beras Pak tani @5kg', '-', 'yes', 60000, 0, 2, 120000, ''),
(1193, '2017-02-08 04:10:08', 479, 'KSU.00406', 'Molto all in 1 Biru sst', '-', 'yes', 5500, 0, 1, 5500, ''),
(1194, '2017-02-08 04:10:21', 379, 'KSU.00406', 'LA hijau', '-', 'yes', 17000, 0, 1, 17000, ''),
(1195, '2017-02-08 04:22:05', 505, 'KSU.00407', 'Floridina', '-', 'yes', 3000, 0, 1, 3000, ''),
(1196, '2017-02-08 04:40:33', 536, 'KSU.00408', 'Beras Anak Terbang', '-', 'yes', 59000, 0, 4, 236000, ''),
(1197, '2017-02-08 04:41:49', 286, 'KSU.00408', 'Clean & Clear 100', '-', 'yes', 19000, 0, 1, 19000, ''),
(1198, '2017-02-08 04:42:51', 473, 'KSU.00408', 'Blue Band 200 gr', '-', 'yes', 7000, 0, 1, 7000, ''),
(1199, '2017-02-08 04:42:59', 28, 'KSU.00408', 'Kecap Bango 600ml', '-', 'yes', 27000, 0, 1, 27000, ''),
(1200, '2017-02-08 04:43:10', 493, 'KSU.00408', 'Daia Ungu 800', '-', 'yes', 14000, 0, 1, 14000, ''),
(1201, '2017-02-08 04:43:17', 491, 'KSU.00408', 'Daia Softener Pink', '-', 'yes', 14000, 0, 1, 14000, ''),
(1202, '2017-02-08 04:44:37', 368, 'KSU.00408', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 4, 27000, ''),
(1203, '2017-02-08 04:44:43', 553, 'KSU.00408', 'Energen Jagung', '-', 'yes', 11500, 0, 1, 11500, ''),
(1204, '2017-02-08 04:44:59', 247, 'KSU.00408', 'Gopek clp', '-', 'yes', 6500, 0, 2, 13000, ''),
(1205, '2017-02-08 04:46:35', 81, 'KSU.00408', 'Johsons Refil 200', '-', 'yes', 17000, 0, 1, 17000, ''),
(1206, '2017-02-08 05:10:07', 206, 'KSU.00409', 'Iso Plus', '-', 'yes', 3000, 0, 1, 3000, ''),
(1207, '2017-02-08 05:10:14', 505, 'KSU.00409', 'Floridina', '-', 'yes', 3000, 0, 1, 3000, ''),
(1208, '2017-02-08 05:10:32', 214, 'KSU.00409', 'Aquaria 600', '-', 'yes', 2000, 0, 1, 2000, ''),
(1209, '2017-02-08 05:12:58', 490, 'KSU.00410', 'Beras Maknyus', '-', 'yes', 65000, 0, 1, 65000, ''),
(1210, '2017-02-08 05:13:08', 156, 'KSU.00410', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 1, 39500, ''),
(1211, '2017-02-08 05:13:21', 367, 'KSU.00410', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 1, 13000, ''),
(1212, '2017-02-08 05:13:31', 233, 'KSU.00410', 'Energen Kc Ijo', '-', 'yes', 11500, 0, 1, 11500, ''),
(1213, '2017-02-08 05:13:40', 170, 'KSU.00410', 'tropical 1lt', '-', 'yes', 13500, 0, 1, 13500, ''),
(1214, '2017-02-08 05:13:54', 492, 'KSU.00410', 'Daia Lemon', '-', 'yes', 14000, 0, 3, 42000, ''),
(1215, '2017-02-08 05:14:45', 368, 'KSU.00411', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 20, 135000, ''),
(1216, '2017-02-08 05:15:07', 156, 'KSU.00411', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 3, 118500, ''),
(1217, '2017-02-08 05:15:51', 54, 'KSU.00412', 'Pepsodent 190', '-', 'yes', 9700, 0, 2, 19400, ''),
(1218, '2017-02-08 05:16:12', 97, 'KSU.00412', 'Shinzui Kirei', '-', 'yes', 3500, 0, 2, 7000, ''),
(1219, '2017-02-08 05:16:15', 98, 'KSU.00412', 'Shinzui Hana', '-', 'yes', 3500, 0, 1, 3500, ''),
(1220, '2017-02-08 05:19:41', 122, 'KSU.00413', 'Sabun Nuvo Merah', '-', 'yes', 2000, 0, 4, 8000, ''),
(1221, '2017-02-08 05:20:00', 118, 'KSU.00413', 'Sabun Nuvo Hijau', '-', 'yes', 2000, 0, 2, 4000, ''),
(1222, '2017-02-08 05:20:10', 119, 'KSU.00413', 'Sabun Nuvo Cool', '-', 'yes', 2000, 0, 4, 8000, ''),
(1223, '2017-02-08 05:21:28', 367, 'KSU.00414', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 8, 104000, ''),
(1224, '2017-02-08 05:22:16', 368, 'KSU.00414', 'Gula pasir 1/2', '-', 'yes', 6750, 250, 14, 94500, ''),
(1225, '2017-02-08 05:23:51', 353, 'KSU.00415', 'Yakult', '-', 'yes', 2000, 0, 2, 4000, ''),
(1226, '2017-02-08 06:18:18', 247, 'KSU.00416', 'Gopek clp', '-', 'yes', 6500, 0, 1, 6500, ''),
(1227, '2017-02-08 06:20:40', 170, 'KSU.00417', 'tropical 1lt', '-', 'yes', 13500, 0, 1, 13500, ''),
(1228, '2017-02-08 06:21:31', 187, 'KSU.00417', 'Bendera Coklat sst', '-', 'yes', 7500, 0, 1, 7500, ''),
(1229, '2017-02-08 06:31:19', 155, 'KSU.00418', 'Beras Premium @2kg', '-', 'yes', 15800, 0, 15, 237000, ''),
(1230, '2017-02-08 06:44:05', 357, 'KSU.00419', 'Djarum 16', '-', 'yes', 20000, 0, 1, 20000, ''),
(1231, '2017-02-08 06:44:16', 367, 'KSU.00419', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 1, 13000, ''),
(1232, '2017-02-08 06:44:26', 186, 'KSU.00419', 'Bendera putih Sst', '-', 'yes', 7500, 0, 1, 7500, ''),
(1233, '2017-02-08 06:44:33', 187, 'KSU.00419', 'Bendera Coklat sst', '-', 'yes', 7500, 0, 1, 7500, ''),
(1234, '2017-02-08 06:44:54', 3, 'KSU.00419', 'Indomie soto', '-', 'yes', 2000, 0, 2, 4000, ''),
(1235, '2017-02-08 06:45:06', 4, 'KSU.00419', 'Indomie Spesial', '-', 'yes', 2000, 0, 3, 6000, ''),
(1236, '2017-02-08 06:46:00', 426, 'KSU.00419', 'Royco ayam', '-', 'yes', 5000, 0, 1, 5000, ''),
(1237, '2017-02-08 06:53:04', 505, 'KSU.00421', 'Floridina', '-', 'yes', 3000, 0, 1, 3000, ''),
(1238, '2017-02-08 07:56:26', 156, 'KSU.00420', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 1, 39500, ''),
(1239, '2017-02-08 07:56:34', 155, 'KSU.00420', 'Beras Premium @2kg', '-', 'yes', 15800, 0, 1, 15800, ''),
(1240, '2017-02-08 08:03:44', 214, 'KSU.00422', 'Aquaria 600', '-', 'yes', 2000, 0, 1, 2000, ''),
(1241, '2017-02-08 08:15:39', 536, 'KSU.00423', 'Beras Anak Terbang', '-', 'yes', 59000, 0, 2, 118000, ''),
(1242, '2017-02-08 08:15:55', 156, 'KSU.00423', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 1, 39500, ''),
(1243, '2017-02-08 08:16:41', 521, 'KSU.00423', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 1, 51000, ''),
(1244, '2017-02-09 02:23:30', 213, 'KSU.00424', 'Aqua 600', '-', 'yes', 2500, 0, 1, 2500, ''),
(1245, '2017-02-09 03:21:59', 156, 'KSU.00425', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 4, 158000, ''),
(1246, '2017-02-09 04:40:02', 214, 'KSU.00426', 'Aquaria 600', '-', 'yes', 2000, 0, 1, 2000, ''),
(1247, '2017-02-09 04:50:54', 175, 'KSU.00427', 'Sanco 2lt', '-', 'yes', 27000, 0, 1, 27000, ''),
(1248, '2017-02-09 04:51:54', 368, 'KSU.00427', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 4, 27000, ''),
(1249, '2017-02-09 04:52:56', 329, 'KSU.00428', 'Multi Travel 70', '-', 'yes', 4500, 0, 1, 4500, ''),
(1250, '2017-02-09 04:53:01', 326, 'KSU.00428', 'Tessa rolingstone  150', '-', 'yes', 4500, 0, 1, 4500, ''),
(1251, '2017-02-09 04:53:06', 543, 'KSU.00428', 'Larutan Badak  Jeruk', '-', 'yes', 5500, 0, 1, 5500, ''),
(1252, '2017-02-09 06:00:34', 156, 'KSU.00429', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 1, 39500, ''),
(1253, '2017-02-09 06:33:00', 156, 'KSU.00430', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 1, 39500, ''),
(1254, '2017-02-09 06:37:55', 521, 'KSU.00431', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 1, 51000, ''),
(1255, '2017-02-09 06:38:04', 500, 'KSU.00431', 'Fortune 2lt', '-', 'yes', 24000, 0, 1, 24000, ''),
(1256, '2017-02-09 06:38:43', 559, 'KSU.00431', 'Sabun Giv Bengkoang', '-', 'yes', 2000, 0, 2, 4000, ''),
(1257, '2017-02-09 06:39:00', 110, 'KSU.00431', 'Sabun Giv Putih', '-', 'yes', 2000, 0, 3, 6000, ''),
(1258, '2017-02-09 06:39:09', 567, 'KSU.00431', 'Sabun Giv Pearl Scrub', '-', 'yes', 2000, 0, 2, 4000, ''),
(1259, '2017-02-09 06:39:23', 236, 'KSU.00431', 'Kopi Luwak 165', '-', 'yes', 9500, 0, 2, 19000, ''),
(1260, '2017-02-09 06:40:00', 31, 'KSU.00431', 'Kecap Lele 680ml', '-', 'yes', 19500, 0, 1, 19500, ''),
(1261, '2017-02-09 06:40:41', 228, 'KSU.00431', 'Top White', '-', 'yes', 10800, 0, 1, 10800, ''),
(1262, '2017-02-09 06:41:37', 510, 'KSU.00431', 'Masako sapi', '-', 'yes', 5000, 0, 1, 5000, ''),
(1263, '2017-02-09 06:41:51', 2, 'KSU.00431', 'Indomie goreng', '-', 'yes', 2200, 0, 4, 8800, ''),
(1264, '2017-02-09 06:42:41', 366, 'KSU.00431', 'Gula jawa 1/2', '-', 'yes', 6500, 0, 1, 6500, ''),
(1265, '2017-02-09 06:47:30', 318, 'KSU.00431', 'Multi 600 gr', '-', 'yes', 19000, 0, 1, 19000, ''),
(1266, '2017-02-09 06:47:44', 465, 'KSU.00431', 'Dandang Biru', '-', 'yes', 3000, 0, 4, 12000, ''),
(1267, '2017-02-09 06:48:02', 251, 'KSU.00431', 'Gopek Kecil', '-', 'yes', 2500, 0, 4, 10000, ''),
(1268, '2017-02-09 06:49:05', 368, 'KSU.00431', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 12, 81000, ''),
(1269, '2017-02-09 06:51:42', 553, 'KSU.00432', 'Energen Jagung', '-', 'yes', 11500, 0, 1, 11500, ''),
(1270, '2017-02-09 06:51:50', 236, 'KSU.00432', 'Kopi Luwak 165', '-', 'yes', 9500, 0, 1, 9500, ''),
(1271, '2017-02-09 06:52:03', 31, 'KSU.00432', 'Kecap Lele 680ml', '-', 'yes', 19500, 0, 1, 19500, ''),
(1272, '2017-02-09 06:52:29', 11, 'KSU.00432', 'Sedap Bakso', '-', 'yes', 2000, 0, 2, 4000, ''),
(1273, '2017-02-09 06:52:44', 187, 'KSU.00432', 'Bendera Coklat sst', '-', 'yes', 7500, 0, 2, 15000, ''),
(1274, '2017-02-09 06:52:56', 186, 'KSU.00432', 'Bendera putih Sst', '-', 'yes', 7500, 0, 2, 15000, ''),
(1275, '2017-02-09 06:53:04', 9, 'KSU.00432', 'Sedap Soto', '-', 'yes', 2000, 0, 1, 2000, ''),
(1276, '2017-02-09 06:53:20', 6, 'KSU.00432', 'Sedap goreng', '-', 'yes', 2200, 0, 5, 11000, ''),
(1277, '2017-02-09 06:53:59', 8, 'KSU.00432', 'SEdap Kari spesial', '-', 'yes', 2000, 0, 2, 4000, ''),
(1278, '2017-02-09 06:55:28', 521, 'KSU.00432', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 1, 51000, ''),
(1279, '2017-02-09 06:57:12', 179, 'KSU.00433', 'Pita merah', '-', 'yes', 7000, 0, 1, 7000, ''),
(1280, '2017-02-09 06:57:17', 345, 'KSU.00433', 'Charm 8', '-', 'yes', 4500, 0, 1, 4500, ''),
(1282, '2017-02-09 07:04:02', 357, 'KSU.00434', 'Djarum 16', '-', 'yes', 20000, 0, 1, 20000, ''),
(1283, '2017-02-09 07:04:43', 238, 'KSU.00434', 'Top Kopi Toraja 165 gr', '-', 'yes', 9500, 0, 1, 9500, ''),
(1284, '2017-02-09 07:05:25', 368, 'KSU.00434', 'Gula pasir 1/2', '-', 'yes', 6750, 250, 2, 13500, ''),
(1285, '2017-02-09 07:09:53', 155, 'KSU.00435', 'Beras Premium @2kg', '-', 'yes', 15800, 0, 1, 15800, ''),
(1286, '2017-02-09 07:15:51', 101, 'KSU.00436', 'Downy Hitam sst', '-', 'yes', 5500, 0, 2, 11000, ''),
(1287, '2017-02-09 07:15:58', 243, 'KSU.00436', 'Poci Vanila Clp', '-', 'yes', 4500, 0, 1, 4500, ''),
(1288, '2017-02-09 07:16:05', 504, 'KSU.00436', 'Coffemic', '-', 'yes', 10700, 0, 1, 10700, ''),
(1289, '2017-02-09 07:16:11', 204, 'KSU.00436', 'Javana', '-', 'yes', 3000, 0, 1, 3000, ''),
(1290, '2017-02-09 07:16:35', 487, 'KSU.00436', 'Frestea Markisa 350 ml', '-', 'yes', 4000, 0, 1, 4000, ''),
(1292, '2017-02-09 07:42:54', 363, 'KSU.00437', 'LA merah', '-', 'yes', 17000, 0, 1, 17000, ''),
(1293, '2017-02-09 07:43:01', 202, 'KSU.00437', 'Sprite 425', '-', 'yes', 4000, 0, 1, 4000, ''),
(1295, '2017-02-09 07:44:40', 3, 'KSU.00438', 'Indomie soto', '-', 'yes', 2000, 0, 1, 2000, ''),
(1296, '2017-02-09 08:40:02', 521, 'KSU.00439', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 1, 51000, ''),
(1297, '2017-02-09 08:41:15', 213, 'KSU.00439', 'Aqua 600', '-', 'yes', 2500, 0, 1, 2500, ''),
(1298, '2017-02-09 08:42:28', 521, 'KSU.00440', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 1, 51000, ''),
(1299, '2017-02-10 02:09:01', 366, 'KSU.00441', 'Gula jawa 1/2', '-', 'yes', 6500, 0, 1, 6500, ''),
(1300, '2017-02-10 02:09:10', 4, 'KSU.00441', 'Indomie Spesial', '-', 'yes', 2000, 0, 2, 4000, ''),
(1301, '2017-02-10 02:09:20', 2, 'KSU.00441', 'Indomie goreng', '-', 'yes', 2200, 0, 4, 8800, ''),
(1302, '2017-02-10 02:09:42', 169, 'KSU.00441', 'Tropical 2lt', '-', 'yes', 24000, 0, 1, 24000, ''),
(1303, '2017-02-10 02:12:15', 33, 'KSU.00442', 'Gudang Garam Filter', '-', 'yes', 15000, 0, 1, 15000, ''),
(1308, '2017-02-10 02:23:28', 33, 'KSU.00443', 'Gudang Garam Filter', '-', 'yes', 15000, 0, 2, 30000, ''),
(1309, '2017-02-10 02:23:47', 365, 'KSU.00443', 'Surya 16', '-', 'yes', 19000, 0, 2, 38000, ''),
(1310, '2017-02-10 02:23:59', 357, 'KSU.00443', 'Djarum 16', '-', 'yes', 20000, 0, 2, 40000, ''),
(1311, '2017-02-10 02:24:13', 537, 'KSU.00443', 'Beras Rejomulyo Sak', '-', 'yes', 255000, 0, 1, 255000, ''),
(1312, '2017-02-10 02:24:22', 521, 'KSU.00443', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 2, 102000, ''),
(1313, '2017-02-10 02:25:21', 510, 'KSU.00443', 'Masako sapi', '-', 'yes', 5000, 0, 3, 15000, ''),
(1314, '2017-02-10 02:25:36', 34, 'KSU.00443', 'Royco Sapi', '-', 'yes', 5000, 0, 1, 5000, ''),
(1315, '2017-02-10 02:28:36', 501, 'KSU.00443', 'Good day chococino', '-', 'yes', 10000, 0, 2, 20000, ''),
(1316, '2017-02-10 02:25:54', 332, 'KSU.00443', 'Kapas Selection', '-', 'yes', 4500, 0, 1, 4500, ''),
(1317, '2017-02-10 02:26:11', 366, 'KSU.00443', 'Gula jawa 1/2', '-', 'yes', 6500, 0, 2, 13000, ''),
(1318, '2017-02-10 02:26:25', 465, 'KSU.00443', 'Dandang Biru', '-', 'yes', 3000, 0, 10, 30000, ''),
(1319, '2017-02-10 02:26:31', 319, 'KSU.00443', 'Multi 250', '-', 'yes', 11000, 0, 1, 11000, ''),
(1320, '2017-02-10 02:26:44', 236, 'KSU.00443', 'Kopi Luwak 165', '-', 'yes', 9500, 0, 1, 9500, ''),
(1321, '2017-02-10 02:26:59', 186, 'KSU.00443', 'Bendera putih Sst', '-', 'yes', 7500, 0, 2, 15000, ''),
(1322, '2017-02-10 02:27:17', 227, 'KSU.00443', 'White Coffe', '-', 'yes', 9500, 0, 3, 28500, ''),
(1323, '2017-02-10 02:27:30', 187, 'KSU.00443', 'Bendera Coklat sst', '-', 'yes', 7500, 0, 2, 15000, ''),
(1324, '2017-02-10 02:27:45', 504, 'KSU.00443', 'Coffemic', '-', 'yes', 10700, 0, 2, 21400, ''),
(1325, '2017-02-10 02:27:51', 230, 'KSU.00443', 'Milo 18 gr', '-', 'yes', 14000, 0, 1, 14000, ''),
(1326, '2017-02-10 02:27:57', 223, 'KSU.00443', 'Good Day Vanila', '-', 'yes', 10000, 0, 1, 10000, ''),
(1327, '2017-02-10 02:28:11', 225, 'KSU.00443', 'Good Day Mocacino', '-', 'yes', 10000, 0, 1, 10000, ''),
(1328, '2017-02-10 02:28:18', 222, 'KSU.00443', 'Good Day Carrebian', '-', 'yes', 10000, 0, 1, 10000, ''),
(1329, '2017-02-10 02:28:24', 224, 'KSU.00443', 'Good Day Coolin', '-', 'yes', 10000, 0, 1, 10000, ''),
(1330, '2017-02-10 02:28:29', 538, 'KSU.00443', 'Good day White Frape', '-', 'yes', 10000, 0, 1, 10000, ''),
(1331, '2017-02-10 02:30:04', 368, 'KSU.00444', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 20, 135000, ''),
(1332, '2017-02-10 02:30:23', 510, 'KSU.00444', 'Masako sapi', '-', 'yes', 5000, 0, 1, 5000, ''),
(1333, '2017-02-10 02:30:49', 508, 'KSU.00444', 'kecap lele sst', '-', 'yes', 18500, 0, 3, 55500, ''),
(1334, '2017-02-10 02:30:55', 522, 'KSU.00444', 'Kapur Barus Dahlia', '-', 'yes', 11000, 0, 1, 11000, ''),
(1335, '2017-02-10 02:31:01', 293, 'KSU.00444', 'Rexona Putri biru', '-', 'yes', 16000, 0, 1, 16000, ''),
(1336, '2017-02-10 02:31:08', 491, 'KSU.00444', 'Daia Softener Pink', '-', 'yes', 14000, 0, 1, 14000, ''),
(1337, '2017-02-10 02:31:18', 513, 'KSU.00444', 'Mama Lemon kuning 800', '-', 'yes', 12500, 0, 1, 12500, ''),
(1338, '2017-02-10 02:31:26', 135, 'KSU.00444', 'So klin lantai hijau 800ml', '-', 'yes', 9000, 0, 1, 9000, ''),
(1339, '2017-02-10 02:31:37', 131, 'KSU.00444', 'Sabun Dettol Active 105gr', '-', 'yes', 5000, 0, 2, 10000, ''),
(1340, '2017-02-10 02:31:45', 136, 'KSU.00444', 'So klin lantai ungu 800ml', '-', 'yes', 9000, 0, 1, 9000, ''),
(1341, '2017-02-10 02:32:06', 429, 'KSU.00444', 'Mia atom bulan', '-', 'yes', 4500, 0, 4, 18000, ''),
(1342, '2017-02-10 02:32:41', 179, 'KSU.00444', 'Pita merah', '-', 'yes', 7000, 0, 6, 42000, ''),
(1343, '2017-02-10 02:34:35', 507, 'KSU.00445', 'Kecap lele 340', '-', 'yes', 10500, 0, 1, 10500, ''),
(1344, '2017-02-10 02:47:45', 501, 'KSU.00447', 'Good day chococino', '-', 'yes', 10000, 0, 1, 10000, ''),
(1345, '2017-02-10 02:50:49', 236, 'KSU.00446', 'Kopi Luwak 165', '-', 'yes', 9500, 0, 1, 9500, ''),
(1346, '2017-02-10 02:50:57', 297, 'KSU.00446', 'Hers Protex 8', '-', 'yes', 2418, 0, 1, 2418, ''),
(1347, '2017-02-10 02:51:08', 521, 'KSU.00446', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 1, 51000, ''),
(1348, '2017-02-10 02:54:45', 4, 'KSU.00448', 'Indomie Spesial', '-', 'yes', 2000, 0, 3, 6000, ''),
(1349, '2017-02-10 03:00:46', 155, 'KSU.00449', 'Beras Premium @2kg', '-', 'yes', 15800, 0, 1, 15800, ''),
(1350, '2017-02-10 03:12:58', 247, 'KSU.00450', 'Gopek clp', '-', 'yes', 6500, 0, 1, 6500, ''),
(1351, '2017-02-10 03:52:41', 369, 'KSU.00451', 'Sampoerna Mild 16', '-', 'yes', 19000, 0, 1, 19000, ''),
(1352, '2017-02-10 04:03:05', 356, 'KSU.00452', 'Djarum 12', '-', 'yes', 15500, 0, 1, 15500, ''),
(1353, '2017-02-10 04:03:24', 203, 'KSU.00452', 'Fanta 425', '-', 'yes', 4000, 0, 1, 4000, ''),
(1354, '2017-02-10 04:31:56', 206, 'KSU.00453', 'Iso Plus', '-', 'yes', 3000, 0, 1, 3000, ''),
(1356, '2017-02-10 05:00:00', 501, 'KSU.00454', 'Good day chococino', '-', 'yes', 10000, 0, 1, 10000, ''),
(1357, '2017-02-10 05:00:16', 122, 'KSU.00454', 'Sabun Nuvo Merah', '-', 'yes', 2000, 0, 1, 2000, ''),
(1358, '2017-02-10 05:02:14', 229, 'KSU.00455', 'Top Kopi Susu', '-', 'yes', 10800, 0, 1, 10800, ''),
(1359, '2017-02-10 05:02:21', 505, 'KSU.00455', 'Floridina', '-', 'yes', 3000, 0, 1, 3000, ''),
(1361, '2017-02-10 05:45:39', 214, 'KSU.00456', 'Aquaria 600', '-', 'yes', 2000, 0, 1, 2000, ''),
(1362, '2017-02-10 06:06:37', 457, 'KSU.00457', 'Dji Samsoe', '-', 'yes', 14500, 0, 1, 14500, ''),
(1363, '2017-02-10 06:07:03', 562, 'KSU.00457', 'GG Mild', '-', 'yes', 14500, 0, 1, 14500, ''),
(1364, '2017-02-10 06:13:59', 416, 'KSU.00458', 'Aqua 1.5', '-', 'yes', 5000, 500, 12, 60000, ''),
(1365, '2017-02-10 06:14:57', 319, 'KSU.00458', 'Multi 250', '-', 'yes', 11000, 0, 1, 11000, ''),
(1366, '2017-02-10 06:15:15', 338, 'KSU.00458', 'Sedap Cup soto', '-', 'yes', 5000, 0, 2, 10000, ''),
(1367, '2017-02-10 06:15:26', 230, 'KSU.00458', 'Milo 18 gr', '-', 'yes', 14000, 0, 1, 14000, ''),
(1368, '2017-02-10 06:19:22', 214, 'KSU.00459', 'Aquaria 600', '-', 'yes', 2000, 0, 1, 2000, ''),
(1369, '2017-02-10 07:42:51', 215, 'KSU.00461', 'Ades 600', '-', 'yes', 3000, 0, 1, 3000, ''),
(1370, '2017-02-10 07:43:27', 323, 'KSU.00462', 'Multi Biru Refil', '-', 'yes', 6500, 0, 1, 6500, ''),
(1371, '2017-02-10 07:44:03', 105, 'KSU.00462', 'Soklin Liquid sst Parfum', '-', 'yes', 2500, 0, 2, 5000, ''),
(1372, '2017-02-10 07:44:09', 175, 'KSU.00462', 'Sanco 2lt', '-', 'yes', 27000, 0, 1, 27000, ''),
(1373, '2017-02-10 07:48:58', 389, 'KSU.00463', 'Panadol Merah', '-', 'yes', 1000, 0, 2, 2000, ''),
(1374, '2017-02-10 07:49:14', 394, 'KSU.00464', 'Vic Vorup', '-', 'yes', 6500, 0, 1, 6500, ''),
(1375, '2017-02-10 07:49:32', 213, 'KSU.00464', 'Aqua 600', '-', 'yes', 2500, 0, 1, 2500, ''),
(1376, '2017-02-10 07:51:13', 105, 'KSU.00465', 'Soklin Liquid sst Parfum', '-', 'yes', 2500, 0, 1, 2500, ''),
(1377, '2017-02-10 07:51:31', 520, 'KSU.00465', 'Daia Softener Pink sst', '-', 'yes', 5200, 0, 1, 5200, ''),
(1378, '2017-02-10 07:52:15', 278, 'KSU.00465', 'Rexona sst Men', '-', 'yes', 2000, 0, 2, 4000, ''),
(1379, '2017-02-10 07:53:58', 521, 'KSU.00466', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 2, 102000, ''),
(1380, '2017-02-10 07:54:21', 490, 'KSU.00466', 'Beras Maknyus', '-', 'yes', 65000, 0, 1, 65000, ''),
(1382, '2017-02-10 08:03:10', 369, 'KSU.00467', 'Sampoerna Mild 16', '-', 'yes', 19000, 0, 2, 38000, ''),
(1383, '2017-02-10 08:03:50', 492, 'KSU.00468', 'Daia Lemon', '-', 'yes', 14000, 0, 1, 14000, ''),
(1384, '2017-02-10 08:04:07', 494, 'KSU.00468', 'Daia Bunga 800', '-', 'yes', 14000, 0, 4, 56000, ''),
(1385, '2017-02-10 08:04:13', 491, 'KSU.00468', 'Daia Softener Pink', '-', 'yes', 14000, 0, 1, 14000, ''),
(1386, '2017-02-10 08:04:20', 513, 'KSU.00468', 'Mama Lemon kuning 800', '-', 'yes', 12500, 0, 2, 25000, ''),
(1387, '2017-02-10 08:04:36', 175, 'KSU.00468', 'Sanco 2lt', '-', 'yes', 27000, 0, 2, 54000, ''),
(1388, '2017-02-10 08:05:29', 345, 'KSU.00468', 'Charm 8', '-', 'yes', 4500, 0, 1, 4500, ''),
(1389, '2017-02-10 08:05:32', 303, 'KSU.00468', 'Laurier maxi 30', '-', 'yes', 11000, 0, 1, 11000, ''),
(1390, '2017-02-11 01:57:01', 362, 'KSU.00469', 'Malboro Merah', '-', 'yes', 22000, 0, 1, 22000, ''),
(1391, '2017-02-11 01:57:53', 33, 'KSU.00470', 'Gudang Garam Filter', '-', 'yes', 15000, 0, 1, 15000, ''),
(1392, '2017-02-11 01:58:03', 213, 'KSU.00470', 'Aqua 600', '-', 'yes', 2500, 0, 1, 2500, ''),
(1393, '2017-02-11 01:59:15', 369, 'KSU.00471', 'Sampoerna Mild 16', '-', 'yes', 19000, 0, 1, 19000, ''),
(1394, '2017-02-11 02:00:34', 355, 'KSU.00472', 'Korek kayu', '-', 'yes', 500, 0, 1, 500, ''),
(1395, '2017-02-11 02:24:37', 365, 'KSU.00473', 'Surya 16', '-', 'yes', 19000, 0, 1, 19000, ''),
(1396, '2017-02-11 02:51:46', 156, 'KSU.00474', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 5, 197500, ''),
(1397, '2017-02-11 03:19:03', 154, 'KSU.00475', 'Beras Pak tani @5kg', '-', 'yes', 60000, 0, 3, 180000, ''),
(1398, '2017-02-11 03:19:15', 486, 'KSU.00475', 'Boom Merah', '-', 'yes', 5000, 0, 1, 5000, ''),
(1399, '2017-02-11 03:19:58', 169, 'KSU.00475', 'Tropical 2lt', '-', 'yes', 24000, 0, 1, 24000, ''),
(1400, '2017-02-11 03:20:04', 170, 'KSU.00475', 'tropical 1lt', '-', 'yes', 13500, 0, 1, 13500, ''),
(1401, '2017-02-11 03:20:12', 97, 'KSU.00475', 'Shinzui Kirei', '-', 'yes', 3500, 0, 2, 7000, ''),
(1402, '2017-02-11 03:20:52', 182, 'KSU.00475', 'tepung beras 500g', '-', 'yes', 6000, 0, 3, 18000, ''),
(1403, '2017-02-11 03:20:55', 247, 'KSU.00475', 'Gopek clp', '-', 'yes', 6500, 0, 1, 6500, ''),
(1404, '2017-02-11 03:21:10', 507, 'KSU.00475', 'Kecap lele 340', '-', 'yes', 10500, 0, 1, 10500, ''),
(1405, '2017-02-11 03:21:19', 368, 'KSU.00475', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 3, 20250, ''),
(1406, '2017-02-11 04:12:24', 214, 'KSU.00476', 'Aquaria 600', '-', 'yes', 2000, 0, 1, 2000, ''),
(1407, '2017-02-11 04:15:37', 214, 'KSU.00477', 'Aquaria 600', '-', 'yes', 2000, 0, 1, 2000, ''),
(1408, '2017-02-11 05:08:20', 484, 'KSU.00479', 'Sunlig Jeruk Nipis 800', '-', 'yes', 14500, 0, 2, 29000, ''),
(1409, '2017-02-11 05:08:47', 170, 'KSU.00479', 'tropical 1lt', '-', 'yes', 13500, 1500, 6, 81000, ''),
(1410, '2017-02-11 05:09:12', 500, 'KSU.00479', 'Fortune 2lt', '-', 'yes', 24000, 1000, 2, 48000, ''),
(1411, '2017-02-11 05:13:52', 536, 'KSU.00480', 'Beras Anak Terbang', '-', 'yes', 59000, 0, 2, 118000, ''),
(1412, '2017-02-11 05:14:00', 540, 'KSU.00480', 'Mie Goreng ayam pedes limau', '-', 'yes', 2000, 0, 4, 8000, ''),
(1413, '2017-02-11 05:14:06', 466, 'KSU.00480', 'Bendera Gold sst', '-', 'yes', 10500, 0, 1, 10500, ''),
(1414, '2017-02-11 05:18:33', 154, 'KSU.00481', 'Beras Pak tani @5kg', '-', 'yes', 60000, 0, 1, 60000, ''),
(1415, '2017-02-11 05:18:39', 121, 'KSU.00481', 'Sabun Nuvo Caring', '-', 'yes', 2000, 0, 1, 2000, ''),
(1416, '2017-02-11 05:18:44', 120, 'KSU.00481', 'Sabun Nuvo Kuning', '-', 'yes', 2000, 0, 1, 2000, ''),
(1417, '2017-02-11 05:18:49', 118, 'KSU.00481', 'Sabun Nuvo Hijau', '-', 'yes', 2000, 0, 1, 2000, ''),
(1418, '2017-02-11 05:18:54', 122, 'KSU.00481', 'Sabun Nuvo Merah', '-', 'yes', 2000, 0, 1, 2000, ''),
(1419, '2017-02-11 05:19:02', 119, 'KSU.00481', 'Sabun Nuvo Cool', '-', 'yes', 2000, 0, 1, 2000, ''),
(1420, '2017-02-11 05:19:54', 170, 'KSU.00481', 'tropical 1lt', '-', 'yes', 13500, 0, 1, 13500, ''),
(1421, '2017-02-11 06:29:59', 362, 'KSU.00482', 'Malboro Merah', '-', 'yes', 22000, 0, 2, 44000, ''),
(1422, '2017-02-11 06:29:21', 369, 'KSU.00482', 'Sampoerna Mild 16', '-', 'yes', 19000, 0, 1, 19000, ''),
(1423, '2017-02-11 06:29:45', 355, 'KSU.00482', 'Korek kayu', '-', 'yes', 500, 0, 4, 2000, ''),
(1424, '2017-02-13 02:59:16', 213, 'KSU.00483', 'Aqua 600', '-', 'yes', 2500, 0, 1, 2500, ''),
(1425, '2017-02-13 03:00:23', 213, 'KSU.00484', 'Aqua 600', '-', 'yes', 2500, 0, 1, 2500, ''),
(1426, '2017-02-13 03:16:53', 213, 'KSU.00485', 'Aqua 600', '-', 'yes', 2500, 0, 1, 2500, ''),
(1427, '2017-02-13 03:17:57', 154, 'KSU.00486', 'Beras Pak tani @5kg', '-', 'yes', 60000, 0, 2, 120000, ''),
(1432, '2017-02-13 03:36:37', 8, 'KSU.00487', 'SEdap Kari spesial', '-', 'yes', 2000, 0, 5, 10000, ''),
(1433, '2017-02-13 03:37:05', 9, 'KSU.00487', 'Sedap Soto', '-', 'yes', 2000, 0, 5, 10000, ''),
(1434, '2017-02-13 03:38:42', 237, 'KSU.00487', 'Top Kopi Murni 165 gr', '-', 'yes', 9500, 0, 1, 9500, ''),
(1435, '2017-02-13 03:38:52', 238, 'KSU.00487', 'Top Kopi Toraja 165 gr', '-', 'yes', 9500, 0, 1, 9500, ''),
(1436, '2017-02-13 03:39:04', 23, 'KSU.00487', 'Sardine Extra Pedas K', '-', 'yes', 7500, 0, 1, 7500, ''),
(1437, '2017-02-13 03:40:27', 461, 'KSU.00487', 'Casablanca Kaleng Femme 100', '-', 'yes', 18000, 0, 1, 18000, ''),
(1438, '2017-02-13 03:40:58', 257, 'KSU.00487', 'Parfum Putri Orange rose', '-', 'yes', 15000, 0, 1, 15000, ''),
(1439, '2017-02-13 03:43:25', 328, 'KSU.00488', 'Tessa Top Brand', '-', 'yes', 3000, 0, 1, 3000, ''),
(1440, '2017-02-13 03:46:31', 179, 'KSU.00489', 'Pita merah', '-', 'yes', 7000, 0, 1, 7000, ''),
(1441, '2017-02-13 03:46:41', 182, 'KSU.00489', 'tepung beras 500g', '-', 'yes', 6000, 0, 1, 6000, ''),
(1442, '2017-02-13 03:48:51', 473, 'KSU.00490', 'Blue Band 200 gr', '-', 'yes', 7000, 300, 1, 7000, ''),
(1443, '2017-02-13 03:49:08', 368, 'KSU.00490', 'Gula pasir 1/2', '-', 'yes', 6750, 250, 4, 27000, ''),
(1444, '2017-02-13 03:49:20', 2, 'KSU.00490', 'Indomie goreng', '-', 'yes', 2200, 0, 5, 11000, ''),
(1445, '2017-02-13 03:49:36', 4, 'KSU.00490', 'Indomie Spesial', '-', 'yes', 2000, 0, 5, 10000, ''),
(1446, '2017-02-13 03:50:14', 521, 'KSU.00490', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 3, 153000, ''),
(1447, '2017-02-13 03:50:26', 156, 'KSU.00490', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 2, 79000, ''),
(1448, '2017-02-13 03:50:36', 155, 'KSU.00490', 'Beras Premium @2kg', '-', 'yes', 15800, 0, 1, 15800, ''),
(1449, '2017-02-13 04:21:49', 505, 'KSU.00491', 'Floridina', '-', 'yes', 3000, 0, 1, 3000, ''),
(1450, '2017-02-13 04:22:42', 154, 'KSU.00492', 'Beras Pak tani @5kg', '-', 'yes', 60000, 0, 3, 180000, ''),
(1451, '2017-02-13 04:23:45', 368, 'KSU.00492', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 4, 27000, ''),
(1452, '2017-02-13 04:28:51', 35, 'KSU.00493', 'Masako Ayam', '-', 'yes', 5000, 0, 1, 5000, ''),
(1453, '2017-02-13 04:28:57', 54, 'KSU.00493', 'Pepsodent 190', '-', 'yes', 9700, 0, 1, 9700, ''),
(1454, '2017-02-13 04:36:48', 521, 'KSU.00494', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 1, 51000, ''),
(1455, '2017-02-13 04:37:25', 486, 'KSU.00494', 'Boom Merah', '-', 'yes', 5000, 0, 2, 10000, ''),
(1456, '2017-02-13 04:40:06', 223, 'KSU.00495', 'Good Day Vanila', '-', 'yes', 10000, 0, 1, 10000, ''),
(1457, '2017-02-13 04:40:16', 159, 'KSU.00495', 'Mama Lemon Anti Bacteri 800ml', '-', 'yes', 13500, 0, 1, 13500, ''),
(1458, '2017-02-13 04:40:32', 123, 'KSU.00495', 'Sabun Lifboy biru', '-', 'yes', 3000, 0, 3, 9000, ''),
(1459, '2017-02-13 04:40:42', 124, 'KSU.00495', 'Sabun Lifboy merah', '-', 'yes', 3000, 0, 2, 6000, ''),
(1460, '2017-02-13 04:40:47', 146, 'KSU.00495', 'Sampo pantene Sst biru', '-', 'yes', 9500, 0, 1, 9500, ''),
(1461, '2017-02-13 04:40:56', 180, 'KSU.00495', 'Tepung Ketan', '-', 'yes', 7500, 0, 2, 15000, ''),
(1462, '2017-02-13 04:41:13', 182, 'KSU.00495', 'tepung beras 500g', '-', 'yes', 6000, 0, 3, 18000, ''),
(1463, '2017-02-13 04:41:20', 185, 'KSU.00495', 'Susu Kaleng coklat', '-', 'yes', 9500, 0, 1, 9500, ''),
(1464, '2017-02-13 04:41:33', 36, 'KSU.00495', 'Magic Lezat', '-', 'yes', 3000, 0, 2, 6000, ''),
(1465, '2017-02-13 04:41:48', 10, 'KSU.00495', 'Sedap AB', '-', 'yes', 2000, 0, 5, 10000, ''),
(1466, '2017-02-13 04:42:04', 6, 'KSU.00495', 'Sedap goreng', '-', 'yes', 2200, 0, 3, 6600, ''),
(1467, '2017-02-13 04:42:18', 2, 'KSU.00495', 'Indomie goreng', '-', 'yes', 2200, 0, 5, 11000, ''),
(1468, '2017-02-13 04:44:08', 496, 'KSU.00495', 'Ciptadent Cool Mint 75', '-', 'yes', 2800, 0, 2, 5600, ''),
(1469, '2017-02-13 04:50:46', 368, 'KSU.00496', 'Gula pasir 1/2', '-', 'yes', 6750, 250, 1, 6750, ''),
(1471, '2017-02-13 04:52:25', 212, 'KSU.00497', 'Frestea  Jasmine Melati 500ml', '-', 'yes', 5500, 0, 3, 16500, ''),
(1472, '2017-02-13 04:56:53', 6, 'KSU.00498', 'Sedap goreng', '-', 'yes', 2200, 0, 15, 33000, ''),
(1473, '2017-02-13 04:57:01', 4, 'KSU.00498', 'Indomie Spesial', '-', 'yes', 2000, 0, 5, 10000, ''),
(1474, '2017-02-13 04:57:10', 8, 'KSU.00498', 'SEdap Kari spesial', '-', 'yes', 2000, 0, 5, 10000, ''),
(1475, '2017-02-13 04:57:29', 37, 'KSU.00498', 'Garam Halus', '-', 'yes', 1700, 0, 4, 6800, ''),
(1478, '2017-02-13 04:58:39', 101, 'KSU.00498', 'Downy Hitam sst', '-', 'yes', 5500, 0, 3, 16500, ''),
(1479, '2017-02-13 04:58:50', 237, 'KSU.00498', 'Top Kopi Murni 165 gr', '-', 'yes', 9500, 0, 2, 19000, ''),
(1480, '2017-02-13 04:59:00', 462, 'KSU.00498', 'ABC saus Tomat 135 ml', '-', 'yes', 6000, 0, 2, 12000, ''),
(1481, '2017-02-13 04:59:06', 235, 'KSU.00498', 'Energen Vanila', '-', 'yes', 11500, 0, 1, 11500, ''),
(1482, '2017-02-13 04:59:11', 233, 'KSU.00498', 'Energen Kc Ijo', '-', 'yes', 11500, 0, 1, 11500, ''),
(1483, '2017-02-13 04:59:17', 553, 'KSU.00498', 'Energen Jagung', '-', 'yes', 11500, 0, 1, 11500, ''),
(1484, '2017-02-13 04:59:24', 510, 'KSU.00498', 'Masako sapi', '-', 'yes', 5000, 0, 1, 5000, ''),
(1485, '2017-02-13 04:59:44', 537, 'KSU.00498', 'Beras Rejomulyo Sak', '-', 'yes', 255000, 0, 1, 255000, ''),
(1486, '2017-02-13 05:04:55', 487, 'KSU.00499', 'Frestea Markisa 350 ml', '-', 'yes', 4000, 0, 1, 4000, ''),
(1489, '2017-02-13 05:52:52', 155, 'KSU.00500', 'Beras Premium @2kg', '-', 'yes', 15800, 0, 1, 15800, ''),
(1490, '2017-02-13 05:53:57', 487, 'KSU.00500', 'Frestea Markisa 350 ml', '-', 'yes', 4000, 0, 1, 4000, ''),
(1491, '2017-02-13 06:31:07', 227, 'KSU.00501', 'White Coffe', '-', 'yes', 9500, 0, 1, 9500, ''),
(1492, '2017-02-13 06:31:44', 222, 'KSU.00501', 'Good Day Carrebian', '-', 'yes', 10000, 0, 1, 10000, ''),
(1493, '2017-02-13 06:31:56', 187, 'KSU.00501', 'Bendera Coklat sst', '-', 'yes', 7500, 0, 1, 7500, ''),
(1494, '2017-02-13 06:32:14', 368, 'KSU.00501', 'Gula pasir 1/2', '-', 'yes', 6750, 250, 2, 13500, ''),
(1495, '2017-02-13 06:32:45', 501, 'KSU.00501', 'Good day chococino', '-', 'yes', 10000, 0, 1, 10000, ''),
(1496, '2017-02-13 06:34:16', 237, 'KSU.00502', 'Top Kopi Murni 165 gr', '-', 'yes', 9500, 0, 1, 9500, ''),
(1497, '2017-02-13 06:34:40', 238, 'KSU.00502', 'Top Kopi Toraja 165 gr', '-', 'yes', 9500, 0, 1, 9500, ''),
(1499, '2017-02-13 06:55:23', 484, 'KSU.00503', 'Sunlig Jeruk Nipis 800', '-', 'yes', 14500, 1000, 1, 14500, ''),
(1500, '2017-02-13 06:55:51', 159, 'KSU.00503', 'Mama Lemon Anti Bacteri 800ml', '-', 'yes', 13500, 1000, 1, 13500, ''),
(1501, '2017-02-13 06:56:25', 368, 'KSU.00503', 'Gula pasir 1/2', '-', 'yes', 6750, 250, 4, 27000, ''),
(1503, '2017-02-13 06:57:32', 169, 'KSU.00503', 'Tropical 2lt', '-', 'yes', 24000, 1000, 2, 48000, ''),
(1504, '2017-02-13 06:58:05', 521, 'KSU.00503', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 1, 51000, ''),
(1505, '2017-02-13 07:19:36', 33, 'KSU.00504', 'Gudang Garam Filter', '-', 'yes', 15000, 0, 1, 15000, ''),
(1506, '2017-02-13 07:22:29', 156, 'KSU.00505', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 4, 158000, ''),
(1507, '2017-02-13 07:26:29', 355, 'KSU.00506', 'Korek kayu', '-', 'yes', 500, 0, 1, 500, ''),
(1508, '2017-02-13 07:54:55', 155, 'KSU.00507', 'Beras Premium @2kg', '-', 'yes', 15800, 0, 2, 31600, ''),
(1509, '2017-02-13 07:55:14', 156, 'KSU.00507', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 1, 39500, ''),
(1510, '2017-02-13 07:56:04', 521, 'KSU.00507', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 1, 51000, ''),
(1511, '2017-02-13 08:05:14', 424, 'KSU.00508', 'Aquaria 1.5', '-', 'yes', 4000, 0, 2, 8000, ''),
(1512, '2017-02-13 08:11:00', 236, 'KSU.00509', 'Kopi Luwak 165', '-', 'yes', 9500, 0, 1, 9500, ''),
(1513, '2017-02-13 08:26:31', 505, 'KSU.00510', 'Floridina', '-', 'yes', 3000, 0, 1, 3000, ''),
(1514, '2017-02-14 02:31:22', 372, 'KSU.00512', 'Signatur', '-', 'yes', 13000, 0, 1, 13000, ''),
(1515, '2017-02-14 03:11:08', 511, 'KSU.00513', 'Antangin ', '-', 'yes', 2000, 0, 6, 12000, ''),
(1516, '2017-02-14 03:23:37', 193, 'KSU.00514', 'Susu zee Putih sst', '-', 'yes', 3000, 0, 6, 18000, ''),
(1517, '2017-02-14 03:33:49', 505, 'KSU.00515', 'Floridina', '-', 'yes', 3000, 0, 1, 3000, ''),
(1518, '2017-02-14 03:34:48', 155, 'KSU.00516', 'Beras Premium @2kg', '-', 'yes', 15800, 0, 2, 31600, ''),
(1519, '2017-02-14 03:51:49', 368, 'KSU.00517', 'Gula pasir 1/2', '-', 'yes', 6750, 250, 1, 6750, ''),
(1521, '2017-02-14 04:01:50', 332, 'KSU.00518', 'Kapas Selection', '-', 'yes', 4500, 0, 1, 4500, ''),
(1522, '2017-02-14 04:29:45', 521, 'KSU.00519', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 2, 102000, ''),
(1523, '2017-02-14 05:19:27', 59, 'KSU.00521', 'Formula 75', '-', 'yes', 7000, 0, 1, 7000, ''),
(1524, '2017-02-14 05:19:48', 555, 'KSU.00521', 'Sampo Dove Dandruff Care', '-', 'yes', 10000, 0, 1, 10000, ''),
(1525, '2017-02-14 06:34:34', 381, 'KSU.00522', 'Paramex', '-', 'yes', 2500, 0, 1, 2500, ''),
(1527, '2017-02-14 06:49:04', 213, 'KSU.00523', 'Aqua 600', '-', 'yes', 2500, 0, 1, 2500, ''),
(1528, '2017-02-14 06:58:41', 368, 'KSU.00524', 'Gula pasir 1/2', '-', 'yes', 6750, 250, 2, 13500, ''),
(1529, '2017-02-14 06:59:10', 357, 'KSU.00524', 'Djarum 16', '-', 'yes', 20000, 0, 1, 20000, ''),
(1530, '2017-02-14 07:00:24', 366, 'KSU.00525', 'Gula jawa 1/2', '-', 'yes', 6500, 0, 1, 6500, ''),
(1532, '2017-02-14 07:02:45', 361, 'KSU.00526', '76 kretek', '-', 'yes', 11800, 500, 5, 59000, ''),
(1533, '2017-02-14 07:03:05', 378, 'KSU.00526', 'Sampoerna Kretek', '-', 'yes', 11000, 500, 5, 55000, ''),
(1535, '2017-02-14 08:08:39', 368, 'KSU.00527', 'Gula pasir 1/2', '-', 'yes', 6750, 250, 20, 135000, ''),
(1536, '2017-02-14 08:08:55', 155, 'KSU.00527', 'Beras Premium @2kg', '-', 'yes', 15800, 0, 4, 63200, ''),
(1537, '2017-02-14 08:24:29', 377, 'KSU.00528', 'Tuton Filter', '-', 'yes', 8000, 0, 1, 8000, ''),
(1538, '2017-02-14 08:24:34', 559, 'KSU.00528', 'Sabun Giv Bengkoang', '-', 'yes', 2000, 0, 1, 2000, ''),
(1539, '2017-02-14 08:30:58', 213, 'KSU.00530', 'Aqua 600', '-', 'yes', 2500, 0, 1, 2500, ''),
(1540, '2017-02-14 08:55:26', 213, 'KSU.00531', 'Aqua 600', '-', 'yes', 2500, 0, 1, 2500, ''),
(1541, '2017-02-14 08:55:34', 487, 'KSU.00531', 'Frestea Markisa 350 ml', '-', 'yes', 4000, 0, 1, 4000, ''),
(1542, '2017-02-14 08:55:51', 356, 'KSU.00531', 'Djarum 12', '-', 'yes', 15500, 0, 1, 15500, ''),
(1543, '2017-02-16 02:29:55', 156, 'KSU.00531', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 4, 158000, ''),
(1544, '2017-02-16 02:41:05', 156, 'KSU.00532', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 5, 197500, ''),
(1545, '2017-02-16 02:50:56', 124, 'KSU.00529', 'Sabun Lifboy merah', '-', 'yes', 3000, 0, 2, 6000, ''),
(1546, '2017-02-16 02:50:59', 125, 'KSU.00529', 'Sabun Lifboy Hijau', '-', 'yes', 3000, 0, 1, 3000, ''),
(1547, '2017-02-16 02:52:33', 367, 'KSU.00533', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 2, 26000, ''),
(1548, '2017-02-16 03:02:47', 33, 'KSU.00534', 'Gudang Garam Filter', '-', 'yes', 15000, 0, 1, 15000, ''),
(1549, '2017-02-16 03:09:51', 521, 'KSU.00535', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 5, 255000, ''),
(1550, '2017-02-16 03:10:07', 555, 'KSU.00535', 'Sampo Dove Dandruff Care', '-', 'yes', 10000, 0, 2, 20000, ''),
(1551, '2017-02-16 03:10:18', 318, 'KSU.00535', 'Multi 600 gr', '-', 'yes', 19000, 0, 1, 19000, ''),
(1552, '2017-02-16 03:10:36', 272, 'KSU.00535', 'Sunslik coundisener 70', '-', 'yes', 9500, 0, 1, 9500, ''),
(1553, '2017-02-16 03:11:20', 156, 'KSU.00536', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 4, 158000, ''),
(1554, '2017-02-16 03:18:52', 236, 'KSU.00537', 'Kopi Luwak 165', '-', 'yes', 9500, 0, 1, 9500, ''),
(1556, '2017-02-16 03:19:16', 473, 'KSU.00537', 'Blue Band 200 gr', '-', 'yes', 7000, 0, 1, 7000, ''),
(1557, '2017-02-16 03:19:25', 37, 'KSU.00537', 'Garam Halus', '-', 'yes', 1700, 0, 2, 3400, ''),
(1558, '2017-02-16 03:36:20', 395, 'KSU.00538', 'Balsem Kaki tiga', '-', 'yes', 10000, 0, 1, 10000, ''),
(1559, '2017-02-16 04:24:38', 362, 'KSU.00539', 'Malboro Merah', '-', 'yes', 22000, 0, 1, 22000, ''),
(1560, '2017-02-16 04:24:53', 4, 'KSU.00539', 'Indomie Spesial', '-', 'yes', 2000, 0, 3, 6000, ''),
(1561, '2017-02-16 04:25:04', 179, 'KSU.00539', 'Pita merah', '-', 'yes', 7000, 0, 1, 7000, ''),
(1562, '2017-02-16 04:25:10', 505, 'KSU.00539', 'Floridina', '-', 'yes', 3000, 0, 1, 3000, ''),
(1563, '2017-02-16 04:25:25', 86, 'KSU.00539', 'Elips vitamin', '-', 'yes', 8000, 0, 1, 8000, ''),
(1564, '2017-02-16 04:26:10', 2, 'KSU.00539', 'Indomie goreng', '-', 'yes', 2200, 0, 2, 4400, ''),
(1565, '2017-02-16 04:29:26', 377, 'KSU.00540', 'Tuton Filter', '-', 'yes', 8000, 0, 2, 16000, ''),
(1566, '2017-02-16 04:34:37', 367, 'KSU.00541', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 3, 39000, ''),
(1567, '2017-02-16 04:34:47', 236, 'KSU.00541', 'Kopi Luwak 165', '-', 'yes', 9500, 0, 2, 19000, ''),
(1568, '2017-02-16 04:35:13', 510, 'KSU.00541', 'Masako sapi', '-', 'yes', 5000, 0, 1, 5000, ''),
(1569, '2017-02-16 04:35:26', 213, 'KSU.00541', 'Aqua 600', '-', 'yes', 2500, 0, 1, 2500, ''),
(1570, '2017-02-16 04:35:48', 557, 'KSU.00541', 'Sabun Citra 80g Lulur Pearly white', '-', 'yes', 2000, 0, 3, 6000, ''),
(1571, '2017-02-16 04:36:16', 521, 'KSU.00541', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 1, 51000, ''),
(1572, '2017-02-16 04:36:43', 181, 'KSU.00541', 'Tepung beras 200gr', '-', 'yes', 3000, 0, 1, 3000, ''),
(1573, '2017-02-16 04:37:18', 170, 'KSU.00541', 'tropical 1lt', '-', 'yes', 13500, 0, 2, 27000, ''),
(1574, '2017-02-16 04:37:38', 372, 'KSU.00542', 'Signatur', '-', 'yes', 13000, 0, 2, 26000, ''),
(1575, '2017-02-16 04:41:48', 43, 'KSU.00543', 'Kingkong', '-', 'yes', 4000, 0, 1, 4000, ''),
(1576, '2017-02-16 04:48:12', 367, 'KSU.00544', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 50, 650000, ''),
(1578, '2017-02-16 04:55:43', 481, 'KSU.00545', 'Molto Anri Bacteri', '-', 'yes', 5500, 0, 1, 5500, ''),
(1579, '2017-02-16 04:55:50', 160, 'KSU.00545', 'Sabun So klin softergen ungu 800gr', '-', 'yes', 15000, 0, 1, 15000, ''),
(1580, '2017-02-16 05:29:06', 372, 'KSU.00546', 'Signatur', '-', 'yes', 13000, 0, 1, 13000, ''),
(1581, '2017-02-16 05:40:09', 213, 'KSU.00547', 'Aqua 600', '-', 'yes', 2500, 0, 1, 2500, ''),
(1582, '2017-02-16 05:40:57', 391, 'KSU.00548', 'Neosep', '-', 'yes', 2500, 0, 1, 2500, ''),
(1583, '2017-02-16 05:50:49', 416, 'KSU.00549', 'Aqua 1.5', '-', 'yes', 5000, 0, 1, 5000, ''),
(1584, '2017-02-16 06:11:59', 213, 'KSU.00550', 'Aqua 600', '-', 'yes', 2500, 0, 3, 7500, ''),
(1585, '2017-02-16 06:12:12', 425, 'KSU.00550', 'Aqua 330ml', '-', 'yes', 2000, 0, 1, 2000, ''),
(1586, '2017-02-16 06:12:20', 242, 'KSU.00550', 'Pulpy Orange', '-', 'yes', 6000, 0, 2, 12000, ''),
(1587, '2017-02-16 06:13:50', 505, 'KSU.00551', 'Floridina', '-', 'yes', 3000, 0, 1, 3000, ''),
(1588, '2017-02-16 06:59:19', 357, 'KSU.00552', 'Djarum 16', '-', 'yes', 20000, 0, 1, 20000, ''),
(1589, '2017-02-16 06:59:32', 186, 'KSU.00552', 'Bendera putih Sst', '-', 'yes', 7500, 0, 1, 7500, ''),
(1590, '2017-02-16 06:59:42', 187, 'KSU.00552', 'Bendera Coklat sst', '-', 'yes', 7500, 0, 1, 7500, ''),
(1591, '2017-02-16 06:59:58', 368, 'KSU.00552', 'Gula pasir 1/2', '-', 'yes', 6750, 250, 2, 13500, ''),
(1592, '2017-02-16 07:00:11', 179, 'KSU.00552', 'Pita merah', '-', 'yes', 7000, 0, 2, 14000, ''),
(1593, '2017-02-16 07:01:09', 151, 'KSU.00552', 'Sampo Zinc Sst biru', '-', 'yes', 2900, 0, 1, 2900, ''),
(1594, '2017-02-16 07:33:41', 367, 'KSU.00553', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 1, 13000, ''),
(1595, '2017-02-16 07:34:31', 169, 'KSU.00553', 'Tropical 2lt', '-', 'yes', 24000, 0, 1, 24000, ''),
(1596, '2017-02-16 07:34:50', 4, 'KSU.00553', 'Indomie Spesial', '-', 'yes', 2000, 0, 1, 2000, ''),
(1597, '2017-02-16 07:34:53', 5, 'KSU.00553', 'Indomie ayam bawang', '-', 'yes', 2000, 0, 1, 2000, ''),
(1598, '2017-02-16 07:35:17', 3, 'KSU.00553', 'Indomie soto', '-', 'yes', 2000, 0, 2, 4000, ''),
(1599, '2017-02-16 07:35:35', 2, 'KSU.00553', 'Indomie goreng', '-', 'yes', 2200, 0, 1, 2200, ''),
(1600, '2017-02-16 07:36:24', 521, 'KSU.00553', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 1, 51000, ''),
(1601, '2017-02-16 07:56:52', 337, 'KSU.00554', 'Hers Protex Wing 5', '-', 'yes', 3000, 0, 2, 6000, ''),
(1602, '2017-02-16 08:40:38', 213, 'KSU.00555', 'Aqua 600', '-', 'yes', 2500, 0, 1, 2500, ''),
(1603, '2017-02-17 03:03:33', 156, 'KSU.00556', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 5, 197500, ''),
(1604, '2017-02-17 03:15:22', 521, 'KSU.00557', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 2, 102000, ''),
(1605, '2017-02-17 03:20:59', 156, 'KSU.00558', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 1, 39500, ''),
(1606, '2017-02-17 03:36:43', 439, 'KSU.00559', 'Beras Organik', '-', 'yes', 67500, 0, 1, 67500, ''),
(1607, '2017-02-17 03:36:53', 353, 'KSU.00559', 'Yakult', '-', 'yes', 2000, 0, 1, 2000, ''),
(1608, '2017-02-17 03:49:08', 215, 'KSU.00560', 'Ades 600', '-', 'yes', 3000, 0, 1, 3000, ''),
(1609, '2017-02-17 04:16:03', 123, 'KSU.00561', 'Sabun Lifboy biru', '-', 'yes', 3000, 0, 3, 9000, ''),
(1610, '2017-02-17 04:16:20', 124, 'KSU.00561', 'Sabun Lifboy merah', '-', 'yes', 3000, 0, 2, 6000, ''),
(1611, '2017-02-17 04:16:28', 113, 'KSU.00561', 'Sabun Lux biru', '-', 'yes', 3500, 0, 1, 3500, ''),
(1612, '2017-02-17 04:16:43', 114, 'KSU.00561', 'Sabun Lux putih', '-', 'yes', 3500, 0, 2, 7000, ''),
(1613, '2017-02-17 04:16:54', 560, 'KSU.00561', 'Sabun Lux Hijau', '-', 'yes', 3500, 0, 2, 7000, ''),
(1614, '2017-02-17 04:17:17', 31, 'KSU.00561', 'Kecap Lele 680ml', '-', 'yes', 19500, 0, 1, 19500, ''),
(1615, '2017-02-17 04:17:31', 182, 'KSU.00561', 'tepung beras 500g', '-', 'yes', 6000, 0, 2, 12000, ''),
(1616, '2017-02-17 04:17:56', 368, 'KSU.00561', 'Gula pasir 1/2', '-', 'yes', 6750, 0, 6, 40500, ''),
(1617, '2017-02-17 04:18:04', 367, 'KSU.00561', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 2, 26000, ''),
(1618, '2017-02-17 04:18:34', 521, 'KSU.00561', 'Beras Rejo Mulya @5kg', '-', 'yes', 51000, 0, 1, 51000, ''),
(1619, '2017-02-17 04:18:58', 211, 'KSU.00562', 'Frestea Madu 500', '-', 'yes', 5500, 0, 1, 5500, ''),
(1620, '2017-02-17 04:31:30', 323, 'KSU.00563', 'Multi Biru Refil', '-', 'yes', 6500, 0, 1, 6500, ''),
(1621, '2017-02-17 04:31:39', 181, 'KSU.00563', 'Tepung beras 200gr', '-', 'yes', 3000, 0, 2, 6000, ''),
(1622, '2017-02-17 04:32:38', 169, 'KSU.00564', 'Tropical 2lt', '-', 'yes', 24000, 0, 1, 24000, ''),
(1623, '2017-02-17 04:32:53', 156, 'KSU.00564', 'Beras Premium @5kg', '-', 'yes', 39500, 0, 1, 39500, ''),
(1624, '2017-02-17 04:45:43', 353, 'KSU.00565', 'Yakult', '-', 'yes', 2000, 0, 1, 2000, ''),
(1625, '2017-02-17 04:56:59', 192, 'KSU.00566', 'Susu zee Coklat sst', '-', 'yes', 3000, 0, 6, 18000, ''),
(1626, '2017-02-17 05:01:58', 211, 'KSU.00567', 'Frestea Madu 500', '-', 'yes', 5500, 0, 1, 5500, ''),
(1627, '2017-02-17 05:14:38', 316, 'KSU.00568', 'Seprei No.1', '-', 'yes', 225000, 0, 2, 450000, ''),
(1628, '2017-02-17 05:20:10', 369, 'KSU.00569', 'Sampoerna Mild 16', '-', 'yes', 19000, 0, 1, 19000, ''),
(1629, '2017-02-17 05:27:53', 214, 'KSU.00570', 'Aquaria 600', '-', 'yes', 2000, 0, 1, 2000, ''),
(1630, '2017-02-17 05:31:33', 2, 'KSU.00571', 'Indomie goreng', '-', 'yes', 2200, 0, 5, 11000, ''),
(1631, '2017-02-17 05:32:05', 4, 'KSU.00571', 'Indomie Spesial', '-', 'yes', 2000, 0, 5, 10000, ''),
(1632, '2017-02-17 05:32:23', 97, 'KSU.00571', 'Shinzui Kirei', '-', 'yes', 3500, 0, 2, 7000, ''),
(1633, '2017-02-17 05:32:30', 54, 'KSU.00571', 'Pepsodent 190', '-', 'yes', 9700, 0, 1, 9700, ''),
(1634, '2017-02-17 05:32:42', 367, 'KSU.00571', 'Gula Pasir 1kg', '-', 'yes', 13000, 0, 1, 13000, ''),
(1635, '2017-02-17 05:32:51', 160, 'KSU.00571', 'Sabun So klin softergen ungu 800gr', '-', 'yes', 15000, 0, 1, 15000, ''),
(1636, '2017-02-17 05:33:01', 170, 'KSU.00571', 'tropical 1lt', '-', 'yes', 13500, 0, 1, 13500, ''),
(1637, '2017-02-17 06:13:46', 181, 'KSU.00572', 'Tepung beras 200gr', '-', 'yes', 3000, 0, 1, 3000, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pelanggan`
--

CREATE TABLE `tbl_pelanggan` (
  `id` int(11) NOT NULL,
  `id_grup_pelanggan` int(11) NOT NULL,
  `tgl_simpan` datetime NOT NULL,
  `tgl_modif` datetime NOT NULL,
  `kode` varchar(160) COLLATE utf8_unicode_ci NOT NULL,
  `nama` varchar(360) COLLATE utf8_unicode_ci NOT NULL,
  `no_hp` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8_unicode_ci NOT NULL,
  `status_pesan` enum('1','2','3') COLLATE utf8_unicode_ci NOT NULL,
  `status_plgn` enum('umum','pelanggan') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_pelanggan`
--

INSERT INTO `tbl_pelanggan` (`id`, `id_grup_pelanggan`, `tgl_simpan`, `tgl_modif`, `kode`, `nama`, `no_hp`, `alamat`, `status_pesan`, `status_plgn`) VALUES
(1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'PLGN.00000', 'Umum', 'Umum', 'Umum', '', 'umum');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pelanggan_grup`
--

CREATE TABLE `tbl_pelanggan_grup` (
  `id` int(11) NOT NULL,
  `tgl_simpan` datetime NOT NULL,
  `tgl_modif` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `grup` varchar(160) NOT NULL,
  `margin` float NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pelanggan_grup`
--

INSERT INTO `tbl_pelanggan_grup` (`id`, `tgl_simpan`, `tgl_modif`, `grup`, `margin`, `keterangan`) VALUES
(1, '2016-11-25 00:00:00', '2016-12-04 11:42:42', 'Umum', 0, 'Grup pelanggan Umum');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pemasukan`
--

CREATE TABLE `tbl_pemasukan` (
  `id_pemasukan` int(5) NOT NULL,
  `tgl` datetime NOT NULL,
  `kode` varchar(160) NOT NULL,
  `pemasukan` varchar(160) NOT NULL,
  `jumlah` int(100) NOT NULL,
  `nominal` int(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pemasukan`
--

INSERT INTO `tbl_pemasukan` (`id_pemasukan`, `tgl`, `kode`, `pemasukan`, `jumlah`, `nominal`) VALUES
(10, '2017-02-03 16:02:33', 'PM.00001', 'Pemasukan', 0, 5000000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pembelian`
--

CREATE TABLE `tbl_pembelian` (
  `id` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `tgl_simpan` datetime NOT NULL,
  `tgl_modif` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `no_nota` varchar(160) NOT NULL,
  `kode` varchar(160) NOT NULL,
  `nama` varchar(160) NOT NULL,
  `jml` int(11) NOT NULL,
  `gtotal` decimal(13,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_pembelian`
--

INSERT INTO `tbl_pembelian` (`id`, `id_supplier`, `tgl_simpan`, `tgl_modif`, `no_nota`, `kode`, `nama`, `jml`, `gtotal`) VALUES
(1, 0, '2017-01-02 14:41:18', '2017-01-02 14:41:18', '01', '', 'Rokok', 0, '3150000.0000'),
(2, 0, '2017-01-10 15:18:19', '2017-01-10 15:18:19', '001', '', 'knkn', 0, '600000.0000'),
(3, 0, '2017-01-20 14:06:22', '2017-01-20 14:06:22', '014203', '', 'PT. HM Sampoerna', 0, '163800.0000'),
(4, 0, '2017-01-21 10:17:00', '2017-01-21 10:17:00', '949-0052639', '', 'CV. Wahyu Jaya Genuk', 0, '6229450.0000'),
(5, 0, '2017-01-21 10:21:29', '2017-01-21 10:21:29', '20012017', '', 'Djarum', 0, '881250.0000'),
(6, 0, '2017-01-23 11:22:45', '2017-01-23 11:22:45', '01 Iwan', '', 'Iwan', 0, '25660000.0000'),
(7, 0, '2017-01-23 12:08:02', '2017-01-23 12:08:02', '01 Giant', '', 'PT. Hero supermarket Tbk', 0, '2342000.0000'),
(8, 0, '2017-01-24 09:58:31', '2017-01-24 09:58:31', '01 susu', '', 'Susu Gomars', 0, '720000.0000'),
(9, 0, '2017-01-24 10:06:14', '2017-01-24 10:06:14', 'B.01', '', 'Beras', 0, '365985000.0000'),
(10, 0, '2017-01-25 09:25:37', '2017-01-25 09:25:37', 'ID69000718', '', 'Asmo Semarang', 0, '370000.0000'),
(11, 0, '2017-01-25 10:04:31', '2017-01-25 10:04:31', '02 Iwan', '', 'Iwan2', 0, '3291000.0000'),
(12, 0, '2017-01-25 10:09:49', '2017-01-25 10:09:49', 'A 296254', '', 'PT Kartini Teh Nasional', 0, '2115000.0000'),
(13, 0, '2017-01-30 12:03:36', '2017-01-30 12:03:36', '001 asinan', '', 'Beras Organik', 0, '27000000.0000'),
(14, 0, '2017-02-01 11:16:19', '2017-02-01 11:16:19', '9732077-CCOD', '', 'PT. Fastronic Makmur Sentosa', 0, '1640400.0000'),
(15, 0, '2017-02-01 11:32:00', '2017-02-01 11:32:00', '02 Giant', '', 'Gulaku', 0, '953600.0000'),
(16, 0, '2017-02-01 11:34:57', '2017-02-01 11:34:57', '01 antoni', '', '', 0, '5071500.0000'),
(17, 0, '2017-02-01 11:41:34', '2017-02-01 11:41:34', '001A', '', '', 0, '950000.0000'),
(18, 0, '2017-02-06 14:08:01', '2017-02-06 07:08:01', '02 Antoni', '', 'Sumur', 0, '11318200.0000'),
(19, 0, '2017-02-07 10:59:13', '2017-02-07 03:59:13', '03 Iwan', '', 'Toko Iwan Gayamsari', 0, '105992900.0000'),
(20, 0, '2017-02-07 11:51:16', '2017-02-07 04:51:16', '004 Iwan', '', 'Toko Iwan Gayamsari', 0, '5398500.0000'),
(21, 0, '2017-02-07 14:19:21', '2017-02-07 07:19:21', '05 Iwan', '', 'Toko Iwan Gayamsari', 0, '2815200.0000'),
(22, 0, '2017-02-08 14:26:55', '2017-02-08 07:26:55', '262781', '', 'PT Surya', 0, '1115000.0000'),
(23, 0, '2017-02-08 14:28:44', '2017-02-08 07:28:44', '02 Asinan', '', 'Beras asinan', 0, '304000000.0000'),
(24, 0, '2017-02-08 14:49:53', '2017-02-08 07:49:53', '01 Return ', '', 'Zaedun', 0, '8000.0000'),
(25, 0, '2017-02-09 09:44:48', '2017-02-09 02:44:48', 'A302186', '', 'PT Kartini Teh Nasional', 0, '940000.0000'),
(26, 0, '2017-02-09 09:47:11', '2017-02-09 02:47:11', '01 Juned', '', 'Kecap Lele', 0, '4303300.0000'),
(27, 0, '2017-02-09 11:30:09', '2017-02-09 04:30:09', '115177', '', 'PT. Intidaya Rajawali Mulya ( Wings )', 0, '6484136.0000'),
(28, 0, '2017-02-14 14:07:49', '2017-02-14 07:07:49', '03 Juned', '', 'Gula Jawa', 0, '276750000.0000'),
(29, 0, '2017-02-14 14:10:06', '2017-02-14 07:10:06', '01 Diah', '', '', 0, '8172000.0000'),
(30, 0, '2017-02-14 14:12:14', '2017-02-14 07:12:14', 'Diah', '', '', 0, '2041200.0000'),
(31, 0, '2017-02-14 14:17:14', '2017-02-14 07:17:14', '000000001', '', '', 0, '6319600.0000');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pembelian_det`
--

CREATE TABLE `tbl_pembelian_det` (
  `id` int(11) NOT NULL,
  `id_satuan` int(11) NOT NULL,
  `no_nota` varchar(160) NOT NULL,
  `kode` varchar(160) NOT NULL,
  `produk` text NOT NULL,
  `qty` double NOT NULL,
  `harga` int(11) NOT NULL,
  `satuan` varchar(50) CHARACTER SET latin1 NOT NULL,
  `konversi` double NOT NULL,
  `ket` text CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_pembelian_det`
--

INSERT INTO `tbl_pembelian_det` (`id`, `id_satuan`, `no_nota`, `kode`, `produk`, `qty`, `harga`, `satuan`, `konversi`, `ket`) VALUES
(1, 3, '01', '8998989100120', 'Gudang Garam Filter', 15, 210000, '', 0, ''),
(2, 3, '001', '089686010947', 'Indomie goreng', 12, 50000, '', 0, ''),
(3, 3, '014203', '8999909000346', 'U bold', 2, 21000, '', 0, ''),
(4, 3, '014203', '8999909982000', 'Sampoerna Mild 12', 2, 24400, '', 0, ''),
(5, 3, '014203', '8999909096004', 'Sampoerna Mild 16', 2, 36500, '', 0, ''),
(6, 3, '949-0052639', '8886008101053', 'Aqua 600', 48, 78700, '', 0, ''),
(7, 3, '949-0052639', '8886008101091', 'Aqua 1.5', 24, 79400, '', 0, ''),
(8, 3, '949-0052639', 'Aqua Gelas', 'Aqua Gelas', 5, 109250, '', 0, ''),
(9, 3, '20012017', '8991906101026', 'Djarum 16', 5, 93250, '', 0, ''),
(10, 3, '20012017', '8991906101361', 'Rokok MLD', 5, 83000, '', 0, ''),
(11, 3, '01 Iwan', '089686010947', 'Indomie goreng', 80, 162000, '', 0, ''),
(12, 3, '01 Iwan', '089686010046', 'Indomie Spesial', 80, 156000, '', 0, ''),
(13, 3, '01 Iwan', '8992753101207', 'Susu Kaleng Kental manis', 5, 44000, '', 0, ''),
(14, 4, '01 Giant', '8998225800043', 'Fortune 2lt', 10, 199000, '', 0, ''),
(15, 3, '01 Giant', '8999999034153', 'Blue Band 200 gr', 8, 44000, '', 0, ''),
(16, 3, '01 susu', '8997021405599', 'Susu Gomars Vanila', 6, 120000, '', 0, ''),
(17, 3, 'B.01', 'pr2', 'Beras Premium @2kg', 25, 385000, '', 0, ''),
(18, 5, 'B.01', 'Beras RM', 'Beras Rejo Mulya @5kg', 74, 3515000, '', 0, ''),
(19, 3, 'B.01', 'pr5', 'Beras Premium @5kg', 50, 1925000, '', 0, ''),
(20, 3, 'ID69000718', '8998181941132', 'Dunhil Hitam', 5, 74000, '', 0, ''),
(21, 3, '02 Iwan', '8991002103337', 'Good Day Vanila', 5, 46300, '', 0, ''),
(22, 3, '02 Iwan', '8991002103931', 'Good Day Carrebian', 5, 46300, '', 0, ''),
(23, 3, '02 Iwan', '8991002103436', 'Good Day Coolin', 5, 46300, '', 0, ''),
(24, 3, '02 Iwan', '8991002103238', 'Good Day Mocacino', 5, 46300, '', 0, ''),
(25, 3, '02 Iwan', '8991906101019', 'Djarum 12', 10, 145000, '', 0, ''),
(26, 3, '02 Iwan', '8994171101289', 'White Coffe', 10, 91500, '', 0, ''),
(27, 3, 'A 296254', '8994286110015', 'Dandang Biru', 30, 70500, '', 0, ''),
(28, 3, '001 asinan', 'Beras Organik', 'Beras Organik', 20, 1350000, '', 0, ''),
(29, 3, '9732077-CCOD', 'FB', 'Frestea beleng', 24, 40000, '', 0, ''),
(30, 3, '9732077-CCOD', '8992761122324', 'Frestea  Jasmine Melati 500ml', 12, 56700, '', 0, ''),
(31, 3, '02 Giant', '8995177101112', 'Gulaku Hijau 1000 gr', 8, 119200, '', 0, ''),
(32, 3, '01 antoni', '8992946121012', 'tropical 1lt', 21, 241500, '', 0, ''),
(33, 3, '001A', '8991002103832', 'Good day chococino', 10, 95000, '', 0, ''),
(34, 3, '02 Antoni', '089686010947', 'Indomie goreng', 54, 105300, '', 0, ''),
(35, 3, '02 Antoni', '8992946121029', 'Tropical 2lt', 16, 352000, '', 0, ''),
(36, 3, '03 Iwan', '8997001240035', 'Pita merah', 40, 256000, '', 0, ''),
(37, 3, '03 Iwan', '8993118936557', 'Beras Maknyus', 10, 620000, '', 0, ''),
(38, 3, '03 Iwan', 'beras anak terbang', 'Beras Anak Terbang', 10, 552500, '', 0, ''),
(39, 3, '03 Iwan', '8991906101019', 'Djarum 12', 40, 580000, '', 0, ''),
(40, 3, '03 Iwan', '8991906101026', 'Djarum 16', 30, 564000, '', 0, ''),
(41, 3, '03 Iwan', '8999909096004', 'Sampoerna Mild 16', 10, 182500, '', 0, ''),
(42, 3, '03 Iwan', '8991906101071', 'LA hijau', 10, 168000, '', 0, ''),
(43, 3, '03 Iwan', '76164217', 'Malboro Merah', 10, 204500, '', 0, ''),
(44, 3, '03 Iwan', '8993587518889', 'Tuton Filter', 10, 75700, '', 0, ''),
(45, 3, '03 Iwan', '8998989300155', 'Signatur', 10, 123700, '', 0, ''),
(46, 3, '03 Iwan', '8994171101043', 'Kopi Luwak 165', 15, 131250, '', 0, ''),
(47, 3, '03 Iwan', '8996001440087', 'Energen Kc Ijo', 1, 10650, '', 0, ''),
(48, 3, '03 Iwan', '8996001440049', 'Energen Coklat', 7, 74550, '', 0, ''),
(49, 3, '03 Iwan', '8996001440124', 'Energen Vanila', 2, 21300, '', 0, ''),
(50, 3, '03 Iwan', '8994171101289', 'White Coffe', 20, 181500, '', 0, ''),
(51, 3, '03 Iwan', '8992770033178', 'Masako Ayam', 16, 71000, '', 0, ''),
(52, 3, '03 Iwan', '8992770033185', 'Masako sapi', 16, 71000, '', 0, ''),
(53, 3, '03 Iwan', '8999999707835', 'Close Up 65', 12, 66000, '', 0, ''),
(54, 3, '03 Iwan', '8993371100146', 'Jahe Wangi', 10, 75000, '', 0, ''),
(55, 3, '03 Iwan', '9311931024036', 'Coffemic', 20, 193400, '', 0, ''),
(56, 3, '03 Iwan', '8993093135006', 'Tepung Ketan', 20, 139000, '', 0, ''),
(57, 3, '03 Iwan', '8993093115008', 'tepung beras 500g', 20, 108000, '', 0, ''),
(58, 3, '03 Iwan', '8992753031900', 'Bendera putih Sst', 40, 260000, '', 0, ''),
(59, 3, '03 Iwan', '8992753102303', 'Bendera Coklat sst', 20, 130000, '', 0, ''),
(60, 3, '03 Iwan', '8992753101207', 'Susu Kaleng Kental manis', 10, 88000, '', 0, ''),
(61, 3, '03 Iwan', '8998181941132', 'Dunhil Hitam', 5, 74250, '', 0, ''),
(62, 3, '03 Iwan', '8992772122245', 'Ademsari', 48, 69100, '', 0, ''),
(63, 3, '004 Iwan', '8994144100202', 'Gopek clp', 10, 61000, '', 0, ''),
(64, 3, '004 Iwan', '8992946512223', 'Shinzui Hana', 6, 18200, '', 0, ''),
(65, 3, '004 Iwan', '8992946512285', 'Shinzui Kirei', 30, 91000, '', 0, ''),
(66, 3, '004 Iwan', '8999999036638', 'Sabun Lux putih', 18, 48800, '', 0, ''),
(67, 3, '004 Iwan', '8999999036607', 'Sabun Lux Pink', 18, 48800, '', 0, ''),
(68, 3, '004 Iwan', '8886007811113', 'Poci Vanila Clp', 5, 19250, '', 0, ''),
(69, 3, '004 Iwan', '8886007811410', 'Poci Asli Clp', 5, 19250, '', 0, ''),
(70, 3, '05 Iwan', '4902430563864', 'Sampo pantene Sst biru', 10, 89000, '', 0, ''),
(71, 3, '05 Iwan', '8999999057190', 'Molto Anri Bacteri', 4, 18800, '', 0, ''),
(72, 2, '05 Iwan', '4902430504454', 'Downy Hitam sst', 20, 92500, '', 0, ''),
(73, 3, '262781', '8998989100120', 'Gudang Garam Filter', 5, 71000, '', 0, ''),
(74, 3, '262781', '8998989110167', 'Surya 16', 5, 91500, '', 0, ''),
(75, 3, '262781', '8998989300391', 'Surya Pro', 5, 60500, '', 0, ''),
(76, 5, '02 Asinan', 'Beras RM', 'Beras Rejo Mulya @5kg', 80, 3800000, '', 0, ''),
(77, 3, '01 Return ', '8999999036676', 'Sabun Lux biru', 1, 2600, '', 0, ''),
(78, 3, '01 Return ', '8999999036607', 'Sabun Lux Pink', 1, 2600, '', 0, ''),
(79, 3, '01 Return ', '8993560024116', 'Sabun Dettol sensitive 65gr', 1, 2800, '', 0, ''),
(80, 3, 'A302186', '8994286110015', 'Dandang Biru', 20, 47000, '', 0, ''),
(81, 3, '01 Juned', 'kecap lele 340', 'Kecap lele 340', 9, 83700, '', 0, ''),
(82, 3, '01 Juned', 'k3', 'Kecap Lele 680ml', 10, 180000, '', 0, ''),
(83, 3, '01 Juned', 'kecap lele sst', 'kecap lele sst', 10, 175000, '', 0, ''),
(84, 3, '115177', '8998866200646', 'Top Kopi Murni 165 gr', 3, 25800, '', 0, ''),
(85, 3, '115177', '8998866201520', 'Top Kopi Toraja 165 gr', 3, 25800, '', 0, ''),
(86, 3, '115177', '8998866500708', 'Floridina', 24, 57000, '', 0, ''),
(87, 3, '115177', '8998866610377', 'Iso Plus', 12, 27000, '', 0, ''),
(88, 3, '115177', '8998866602570', 'Sabun Nuvo Kuning', 24, 40200, '', 0, ''),
(89, 3, '115177', '8998866608305', 'Sabun Giv Bengkoang', 24, 40200, '', 0, ''),
(90, 3, '115177', '8998866607872', 'Ekonomi', 30, 51000, '', 0, ''),
(91, 3, '115177', '8998866679602', 'So klin lantai hijau 800ml', 3, 25194, '', 0, ''),
(92, 3, '115177', '8998866200837', 'Sedap Cup soto', 3, 10078, '', 0, ''),
(93, 3, '115177', '8998866601788', 'WPC biru', 2, 17560, '', 0, ''),
(94, 3, '115177', '8998866200561', 'Ekomie', 12, 86400, '', 0, ''),
(95, 3, '03 Juned', 'Gula pasir 1kg', 'Gula Pasir 1kg', 150, 1845000, '', 0, ''),
(96, 3, '01 Diah', '8886008101053', 'Aqua 600', 72, 113500, '', 0, ''),
(97, 3, 'Diah', '8992761122331', 'Frestea Apel 500', 12, 56700, '', 0, ''),
(98, 3, 'Diah', '8992761122430', 'Frestea Madu 500', 12, 56700, '', 0, ''),
(99, 3, 'Diah', '8992761122324', 'Frestea  Jasmine Melati 500ml', 12, 56700, '', 0, ''),
(100, 3, '000000001', '8998866803694', 'Sabun So klin softergen ungu 800gr', 14, 168000, '', 0, ''),
(101, 3, '000000001', '8998866607315', 'Sabun So klin softergen pink 800gr', 14, 168000, '', 0, ''),
(102, 3, '000000001', '8992946121012', 'tropical 1lt', 2, 23000, '', 0, ''),
(103, 3, '000000001', '8999999390198', 'Sunlig Jeruk Nipis 800', 12, 130800, '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pengaturan`
--

CREATE TABLE `tbl_pengaturan` (
  `id_pengaturan` int(3) NOT NULL,
  `website` varchar(100) NOT NULL,
  `judul` varchar(500) NOT NULL,
  `deskripsi` varchar(768) NOT NULL,
  `string_plgn` varchar(160) NOT NULL,
  `string_nota` varchar(320) NOT NULL,
  `string_nota_bottom` varchar(160) NOT NULL,
  `string_nota_bottom2` varchar(160) NOT NULL,
  `string_nota_footer` varchar(40) NOT NULL,
  `alamat` varchar(300) NOT NULL,
  `email` varchar(360) NOT NULL,
  `pesan` text NOT NULL,
  `tlp` varchar(160) NOT NULL,
  `fax` varchar(160) NOT NULL,
  `logo` longtext NOT NULL,
  `fb` varchar(160) NOT NULL,
  `gplus` varchar(160) NOT NULL,
  `twit` varchar(160) NOT NULL,
  `ppn` int(11) NOT NULL,
  `ymket` varchar(160) NOT NULL,
  `bbket` varchar(160) NOT NULL,
  `print_method` enum('not_set','directly','network') NOT NULL,
  `print_os` varchar(800) NOT NULL,
  `print_driver` varchar(360) NOT NULL,
  `print_name` varchar(800) NOT NULL,
  `print_ip` varchar(160) NOT NULL,
  `print_port` varchar(160) NOT NULL,
  `status_potong_stok` enum('1','0') NOT NULL,
  `id_satuan` int(11) NOT NULL,
  `id_mata_uang` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pengaturan`
--

INSERT INTO `tbl_pengaturan` (`id_pengaturan`, `website`, `judul`, `deskripsi`, `string_plgn`, `string_nota`, `string_nota_bottom`, `string_nota_bottom2`, `string_nota_footer`, `alamat`, `email`, `pesan`, `tlp`, `fax`, `logo`, `fb`, `gplus`, `twit`, `ppn`, `ymket`, `bbket`, `print_method`, `print_os`, `print_driver`, `print_name`, `print_ip`, `print_port`, `status_potong_stok`, `id_satuan`, `id_mata_uang`) VALUES
(1, 'http://localhost/resto/', 'UKM \"KENCANA MULYA\"', 'Kami adalah produsen tas dan aksesoris National Geographic terbaik di Indonesia yang berlokasi di Jawa Tengah, Semarang.\n\nKami memberikan jaminan kepuasan barang untuk memastikan konsumen-konsumen kami mendapatkan yang terbaik dari NGSPECIALIST.\n\nHubungi kami di:\n085883086838 (Call, SMS, Whatsapp)\nNGSPECIALIST (Line)\n57374ef4 (BBM)', 'PLGN', 'KSU', 'Terima Kasih ', 'Ditunggu Kedatangannya Kembali', 'Cashier', 'Jl. Kijang Utara No. 79 Gayamsari', '', 'Produsen Tas National Geographic Terbaik di Indonesia', 'Tlp. 0821-3208-2233', '021-5555555', '', '', '', '', 0, '', '', 'directly', 'Windows XP', 'EPSON TM-U220 Receipt', 'EPSON TM-U220 Receipt', '192.168.1.128', '9100', '1', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pengaturan_mata_uang`
--

CREATE TABLE `tbl_pengaturan_mata_uang` (
  `id` int(11) NOT NULL,
  `mata_uang` varchar(32) NOT NULL,
  `sep` varchar(16) NOT NULL,
  `ket` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pengaturan_mata_uang`
--

INSERT INTO `tbl_pengaturan_mata_uang` (`id`, `mata_uang`, `sep`, `ket`) VALUES
(1, 'Rp', '. ', 'Rupiah'),
(2, '$', '', 'USD'),
(3, 'Rs', ' ', 'SGD');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pengeluaran`
--

CREATE TABLE `tbl_pengeluaran` (
  `id` int(5) NOT NULL,
  `tgl` datetime NOT NULL,
  `kode` varchar(160) NOT NULL,
  `pengeluaran` varchar(160) NOT NULL,
  `jumlah` int(100) NOT NULL,
  `nominal` int(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pengeluaran`
--

INSERT INTO `tbl_pengeluaran` (`id`, `tgl`, `kode`, `pengeluaran`, `jumlah`, `nominal`) VALUES
(5, '2017-02-03 00:00:00', 'PG.00001', 'Beban Transport', 0, 1191000),
(6, '2017-02-03 00:00:00', 'PG.00002', 'Beban Gaji', 0, 20250000),
(7, '2017-02-03 00:00:00', 'PG.00003', 'Beban Penyusutan', 0, 204167),
(8, '2017-02-03 00:00:00', 'PG.00004', 'Beban Pemeliharaan', 0, 1019000),
(9, '2017-02-03 00:00:00', 'PG.00005', 'Beban ATK', 0, 117250),
(10, '2017-02-03 00:00:00', 'PG.00006', 'Beban Bunga', 0, 6000000),
(12, '0000-00-00 00:00:00', 'PG.00007', 'Beban Operasional', 0, 9593822),
(13, '2017-02-03 00:00:00', 'PG.00008', 'Beban Konsumsi', 0, 8500),
(14, '2017-02-03 00:00:00', 'PG.00009', 'Beban Amortisasi', 0, 800000),
(15, '2017-02-03 00:00:00', 'PG.00010', 'PPTT', 0, 800000),
(16, '2017-02-03 00:00:00', 'PG.00011', 'Beban Lainnya', 0, 88019);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_piutang`
--

CREATE TABLE `tbl_piutang` (
  `id` int(5) NOT NULL,
  `tgl_simpan` date NOT NULL,
  `kode` varchar(160) NOT NULL,
  `piutang` varchar(160) NOT NULL,
  `jumlah` int(100) NOT NULL,
  `nominal` int(100) NOT NULL,
  `status_piutang` enum('0','1') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_piutang`
--

INSERT INTO `tbl_piutang` (`id`, `tgl_simpan`, `kode`, `piutang`, `jumlah`, `nominal`, `status_piutang`) VALUES
(9, '2017-02-03', '00001', 'Piutang Dagang', 0, 56422900, '0'),
(10, '2017-02-03', '00002', 'Piutang Lainnya', 0, 36553459, '0');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_printer`
--

CREATE TABLE `tbl_printer` (
  `id` int(11) NOT NULL,
  `ip` varchar(160) COLLATE utf8_unicode_ci NOT NULL,
  `print_os` varchar(160) COLLATE utf8_unicode_ci NOT NULL,
  `print_driver` varchar(160) COLLATE utf8_unicode_ci NOT NULL,
  `print_name` varchar(160) COLLATE utf8_unicode_ci NOT NULL,
  `print_port` int(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sessions_back`
--

CREATE TABLE `tbl_sessions_back` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sessions_back`
--

INSERT INTO `tbl_sessions_back` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('75087b968a2acac543820c9952166e01', '192.168.0.2', 'Mozilla/5.0 (Windows NT 5.1; rv:50.0) Gecko/20100101 Firefox/50.0', 1487057575, 'a:6:{s:9:\"user_data\";s:0:\"\";s:8:\"identity\";s:13:\"administrator\";s:8:\"username\";s:13:\"administrator\";s:5:\"email\";s:15:\"admin@admin.com\";s:7:\"user_id\";s:1:\"1\";s:14:\"old_last_login\";s:10:\"1487055665\";}'),
('f601f29817de32ff010c3d3484281c61', '192.168.0.2', 'Mozilla/5.0 (Windows NT 5.1; rv:50.0) Gecko/20100101 Firefox/50.0', 1487218225, 'a:7:{s:9:\"user_data\";s:0:\"\";s:8:\"identity\";s:13:\"administrator\";s:8:\"username\";s:13:\"administrator\";s:5:\"email\";s:15:\"admin@admin.com\";s:7:\"user_id\";s:1:\"1\";s:14:\"old_last_login\";s:10:\"1487055794\";s:13:\"temp_pemb_set\";a:3:{s:10:\"tgl_simpan\";s:10:\"2017-02-16\";s:7:\"no_nota\";s:7:\"06 diah\";s:4:\"nama\";s:10:\"gula pasir\";}}'),
('6278199179ff7d42f3dd4b9bb307aa46', '192.168.0.2', 'Mozilla/5.0 (Windows NT 5.1; rv:50.0) Gecko/20100101 Firefox/50.0', 1487298030, 'a:6:{s:9:\"user_data\";s:0:\"\";s:8:\"identity\";s:13:\"administrator\";s:8:\"username\";s:13:\"administrator\";s:5:\"email\";s:15:\"admin@admin.com\";s:7:\"user_id\";s:1:\"1\";s:14:\"old_last_login\";s:10:\"1487215929\";}'),
('ab35f3ce9bc66a8048f1ae8f96d24c94', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:50.0) Gecko/20100101 Firefox/50.0', 1487312630, 'a:6:{s:9:\"user_data\";s:0:\"\";s:8:\"identity\";s:13:\"administrator\";s:8:\"username\";s:13:\"administrator\";s:5:\"email\";s:15:\"admin@admin.com\";s:7:\"user_id\";s:1:\"1\";s:14:\"old_last_login\";s:10:\"1487298030\";}'),
('d25262ab204cd9786abb119793c49e33', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 1487433664, 'a:6:{s:9:\"user_data\";s:0:\"\";s:8:\"identity\";s:13:\"administrator\";s:8:\"username\";s:13:\"administrator\";s:5:\"email\";s:15:\"admin@admin.com\";s:7:\"user_id\";s:1:\"1\";s:14:\"old_last_login\";s:10:\"1487312657\";}'),
('a9ab68eba91c43d720599b9b15f0e998', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 1487477059, 'a:6:{s:9:\"user_data\";s:0:\"\";s:8:\"identity\";s:13:\"administrator\";s:8:\"username\";s:13:\"administrator\";s:5:\"email\";s:15:\"admin@admin.com\";s:7:\"user_id\";s:1:\"1\";s:14:\"old_last_login\";s:10:\"1487433218\";}'),
('f48d0fed70547fe0797e1bd2a100c43b', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 1487481865, 'a:6:{s:9:\"user_data\";s:0:\"\";s:8:\"identity\";s:13:\"administrator\";s:8:\"username\";s:13:\"administrator\";s:5:\"email\";s:15:\"admin@admin.com\";s:7:\"user_id\";s:1:\"1\";s:14:\"old_last_login\";s:10:\"1487477101\";}');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sessions_front`
--

CREATE TABLE `tbl_sessions_front` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sessions_front`
--

INSERT INTO `tbl_sessions_front` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('4ce3de58cee286930c65c3ac0cd26f5f', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 1487480737, 'a:6:{s:9:\"user_data\";s:0:\"\";s:8:\"identity\";s:13:\"administrator\";s:8:\"username\";s:13:\"administrator\";s:5:\"email\";s:15:\"admin@admin.com\";s:7:\"user_id\";s:1:\"1\";s:14:\"old_last_login\";s:10:\"1487477092\";}'),
('fd597d4b36ebbbfc072711613ac7a190', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 1487433218, 'a:6:{s:9:\"user_data\";s:0:\"\";s:8:\"identity\";s:13:\"administrator\";s:8:\"username\";s:13:\"administrator\";s:5:\"email\";s:15:\"admin@admin.com\";s:7:\"user_id\";s:1:\"1\";s:14:\"old_last_login\";s:10:\"1487429893\";}');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_set_meja`
--

CREATE TABLE `tbl_set_meja` (
  `id_set_meja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_track_bahan`
--

CREATE TABLE `tbl_track_bahan` (
  `id` int(11) NOT NULL,
  `no_nota` varchar(160) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `id_bahan` int(11) NOT NULL,
  `tgl` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `bahan` varchar(160) NOT NULL,
  `qty` int(50) NOT NULL,
  `ket` varchar(160) NOT NULL,
  `status_nota` varchar(160) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_trans_opn`
--

CREATE TABLE `tbl_trans_opn` (
  `id` int(11) NOT NULL,
  `tgl` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `no_stok_op` varchar(50) NOT NULL,
  `ket` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_trans_opn_det`
--

CREATE TABLE `tbl_trans_opn_det` (
  `id` int(11) NOT NULL,
  `tgl` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `no_stok_op` varchar(50) NOT NULL,
  `bahan` varchar(160) NOT NULL,
  `bahan_sys` varchar(160) NOT NULL,
  `stok_awal` double NOT NULL,
  `stok_awal_sys` double NOT NULL,
  `stok_masuk` double NOT NULL,
  `stok_masuk_sys` double NOT NULL,
  `stok_keluar` double NOT NULL,
  `stok_keluar_sys` double NOT NULL,
  `retur` double NOT NULL,
  `retur_sys` double NOT NULL,
  `rusak` double NOT NULL,
  `rusak_sys` double NOT NULL,
  `total` double NOT NULL,
  `total_sys` double NOT NULL,
  `selisih` double NOT NULL,
  `fisik` double NOT NULL,
  `id_bahan` int(11) NOT NULL,
  `keterangan` varchar(160) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_trans_opn_det`
--

INSERT INTO `tbl_trans_opn_det` (`id`, `tgl`, `no_stok_op`, `bahan`, `bahan_sys`, `stok_awal`, `stok_awal_sys`, `stok_masuk`, `stok_masuk_sys`, `stok_keluar`, `stok_keluar_sys`, `retur`, `retur_sys`, `rusak`, `rusak_sys`, `total`, `total_sys`, `selisih`, `fisik`, `id_bahan`, `keterangan`) VALUES
(1, '2017-01-17 13:21:12', 'OPBRG.00001', 'tropical 1lt', 'tropical 1lt', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28, 0, 28, 28, 170, ''),
(2, '2017-01-17 13:21:12', 'OPBRG.00001', 'Tropical 500ml', 'Tropical 500ml', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 0, 13, 13, 171, ''),
(3, '2017-01-17 13:21:12', 'OPBRG.00001', 'sania 1lt', 'sania 1lt', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 4, 4, 173, ''),
(4, '2017-01-17 13:21:12', 'OPBRG.00001', 'fortune 1lt', 'fortune 1lt', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 172, ''),
(5, '2017-01-17 13:21:12', 'OPBRG.00001', 'Sanco 2lt', 'Sanco 2lt', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17, 0, 17, 17, 175, ''),
(6, '2017-01-17 13:21:12', 'OPBRG.00001', 'Tropical 2lt', 'Tropical 2lt', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 12, 12, 169, ''),
(7, '2017-01-17 13:21:12', 'OPBRG.00001', 'Fortune 2lt', 'Fortune 2lt', 6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 6, 6, 0, 6, 500, ''),
(8, '2017-01-17 13:21:12', 'OPBRG.00001', 'Aqua 1.5', 'Aqua 1.5', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 8, 8, 416, ''),
(9, '2017-01-17 13:21:12', 'OPBRG.00001', 'Aquaria 1.5', 'Aquaria 1.5', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 8, 8, 424, ''),
(10, '2017-01-17 13:21:12', 'OPBRG.00001', 'Sirup delicio strawberry', 'Sirup delicio strawberry', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 5, 5, 422, ''),
(11, '2017-01-17 13:21:12', 'OPBRG.00001', 'Sirup Delicio Melon', 'Sirup Delicio Melon', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 421, ''),
(12, '2017-01-17 13:21:12', 'OPBRG.00001', 'Sirup delicio Leci', 'Sirup delicio Leci', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 419, ''),
(13, '2017-01-17 13:21:12', 'OPBRG.00001', 'Sirup Delicio Jambu', 'Sirup Delicio Jambu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 4, 4, 418, ''),
(14, '2017-01-17 13:21:12', 'OPBRG.00001', 'Sirup Delicio orange', 'Sirup Delicio orange', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 420, ''),
(15, '2017-01-17 13:21:12', 'OPBRG.00001', 'Sirup Fress', 'Sirup Fress', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 417, ''),
(16, '2017-01-17 13:21:12', 'OPBRG.00001', 'Sirup Kartika melon', 'Sirup Kartika melon', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 12, 12, 488, ''),
(17, '2017-01-17 13:21:12', 'OPBRG.00001', 'Kecap Sukasari Botol B', 'Kecap Sukasari Botol B', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 38, ''),
(18, '2017-01-17 13:21:12', 'OPBRG.00001', 'Nutrisari Florida', 'Nutrisari Florida', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 6, 6, 220, ''),
(19, '2017-01-17 13:21:12', 'OPBRG.00001', 'Nutrisari Anggur', 'Nutrisari Anggur', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 217, ''),
(20, '2017-01-17 13:21:12', 'OPBRG.00001', 'Nutrisari Jambu', 'Nutrisari Jambu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 8, 8, 219, ''),
(21, '2017-01-17 13:21:12', 'OPBRG.00001', 'Nutrisari Sirsat', 'Nutrisari Sirsat', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 0, 14, 14, 221, ''),
(22, '2017-01-17 13:21:12', 'OPBRG.00001', 'Nutrisari Am Sweet', 'Nutrisari Am Sweet', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 9, 9, 218, ''),
(23, '2017-01-17 13:21:12', 'OPBRG.00001', 'Nutrisari Mango', 'Nutrisari Mango', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11, 0, 11, 11, 216, ''),
(24, '2017-01-17 13:21:12', 'OPBRG.00001', 'Good Day Mocacino', 'Good Day Mocacino', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 5, 5, 225, ''),
(25, '2017-01-17 13:21:12', 'OPBRG.00001', 'Good day chococino', 'Good day chococino', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 501, ''),
(26, '2017-01-17 13:38:45', 'OPBRG.00002', 'Good Day Carrebian', 'Good Day Carrebian', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 222, ''),
(27, '2017-01-17 13:38:45', 'OPBRG.00002', 'Good Day Vanila', 'Good Day Vanila', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 223, ''),
(28, '2017-01-17 13:38:45', 'OPBRG.00002', 'Top Kopi Susu', 'Top Kopi Susu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 4, 4, 229, ''),
(29, '2017-01-17 13:38:45', 'OPBRG.00002', 'Top White', 'Top White', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 4, 4, 228, ''),
(30, '2017-01-17 13:38:45', 'OPBRG.00002', 'Top Kopi Gula', 'Top Kopi Gula', 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 0, 4, 502, ''),
(31, '2017-01-17 13:38:45', 'OPBRG.00002', 'Top kopi susu kental manis', 'Top kopi susu kental manis', 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 10, 503, ''),
(32, '2017-01-17 13:38:45', 'OPBRG.00002', 'Milo 18 gr', 'Milo 18 gr', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 9, 9, 230, ''),
(33, '2017-01-17 13:38:45', 'OPBRG.00002', 'Coffemic', 'Coffemic', 12, 12, 0, 0, 0, 0, 0, 0, 0, 0, 12, 12, 0, 12, 504, ''),
(34, '2017-01-17 13:38:45', 'OPBRG.00002', 'Energen Kc Ijo', 'Energen Kc Ijo', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 233, ''),
(35, '2017-01-17 13:38:45', 'OPBRG.00002', 'Energen Vanila', 'Energen Vanila', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 235, ''),
(36, '2017-01-17 13:38:45', 'OPBRG.00002', 'Energen Coklat', 'Energen Coklat', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 234, ''),
(37, '2017-01-17 13:38:45', 'OPBRG.00002', 'Top Kopi Murni 65 gr', 'Top Kopi Murni 65 gr', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 4, 4, 240, ''),
(38, '2017-01-17 13:38:45', 'OPBRG.00002', 'Segar Dingin', 'Segar Dingin', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 8, 8, 232, ''),
(39, '2017-01-17 13:38:45', 'OPBRG.00002', 'Jahe Wangi', 'Jahe Wangi', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 7, 7, 231, ''),
(40, '2017-01-17 13:38:45', 'OPBRG.00002', 'Top Kopi Murni 165 gr', 'Top Kopi Murni 165 gr', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 237, ''),
(41, '2017-01-17 13:38:45', 'OPBRG.00002', 'Top Kopi Toraja 165 gr', 'Top Kopi Toraja 165 gr', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 238, ''),
(42, '2017-01-17 13:38:45', 'OPBRG.00002', 'Top Kopi murni 7 gr', 'Top Kopi murni 7 gr', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 4, 4, 239, ''),
(43, '2017-01-17 13:38:45', 'OPBRG.00002', 'Kopi Luwakl 165', 'Kopi Luwakl 165', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 236, ''),
(44, '2017-01-17 14:09:09', 'OPBRG.00003', 'Kopi Kapal Api 165 gr', 'Kopi Kapal Api 165 gr', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 5, 5, 241, ''),
(45, '2017-01-17 14:09:09', 'OPBRG.00003', 'Sprite 425', 'Sprite 425', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11, 0, 11, 11, 202, ''),
(46, '2017-01-17 14:09:09', 'OPBRG.00003', 'Fanta 425', 'Fanta 425', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11, 0, 11, 11, 203, ''),
(47, '2017-01-17 14:09:09', 'OPBRG.00003', 'Iso Plus', 'Iso Plus', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, 0, 23, 23, 206, ''),
(48, '2017-01-17 14:09:09', 'OPBRG.00003', 'Floridina', 'Floridina', 19, 19, 0, 0, 0, 0, 0, 0, 0, 0, 19, 19, 0, 19, 505, ''),
(49, '2017-01-17 14:09:09', 'OPBRG.00003', 'Javana', 'Javana', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19, 0, 19, 19, 204, ''),
(50, '2017-01-17 14:09:09', 'OPBRG.00003', 'Susu Gomars Vanila', 'Susu Gomars Vanila', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 177, ''),
(51, '2017-01-17 14:09:09', 'OPBRG.00003', 'Sosro Clp', 'Sosro Clp', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 8, 8, 246, ''),
(52, '2017-01-17 14:09:09', 'OPBRG.00003', 'Gopek clp', 'Gopek clp', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 247, ''),
(53, '2017-01-17 14:09:09', 'OPBRG.00003', 'Poci Vanila Clp', 'Poci Vanila Clp', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 5, 5, 243, ''),
(54, '2017-01-17 14:09:09', 'OPBRG.00003', 'Poci Asli Clp', 'Poci Asli Clp', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 244, ''),
(55, '2017-01-17 14:09:09', 'OPBRG.00003', 'Gopek Super', 'Gopek Super', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 0, 13, 28, 248, ''),
(56, '2017-01-17 14:09:09', 'OPBRG.00003', 'Poci Kepyur', 'Poci Kepyur', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 110, 0, 110, 110, 249, ''),
(57, '2017-01-17 14:09:09', 'OPBRG.00003', 'Gopek Kecil', 'Gopek Kecil', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 72, 0, 72, 72, 251, ''),
(58, '2017-01-17 14:09:09', 'OPBRG.00003', 'Dandang Biru', 'Dandang Biru', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 5, 5, 465, ''),
(59, '2017-01-17 14:09:09', 'OPBRG.00003', 'Dandang kepyur', 'Dandang kepyur', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 112, 0, 112, 112, 250, ''),
(60, '2017-01-17 14:09:09', 'OPBRG.00003', 'Gula Pasir 1kg', 'Gula Pasir 1kg', 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 28, -1, 29, 29, 367, ''),
(61, '2017-01-17 14:09:09', 'OPBRG.00003', 'Gula pasir 1/2', 'Gula pasir 1/2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 36, 0, 36, 36, 368, ''),
(62, '2017-01-17 14:09:09', 'OPBRG.00003', 'Gula jawa 1/2', 'Gula jawa 1/2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 0, 13, 13, 366, ''),
(63, '2017-01-17 14:37:07', 'OPBRG.00004', 'Pulpy Orange', 'Pulpy Orange', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 20, 20, 242, ''),
(64, '2017-01-17 14:37:07', 'OPBRG.00004', 'Lasegar Strawberi', 'Lasegar Strawberi', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 470, ''),
(65, '2017-01-17 14:37:07', 'OPBRG.00004', 'Lasegar Jambu', 'Lasegar Jambu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 468, ''),
(66, '2017-01-17 14:37:07', 'OPBRG.00004', 'Frestea Markisa 350 ml', 'Frestea Markisa 350 ml', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 12, 12, 487, ''),
(67, '2017-01-17 14:37:07', 'OPBRG.00004', 'Frestea Apel 500', 'Frestea Apel 500', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 12, 12, 210, ''),
(68, '2017-01-17 14:37:07', 'OPBRG.00004', 'Frestea Madu 500', 'Frestea Madu 500', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 5, 5, 211, ''),
(69, '2017-01-17 14:37:07', 'OPBRG.00004', 'Frestea Melati 500', 'Frestea Melati 500', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 212, ''),
(70, '2017-01-17 14:37:07', 'OPBRG.00004', 'Aqua 330ml', 'Aqua 330ml', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 45, 0, 45, 45, 425, ''),
(71, '2017-01-17 14:37:07', 'OPBRG.00004', 'Aquaria 600', 'Aquaria 600', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 71, 0, 71, 71, 214, ''),
(72, '2017-01-17 14:37:07', 'OPBRG.00004', 'Ades 600', 'Ades 600', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25, 0, 25, 25, 215, ''),
(73, '2017-01-17 14:37:07', 'OPBRG.00004', 'Aqua 600', 'Aqua 600', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11, 0, 11, 11, 213, ''),
(74, '2017-01-17 14:37:07', 'OPBRG.00004', 'Nu Gren Tea less Sugar', 'Nu Gren Tea less Sugar', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 207, ''),
(75, '2017-01-17 14:37:07', 'OPBRG.00004', 'Nu Green Tea Teh hijau', 'Nu Green Tea Teh hijau', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 208, ''),
(76, '2017-01-17 14:37:07', 'OPBRG.00004', 'Frestea beleng', 'Frestea beleng', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 0, 13, 13, 350, ''),
(77, '2017-01-17 14:37:07', 'OPBRG.00004', 'Frestea besar', 'Frestea besar', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 6, 6, 415, ''),
(78, '2017-01-17 14:37:07', 'OPBRG.00004', 'Teh botol sosro', 'Teh botol sosro', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28, 0, 28, 28, 351, ''),
(79, '2017-01-17 14:37:07', 'OPBRG.00004', 'Fruit tea', 'Fruit tea', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22, 0, 22, 22, 354, ''),
(80, '2017-01-17 14:37:07', 'OPBRG.00004', 'Tebs', 'Tebs', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 4, 4, 352, ''),
(81, '2017-01-17 14:37:07', 'OPBRG.00004', 'Yakult', 'Yakult', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 10, 10, 353, ''),
(82, '2017-01-17 14:37:07', 'OPBRG.00004', 'Multi 600 gr', 'Multi 600 gr', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 4, 4, 318, ''),
(83, '2017-01-17 14:37:07', 'OPBRG.00004', 'Tessa Kotak 120', 'Tessa Kotak 120', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 325, ''),
(84, '2017-01-17 14:37:07', 'OPBRG.00004', 'Multi 250', 'Multi 250', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 7, 7, 319, ''),
(85, '2017-01-17 14:37:07', 'OPBRG.00004', 'Multi 260', 'Multi 260', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 320, ''),
(86, '2017-01-17 14:37:07', 'OPBRG.00004', 'Tessa 200', 'Tessa 200', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 324, ''),
(87, '2017-01-17 14:37:07', 'OPBRG.00004', 'Multi Serbet', 'Multi Serbet', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 321, ''),
(88, '2017-01-17 14:37:07', 'OPBRG.00004', 'Multi Biru Refil', 'Multi Biru Refil', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 7, 7, 323, ''),
(89, '2017-01-17 14:37:07', 'OPBRG.00004', 'Multi Putih Refil', 'Multi Putih Refil', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 322, ''),
(90, '2017-01-17 14:37:07', 'OPBRG.00004', 'Tessa Top Brand', 'Tessa Top Brand', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 6, 6, 328, ''),
(91, '2017-01-17 14:37:07', 'OPBRG.00004', 'Tissu Pulpies', 'Tissu Pulpies', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 5, 5, 330, ''),
(92, '2017-01-17 14:37:07', 'OPBRG.00004', 'Multi Travel 70', 'Multi Travel 70', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 5, 5, 329, ''),
(93, '2017-01-17 14:37:07', 'OPBRG.00004', 'Tessa rolingstone  150', 'Tessa rolingstone  150', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 326, ''),
(94, '2017-01-17 14:37:07', 'OPBRG.00004', 'Tessa 50', 'Tessa 50', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 327, ''),
(95, '2017-01-17 14:40:06', 'OPBRG.00005', 'Tessa Gulung', 'Tessa Gulung', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 5, 5, 336, ''),
(96, '2017-01-17 14:40:06', 'OPBRG.00005', 'Multi Gulung', 'Multi Gulung', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 11, 335, ''),
(97, '2017-01-17 14:43:12', 'OPBRG.00006', 'Tessa gulung putih', 'Tessa gulung putih', 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, 0, 5, 506, ''),
(98, '2017-01-17 14:49:25', 'OPBRG.00007', 'Multi Gulung', 'Multi Gulung', 11, 11, 0, 0, 0, 0, 0, 0, 0, 0, 2, 11, -9, 9, 335, ''),
(99, '2017-01-17 14:49:25', 'OPBRG.00007', 'Kapas Cinderela', 'Kapas Cinderela', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 12, 12, 331, ''),
(100, '2017-01-17 14:49:25', 'OPBRG.00007', 'Kapas Selection', 'Kapas Selection', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 9, 9, 332, ''),
(101, '2017-01-17 14:49:25', 'OPBRG.00007', 'Hers Protex Maxi wing', 'Hers Protex Maxi wing', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 298, ''),
(102, '2017-01-17 14:49:25', 'OPBRG.00007', 'Hers Protex Reguler', 'Hers Protex Reguler', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 463, ''),
(103, '2017-01-17 14:49:25', 'OPBRG.00007', 'Hers Protex 8', 'Hers Protex 8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 297, ''),
(104, '2017-01-17 14:49:25', 'OPBRG.00007', 'Hers Protex Non ', 'Hers Protex Non ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 299, ''),
(105, '2017-01-17 14:49:25', 'OPBRG.00007', 'Softex Daun Sirih', 'Softex Daun Sirih', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 4, 4, 301, ''),
(106, '2017-01-17 14:49:25', 'OPBRG.00007', 'Laurier maxi 8', 'Laurier maxi 8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 300, ''),
(107, '2017-01-17 14:49:25', 'OPBRG.00007', 'Laurier maxi 30', 'Laurier maxi 30', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 303, ''),
(108, '2017-01-17 14:49:25', 'OPBRG.00007', 'Softex Daun Sirih Wing', 'Softex Daun Sirih Wing', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 302, ''),
(109, '2017-01-17 14:49:25', 'OPBRG.00007', 'Charm 8', 'Charm 8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 5, 5, 345, ''),
(110, '2017-01-17 14:49:25', 'OPBRG.00007', 'Mamy Poko S', 'Mamy Poko S', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 304, ''),
(111, '2017-01-17 14:49:25', 'OPBRG.00007', 'Fitti Day Pant', 'Fitti Day Pant', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 2, 306, ''),
(112, '2017-01-17 14:49:25', 'OPBRG.00007', 'Protex 60', 'Protex 60', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 305, ''),
(113, '2017-01-17 14:49:25', 'OPBRG.00007', 'Sweety Sst', 'Sweety Sst', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 4, 4, 307, ''),
(114, '2017-01-17 14:50:55', 'OPBRG.00008', 'Mia atom bulan', 'Mia atom bulan', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 20, 20, 429, ''),
(115, '2017-01-17 14:50:55', 'OPBRG.00008', 'Ekomie', 'Ekomie', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 9, 9, 183, ''),
(116, '2017-01-17 14:50:55', 'OPBRG.00008', 'Pita merah', 'Pita merah', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 0, 13, 18, 179, ''),
(117, '2017-01-17 14:57:24', 'OPBRG.00009', 'Tepung Ketan', 'Tepung Ketan', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28, 0, 28, 28, 180, ''),
(118, '2017-01-17 14:57:24', 'OPBRG.00009', 'tepung beras 500g', 'tepung beras 500g', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 0, 21, 21, 182, ''),
(119, '2017-01-17 14:57:24', 'OPBRG.00009', 'Tepung beras 200gr', 'Tepung beras 200gr', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 0, 30, 30, 181, ''),
(120, '2017-01-17 14:57:24', 'OPBRG.00009', 'Gula ku Heloo kitty', 'Gula ku Heloo kitty', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 188, ''),
(121, '2017-01-17 14:57:24', 'OPBRG.00009', 'Gulaku Hijau 500 gr', 'Gulaku Hijau 500 gr', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 5, 5, 189, ''),
(122, '2017-01-17 14:57:24', 'OPBRG.00009', 'Gulaku Hijau 1000 gr', 'Gulaku Hijau 1000 gr', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 9, 9, 190, ''),
(123, '2017-01-17 14:57:24', 'OPBRG.00009', 'Susu Kaleng coklat', 'Susu Kaleng coklat', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 0, 16, 16, 185, ''),
(124, '2017-01-17 14:57:24', 'OPBRG.00009', 'Susu Kaleng Kental manis', 'Susu Kaleng Kental manis', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 184, ''),
(125, '2017-01-17 14:57:24', 'OPBRG.00009', 'Bendera Gold', 'Bendera Gold', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 0, 16, 16, 485, ''),
(126, '2017-01-17 14:57:24', 'OPBRG.00009', 'Bendera Gold sst', 'Bendera Gold sst', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 466, ''),
(127, '2017-01-17 14:57:24', 'OPBRG.00009', 'Bendera putih Sst', 'Bendera putih Sst', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33, 0, 33, 19, 186, ''),
(128, '2017-01-17 15:06:10', 'OPBRG.00010', 'Bendera Coklat sst', 'Bendera Coklat sst', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33, 0, 33, 33, 187, ''),
(129, '2017-01-17 15:06:10', 'OPBRG.00010', 'Susu Zee  sak', 'Susu Zee  sak', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 191, ''),
(130, '2017-01-17 15:06:10', 'OPBRG.00010', 'Susu zee Putih sst', 'Susu zee Putih sst', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25, 0, 25, 0, 193, ''),
(131, '2017-01-17 15:06:10', 'OPBRG.00010', 'Susu zee Coklat sst', 'Susu zee Coklat sst', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 70, 0, 70, 0, 192, ''),
(132, '2017-01-17 15:06:10', 'OPBRG.00010', 'Sedap goreng', 'Sedap goreng', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 170, 0, 170, 0, 6, ''),
(133, '2017-01-17 15:06:10', 'OPBRG.00010', 'Indomie goreng', 'Indomie goreng', 24, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, -24, 0, 2, ''),
(134, '2017-01-17 15:06:10', 'OPBRG.00010', 'Indomie soto', 'Indomie soto', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 48, 0, 48, 0, 3, ''),
(135, '2017-01-17 15:06:10', 'OPBRG.00010', 'Indomie Spesial', 'Indomie Spesial', 21, 21, 0, 0, 0, 0, 0, 0, 0, 0, 52, 21, 31, 0, 4, ''),
(136, '2017-01-17 15:06:10', 'OPBRG.00010', 'Indomie ayam bawang', 'Indomie ayam bawang', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 127, 0, 127, 0, 5, ''),
(137, '2017-01-17 15:06:10', 'OPBRG.00010', 'Sukses Goreng', 'Sukses Goreng', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 39, 0, 39, 0, 14, ''),
(138, '2017-01-17 15:06:10', 'OPBRG.00010', 'Sukses AB', 'Sukses AB', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 20, 0, 489, ''),
(139, '2017-01-17 15:06:10', 'OPBRG.00010', 'ABC Cup Gulai ayam', 'ABC Cup Gulai ayam', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 0, 19, ''),
(140, '2017-01-17 15:06:10', 'OPBRG.00010', 'ABC Cup Kari Ayam', 'ABC Cup Kari Ayam', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 0, 20, ''),
(141, '2017-01-17 15:06:10', 'OPBRG.00010', 'Sedap Cup soto', 'Sedap Cup soto', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 338, ''),
(142, '2017-01-17 15:06:10', 'OPBRG.00010', 'Sedap Cup Kari Spesial', 'Sedap Cup Kari Spesial', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 5, 0, 339, ''),
(143, '2017-01-17 15:06:10', 'OPBRG.00010', 'Sedap Ayam spesial', 'Sedap Ayam spesial', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 12, 0, 7, ''),
(144, '2017-01-17 15:06:10', 'OPBRG.00010', 'Sedap Soto', 'Sedap Soto', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 42, 0, 42, 75, 9, ''),
(145, '2017-01-17 15:06:10', 'OPBRG.00010', 'SEdap Kari spesial', 'SEdap Kari spesial', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 42, 0, 42, 42, 8, ''),
(146, '2017-01-17 15:13:55', 'OPBRG.00011', 'Indomie goreng', 'Indomie goreng', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, ''),
(147, '2017-01-17 15:13:55', 'OPBRG.00011', 'Indomie soto', 'Indomie soto', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 29, 0, 29, 29, 3, ''),
(148, '2017-01-17 15:13:55', 'OPBRG.00011', 'Indomie Spesial', 'Indomie Spesial', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 52, 0, 52, 52, 4, ''),
(149, '2017-01-17 15:13:55', 'OPBRG.00011', 'Indomie ayam bawang', 'Indomie ayam bawang', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 127, 0, 127, 127, 5, ''),
(150, '2017-01-17 15:13:55', 'OPBRG.00011', 'Sukses Goreng', 'Sukses Goreng', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 39, 0, 39, 39, 14, ''),
(151, '2017-01-17 15:13:55', 'OPBRG.00011', 'Sukses AB', 'Sukses AB', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 20, 20, 489, ''),
(152, '2017-01-17 15:13:55', 'OPBRG.00011', 'ABC Cup Gulai ayam', 'ABC Cup Gulai ayam', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 19, ''),
(153, '2017-01-17 15:13:55', 'OPBRG.00011', 'Sedap Cup Kari Spesial', 'Sedap Cup Kari Spesial', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 4, 5, 339, ''),
(154, '2017-01-17 15:18:33', 'OPBRG.00012', 'ABC Cup Kari Ayam', 'ABC Cup Kari Ayam', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 20, ''),
(155, '2017-01-17 15:18:33', 'OPBRG.00012', 'Sedap goreng', 'Sedap goreng', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 170, 0, 170, 170, 6, ''),
(156, '2017-01-17 15:18:33', 'OPBRG.00012', 'Sedap Ayam spesial', 'Sedap Ayam spesial', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0, 15, 15, 7, ''),
(157, '2017-01-17 15:18:33', 'OPBRG.00012', 'SEdap Kari spesial', 'SEdap Kari spesial', 42, 42, 0, 0, 0, 0, 0, 0, 0, 0, 62, 42, 20, 20, 8, ''),
(158, '2017-01-17 15:18:33', 'OPBRG.00012', 'Sedap Soto', 'Sedap Soto', 75, 75, 0, 0, 0, 0, 0, 0, 0, 0, 75, 75, 0, 75, 9, ''),
(159, '2017-01-17 15:23:13', 'OPBRG.00013', 'Sedap AB', 'Sedap AB', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 85, 0, 85, 85, 10, ''),
(160, '2017-01-17 15:23:13', 'OPBRG.00013', 'Sedap Bakso', 'Sedap Bakso', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 66, 0, 66, 66, 11, ''),
(161, '2017-01-17 15:23:13', 'OPBRG.00013', 'Sedap White Curry', 'Sedap White Curry', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0, 15, 15, 13, ''),
(162, '2017-01-17 15:23:13', 'OPBRG.00013', 'ABC Selera pedas gulai', 'ABC Selera pedas gulai', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 8, 8, 16, ''),
(163, '2017-01-17 15:23:13', 'OPBRG.00013', 'ABC Selera ayam bawang', 'ABC Selera ayam bawang', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 10, 10, 17, ''),
(164, '2017-01-17 15:23:13', 'OPBRG.00013', 'ABC selera Sup  tomat', 'ABC selera Sup  tomat', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 0, 18, 18, 18, ''),
(165, '2017-01-17 15:23:13', 'OPBRG.00013', 'Motto T ', 'Motto T ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28, 0, 28, 28, 32, ''),
(166, '2017-01-17 15:33:44', 'OPBRG.00014', 'Kecap lele 340', 'Kecap lele 340', 17, 17, 0, 0, 0, 0, 0, 0, 0, 0, 17, 17, 0, 17, 507, ''),
(167, '2017-01-17 15:33:44', 'OPBRG.00014', 'Kecap Lele 680ml', 'Kecap Lele 680ml', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 6, 17, 31, ''),
(168, '2017-01-17 15:33:44', 'OPBRG.00014', 'kecap lele sst', 'kecap lele sst', 6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 6, 6, 0, 6, 508, ''),
(169, '2017-01-17 15:33:44', 'OPBRG.00014', 'Kecap Sedap 600ml', 'Kecap Sedap 600ml', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 30, ''),
(170, '2017-01-17 15:33:44', 'OPBRG.00014', 'Kecap Sukasari 600ml', 'Kecap Sukasari 600ml', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 29, ''),
(171, '2017-01-17 15:33:44', 'OPBRG.00014', 'Kecap Bango 600ml', 'Kecap Bango 600ml', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 28, ''),
(172, '2017-01-17 15:33:44', 'OPBRG.00014', 'Kecap Sukasari Manis', 'Kecap Sukasari Manis', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 27, ''),
(173, '2017-01-17 15:33:44', 'OPBRG.00014', 'ABC Kecap Pedes', 'ABC Kecap Pedes', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 4, 4, 26, ''),
(174, '2017-01-17 15:33:44', 'OPBRG.00014', 'Minyak Wijen', 'Minyak Wijen', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 25, ''),
(175, '2017-01-18 09:26:19', 'OPBRG.00015', 'ABC saus Tomat 135 ml', 'ABC saus Tomat 135 ml', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 4, 4, 462, ''),
(176, '2017-01-18 09:26:19', 'OPBRG.00015', 'Blue Band 200 gr', 'Blue Band 200 gr', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 473, ''),
(177, '2017-01-18 09:26:19', 'OPBRG.00015', 'Sardine Extra Pedas K', 'Sardine Extra Pedas K', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 0, 23, ''),
(178, '2017-01-18 09:26:19', 'OPBRG.00015', 'Sambel Trasi Kaleng', 'Sambel Trasi Kaleng', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 0, 21, ''),
(179, '2017-01-18 09:26:19', 'OPBRG.00015', 'Xonce', 'Xonce', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 20, 0, 393, ''),
(180, '2017-01-18 09:26:19', 'OPBRG.00015', 'Ademsari', 'Ademsari', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 8, 0, 392, ''),
(181, '2017-01-18 09:26:19', 'OPBRG.00015', 'Ultraflu', 'Ultraflu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 428, ''),
(182, '2017-01-18 09:26:19', 'OPBRG.00015', 'Paramex', 'Paramex', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 6, 0, 381, ''),
(183, '2017-01-18 09:26:19', 'OPBRG.00015', 'Neosep', 'Neosep', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 8, 0, 391, ''),
(184, '2017-01-18 09:26:19', 'OPBRG.00015', 'Vic Vorup', 'Vic Vorup', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 394, ''),
(185, '2017-01-18 09:26:19', 'OPBRG.00015', 'Balsem Kaki tiga', 'Balsem Kaki tiga', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 395, ''),
(186, '2017-01-18 09:26:19', 'OPBRG.00015', 'Counterpain', 'Counterpain', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 396, ''),
(187, '2017-01-18 09:26:19', 'OPBRG.00015', 'Komix OBH', 'Komix OBH', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 6, 0, 382, ''),
(188, '2017-01-18 09:26:19', 'OPBRG.00015', 'Komix Papermint', 'Komix Papermint', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 383, ''),
(189, '2017-01-18 09:44:02', 'OPBRG.00016', 'ABC saus Tomat 135 ml', 'ABC saus Tomat 135 ml', 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 0, 4, 462, ''),
(190, '2017-01-18 09:44:02', 'OPBRG.00016', 'Blue Band 200 gr', 'Blue Band 200 gr', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 473, ''),
(191, '2017-01-18 09:44:02', 'OPBRG.00016', 'Sardine Extra Pedas K', 'Sardine Extra Pedas K', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 23, ''),
(192, '2017-01-18 09:44:02', 'OPBRG.00016', 'Sambel Trasi Kaleng', 'Sambel Trasi Kaleng', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 21, ''),
(193, '2017-01-18 09:44:02', 'OPBRG.00016', 'motto 1/4', 'motto 1/4', 12, 12, 0, 0, 0, 0, 0, 0, 0, 0, 12, 12, 0, 12, 509, ''),
(194, '2017-01-18 09:44:02', 'OPBRG.00016', 'Royco Sapi', 'Royco Sapi', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 4, 4, 34, ''),
(195, '2017-01-18 09:44:02', 'OPBRG.00016', 'Royco ayam', 'Royco ayam', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 4, 4, 426, ''),
(196, '2017-01-18 09:44:02', 'OPBRG.00016', 'Masako sapi', 'Masako sapi', 7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 7, 7, 0, 7, 510, ''),
(197, '2017-01-18 09:44:02', 'OPBRG.00016', 'Masako Ayam', 'Masako Ayam', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 8, 8, 35, ''),
(198, '2017-01-18 09:44:02', 'OPBRG.00016', 'Magic Lezat', 'Magic Lezat', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 6, 6, 36, ''),
(199, '2017-01-18 09:44:02', 'OPBRG.00016', 'Garam Halus', 'Garam Halus', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 63, 0, 63, 63, 37, ''),
(200, '2017-01-18 10:07:33', 'OPBRG.00017', 'Xonce', 'Xonce', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 20, 20, 393, ''),
(201, '2017-01-18 10:07:33', 'OPBRG.00017', 'Cimin', 'Cimin', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 430, ''),
(202, '2017-01-18 10:07:33', 'OPBRG.00017', 'Komix OBH', 'Komix OBH', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 7, 7, 382, ''),
(203, '2017-01-18 10:07:33', 'OPBRG.00017', 'Komix Papermint', 'Komix Papermint', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 383, ''),
(204, '2017-01-18 10:07:33', 'OPBRG.00017', 'Komix Jahe', 'Komix Jahe', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 384, ''),
(205, '2017-01-18 10:07:33', 'OPBRG.00017', 'Komix Jeruk nipis', 'Komix Jeruk nipis', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 7, 7, 385, ''),
(206, '2017-01-18 10:07:33', 'OPBRG.00017', 'Ultraflu', 'Ultraflu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 428, ''),
(207, '2017-01-18 10:07:33', 'OPBRG.00017', 'Paramex', 'Paramex', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 6, 6, 381, ''),
(208, '2017-01-18 10:07:33', 'OPBRG.00017', 'Counterpain', 'Counterpain', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 396, ''),
(209, '2017-01-18 10:07:33', 'OPBRG.00017', 'Neosep', 'Neosep', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 8, 8, 391, ''),
(210, '2017-01-18 10:07:33', 'OPBRG.00017', 'Panadol Biru', 'Panadol Biru', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 70, 0, 70, 70, 390, ''),
(211, '2017-01-18 10:07:33', 'OPBRG.00017', 'Panadol Merah', 'Panadol Merah', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 40, 0, 40, 40, 389, ''),
(212, '2017-01-18 10:07:33', 'OPBRG.00017', 'Bodrek', 'Bodrek', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 44, 0, 44, 44, 380, ''),
(213, '2017-01-18 10:07:33', 'OPBRG.00017', 'Balsem Kaki tiga', 'Balsem Kaki tiga', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 395, ''),
(214, '2017-01-18 10:07:33', 'OPBRG.00017', 'Vic Vorup', 'Vic Vorup', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 394, ''),
(215, '2017-01-18 10:07:33', 'OPBRG.00017', 'Promax', 'Promax', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 140, 0, 140, 140, 388, ''),
(216, '2017-01-18 10:07:33', 'OPBRG.00017', 'Ademsari', 'Ademsari', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 8, 8, 392, ''),
(217, '2017-01-18 10:07:33', 'OPBRG.00017', 'Korek kayu', 'Korek kayu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 317, 0, 317, 317, 355, ''),
(218, '2017-01-18 10:07:33', 'OPBRG.00017', 'Frescare Sport', 'Frescare Sport', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 295, ''),
(219, '2017-01-18 10:07:33', 'OPBRG.00017', 'Frescare Splass', 'Frescare Splass', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 296, ''),
(220, '2017-01-18 10:07:33', 'OPBRG.00017', 'Djarum 12', 'Djarum 12', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 356, ''),
(221, '2017-01-18 10:07:33', 'OPBRG.00017', 'Djarum 16', 'Djarum 16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 8, 8, 357, ''),
(222, '2017-01-18 10:07:33', 'OPBRG.00017', 'Magnum', 'Magnum', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 5, 5, 376, ''),
(223, '2017-01-18 10:07:33', 'OPBRG.00017', 'Signatur', 'Signatur', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 5, 5, 372, ''),
(224, '2017-01-18 10:07:33', 'OPBRG.00017', 'U mild', 'U mild', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 375, ''),
(225, '2017-01-18 10:07:33', 'OPBRG.00017', 'Gudang Garam Mild', 'Gudang Garam Mild', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 371, ''),
(226, '2017-01-18 10:07:33', 'OPBRG.00017', 'Gudang Garam Filter', 'Gudang Garam Filter', 15, 15, 15, 15, 0, 0, 0, 0, 0, 0, 18, 30, -12, 18, 33, ''),
(227, '2017-01-18 10:07:33', 'OPBRG.00017', 'Sampoerna Mild 16', 'Sampoerna Mild 16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 369, ''),
(228, '2017-01-18 10:07:33', 'OPBRG.00017', 'Sampoerna Mild 12', 'Sampoerna Mild 12', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 436, ''),
(229, '2017-01-18 10:07:33', 'OPBRG.00017', 'Sampoerna Kretek', 'Sampoerna Kretek', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11, 0, 11, 11, 378, ''),
(230, '2017-01-18 10:07:33', 'OPBRG.00017', 'Malboro putih', 'Malboro putih', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 4, 4, 358, ''),
(231, '2017-01-18 10:07:33', 'OPBRG.00017', 'Malboro Merah', 'Malboro Merah', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 362, ''),
(232, '2017-01-18 10:07:33', 'OPBRG.00017', 'U bold', 'U bold', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 456, ''),
(233, '2017-01-18 10:07:33', 'OPBRG.00017', 'Dji Samsoe', 'Dji Samsoe', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 12, 12, 457, ''),
(234, '2017-01-18 10:07:33', 'OPBRG.00017', '76 filter', '76 filter', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 0, 16, 16, 360, ''),
(235, '2017-01-18 10:07:33', 'OPBRG.00017', '76 kretek', '76 kretek', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 0, 16, 16, 361, ''),
(236, '2017-01-18 10:07:33', 'OPBRG.00017', 'Sejati', 'Sejati', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 370, ''),
(237, '2017-01-18 10:07:33', 'OPBRG.00017', 'Tuton Filter', 'Tuton Filter', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 10, 10, 377, ''),
(238, '2017-01-18 10:07:33', 'OPBRG.00017', 'Dunhil Hitam', 'Dunhil Hitam', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 464, ''),
(239, '2017-01-18 10:07:33', 'OPBRG.00017', 'Surya Pro', 'Surya Pro', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 374, ''),
(240, '2017-01-18 10:07:33', 'OPBRG.00017', 'Surya 16', 'Surya 16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 5, 5, 365, ''),
(241, '2017-01-18 10:07:33', 'OPBRG.00017', 'LA merah', 'LA merah', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 9, 9, 363, ''),
(242, '2017-01-18 10:18:51', 'OPBRG.00018', 'Antangin ', 'Antangin ', 36, 36, 0, 0, 0, 0, 0, 0, 0, 0, 36, 36, 0, 36, 511, ''),
(243, '2017-01-18 10:18:51', 'OPBRG.00018', 'Batu abc K', 'Batu abc K', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 364, ''),
(244, '2017-01-18 10:18:51', 'OPBRG.00018', 'Batu abc Besar', 'Batu abc Besar', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22, 0, 22, 22, 397, ''),
(245, '2017-01-18 10:18:51', 'OPBRG.00018', 'Slimming tea', 'Slimming tea', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 398, ''),
(246, '2017-01-18 10:18:51', 'OPBRG.00018', 'Extrajoss', 'Extrajoss', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 48, 0, 48, 48, 386, ''),
(247, '2017-01-18 10:18:51', 'OPBRG.00018', 'Hemaviton Jreng', 'Hemaviton Jreng', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 4, 4, 387, ''),
(248, '2017-01-18 10:18:51', 'OPBRG.00018', 'Bedak Padat Mustika', 'Bedak Padat Mustika', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 400, ''),
(249, '2017-01-18 10:18:51', 'OPBRG.00018', 'Bedak Refil Mustika', 'Bedak Refil Mustika', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 399, ''),
(250, '2017-01-18 10:18:51', 'OPBRG.00018', 'Bedak tabur Mustika', 'Bedak tabur Mustika', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 401, ''),
(251, '2017-01-18 10:18:51', 'OPBRG.00018', 'Sampo Mustika ratu bayam', 'Sampo Mustika ratu bayam', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 447, ''),
(252, '2017-01-18 10:18:51', 'OPBRG.00018', 'Bedak Puteri kuning langsat', 'Bedak Puteri kuning langsat', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 402, ''),
(253, '2017-01-18 10:18:51', 'OPBRG.00018', 'Bedak Puteri Transparan', 'Bedak Puteri Transparan', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 403, ''),
(254, '2017-01-18 10:18:51', 'OPBRG.00018', 'Bedak Puteri Kuning Gading', 'Bedak Puteri Kuning Gading', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 404, ''),
(255, '2017-01-18 10:18:51', 'OPBRG.00018', 'Sampo Mustika ratu teh hijau', 'Sampo Mustika ratu teh hijau', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 448, ''),
(256, '2017-01-18 10:18:51', 'OPBRG.00018', 'Sampo Mustika Daun waru', 'Sampo Mustika Daun waru', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 449, ''),
(257, '2017-01-18 10:18:51', 'OPBRG.00018', 'Lulur Kocok', 'Lulur Kocok', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 201, ''),
(258, '2017-01-18 10:18:51', 'OPBRG.00018', 'Obat batuk Madu', 'Obat batuk Madu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 440, ''),
(259, '2017-01-18 10:18:51', 'OPBRG.00018', 'Pasta gigi daun Sirih', 'Pasta gigi daun Sirih', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 200, ''),
(260, '2017-01-18 10:18:51', 'OPBRG.00018', 'Handbody Papaya', 'Handbody Papaya', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 446, ''),
(261, '2017-01-18 10:18:51', 'OPBRG.00018', 'Handbody Jasmine Melati', 'Handbody Jasmine Melati', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 443, ''),
(262, '2017-01-18 10:18:51', 'OPBRG.00018', 'Handbody Mangir kuning', 'Handbody Mangir kuning', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 444, ''),
(263, '2017-01-18 10:18:51', 'OPBRG.00018', 'Handbody Rose mawar', 'Handbody Rose mawar', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 441, ''),
(264, '2017-01-18 10:18:51', 'OPBRG.00018', 'Handbody Mangir putih', 'Handbody Mangir putih', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 442, ''),
(265, '2017-01-18 10:18:51', 'OPBRG.00018', 'Bilasan Santaan Ms', 'Bilasan Santaan Ms', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 450, ''),
(266, '2017-01-18 10:18:51', 'OPBRG.00018', 'Vaselin B3 100 ml', 'Vaselin B3 100 ml', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 451, ''),
(267, '2017-01-18 10:18:51', 'OPBRG.00018', 'Vaselin Aloe Vera 100 ml', 'Vaselin Aloe Vera 100 ml', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 452, ''),
(268, '2017-01-18 10:18:51', 'OPBRG.00018', 'Citra Bengkoang 60', 'Citra Bengkoang 60', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 4, 4, 280, ''),
(269, '2017-01-18 10:18:51', 'OPBRG.00018', 'Citra Mutiara 60', 'Citra Mutiara 60', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 279, ''),
(270, '2017-01-18 10:18:51', 'OPBRG.00018', 'Citra bengkoang 250', 'Citra bengkoang 250', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 282, ''),
(271, '2017-01-18 10:20:45', 'OPBRG.00019', 'Ponds AM', 'Ponds AM', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 260, ''),
(272, '2017-01-18 10:20:45', 'OPBRG.00019', 'Pelembab Whitening', 'Pelembab Whitening', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 21, 453, ''),
(273, '2017-01-18 10:20:45', 'OPBRG.00019', 'Pelembab  Sekar ', 'Pelembab  Sekar ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 5, 5, 275, ''),
(274, '2017-01-18 10:20:45', 'OPBRG.00019', 'Alas Bedak Tasik', 'Alas Bedak Tasik', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 276, ''),
(275, '2017-01-18 10:23:29', 'OPBRG.00020', 'Minyak Kayu Putih 30ml', 'Minyak Kayu Putih 30ml', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 294, ''),
(276, '2017-01-18 10:23:29', 'OPBRG.00020', 'Johnson Cologne Beaven', 'Johnson Cologne Beaven', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 285, ''),
(277, '2017-01-18 10:23:29', 'OPBRG.00020', 'Johnson Top To', 'Johnson Top To', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 284, ''),
(278, '2017-01-18 10:23:29', 'OPBRG.00020', 'Dettol anti septik 50ml', 'Dettol anti septik 50ml', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 288, ''),
(279, '2017-01-18 10:23:29', 'OPBRG.00020', 'Dettol anti septik 100ml', 'Dettol anti septik 100ml', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 289, ''),
(280, '2017-01-18 10:23:29', 'OPBRG.00020', 'Rexona Men', 'Rexona Men', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 4, 291, ''),
(281, '2017-01-18 10:31:42', 'OPBRG.00021', 'Rexona Women', 'Rexona Women', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 290, ''),
(282, '2017-01-18 10:31:42', 'OPBRG.00021', 'Rexona Putri ungu', 'Rexona Putri ungu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 292, ''),
(283, '2017-01-18 10:31:42', 'OPBRG.00021', 'Rexona Putri biru', 'Rexona Putri biru', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 293, ''),
(284, '2017-01-18 10:31:42', 'OPBRG.00021', 'Parfum putri Ungu', 'Parfum putri Ungu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 253, ''),
(285, '2017-01-18 10:31:42', 'OPBRG.00021', 'Parfum Putri Kuning', 'Parfum Putri Kuning', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 254, ''),
(286, '2017-01-18 10:31:42', 'OPBRG.00021', 'Parfum Putri pink', 'Parfum Putri pink', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 255, ''),
(287, '2017-01-18 10:31:42', 'OPBRG.00021', 'Parfum Putri Merah', 'Parfum Putri Merah', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 256, ''),
(288, '2017-01-18 10:31:42', 'OPBRG.00021', 'Parfum Putri Orange rose', 'Parfum Putri Orange rose', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 257, ''),
(289, '2017-01-18 10:31:42', 'OPBRG.00021', 'Parfum Putri Comeli', 'Parfum Putri Comeli', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 258, ''),
(290, '2017-01-18 10:31:42', 'OPBRG.00021', 'Parfum Putri Biru', 'Parfum Putri Biru', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 259, ''),
(291, '2017-01-18 10:31:42', 'OPBRG.00021', 'Parfum Lovely mood Hijau', 'Parfum Lovely mood Hijau', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 262, ''),
(292, '2017-01-18 10:31:42', 'OPBRG.00021', 'Parfum Lovely mood Orange', 'Parfum Lovely mood Orange', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 261, ''),
(293, '2017-01-18 10:31:42', 'OPBRG.00021', 'Parfum Lovely mood Ungu', 'Parfum Lovely mood Ungu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 263, ''),
(294, '2017-01-18 10:31:42', 'OPBRG.00021', 'Cem Ceman', 'Cem Ceman', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 264, ''),
(295, '2017-01-18 10:31:42', 'OPBRG.00021', 'Peliing Pundisari', 'Peliing Pundisari', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 438, ''),
(296, '2017-01-18 10:31:42', 'OPBRG.00021', 'Casablanca Romantic 100', 'Casablanca Romantic 100', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 283, ''),
(297, '2017-01-18 10:31:42', 'OPBRG.00021', 'Casablanca Kaleng Femme 100', 'Casablanca Kaleng Femme 100', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 461, ''),
(298, '2017-01-18 10:31:42', 'OPBRG.00021', 'Emeron HBL Merah', 'Emeron HBL Merah', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 5, 5, 265, ''),
(299, '2017-01-18 10:31:42', 'OPBRG.00021', 'Emeron HBL Pink', 'Emeron HBL Pink', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 266, ''),
(300, '2017-01-18 10:31:42', 'OPBRG.00021', 'Resi V extra', 'Resi V extra', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 267, ''),
(301, '2017-01-18 10:31:42', 'OPBRG.00021', 'Eskulin Sunday', 'Eskulin Sunday', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 268, ''),
(302, '2017-01-18 10:31:42', 'OPBRG.00021', 'Ponds White Beauty', 'Ponds White Beauty', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 270, ''),
(303, '2017-01-18 10:31:42', 'OPBRG.00021', 'Ponds FF Pure White', 'Ponds FF Pure White', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 271, ''),
(304, '2017-01-18 10:31:42', 'OPBRG.00021', 'Rexona sst Men', 'Rexona sst Men', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 7, 7, 278, ''),
(305, '2017-01-18 10:31:42', 'OPBRG.00021', 'Sunslik coundisener 70', 'Sunslik coundisener 70', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 272, ''),
(306, '2017-01-18 10:31:42', 'OPBRG.00021', 'Clear AD ', 'Clear AD ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 273, ''),
(307, '2017-01-18 10:31:42', 'OPBRG.00021', 'Pantene Countidisiner 85', 'Pantene Countidisiner 85', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 274, ''),
(308, '2017-01-18 10:31:42', 'OPBRG.00021', 'Dettol Bedak original', 'Dettol Bedak original', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 78, ''),
(309, '2017-01-18 10:31:42', 'OPBRG.00021', 'Dettol Bedak Mentol', 'Dettol Bedak Mentol', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 79, ''),
(310, '2017-01-18 10:39:09', 'OPBRG.00022', 'Johsons Refil 200', 'Johsons Refil 200', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 81, ''),
(311, '2017-01-18 10:39:09', 'OPBRG.00022', 'Top Lady', 'Top Lady', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 4, 4, 87, ''),
(312, '2017-01-18 10:39:09', 'OPBRG.00022', 'Elips Hair Mask hijau', 'Elips Hair Mask hijau', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 82, ''),
(313, '2017-01-18 10:39:09', 'OPBRG.00022', 'Elips Hair mask orange', 'Elips Hair mask orange', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 83, ''),
(314, '2017-01-18 10:39:09', 'OPBRG.00022', 'Elips Hair Mask Pink', 'Elips Hair Mask Pink', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 84, ''),
(315, '2017-01-18 10:39:09', 'OPBRG.00022', 'Elips Hair Mask Ungu', 'Elips Hair Mask Ungu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 85, ''),
(316, '2017-01-18 10:39:09', 'OPBRG.00022', 'Elips vitamin', 'Elips vitamin', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, ''),
(317, '2017-01-18 10:39:09', 'OPBRG.00022', 'Sabun Easy 700gr', 'Sabun Easy 700gr', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 157, ''),
(318, '2017-01-18 10:39:09', 'OPBRG.00022', 'Sabun Rinso 900gr', 'Sabun Rinso 900gr', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 0, 16, 16, 158, ''),
(319, '2017-01-18 10:39:09', 'OPBRG.00022', 'Daia Lemon', 'Daia Lemon', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 4, 4, 492, ''),
(320, '2017-01-18 10:39:09', 'OPBRG.00022', 'Daia Bunga 800', 'Daia Bunga 800', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 4, 4, 494, ''),
(321, '2017-01-18 10:39:09', 'OPBRG.00022', 'Daia Softener Pink', 'Daia Softener Pink', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 6, 6, 491, ''),
(322, '2017-01-18 10:39:09', 'OPBRG.00022', 'Daia Ungu', 'Daia Ungu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 4, 4, 341, ''),
(323, '2017-01-18 10:39:09', 'OPBRG.00022', 'Soklin Smart White 800', 'Soklin Smart White 800', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 6, 6, 495, ''),
(324, '2017-01-18 10:39:09', 'OPBRG.00022', 'Sampo Zinc Sst Hijau', 'Sampo Zinc Sst Hijau', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 5, 5, 150, ''),
(325, '2017-01-18 10:39:09', 'OPBRG.00022', 'Sampo Zinc Sst biru', 'Sampo Zinc Sst biru', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 151, ''),
(326, '2017-01-18 10:39:09', 'OPBRG.00022', 'Sampo Zinc Sst Merah', 'Sampo Zinc Sst Merah', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 4, 4, 475, ''),
(327, '2017-01-18 10:43:58', 'OPBRG.00023', 'Sampo Zinc Hitam', 'Sampo Zinc Hitam', 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 0, 4, 512, ''),
(328, '2017-01-18 10:43:58', 'OPBRG.00023', 'Sampo Lifboy sst kuning', 'Sampo Lifboy sst kuning', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 152, ''),
(329, '2017-01-18 10:43:58', 'OPBRG.00023', 'Sampo Lifboy sst biru', 'Sampo Lifboy sst biru', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 153, ''),
(330, '2017-01-18 10:43:58', 'OPBRG.00023', 'Sampo pantene Sst pink', 'Sampo pantene Sst pink', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 148, ''),
(331, '2017-01-18 10:43:58', 'OPBRG.00023', 'Sampo pantene Sst biru', 'Sampo pantene Sst biru', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 146, ''),
(332, '2017-01-18 10:43:58', 'OPBRG.00023', 'Sampo pantene Sst hitam', 'Sampo pantene Sst hitam', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 147, ''),
(333, '2017-01-18 10:43:58', 'OPBRG.00023', 'Sampo Dove sst Nourishment', 'Sampo Dove sst Nourishment', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 149, ''),
(334, '2017-01-18 10:45:09', 'OPBRG.00024', 'sampo Dove Daily shine', 'sampo Dove Daily shine', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 5, 4, 483, ''),
(335, '2017-01-18 10:55:01', 'OPBRG.00025', 'Molto White musk sst', 'Molto White musk sst', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 102, ''),
(336, '2017-01-18 10:55:01', 'OPBRG.00025', 'Molto Anri Bacteri', 'Molto Anri Bacteri', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 6, 6, 481, ''),
(337, '2017-01-18 10:55:01', 'OPBRG.00025', 'Molto all in 1 Biru sst', 'Molto all in 1 Biru sst', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 6, 6, 479, ''),
(338, '2017-01-18 10:55:01', 'OPBRG.00025', 'Molto Elegant sst', 'Molto Elegant sst', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 4, 4, 480, ''),
(339, '2017-01-18 10:55:01', 'OPBRG.00025', 'Soklin Liquid sst Biru', 'Soklin Liquid sst Biru', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 6, 6, 106, ''),
(340, '2017-01-18 10:55:01', 'OPBRG.00025', 'Soklin Liquid sst Parfum', 'Soklin Liquid sst Parfum', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 105, ''),
(341, '2017-01-18 10:55:01', 'OPBRG.00025', 'Soklin Liquid sst ungu', 'Soklin Liquid sst ungu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 104, ''),
(342, '2017-01-18 10:55:01', 'OPBRG.00025', 'Soklin Liquid sst Pink', 'Soklin Liquid sst Pink', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 103, ''),
(343, '2017-01-18 10:55:01', 'OPBRG.00025', 'Rinso Cair  Molto  42', 'Rinso Cair  Molto  42', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 108, ''),
(344, '2017-01-18 10:55:01', 'OPBRG.00025', 'Rinso Cair  Hijau 42', 'Rinso Cair  Hijau 42', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 0, 14, 14, 107, ''),
(345, '2017-01-18 10:55:01', 'OPBRG.00025', 'Downy Biru sst', 'Downy Biru sst', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 6, 6, 482, ''),
(346, '2017-01-18 10:55:01', 'OPBRG.00025', 'Downy Hitam sst', 'Downy Hitam sst', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 6, 6, 101, ''),
(347, '2017-01-18 10:55:01', 'OPBRG.00025', 'Sampo Emeron Hijau 170ml', 'Sampo Emeron Hijau 170ml', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 145, ''),
(348, '2017-01-18 10:55:01', 'OPBRG.00025', 'Sampo Emeron hitam ', 'Sampo Emeron hitam ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 144, ''),
(349, '2017-01-18 10:55:01', 'OPBRG.00025', 'Sb citra hijau', 'Sb citra hijau', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 100, ''),
(350, '2017-01-18 10:55:01', 'OPBRG.00025', 'Sabun Fress orange', 'Sabun Fress orange', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 51, 0, 51, 51, 99, ''),
(351, '2017-01-18 10:55:01', 'OPBRG.00025', 'Emeron Hitam 340', 'Emeron Hitam 340', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 89, ''),
(352, '2017-01-18 10:55:01', 'OPBRG.00025', 'Emeron putih 340', 'Emeron putih 340', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 88, ''),
(353, '2017-01-18 10:55:01', 'OPBRG.00025', 'Sabun Tawon', 'Sabun Tawon', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 5, 5, 90, ''),
(354, '2017-01-18 10:55:01', 'OPBRG.00025', 'Sabun Badan Mangir', 'Sabun Badan Mangir', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 91, ''),
(355, '2017-01-18 10:55:01', 'OPBRG.00025', 'Sabun Badan', 'Sabun Badan', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 92, ''),
(356, '2017-01-18 10:55:01', 'OPBRG.00025', 'zwitsal natural', 'zwitsal natural', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 93, ''),
(357, '2017-01-18 11:00:25', 'OPBRG.00026', 'Johnson putih', 'Johnson putih', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 4, 4, 96, ''),
(358, '2017-01-18 11:00:25', 'OPBRG.00026', 'Johnson Pink', 'Johnson Pink', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 95, ''),
(359, '2017-01-18 11:00:25', 'OPBRG.00026', 'Shinzui Orange', 'Shinzui Orange', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 98, ''),
(360, '2017-01-18 11:00:25', 'OPBRG.00026', 'Shinzui Ungu', 'Shinzui Ungu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 4, 4, 97, ''),
(361, '2017-01-18 11:00:25', 'OPBRG.00026', 'Sabun Giv Putih', 'Sabun Giv Putih', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11, 0, 11, 11, 110, ''),
(362, '2017-01-18 11:00:25', 'OPBRG.00026', 'Sabun Giv Ungu', 'Sabun Giv Ungu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23, 0, 23, 23, 112, ''),
(363, '2017-01-18 11:00:25', 'OPBRG.00026', 'Sabun Giv Merah', 'Sabun Giv Merah', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 7, 7, 109, ''),
(364, '2017-01-18 11:00:25', 'OPBRG.00026', 'Sabun Lux Putih Kotak', 'Sabun Lux Putih Kotak', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 7, 7, 115, ''),
(365, '2017-01-18 11:00:25', 'OPBRG.00026', 'Sabun Lux biru', 'Sabun Lux biru', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 4, 4, 113, ''),
(366, '2017-01-18 11:00:25', 'OPBRG.00026', 'Sabun Lux Pink', 'Sabun Lux Pink', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 117, ''),
(367, '2017-01-18 11:00:25', 'OPBRG.00026', 'Sabun Lux Ungu', 'Sabun Lux Ungu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 116, ''),
(368, '2017-01-18 11:00:25', 'OPBRG.00026', 'Sabun Lux putih', 'Sabun Lux putih', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 6, 6, 114, ''),
(369, '2017-01-18 11:00:25', 'OPBRG.00026', 'Sabun Nuvo Kuning', 'Sabun Nuvo Kuning', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 120, ''),
(370, '2017-01-18 11:00:25', 'OPBRG.00026', 'Sabun Nuvo Cool', 'Sabun Nuvo Cool', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22, 0, 22, 22, 119, ''),
(371, '2017-01-18 11:08:58', 'OPBRG.00027', 'Sabun Nuvo Merah', 'Sabun Nuvo Merah', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 190, 0, 190, 190, 122, ''),
(372, '2017-01-18 11:08:58', 'OPBRG.00027', 'Sabun Nuvo Hijau', 'Sabun Nuvo Hijau', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 0, 86, 86, 118, ''),
(373, '2017-01-18 11:08:58', 'OPBRG.00027', 'Sabun Lifboy Hijau', 'Sabun Lifboy Hijau', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 45, 0, 45, 45, 125, ''),
(374, '2017-01-18 11:08:58', 'OPBRG.00027', 'Sabun Lifboy merah', 'Sabun Lifboy merah', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, 0, 24, 24, 124, '');
INSERT INTO `tbl_trans_opn_det` (`id`, `tgl`, `no_stok_op`, `bahan`, `bahan_sys`, `stok_awal`, `stok_awal_sys`, `stok_masuk`, `stok_masuk_sys`, `stok_keluar`, `stok_keluar_sys`, `retur`, `retur_sys`, `rusak`, `rusak_sys`, `total`, `total_sys`, `selisih`, `fisik`, `id_bahan`, `keterangan`) VALUES
(375, '2017-01-18 11:08:58', 'OPBRG.00027', 'Sabun Lifboy biru', 'Sabun Lifboy biru', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 0, 30, 30, 123, ''),
(376, '2017-01-18 11:08:58', 'OPBRG.00027', 'Sabun Dettol re- energize 65gr', 'Sabun Dettol re- energize 65gr', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 127, ''),
(377, '2017-01-18 11:08:58', 'OPBRG.00027', 'Sabun Dettol sensitive 65gr', 'Sabun Dettol sensitive 65gr', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 8, 8, 129, ''),
(378, '2017-01-18 11:08:58', 'OPBRG.00027', 'Sabun Dettol ektra timun 65gr', 'Sabun Dettol ektra timun 65gr', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17, 0, 17, 17, 126, ''),
(379, '2017-01-18 11:08:58', 'OPBRG.00027', 'Sabun Dettol cool 65gr', 'Sabun Dettol cool 65gr', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 4, 4, 128, ''),
(380, '2017-01-18 11:08:58', 'OPBRG.00027', 'Sabun Dettol Sensitive 105gr', 'Sabun Dettol Sensitive 105gr', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 4, 4, 130, ''),
(381, '2017-01-18 11:08:58', 'OPBRG.00027', 'Sabun Dettol Active 105gr', 'Sabun Dettol Active 105gr', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 0, 14, 14, 131, ''),
(382, '2017-01-18 11:08:58', 'OPBRG.00027', 'Sabun So klin softergen ungu 800gr', 'Sabun So klin softergen ungu 800gr', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 160, ''),
(383, '2017-01-18 11:08:58', 'OPBRG.00027', 'Sabun So klin softergen pink 800gr', 'Sabun So klin softergen pink 800gr', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 4, 4, 161, ''),
(384, '2017-01-18 11:08:58', 'OPBRG.00027', 'Boom Merah', 'Boom Merah', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 12, 12, 486, ''),
(385, '2017-01-18 11:08:58', 'OPBRG.00027', 'Sabun Boom', 'Sabun Boom', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 12, 12, 162, ''),
(386, '2017-01-18 11:08:58', 'OPBRG.00027', 'Pepsodent Complete 170', 'Pepsodent Complete 170', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 58, ''),
(387, '2017-01-18 11:08:58', 'OPBRG.00027', 'Pepsodent Whitening 75', 'Pepsodent Whitening 75', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 7, 7, 57, ''),
(388, '2017-01-18 11:08:58', 'OPBRG.00027', 'Pepsodent 75', 'Pepsodent 75', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 100, 100, 56, ''),
(389, '2017-01-18 11:08:58', 'OPBRG.00027', 'Pepsodent 120', 'Pepsodent 120', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19, 0, 19, 19, 55, ''),
(390, '2017-01-18 11:08:58', 'OPBRG.00027', 'Close Up 65', 'Close Up 65', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 62, ''),
(391, '2017-01-18 11:17:24', 'OPBRG.00028', 'Sytema nano', 'Sytema nano', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11, 0, 11, 11, 60, ''),
(392, '2017-01-18 11:17:24', 'OPBRG.00028', 'Formula 75', 'Formula 75', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 4, 4, 59, ''),
(393, '2017-01-18 11:17:24', 'OPBRG.00028', 'Masker Bengkoang', 'Masker Bengkoang', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 406, ''),
(394, '2017-01-18 11:17:24', 'OPBRG.00028', 'Lulur badan', 'Lulur badan', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 405, ''),
(395, '2017-01-18 11:17:24', 'OPBRG.00028', 'Feling Pundisari', 'Feling Pundisari', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 407, ''),
(396, '2017-01-18 11:17:24', 'OPBRG.00028', 'Seprei No.1', 'Seprei No.1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 316, ''),
(397, '2017-01-18 11:17:24', 'OPBRG.00028', 'Seprei Jepang', 'Seprei Jepang', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 314, ''),
(398, '2017-01-18 11:17:24', 'OPBRG.00028', 'Seprei No.2', 'Seprei No.2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 10, 10, 315, ''),
(399, '2017-01-18 11:17:24', 'OPBRG.00028', 'Seprei No.3', 'Seprei No.3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 5, 5, 317, ''),
(400, '2017-01-18 11:17:24', 'OPBRG.00028', 'Engkrak', 'Engkrak', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 413, ''),
(401, '2017-01-18 11:17:24', 'OPBRG.00028', 'Gantungan baju', 'Gantungan baju', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 411, ''),
(402, '2017-01-18 11:17:24', 'OPBRG.00028', 'Sulak', 'Sulak', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 414, ''),
(403, '2017-01-18 11:17:24', 'OPBRG.00028', 'Kranjang sampah', 'Kranjang sampah', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 412, ''),
(404, '2017-01-18 11:17:24', 'OPBRG.00028', 'Sapu tebah', 'Sapu tebah', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 409, ''),
(405, '2017-01-18 11:17:24', 'OPBRG.00028', 'Sapu 2 macan miring', 'Sapu 2 macan miring', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 410, ''),
(406, '2017-01-18 11:17:24', 'OPBRG.00028', 'Keset besar', 'Keset besar', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 408, ''),
(407, '2017-01-18 11:17:24', 'OPBRG.00028', 'Pembersih kaca', 'Pembersih kaca', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 433, ''),
(408, '2017-01-18 11:17:24', 'OPBRG.00028', 'Bed cover', 'Bed cover', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 435, ''),
(409, '2017-01-18 11:31:19', 'OPBRG.00029', 'Dangdut Putih', 'Dangdut Putih', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 20, 20, 348, ''),
(410, '2017-01-18 11:31:19', 'OPBRG.00029', 'HIT refill', 'HIT refill', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 142, ''),
(411, '2017-01-18 11:31:19', 'OPBRG.00029', 'Wipol 800ml', 'Wipol 800ml', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 140, ''),
(412, '2017-01-18 11:31:19', 'OPBRG.00029', 'shine besar', 'shine besar', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 141, ''),
(413, '2017-01-18 11:31:19', 'OPBRG.00029', 'WPC biru', 'WPC biru', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 138, ''),
(414, '2017-01-18 11:31:19', 'OPBRG.00029', 'WPC hijau', 'WPC hijau', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 4, 4, 139, ''),
(415, '2017-01-18 11:31:19', 'OPBRG.00029', 'Poriklin 1000ml', 'Poriklin 1000ml', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 6, 6, 137, ''),
(416, '2017-01-18 11:31:19', 'OPBRG.00029', 'So klin lantai ungu 800ml', 'So klin lantai ungu 800ml', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 136, ''),
(417, '2017-01-18 11:31:19', 'OPBRG.00029', 'So klin lantai biru 800ml', 'So klin lantai biru 800ml', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 134, ''),
(418, '2017-01-18 11:31:19', 'OPBRG.00029', 'Mama Lemon anti gores', 'Mama Lemon anti gores', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 5, 5, 132, ''),
(419, '2017-01-18 11:31:19', 'OPBRG.00029', 'Mama Lemon Anti Bacteri 800ml', 'Mama Lemon Anti Bacteri 800ml', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 159, ''),
(420, '2017-01-18 11:36:39', 'OPBRG.00030', 'Mama Lemon kuning 800', 'Mama Lemon kuning 800', 7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 7, 7, 0, 7, 513, ''),
(421, '2017-01-18 11:36:39', 'OPBRG.00030', 'Sunlig Jeruk Nipis 800', 'Sunlig Jeruk Nipis 800', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 20, 20, 484, ''),
(422, '2017-01-18 11:36:39', 'OPBRG.00030', 'Sunlig Cair Anti bacteria 800', 'Sunlig Cair Anti bacteria 800', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 458, ''),
(423, '2017-01-18 11:51:43', 'OPBRG.00031', 'Rinso Cair molto pink 800 ml', 'Rinso Cair molto pink 800 ml', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 514, ''),
(424, '2017-01-18 11:51:43', 'OPBRG.00031', 'Rinso Cair molto  biru 800 ml', 'Rinso Cair molto  biru 800 ml', 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 0, 3, 515, ''),
(425, '2017-01-18 11:51:43', 'OPBRG.00031', 'Rinso Cair Anti noda 800 ml', 'Rinso Cair Anti noda 800 ml', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 516, ''),
(426, '2017-01-18 11:51:43', 'OPBRG.00031', 'Rinso Cair Parfum 800 ml', 'Rinso Cair Parfum 800 ml', 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 2, 517, ''),
(427, '2017-01-18 11:51:43', 'OPBRG.00031', 'Soklin Liquid Pink 800', 'Soklin Liquid Pink 800', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 5, 5, 77, ''),
(428, '2017-01-18 11:51:43', 'OPBRG.00031', 'Soklin Liquid Biru 800', 'Soklin Liquid Biru 800', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 5, 5, 76, ''),
(429, '2017-01-18 11:51:43', 'OPBRG.00031', 'Soklin Liqud Ungu 800', 'Soklin Liqud Ungu 800', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 6, 6, 75, ''),
(430, '2017-01-18 11:51:43', 'OPBRG.00031', 'Ciptadent  hijau 190', 'Ciptadent  hijau 190', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 5, 5, 63, ''),
(431, '2017-01-18 11:51:43', 'OPBRG.00031', 'Ciptadent Fresh Mint 190 gr', 'Ciptadent Fresh Mint 190 gr', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 12, 12, 498, ''),
(432, '2017-01-18 11:59:02', 'OPBRG.00032', 'Ciptadent Fresh mint 75 gr', 'Ciptadent Fresh mint 75 gr', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 12, 12, 497, ''),
(433, '2017-01-18 11:59:02', 'OPBRG.00032', 'Ciptadent Cool Mint 75', 'Ciptadent Cool Mint 75', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 12, 12, 496, ''),
(434, '2017-01-18 11:59:02', 'OPBRG.00032', 'Formula Junior Vitamin', 'Formula Junior Vitamin', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 65, ''),
(435, '2017-01-18 11:59:02', 'OPBRG.00032', 'Formula junior ', 'Formula junior ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 64, ''),
(436, '2017-01-18 11:59:02', 'OPBRG.00032', 'Dee dee orange', 'Dee dee orange', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 67, ''),
(437, '2017-01-18 11:59:02', 'OPBRG.00032', 'Dee dee Grape', 'Dee dee Grape', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 68, ''),
(438, '2017-01-18 11:59:02', 'OPBRG.00032', 'Cussons Kid strawbery', 'Cussons Kid strawbery', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 69, ''),
(439, '2017-01-18 11:59:02', 'OPBRG.00032', 'Kodomo Angur', 'Kodomo Angur', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 0, 13, 13, 71, ''),
(440, '2017-01-18 11:59:02', 'OPBRG.00032', 'Listerin Cool mint', 'Listerin Cool mint', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 73, ''),
(441, '2017-01-18 11:59:02', 'OPBRG.00032', 'Listerin Natural', 'Listerin Natural', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 72, ''),
(442, '2017-01-18 11:59:02', 'OPBRG.00032', 'Formula Paket', 'Formula Paket', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 5, 5, 74, ''),
(443, '2017-01-18 12:06:31', 'OPBRG.00033', 'Cling Biru 450', 'Cling Biru 450', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 53, ''),
(444, '2017-01-18 12:06:31', 'OPBRG.00033', 'So klin Softener kuning 900', 'So klin Softener kuning 900', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 52, ''),
(445, '2017-01-18 12:06:31', 'OPBRG.00033', 'Pewangi So klin ungu 450', 'Pewangi So klin ungu 450', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 39, ''),
(446, '2017-01-18 12:06:31', 'OPBRG.00033', 'Pewangi So Klin biru 450', 'Pewangi So Klin biru 450', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 40, ''),
(447, '2017-01-18 12:06:31', 'OPBRG.00033', 'Rapika Refil Pink 450', 'Rapika Refil Pink 450', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 41, ''),
(448, '2017-01-18 12:06:31', 'OPBRG.00033', 'Rapika Refil Biru 450', 'Rapika Refil Biru 450', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 499, ''),
(449, '2017-01-18 12:06:31', 'OPBRG.00033', 'Rapika refil Ungu 450', 'Rapika refil Ungu 450', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 42, ''),
(450, '2017-01-18 12:06:31', 'OPBRG.00033', 'Sleek Baby 450 ml', 'Sleek Baby 450 ml', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 51, ''),
(451, '2017-01-18 12:06:31', 'OPBRG.00033', 'Kispray sst Pink', 'Kispray sst Pink', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 44, ''),
(452, '2017-01-18 12:14:23', 'OPBRG.00034', 'Kispray sst Biru', 'Kispray sst Biru', 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 0, 3, 518, ''),
(453, '2017-01-18 12:14:23', 'OPBRG.00034', 'Daia Ungu', 'Daia Ungu', 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 2, 4, -2, 2, 341, ''),
(454, '2017-01-18 12:14:23', 'OPBRG.00034', 'Daia biru', 'Daia biru', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 340, ''),
(455, '2017-01-18 12:14:23', 'OPBRG.00034', 'So klin sst ungu', 'So klin sst ungu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 5, 5, 342, ''),
(456, '2017-01-18 12:26:15', 'OPBRG.00035', 'Daia Softener Pink sst', 'Daia Softener Pink sst', 12, 12, 0, 0, 0, 0, 0, 0, 0, 0, 12, 12, 0, 12, 520, ''),
(457, '2017-01-18 12:26:15', 'OPBRG.00035', 'Soklin Softener pink sst', 'Soklin Softener pink sst', 12, 12, 0, 0, 0, 0, 0, 0, 0, 0, 12, 12, 0, 12, 519, ''),
(458, '2017-01-18 12:26:15', 'OPBRG.00035', 'Jazz1 SSt pink', 'Jazz1 SSt pink', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 5, 5, 471, ''),
(459, '2017-01-18 12:26:15', 'OPBRG.00035', 'Jazz1 SSt Lavender', 'Jazz1 SSt Lavender', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 4, 4, 472, ''),
(460, '2017-01-18 12:26:15', 'OPBRG.00035', 'Rinso sst Molto', 'Rinso sst Molto', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 349, ''),
(461, '2017-01-18 12:26:15', 'OPBRG.00035', 'Rinso sst kecil', 'Rinso sst kecil', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 9, 9, 343, ''),
(462, '2017-01-18 12:26:15', 'OPBRG.00035', 'Sunlight Cream', 'Sunlight Cream', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 4, 4, 344, ''),
(463, '2017-01-18 12:26:15', 'OPBRG.00035', 'Wing Biru', 'Wing Biru', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 27, 0, 27, 27, 346, ''),
(464, '2017-01-18 13:05:27', 'OPBRG.00036', 'Beras Pak tani @5kg', 'Beras Pak tani @5kg', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 154, ''),
(465, '2017-01-18 13:05:27', 'OPBRG.00036', 'Beras Organik', 'Beras Organik', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 8, 8, 439, ''),
(466, '2017-01-18 13:05:27', 'OPBRG.00036', 'Beras Premium @2kg', 'Beras Premium @2kg', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 38, 0, 38, 38, 155, ''),
(467, '2017-01-18 13:05:27', 'OPBRG.00036', 'Beras Premium @5kg', 'Beras Premium @5kg', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 0, 13, 13, 156, ''),
(468, '2017-01-18 13:05:27', 'OPBRG.00036', 'Sikat Tulip', 'Sikat Tulip', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 70, 0, 70, 70, 194, ''),
(469, '2017-01-18 13:05:27', 'OPBRG.00036', 'Sikat Formula', 'Sikat Formula', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 8, 8, 195, ''),
(470, '2017-01-18 13:05:27', 'OPBRG.00036', 'Sikat Ciptadent', 'Sikat Ciptadent', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11, 0, 11, 11, 199, ''),
(471, '2017-01-18 13:05:27', 'OPBRG.00036', 'Sikat Formula anak', 'Sikat Formula anak', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 198, ''),
(472, '2017-01-18 13:05:27', 'OPBRG.00036', 'Air wick komplit', 'Air wick komplit', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 168, ''),
(473, '2017-01-18 13:05:27', 'OPBRG.00036', 'Air Wick citrus', 'Air Wick citrus', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 164, ''),
(474, '2017-01-18 13:05:27', 'OPBRG.00036', ' Para Kamper', ' Para Kamper', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 163, ''),
(475, '2017-01-18 13:05:27', 'OPBRG.00036', 'Soffel pink sst', 'Soffel pink sst', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 6, 6, 45, ''),
(476, '2017-01-18 13:05:27', 'OPBRG.00036', 'Soffel kuning sst', 'Soffel kuning sst', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 4, 4, 46, ''),
(477, '2017-01-18 13:05:27', 'OPBRG.00036', 'Rapika hijau sst', 'Rapika hijau sst', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 49, ''),
(478, '2017-01-18 13:05:27', 'OPBRG.00036', 'Rapika Merah sst', 'Rapika Merah sst', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 50, ''),
(479, '2017-01-18 13:05:27', 'OPBRG.00036', 'Kingkong', 'Kingkong', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 0, 14, 14, 43, ''),
(480, '2017-01-18 13:25:47', 'OPBRG.00037', 'Beras Rejo Mulya @5kg', 'Beras Rejo Mulya @5kg', 48, 48, 0, 0, 0, 0, 0, 0, 0, 0, 48, 48, 0, 48, 521, ''),
(481, '2017-01-18 13:25:47', 'OPBRG.00037', 'Air Wick Isi ulang aqua', 'Air Wick Isi ulang aqua', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 166, ''),
(482, '2017-01-18 13:25:47', 'OPBRG.00037', 'Air Wick isi ulang lavender', 'Air Wick isi ulang lavender', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 167, ''),
(483, '2017-01-18 13:25:47', 'OPBRG.00037', 'Kapur Barus Dahlia', 'Kapur Barus Dahlia', 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 2, 522, ''),
(484, '2017-01-18 13:25:47', 'OPBRG.00037', 'Kapur Barus toliet', 'Kapur Barus toliet', 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 0, 4, 523, ''),
(485, '2017-01-18 13:25:47', 'OPBRG.00037', 'TK  02', 'TK  02', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 312, ''),
(486, '2017-01-18 13:25:47', 'OPBRG.00037', 'Tk 10', 'Tk 10', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 313, ''),
(487, '2017-01-18 13:25:47', 'OPBRG.00037', 'TW 03', 'TW 03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 311, ''),
(488, '2017-01-18 13:25:47', 'OPBRG.00037', 'TW 02', 'TW 02', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 310, ''),
(489, '2017-01-18 13:25:47', 'OPBRG.00037', 'TW 07', 'TW 07', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 309, ''),
(490, '2017-01-18 13:25:47', 'OPBRG.00037', 'TW 20', 'TW 20', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 308, ''),
(491, '2017-01-19 13:58:00', 'OPBRG.00038', 'krupuk Udang', 'krupuk Udang', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 12, 527, ''),
(492, '2017-01-19 13:58:00', 'OPBRG.00038', 'Telor', 'Telor', 20, 20, 0, 0, 0, 0, 0, 0, 0, 0, 20, 20, 0, 20, 528, ''),
(493, '2017-01-19 13:58:00', 'OPBRG.00038', 'Abon', 'Abon', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 526, ''),
(494, '2017-01-19 13:58:00', 'OPBRG.00038', 'Beras Ketan', 'Beras Ketan', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 524, ''),
(495, '2017-01-19 13:58:00', 'OPBRG.00038', 'aquaria gelas', 'aquaria gelas', 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15, 0, 15, 529, ''),
(496, '2017-01-20 10:45:05', 'OPBRG.00039', 'Telor', 'Telor', 20, 20, 0, 0, 20, 20, 0, 0, 0, 0, 0, 0, 0, 0, 528, ''),
(497, '2017-01-20 10:45:39', 'OPBRG.00040', 'Abon', 'Abon', 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 526, ''),
(498, '2017-01-20 10:46:24', 'OPBRG.00041', 'aquaria gelas', 'aquaria gelas', 15, 15, 0, 0, 10, 10, 0, 0, 0, 0, 5, 5, 0, 5, 529, ''),
(499, '2017-01-20 10:47:00', 'OPBRG.00042', 'Beras Ketan', 'Beras Ketan', 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 524, ''),
(500, '2017-01-20 10:48:05', 'OPBRG.00043', 'Beras Rejo Mulya @5kg', 'Beras Rejo Mulya @5kg', 48, 48, 0, 0, 2, 2, 0, 0, 0, 0, 13, 46, -33, 13, 521, ''),
(501, '2017-01-20 10:50:29', 'OPBRG.00044', 'Sirup Kartika melon', 'Sirup Kartika melon', 12, 12, 0, 0, 12, 12, 0, 0, 0, 0, 0, 0, 0, 0, 488, ''),
(502, '2017-01-20 10:54:06', 'OPBRG.00045', 'Snikers besar', 'Snikers besar', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 431, ''),
(503, '2017-01-20 10:54:06', 'OPBRG.00045', 'Snikers Kecil', 'Snikers Kecil', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 7, 7, 432, ''),
(504, '2017-01-20 10:54:06', 'OPBRG.00045', 'ABC kacang ijo', 'ABC kacang ijo', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 423, ''),
(505, '2017-01-20 10:58:43', 'OPBRG.00046', 'Gula pasir 1/2', 'Gula pasir 1/2', 36, 36, 0, 0, 1, 1, 0, 0, 0, 0, 108, 35, 73, 108, 368, ''),
(506, '2017-01-20 10:58:43', 'OPBRG.00046', 'Gula Pasir 1kg', 'Gula Pasir 1kg', 29, 29, 0, 0, 1, 1, 0, 0, 0, 0, 100, 28, 72, 100, 367, ''),
(507, '2017-01-20 10:59:04', 'OPBRG.00047', 'Gula jawa 1/2', 'Gula jawa 1/2', 13, 13, 0, 0, 1, 1, 0, 0, 0, 0, 0, 12, -12, 0, 366, ''),
(510, '2017-01-25 15:33:57', 'OPBRG.00048', 'PRODUK UNTUK NGETES', 'PRODUK UNTUK NGETES', 50, 50, 0, 0, 0, 0, 0, 0, 0, 0, 55, 50, 5, 55, 539, ''),
(511, '2017-01-30 14:31:25', 'OPBRG.00049', 'Beras Maknyus', 'Beras Maknyus', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 490, ''),
(512, '2017-01-30 14:34:03', 'OPBRG.00050', 'tepung beras 500g', 'tepung beras 500g', 21, 21, 0, 0, 20, 20, 0, 0, 0, 0, 1, 1, 0, 1, 182, ''),
(513, '2017-01-30 14:34:03', 'OPBRG.00050', 'Nutrisari Kardus', 'Nutrisari Kardus', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 3, 176, ''),
(514, '2017-01-30 14:34:03', 'OPBRG.00050', 'shine besar', 'shine besar', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1, 1, 2, 141, ''),
(515, '2017-01-30 14:34:59', 'OPBRG.00051', 'Rokok MLD', 'Rokok MLD', 5, 5, 5, 5, 0, 0, 0, 0, 0, 0, 5, 10, -5, 5, 534, ''),
(516, '2017-01-30 14:41:07', 'OPBRG.00052', 'Good Day Coolin', 'Good Day Coolin', 5, 5, 5, 5, 1, 1, 0, 0, 0, 0, 0, 9, -9, 0, 224, ''),
(517, '2017-01-31 14:11:05', 'OPBRG.00053', 'Tepung Ketan', 'Tepung Ketan', 28, 28, 0, 0, 20, 20, 0, 0, 0, 0, 1, 8, -7, 5, 180, ''),
(518, '2017-01-31 14:11:05', 'OPBRG.00053', 'Susu zee Coklat sst', 'Susu zee Coklat sst', 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 5, -1, 6, 69, 192, ''),
(519, '2017-01-31 14:11:05', 'OPBRG.00053', 'Susu zee Putih sst', 'Susu zee Putih sst', 0, 0, 0, 0, 10, 10, 0, 0, 0, 0, 1, -10, 11, 11, 193, ''),
(520, '2017-01-31 14:11:05', 'OPBRG.00053', 'Gula jawa 1/2', 'Gula jawa 1/2', 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 10, -1, 11, 13, 366, ''),
(521, '2017-01-31 14:11:05', 'OPBRG.00053', 'Beras Organik', 'Beras Organik', 8, 8, 20, 20, 10, 10, 0, 0, 0, 0, 1, 18, -17, 19, 439, ''),
(522, '2017-02-03 06:14:07', 'OPBRG.00001', 'Indomie goreng', 'Indomie goreng', 80, 80, 80, 80, 2, 2, 0, 0, 0, 0, 78, 158, -80, 50, 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_trans_opn_ksr`
--

CREATE TABLE `tbl_trans_opn_ksr` (
  `no_stok_op` varchar(160) NOT NULL,
  `tgl` datetime NOT NULL,
  `kasir` varchar(160) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_trans_opn_ksr_det`
--

CREATE TABLE `tbl_trans_opn_ksr_det` (
  `id` int(11) NOT NULL,
  `tgl` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `no_stok_op` varchar(160) NOT NULL,
  `id_user` int(11) NOT NULL,
  `kasir` varchar(160) NOT NULL,
  `setor` int(11) NOT NULL,
  `penjualan` int(11) NOT NULL,
  `penjualan_sys` int(11) NOT NULL,
  `selisih` int(32) NOT NULL,
  `fisik` int(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_util_backup`
--

CREATE TABLE `tbl_util_backup` (
  `id` int(11) UNSIGNED NOT NULL,
  `tgl` timestamp NULL DEFAULT NULL,
  `name` varchar(160) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_akt_aktiva`
--
ALTER TABLE `tbl_akt_aktiva`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_akt_ekuitas`
--
ALTER TABLE `tbl_akt_ekuitas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_akt_kas`
--
ALTER TABLE `tbl_akt_kas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_hutang`
--
ALTER TABLE `tbl_hutang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_inventori`
--
ALTER TABLE `tbl_inventori`
  ADD PRIMARY KEY (`id_inventori`);

--
-- Indexes for table `tbl_ion_groups`
--
ALTER TABLE `tbl_ion_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_ion_login_attempts`
--
ALTER TABLE `tbl_ion_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_ion_login_history`
--
ALTER TABLE `tbl_ion_login_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_ion_users`
--
ALTER TABLE `tbl_ion_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_ion_users_groups`
--
ALTER TABLE `tbl_ion_users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- Indexes for table `tbl_karyawan`
--
ALTER TABLE `tbl_karyawan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_karyawan_jabatan`
--
ALTER TABLE `tbl_karyawan_jabatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `tbl_meja`
--
ALTER TABLE `tbl_meja`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_metode_pemb`
--
ALTER TABLE `tbl_metode_pemb`
  ADD PRIMARY KEY (`no_nota`);

--
-- Indexes for table `tbl_m_bahan`
--
ALTER TABLE `tbl_m_bahan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_m_produk`
--
ALTER TABLE `tbl_m_produk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_m_produk_item`
--
ALTER TABLE `tbl_m_produk_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_m_satuan`
--
ALTER TABLE `tbl_m_satuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_m_supplier`
--
ALTER TABLE `tbl_m_supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_orderlist`
--
ALTER TABLE `tbl_orderlist`
  ADD PRIMARY KEY (`no_nota`);

--
-- Indexes for table `tbl_orderlist_det`
--
ALTER TABLE `tbl_orderlist_det`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tbl_orderlist_det_tbl_orderlist` (`no_nota`);

--
-- Indexes for table `tbl_pelanggan`
--
ALTER TABLE `tbl_pelanggan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode` (`kode`);

--
-- Indexes for table `tbl_pelanggan_grup`
--
ALTER TABLE `tbl_pelanggan_grup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_pemasukan`
--
ALTER TABLE `tbl_pemasukan`
  ADD PRIMARY KEY (`id_pemasukan`);

--
-- Indexes for table `tbl_pembelian`
--
ALTER TABLE `tbl_pembelian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_pembelian_det`
--
ALTER TABLE `tbl_pembelian_det`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_pengaturan`
--
ALTER TABLE `tbl_pengaturan`
  ADD PRIMARY KEY (`id_pengaturan`);

--
-- Indexes for table `tbl_pengaturan_mata_uang`
--
ALTER TABLE `tbl_pengaturan_mata_uang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_pengeluaran`
--
ALTER TABLE `tbl_pengeluaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_piutang`
--
ALTER TABLE `tbl_piutang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_printer`
--
ALTER TABLE `tbl_printer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_sessions_back`
--
ALTER TABLE `tbl_sessions_back`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indexes for table `tbl_sessions_front`
--
ALTER TABLE `tbl_sessions_front`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indexes for table `tbl_set_meja`
--
ALTER TABLE `tbl_set_meja`
  ADD PRIMARY KEY (`id_set_meja`);

--
-- Indexes for table `tbl_track_bahan`
--
ALTER TABLE `tbl_track_bahan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_trans_opn`
--
ALTER TABLE `tbl_trans_opn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_trans_opn_det`
--
ALTER TABLE `tbl_trans_opn_det`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_trans_opn_ksr`
--
ALTER TABLE `tbl_trans_opn_ksr`
  ADD PRIMARY KEY (`no_stok_op`);

--
-- Indexes for table `tbl_trans_opn_ksr_det`
--
ALTER TABLE `tbl_trans_opn_ksr_det`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_util_backup`
--
ALTER TABLE `tbl_util_backup`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_akt_aktiva`
--
ALTER TABLE `tbl_akt_aktiva`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `tbl_akt_ekuitas`
--
ALTER TABLE `tbl_akt_ekuitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_akt_kas`
--
ALTER TABLE `tbl_akt_kas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_hutang`
--
ALTER TABLE `tbl_hutang`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `tbl_inventori`
--
ALTER TABLE `tbl_inventori`
  MODIFY `id_inventori` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_ion_groups`
--
ALTER TABLE `tbl_ion_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tbl_ion_login_attempts`
--
ALTER TABLE `tbl_ion_login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_ion_login_history`
--
ALTER TABLE `tbl_ion_login_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_ion_users`
--
ALTER TABLE `tbl_ion_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `tbl_ion_users_groups`
--
ALTER TABLE `tbl_ion_users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `tbl_karyawan`
--
ALTER TABLE `tbl_karyawan`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_karyawan_jabatan`
--
ALTER TABLE `tbl_karyawan_jabatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `tbl_meja`
--
ALTER TABLE `tbl_meja`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_m_bahan`
--
ALTER TABLE `tbl_m_bahan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_m_produk`
--
ALTER TABLE `tbl_m_produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=569;
--
-- AUTO_INCREMENT for table `tbl_m_produk_item`
--
ALTER TABLE `tbl_m_produk_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_m_satuan`
--
ALTER TABLE `tbl_m_satuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tbl_m_supplier`
--
ALTER TABLE `tbl_m_supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_orderlist_det`
--
ALTER TABLE `tbl_orderlist_det`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1638;
--
-- AUTO_INCREMENT for table `tbl_pelanggan`
--
ALTER TABLE `tbl_pelanggan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `tbl_pelanggan_grup`
--
ALTER TABLE `tbl_pelanggan_grup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_pemasukan`
--
ALTER TABLE `tbl_pemasukan`
  MODIFY `id_pemasukan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tbl_pembelian`
--
ALTER TABLE `tbl_pembelian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `tbl_pembelian_det`
--
ALTER TABLE `tbl_pembelian_det`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;
--
-- AUTO_INCREMENT for table `tbl_pengaturan`
--
ALTER TABLE `tbl_pengaturan`
  MODIFY `id_pengaturan` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_pengaturan_mata_uang`
--
ALTER TABLE `tbl_pengaturan_mata_uang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_pengeluaran`
--
ALTER TABLE `tbl_pengeluaran`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `tbl_piutang`
--
ALTER TABLE `tbl_piutang`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tbl_printer`
--
ALTER TABLE `tbl_printer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_set_meja`
--
ALTER TABLE `tbl_set_meja`
  MODIFY `id_set_meja` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_track_bahan`
--
ALTER TABLE `tbl_track_bahan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_trans_opn`
--
ALTER TABLE `tbl_trans_opn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_trans_opn_det`
--
ALTER TABLE `tbl_trans_opn_det`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=523;
--
-- AUTO_INCREMENT for table `tbl_trans_opn_ksr_det`
--
ALTER TABLE `tbl_trans_opn_ksr_det`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_util_backup`
--
ALTER TABLE `tbl_util_backup`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_ion_users_groups`
--
ALTER TABLE `tbl_ion_users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `tbl_ion_groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `tbl_ion_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `tbl_orderlist_det`
--
ALTER TABLE `tbl_orderlist_det`
  ADD CONSTRAINT `FK_tbl_orderlist_det_tbl_orderlist` FOREIGN KEY (`no_nota`) REFERENCES `tbl_orderlist` (`no_nota`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
