-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2023 at 05:10 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sp_mentalhealth`
--

-- --------------------------------------------------------

--
-- Table structure for table `aturan`
--

CREATE TABLE `aturan` (
  `id_aturan` int(11) NOT NULL,
  `id_penyakit` int(11) NOT NULL,
  `id_gejala` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aturan`
--

INSERT INTO `aturan` (`id_aturan`, `id_penyakit`, `id_gejala`) VALUES
(43, 1, 46),
(44, 1, 49),
(45, 1, 50),
(46, 1, 51),
(47, 1, 54),
(48, 2, 43),
(49, 2, 44),
(50, 2, 48),
(51, 2, 52),
(52, 2, 53),
(53, 2, 56),
(54, 2, 57),
(55, 3, 47),
(56, 3, 43),
(57, 3, 45),
(58, 3, 46),
(59, 3, 49),
(60, 3, 53),
(61, 3, 55),
(62, 3, 56);

-- --------------------------------------------------------

--
-- Table structure for table `gejala`
--

CREATE TABLE `gejala` (
  `id_gejala` int(11) NOT NULL,
  `kode_gejala` varchar(5) NOT NULL,
  `nama_gejala` text NOT NULL,
  `nilai_cf` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gejala`
--

INSERT INTO `gejala` (`id_gejala`, `kode_gejala`, `nama_gejala`, `nilai_cf`) VALUES
(43, 'G01', 'Menjadi marah karena hal-hal kecil', 0.4),
(44, 'G02', 'Cenderung berlebihan terhadap situasi', 0.6),
(45, 'G03', 'Ketakutan tanpa alasan yang jelas', 0.6),
(46, 'G04', 'kesulitan untuk relaksasi atau bersantai', 0.4),
(47, 'G05', 'hilang harapan dan putus asa', 0.6),
(48, 'G06', 'gangguan dalam bernapas seperti napas berdetak cepat atau sulit bernapas', 0.6),
(49, 'G07', 'sedih', 0.2),
(50, 'G08', 'tidak dapat menikmati hal-hal yang sedang di lakukan', 0.8),
(51, 'G09', 'pesimis', 0.2),
(52, 'G10', 'kesulitan dalam menelan', 0.2),
(53, 'G11', 'ketakutan', 0.6),
(54, 'G12', 'diri tidak layak', 0.6),
(55, 'G13', 'mudah kesal', 0.6),
(56, 'G14', 'mudah kelelahan', 0.6),
(57, 'G15', 'perubahan kegiatan detak jantung dan denyut nadi tanpa stimulasi oleh latihan fisik', 0.8);

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `nama_lengkap` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `level` enum('Admin','User') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `nama_lengkap`, `username`, `password`, `level`) VALUES
(1, 'Administrator', 'admin', 'admin', 'Admin'),
(2, 'dhandy', 'dhandy', '123', 'User');

-- --------------------------------------------------------

--
-- Table structure for table `penyakit`
--

CREATE TABLE `penyakit` (
  `id_penyakit` int(11) NOT NULL,
  `kode_penyakit` varchar(5) NOT NULL,
  `nama_penyakit` varchar(50) NOT NULL,
  `deskripsi` text NOT NULL,
  `solusi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penyakit`
--

INSERT INTO `penyakit` (`id_penyakit`, `kode_penyakit`, `nama_penyakit`, `deskripsi`, `solusi`) VALUES
(1, 'P01', 'Depresi', 'Depresi bisa lebih dari sekadar keadaan sedih atau tertekan. Seseorang yang mengidap gangguan dalam tahap berat dapat menimbulkan berbagai gejala yang berbeda-beda. Beberapa gejala dapat memengaruhi suasana hati, tetapi juga dapat terjadi pada beberapa bagian tubuh. ', '1. Coba kontrol pikiran Anda dan fokus pada pikiran positif\r\nMemang sulit untuk melawan emosi dan pikiran negatif yang muncul saat depresi. Namun, hal ini bukan berarti Anda tidak bisa melawannya, kok. Saat sedang merasa terpuruk, cobalah untuk berpikir positif dan motivasi diri Anda. Tanamkan ide dan katakan pada diri Anda “saya pasti bisa”. Anda juga bisa mencoba meditasi untuk menenangkan pikiran dan emosi.\r\n\r\nJika selama ini Anda sulit mengontrol pikiran negatif yang muncul, cobalah untuk menceritakan perasaan Anda pada orang terdekat atau dengan psikolog.\r\n\r\n2. Lakukan hal baru yang menyenangkan\r\nSaat depresi datang, Anda mungkin akan menjadi tidak berenergi dan enggan melakukan aktivitas. Namun, hal ini tidak baik, lho.\r\n\r\nYuk, coba jernihkan pikiran dan cari distraksi dengan mencoba hal-hal baru, berbeda, dan menyenangkan. Misalnya dengan rutin olahraga, ikuti kelas melukis, yoga, atau ikut berpartisipasi dalam kegiatan amal dan sosial. Aktivitas ini bisa membuat Anda mendapatkan teman baru dan mungkin support system yang baik\r\n\r\n3. Tulis buku harian\r\nJika Anda merasa mumet dan sulit menceritakan keluh kesah atau unek-unek kepada orang lain, cobalah untuk mencurahkan perasaan Anda dengan menulis buku harian. Di dalam buku ini, Anda bisa menuliskan semua perasaan Anda, baik itu cita-cita, harapan dalam hidup, atau hal apa yang masih ingin Anda capai.\r\n\r\nDalam menulis buku harian, Anda juga tidak perlu takut untuk merasa dihakimi. Dengan demikian, bentuk katarsis ini mungkin bisa membuat Anda merasa lebih lega.\r\n\r\n4. Coba detoks sosial media\r\nApakah Anda merasa semakin stres, cemas, dan kesepian setelah menghabiskan waktu di media sosial? Jika iya, cobalah untuk melakukan detoks sosial media untuk sementara waktu. Hal ini bisa membuat Anda merasa lebih tenang tanpa adanya distraksi dari lingkungan luar.\r\n\r\nJika Anda mulai merasakan adanya tanda-tanda depresi kembali, atau merasakan gangguan yang tidak dapat ditangani sendiri, jangan ragu untuk segera mencari bantuan dengan berkonsultasi ke psikolog atau dokter.'),
(2, 'P02', 'Kecemasan', 'Penyebab pasti rasa cemas tidak diketahui. Namun, sudah terbukti bahwa rasa cemas disebabkan oleh kombinasi faktor-faktor tertentu. Seperti gangguan mental lainnya, rasa cemas disebabkan oleh gagalnya saraf-saraf otak untuk mengontrol emosi dan rasa takut. Contohnya stress dapat mengubah alur komunikasi sel-sel saraf dalam sirkuit otak. Hal ini akan mengubah struktur otak tertentu yang mengkontrol emosi. Struktur otak tertentu ini pada awalnya dibentuk dari genetik dan keturunan keluarga', '1. Menarik napas dalam\r\nSaat menarik napas dalam-dalam, tubuh menjadi lebih rileks dan aktivitas saraf penyebab kecemasan di otak dapat berkurang. Ada pula teknik pernapasan yang bisa Anda lakukan sebagai cara mengatasi gangguan kecemasan.\r\n\r\nCaranya, tarik napas selama 4 detik, kemudian tahan selama 7 detik, lalu lepaskan kembali perlahan-lahan dalam 8 detik. Lakukan beberapa kali hingga pikiran lebih tenang.\r\n\r\n2. Memusatkan pikiran pada aktivitas yang dijalani\r\nKetika merasa cemas, fokus Anda akan terganggu. Jika ini terjadi, cobalah untuk kembali fokus pada hal yang akan dilakukan, misalnya jika ada jadwal membersihkan rumah, lakukanlah. Jika ada jadwal berkumpul dengan teman-teman, pergilah.\r\n\r\nDuduk diam tanpa melakukan apa pun dan hanya fokus pada kekhawatiran tentang hal-hal yang mungkin terjadi justru akan memperburuk rasa cemas.\r\n\r\n3. Menerapkan metode 5-4-3-2-1\r\nSaat gangguan kecemasan menyerang, lihatlah lingkungan sekitar dan sebutkan 5 benda yang ada di sekeliling Anda. Selanjutnya, sebutkan 4 benda yang bisa Anda sentuh. Setelah itu, diam sejenak dan sebutkan 3 suara yang Anda dengar.\r\n\r\nLanjutkan dengan menyebutkan 2 bau yang bisa Anda hirup. Terakhir, kenali 1 rasa yang ada di lidah Anda. Cara mengatasi gangguan kecemasan yang satu ini diyakini dapat menghentikan pikiran negatif yang membuat Anda gelisah\r\nDalam menulis buku harian, Anda juga tidak perlu takut untuk merasa dihakimi. Dengan demikian, bentuk katarsis ini mungkin bisa membuat Anda merasa lebih lega.\r\n\r\n4. Menghindari minuman berkafein dan beralkohol\r\nCara mengatasi gangguan kecemasan berikutnya adalah dengan menghindari konsumsi minuman beralkohol dan berkafein. Alkohol memang dapat memberikan efek rileks dalam jangka pendek. Namun, jika dikonsumsi terlalu sering atau berlebihan, alkohol justru dapat memperparah gangguan kecemasan.\r\n\r\nTidak hanya alkohol, konsumsi kafein dalam bentuk kopi maupun teh juga dapat memicu dan memperburuk gejala kecemasan. studi menunjukkan bahwa konsumsi kafein membuat seseorang merasa lebih gelisah, terlebih jika dikonsumsi dalam jumlah berlebihan, yaitu lebih dari 5 gelas per hari\r\n\r\nJika Anda mulai merasakan adanya tanda-tanda kecemasan kembali, atau merasakan gangguan yang tidak dapat ditangani sendiri, jangan ragu untuk segera mencari bantuan dengan berkonsultasi ke psikolog atau dokter.'),
(3, 'P03', 'Stress', 'Stres terbagi dalam stres akut dan kronis. Stres akut terjadi dalam jangka waktu yang pendek dan mudah ditangani. Sementara itu, stres kronis berlangsung dalam waktu lebih lama, yang jika tidak ditangani dapat menimbulkan masalah kesehatan.\r\n\r\nStres ditandai dengan adanya perubahan fisik dan mental. Gejala yang muncul saat seseorang mengalami stres dapat berbeda-beda, tergantung cara menyikapinya.', '1. Mengidentifikasi penyebab stress: Mengetahui apa yang menyebabkan stres sangat penting untuk menentukan cara terbaik untuk mengatasinya.\r\n\r\n2. Berbicara dengan orang yang dapat dipercaya: Berbicara dengan orang yang dapat dipercaya tentang apa yang Anda alami dapat membantu mengurangi beban dan membantu Anda merasa lebih baik.\r\n\r\n3. Mencoba teknik relaksasi: Teknik seperti meditasi, yoga, atau latihan pernapasan dapat membantu mengurangi tingkat stres\r\n\r\n4. Berolahraga: Olahraga secara teratur dapat membantu mengurangi tingkat stres dan meningkatkan kesehatan fisik secara keseluruhan.\r\n\r\nJika Anda mulai merasakan adanya tanda-tanda stress kembali, atau merasakan gangguan yang tidak dapat ditangani sendiri, jangan ragu untuk segera mencari bantuan dengan berkonsultasi ke psikolog atau dokter.');

-- --------------------------------------------------------

--
-- Table structure for table `riwayat`
--

CREATE TABLE `riwayat` (
  `id_riwayat` int(11) NOT NULL,
  `id_pengguna` int(11) DEFAULT NULL,
  `tanggal` date NOT NULL,
  `id_penyakit` int(11) DEFAULT NULL,
  `metode` enum('Forward Chaining','Certainty Factor') NOT NULL,
  `nilai` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `riwayat`
--

INSERT INTO `riwayat` (`id_riwayat`, `id_pengguna`, `tanggal`, `id_penyakit`, `metode`, `nilai`) VALUES
(6, 2, '2023-01-27', 1, 'Certainty Factor', 100),
(7, 2, '2023-01-27', 2, 'Certainty Factor', 100),
(8, 2, '2023-01-28', 1, 'Certainty Factor', 100),
(9, 2, '2023-01-28', 1, 'Certainty Factor', 100),
(10, 2, '2023-01-28', 1, 'Certainty Factor', 100),
(11, 2, '2023-01-28', 1, 'Certainty Factor', 100),
(12, 2, '2023-01-28', 2, 'Certainty Factor', 99),
(13, 2, '2023-01-28', 2, 'Certainty Factor', 93),
(14, 2, '2023-01-28', 3, 'Certainty Factor', 80),
(15, 2, '2023-01-28', 2, 'Certainty Factor', 54),
(16, 2, '2023-01-28', 3, 'Certainty Factor', 94),
(17, 2, '2023-01-28', 1, 'Certainty Factor', 0),
(18, 2, '2023-01-28', 3, 'Certainty Factor', 83);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aturan`
--
ALTER TABLE `aturan`
  ADD PRIMARY KEY (`id_aturan`) USING BTREE,
  ADD KEY `id_penyakit` (`id_penyakit`),
  ADD KEY `id_gejala` (`id_gejala`);

--
-- Indexes for table `gejala`
--
ALTER TABLE `gejala`
  ADD PRIMARY KEY (`id_gejala`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`) USING BTREE;

--
-- Indexes for table `penyakit`
--
ALTER TABLE `penyakit`
  ADD PRIMARY KEY (`id_penyakit`);

--
-- Indexes for table `riwayat`
--
ALTER TABLE `riwayat`
  ADD PRIMARY KEY (`id_riwayat`),
  ADD KEY `id_penyakit` (`id_penyakit`),
  ADD KEY `id_pengguna` (`id_pengguna`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aturan`
--
ALTER TABLE `aturan`
  MODIFY `id_aturan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `gejala`
--
ALTER TABLE `gejala`
  MODIFY `id_gejala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `penyakit`
--
ALTER TABLE `penyakit`
  MODIFY `id_penyakit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `riwayat`
--
ALTER TABLE `riwayat`
  MODIFY `id_riwayat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aturan`
--
ALTER TABLE `aturan`
  ADD CONSTRAINT `aturan_ibfk_1` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit` (`id_penyakit`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `aturan_ibfk_2` FOREIGN KEY (`id_gejala`) REFERENCES `gejala` (`id_gejala`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `riwayat`
--
ALTER TABLE `riwayat`
  ADD CONSTRAINT `riwayat_ibfk_1` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit` (`id_penyakit`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `riwayat_ibfk_2` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
