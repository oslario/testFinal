-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: testGolang
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.18.04.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Message`
--

DROP TABLE IF EXISTS `Message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Message` (
  `Id` smallint(6) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Msg` varchar(256) NOT NULL,
  `CreateDate` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone` varchar(100) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Message`
--

LOCK TABLES `Message` WRITE;
/*!40000 ALTER TABLE `Message` DISABLE KEYS */;
INSERT INTO `Message` VALUES (1,'Oslario Andrey','2w12w12','2020-01-22 16:57:44','oslario@yahoo.com','08129076812');
/*!40000 ALTER TABLE `Message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Artikel`
--

DROP TABLE IF EXISTS `Artikel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Artikel` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Judul` varchar(250) NOT NULL,
  `Isi` text NOT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `PublishDate` datetime DEFAULT NULL,
  `UserID` smallint(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Artikel`
--

LOCK TABLES `Artikel` WRITE;
/*!40000 ALTER TABLE `Artikel` DISABLE KEYS */;
INSERT INTO `Artikel` VALUES (1,'Sopir Mobil Pelindas Pria di Bandung Sempat Letuskan Senjata','Bandung - Mobil berkelir hitam melindas seorang pria di Kota Bandung. Sebelum melindas korban, sopir mobil berpelat B itu sempat menembakkan senjata ke udara.\n\nBaca juga:\nInsiden Mobil Lindas Pria di Bandung, Saksi: Sopir Langsung Kabur\n\nSalah seorang saksi, Gatot (27), mengaku terkejut mendengar letusan senjata tepat di pinggir jalan tempatnya berjualan bakso. Ia melihat ada mobil yang tengah dihadang seorang pria.\n\n\"Jadi saya awalnya lagi di tempat bakso, tiba-tiba dengar letusan. Saya keluar, ternyata ada pria yang nembakin senjata ke udara dari kemudi mobil,\" kata Gatot saat ditemui di lokasi kejadian Jalan Babakan Ciparay, Kelurahan Sukahaji, Kecamatan Babakan Ciparay, Kota Bandung, Rabu (22/1/2020).','2020-01-01 00:00:00','2020-01-02 00:00:00',2),(2,'OJK Tak Punya Wewenang Awasi Asabri, Ini Alasannya','Jakarta - Ombudsman Republik Indonesia (ORI) menyebut pihak Otoritas Jasa Keuangan (OJK) tak punya wewenang mengawasi sejumlah masalah yang terjadi PT Asabri (Persero).\n\nAnggota Ombudsman Alamsyah Saragih menjelaskan, OJK tak bisa awasi Asabri lantaran terhalang oleh Peraturan Presiden (PP) Nomor 102 tahun 2015 tentang asuransi sosial prajurit TNI, anggota Polri, dan pegawai aparatur sipil negara.\n\n\"Ini polemik ketika Asabri dinyatakan tidak bisa diawasi oleh OJK. Kami melihat ada PP 102/2015 yang dibuat tidak relevan dengan peraturan perasuransian,\" kata Alamsyah saat acara Ngopi Bareng Ombudsman di kantornya, Jakarta, Rabu (22/1/2020).\n\nDalam pasal 54 PP itu disebutkan, yang berhak melakukan pengawasan pada Asabri yaitu Inspektorat Jenderal Kementerian Pertahanan, Inspektorat Pengawasan Umum Mabes Polri dan TNI, Inspektorat Jenderal Kementerian Keuangan, Badan Pemeriksa Keuangan (BPK), serta auditor independen. Sementara OJK tidak masuk di dalamnya.','2020-01-02 00:00:00','2020-01-22 16:05:11',2),(3,'Imigrasi: Sejak 7 Januari Sampai Kini Harun Masiku Masih Berada di RI','Jakarta - Direktorat Jenderal (Ditjen) Imigrasi mengakui tersangka KPK Harun Masiku sudah berada di Indonesia sejak tanggal 7 Januari 2020 atau sehari sebelum OTT KPK. Ditjen Imigrasi mengatakan sejak tanggal 7 Januari 2020 hingga saat ini Harun masih berada di Indonesia.\n\n\"Jadi menurut data perlintasan di Sistem Informasi dan Manajemen Keimigrasian ( SIMKIM ) yang bersangkutan (Harun Masiku) sudah berada di Indonesia sejak tanggal 7 Januari 2020 sampai saat ini,\" kaya Dirjen Imigrasi Ronny Sompie kepada detikcom, Rabu (22/1/2020).\n\nNamun, Ronny enggan menjelaskan lebih jauh terkait keberadaan Harun saat ini. Menurutnya, hal itu sudah masuk dalam ranah KPK.','2020-01-03 00:00:00','2020-01-03 00:00:00',2),(4,'USBN Diganti US Mulai 2020, PGRI: Harus Ada Standardisasi di Sekolah','Jakarta - Persatuan Guru Republik Indonesia (PGRI) angkat bicara terkait Ujian Sekolah Berstandar Nasional (USBN) yang akan diganti Ujian Sekolah (US) tahun 2020. PGRI berharap Ujian Sekolah tersebut harus ada standardisasi yang jelas di tiap-tiap sekolah.\n\n\"Posisi PGRI adalah kita perlu standardisasi, itu USBN misalnya standardisasi, nah USBN jangan sepenuhnya, nanti di sekolah tidak ada standarnya,\" ujar Ketua PGRI Unifah Rosyidi di kantor Wapres, Jalan Medan Merdeka Utara, Jakarta Pusat, Rabu (22/1/2020)','2020-01-04 00:00:00','2020-01-05 00:00:00',2),(5,'KPI: Konten di Platform Digital Netflix Harus Diatur dan Diawasi','Jakarta - Banyaknya konten negatif yang beredar di platform digital seperti Netflix terjadi karena tak adanya pengawasan terhadap platform digital.\n\nHal ini diutarakan oleh Yuliandre Darwis, M. Mass. Comm., Ph.D., Komisioner Komisi Penyiaran Indonesia (KPI). Menurutnya, Karena tidak adanya pengawasan tersebut, maka banyak konten negatif masih leluasa beredar di platform digital seperti Netflix.\n\nYuliandre menambahkan, banyak netizen yang menganggap pengawasan terhadap konten di platform digital tidak diperlukan. Ini disebabkan anggapan bahwa pengawasan itu merupakan salah satu bentuk pengekangan kebebasan berekspresi. Namun menurut Yuliandre anggapan tersebut salah.\n\n\"Seluruh konten video dan film yang ada di platform digital harusnya diatur. Karena konten tersebut di broadcast di platform digital dan masuk ke ranah publik, makanya konten tersebut harus diawasi. Di negara-negara maju pengawasan terhadap konten yang disiarkan di platform digital sudah dilakukan. Di Indonesia saja yang telat,\" terang Yuliandre dalam keterangan yang diterima detikINET.','2020-01-05 00:00:00','2020-01-22 16:04:56',2),(6,'Susun Omnibus Law, Pemerintah Cuma Cabut Pasal yang Tumpang Tindih','Jakarta - Pemerintah hanya akan menghapus pasal-pasal yang tumpang tindih terkait penyusunan rancangan undang-undang (RUU) Omnibus Law. Hal tersebut disampaikan oleh Menko Polhukam Mahfud Md saat ditemui di acara Law & Regulation Outlook 2020.\n\n\"Yang dicabut dengan resmi pasal berapa, itu yang akan hilang. Yang tidak dicabut tetap berlaku. Jadi jangan khawatir,\" katanya di Hotel Shangri-La, Jakarta Pusat, Rabu (22/1/2020).\n\nRUU omnibus law sendiri mencakup revisi dari 79 undang-undang yang terdiri dari 1.244 pasal. Pasal yang direvisi, akan memangkas hal yang selama ini menghambat masuknya investasi ke dalam negeri.','2020-01-21 21:27:04','2020-01-22 16:05:08',2),(7,'Berlomba dengan Mafia Tanah Kali Ciliwung','Lumpur berwarna kecokelatan sisa-sisa banjir besar pada awal Januari 2020 masih terlihat di sepanjang jalan menuju lingkungan RW 06 dan RW 16 di Kelurahan Cililitan, Kecamatan Kramat Jati, Jakarta Timur. Jalanan selebar tiga meter membelah pemukiman warga dan aliran Kali Ciliwung. Tidak seperti kawasan kumuh di sepanjang Daerah Aliran Sungai Ciliwung pada umumnya, di daerah tersebut berdiri rumah-rumah warga mulai dari yang biasa, sedang, hingga mewah. Jarak perumahan ke bibir Ciliwung berkisar 10-50 meter.\n\nPada awal Januari lalu, kawasan ini sempat digenangi air Ciliwung setinggi 50-150 cm. Warga mengungsi ke Jalan Dewi Sartika yang lebih tinggi. Kawasan ini sebenarnya termasuk dalam proyek normalisasi Kali Ciliwung yang dikerjakan Kementerian Pekerjaan Umum dan Perumahan Rakyat (PUPR) berserta Pemerintah Provinsi DKI Jakarta sejak 2013 silam. Normalisasi bakal diterapkan di sepanjang Kali Ciliwung yang membelah Jakarta, yakni 33,69 km. Namun, dari total panjang kali yang hendak dinormalisasi itu, baru 16,38 km yang terealisasi. Sisanya mangkrak sejak 2017, termasuk di Cililitan.\n\nSebenarnya warga setempat sudah tahu dan mendukung proyek itu, karena untuk menanggulangi banjir setiap tahunnya. Sayangnya, pembahasan lahan yang tak kunjung selesai sejak tahun 2014. “Warga setuju untuk dinormalisasi, karena nggak banyak makan pemukiman warga juga. Ada sekitar empat rumah yang kena, semua udah okey,” kata Ketua RW 16 Kelurahan Cililitan','2020-01-21 21:27:42','2020-01-22 16:05:05',2),(8,'Besok, Bandara Soekarno Hatta Gelar Festival Durian','Jakarta - Siap-siap, Bandara Soekarno Hatta akan menggelar festival yang menarik. Namanya Festival Durian, siap-siap makan durian sepuasnya!\n\n\"Akan diselenggarakan besok, tanggal 23-24 Januari,\" kata Senior Manager of Branch Communication and Legal Angkasa Pura II Febri Toga Simatupang kepada detikcom, Rabu (22/1/2020).\n\nFebri menjelaskan, festival tersebut digagas untuk meningkatkan kepuasan pada penumpang. Berbagai macam durian akan disajikan.\n\n\"Wah macam-macam nanti duriannya, semua ada,\" ujarnya sembari tertawa.\n\nBACA JUGA: Viral \'Surat Cinta\' Turis Jepang buat Bandara Soekarno Hatta\n\n\nFestival Durian akan digelar di Terminal 3 Plaza di dekat tempat kedatangan domestik. Nantinya, para penumpang tinggal menunjukkan boarding pass kepada panitia dan membayar Rp 100 ribu.\n\n\"Tapi ingat, Festival Durian ini khusus kepada penumpang yang punya boarding pass ya. Duriannya juga tidak boleh dibawa pulang,\" tutup Febri.','2020-01-21 21:39:07','2020-01-22 16:04:59',2),(9,'Bom PD II Seberat 500 Kg Dijinakkan di Jerman, 10 Ribu Orang Dievakuasi','Berlin - Sebuah bom seberat 500 kilogram yang berasal dari era Perang Dunia (PD) II berhasil dijinakkan di kota Cologne, Jerman. Sekitar 10 ribu orang terpaksa dievakuasi dan layanan kereta serta lalu lintas kapal sempat terganggu saat operasi penjinakan bom era perang ini berlangsung.\n\nSeperti dilansir Associated Press dan AFP, Rabu (22/1/2020), bom seberat 500 kilogram itu ditemukan terkubur di sebuah lokasi proyek konstruksi di dekat Sungai Rhine yang ada di pusat kota Cologne, pada Senin (20/1) malam waktu setempat.\n\nOtoritas kota Cologne menyebut bom tersebut berasal dari militer Amerika Serikat (AS) dan dijatuhkan saat gempuran udara di Cologne pada era PD II silam.','2020-01-22 13:40:07','2020-01-22 16:03:40',2),(10,'Lutfi \'Pembawa Bendera\' Mengaku Disetrum, Polisi Persilakan Lapor Propam','Jakarta - Di hadapan majelis hakim PN Jakarta Pusat, terdakwa Dede Alfiandi alias Dede mengaku disetrum dan dipaksa polisi untuk mengakui perbuatannya. Polda Metro Jaya mempersilakan Dede untuk melapor ke Propam apabila merasa ada yang salah selama proses penyelidikan di kepolisian.\n\n\"Ada mekanismenya, kalau memang enggak terima. Ada yang namanya dewan pengawas kita Propam. Laporkan ke Propam nanti akan kita lakukan pemeriksaan,\" jelas Kabid Humas Polda Metro Jaya Kombes Yusri Yunus kepada wartawan di Polda Metro Jaya, Jakarta, Rabu (22/1/2020).\n\nYusri mengklaim pihaknya telah melakukan penyidikan kasus itu secara profesional. Polisi telah sesuai prosedur dalam penyelidikan kasus tersebut.','2020-01-22 13:40:31','2020-01-22 16:05:03',2),(11,'Lalai Awasi Jiwasraya, Anggota DPR Sebut OJK Tak Punya Kredibilitas','Jakarta - Anggota Komisi XI DPR RI dari fraksi PKS menilai Otoritas Jasa Keuangan (OJK) tak punya kredibilitas karena pengawasannya lalai terhadap kasus keuangan yang dialami PT Asuransi Jiwasraya (Persero). Atas kasus tersebut, Hidayatullah mengatakan kepercayaannya hilang terhadap OJK sebagai pengawas industri jasa keuangan.\n\n\"Dengan terbukanya permasalahan industri keuangan khususnya di bidang asuransi ini sesungguhnya sudah menghilangkan kredibilitas OJK dan bapak-bapak sebagai komisioner,\" kata Hidayatullah di hadapan Dewan Komisioner OJK dalam rapat kerja Komisi XI, di Gedung DPR RI, Jakarta, Rabu (22/1/2020).\n\nMenurut Hidayatullah, beberapa rapat kerja yang digelar dengan OJK sebagai mitra kerja Komisi XI bagaikan angin lalu.','2020-01-22 13:43:49','2020-01-22 16:05:01',2),(12,'Triawan Diminta Erick Thohir Jadi Komut Garuda Akhir 2019','Jakarta -\nTriawan Munaf kini resmi menjabat Komisaris Utama PT Garuda Indonesia (Persero) Tbk. Mantan Kepala Badan Ekonomi Kreatif Indonesia (Bekraf) ini resmi menjabat usai diputuskan dalam Rapat Umum Pemegang Saham Luar Biasa (RUPSLB) yang digelar hari ini.\n\nTriawan mengaku, diminta Menteri BUMN Erick Thohir untuk mengemban tugas tersebut sejak akhir tahun lalu.\n\n\"Sudah sejak akhir tahun lalu saya diminta,\" katanya saat dihubungi wartawan, Rabu (22/1/2020).\nErick, kata Triawan, berpesan agar dirinya menjalankan misi Presiden Joko Widodo (Jokowi) agar menjadikan BUMN sebagai agen perubahan.\n\n\"Ya sama, misi presiden yang harus dilaksanakan, lalu BUMN sebagai agent of change, jadi apalagi Garuda itu sebuah kebanggaan yang harus kita tingkatkan terus di flight carrier,\" ujarnya.','2020-01-22 17:23:26','2020-01-22 17:29:13',2),(13,'Ini yang Bikin Banyak Gedung Perkantoran Kosong di Jakarta','Jakarta -\nPasar properti sektor gedung perkantoran di area Central Business District (CBD) Jakarta tengah mengalami tekanan.\n\nLembaga konsultan properti Savills Indonesia mencatat sepanjang 2019, total pasokan ruang perkantoran di sana mencapai 6,6 juta m2.\n\nSementara penyerapan ruang kantor hanya sekitar 152 ribu m2. Maka dari itu ada tingkat kekosongan hingga 24,4% atau naik 0,4% dibandingkan tahun sebelumnya.\n\nMeningkatnya tingkat kekosongan perkantoran di Jakarta terjadi, karena pasokan pertumbuhan gedung perkantoran yang kian meningkat setiap tahunnya.\n\n\"Pasokan sekarang berlimpah, tahun 2019 itu saja ada 5 gedung yang baru selesai dibangun, atau ada tambahan ruang kantor baru sebanyak 262.000 m2,\" ujar Kepala Departemen Riset dan Konsultasi Savills Indonesia, Anton Sitorus dalam jumpa pers di Panin Tower, Jakarta, Rabu (26/7/2017).','2020-01-22 17:28:56','2020-01-22 17:29:10',2);
/*!40000 ALTER TABLE `Artikel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `Id` smallint(6) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `Password` varchar(200) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Status` smallint(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'admin','Admin','admin','Super',1),(2,'oslario@yahoo.com','Oslario','admin','Andrey',1);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-22 18:09:22
