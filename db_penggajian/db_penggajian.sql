-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 27 Des 2019 pada 23.58
-- Versi Server: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_penggajian`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_gaji`
--

CREATE TABLE `detail_gaji` (
  `nomor_slip` int(3) NOT NULL,
  `kode_potongan` varchar(2) NOT NULL,
  `jumlah` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `gaji`
--

CREATE TABLE `gaji` (
  `nomor_slip` int(3) NOT NULL,
  `tanggal` date NOT NULL,
  `pendapatan` int(9) NOT NULL,
  `potongan` int(8) NOT NULL,
  `gaji_bersih` int(9) NOT NULL,
  `nip` varchar(10) NOT NULL,
  `kode_PTG` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jabatan`
--

CREATE TABLE `jabatan` (
  `kode_jabatan` varchar(2) NOT NULL,
  `nama_jabatan` varchar(17) NOT NULL,
  `gaji_pokok` int(8) NOT NULL,
  `TJ_jabatan` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `potongan`
--

CREATE TABLE `potongan` (
  `kode_potongan` varchar(2) NOT NULL,
  `nama_potongan` varchar(17) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_golongan`
--

CREATE TABLE `tb_golongan` (
  `golongan` varchar(1) NOT NULL,
  `tj_suami_istri` int(8) NOT NULL,
  `tj_anak` int(7) NOT NULL,
  `uang_makan` int(6) NOT NULL,
  `uang_lembur` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pegawai`
--

CREATE TABLE `tb_pegawai` (
  `nip` varchar(10) NOT NULL,
  `nama_pegawai` varchar(17) NOT NULL,
  `alamat` varchar(40) NOT NULL,
  `no_telp` varchar(12) NOT NULL,
  `status` enum('Lajang','Menikah') NOT NULL,
  `jumlah_anak` int(2) NOT NULL,
  `kode_jabatan` varchar(2) NOT NULL,
  `golongan` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_petugas`
--

CREATE TABLE `tb_petugas` (
  `kode_PTG` varchar(3) NOT NULL,
  `nama_PTG` varchar(17) NOT NULL,
  `pass_PTG` varchar(15) NOT NULL,
  `status_PTG` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_gaji`
--
ALTER TABLE `detail_gaji`
  ADD KEY `kode_potongan` (`kode_potongan`),
  ADD KEY `nomor_slip` (`nomor_slip`);

--
-- Indexes for table `gaji`
--
ALTER TABLE `gaji`
  ADD PRIMARY KEY (`nomor_slip`),
  ADD KEY `nip` (`nip`),
  ADD KEY `kode_PTG` (`kode_PTG`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`kode_jabatan`);

--
-- Indexes for table `potongan`
--
ALTER TABLE `potongan`
  ADD PRIMARY KEY (`kode_potongan`);

--
-- Indexes for table `tb_golongan`
--
ALTER TABLE `tb_golongan`
  ADD PRIMARY KEY (`golongan`);

--
-- Indexes for table `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  ADD PRIMARY KEY (`nip`),
  ADD KEY `kode_jabatan` (`kode_jabatan`),
  ADD KEY `golongan` (`golongan`);

--
-- Indexes for table `tb_petugas`
--
ALTER TABLE `tb_petugas`
  ADD PRIMARY KEY (`kode_PTG`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gaji`
--
ALTER TABLE `gaji`
  MODIFY `nomor_slip` int(3) NOT NULL AUTO_INCREMENT;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_gaji`
--
ALTER TABLE `detail_gaji`
  ADD CONSTRAINT `detail_gaji_ibfk_1` FOREIGN KEY (`kode_potongan`) REFERENCES `potongan` (`kode_potongan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_gaji_ibfk_2` FOREIGN KEY (`nomor_slip`) REFERENCES `gaji` (`nomor_slip`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `gaji`
--
ALTER TABLE `gaji`
  ADD CONSTRAINT `gaji_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `tb_pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `gaji_ibfk_2` FOREIGN KEY (`kode_PTG`) REFERENCES `tb_petugas` (`kode_PTG`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  ADD CONSTRAINT `tb_pegawai_ibfk_1` FOREIGN KEY (`kode_jabatan`) REFERENCES `jabatan` (`kode_jabatan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_pegawai_ibfk_2` FOREIGN KEY (`golongan`) REFERENCES `tb_golongan` (`golongan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
