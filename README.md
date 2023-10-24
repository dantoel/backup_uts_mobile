# UTS - Kelompok 2

## Anggota Kelompok 2 - SIB 3E

### Daftar Peserta

1. **Ahmad Hanafi Mubarok**
   - No. Absen : 02
   - NIM : 2141762009

2. **Anisatul Latifah**
   - No. Absen : 05
   - NIM : 2141762008

3. **Margaretha Violina Putri**
   - No. Absen : 13
   - NIM : 2141762056

4. **Rizqi Zamzami Jamil**
   - No. Absen : 21
   - NIM : 2141762089

<br>

# Latar Belakang Masalah

| Informasi | Keterangan |
|---|---|
| Nama Politeknik | Politeknik XYZ |
| Posisi | Direktur |
| Tujuan survei | Memastikan kualitas layanan pendidikan dan fasilitas pendukung |
| Objek survei | Mahasiswa Kelas Internasional |
| Fokus survei | Sumber daya dan dukungan akademik, layanan kantin dan makanan, faktor lainnya |
| Tujuan pengembangan | Mengintegrasikan hasil survei dalam sebuah aplikasi mobile |
| Persyaratan | Hasil survei harus dapat diakses dalam bentuk data mentah |
| Manfaat | Alat yang efisien untuk memahami hasil survei dan melibatkan mahasiswa dalam proses evaluasi kualitas pendidikan |

<br>

# Requirement Berdasarkan Problem
Berikut penjelasan requirement berdasarkan problem dalam dataset : 
1. Total pengisi survey (responden): Aplikasi harus mampu menyajikan informasi tentang jumlah total mahasiswa yang mengisi survei sebagai respons pada fitur ini.
2. Jumlah faktor yang dipermasalahkan (per faktor): Aplikasi harus dapat menghitung dan menampilkan jumlah faktor yang diangkat sebagai masalah oleh mahasiswa dalam survei.
3. Jumlah responden berdasarkan gender: Aplikasi harus memungkinkan pengguna untuk memahami sebaran responden berdasarkan jenis kelamin (gender) dan menyajikannya dalam bentuk yang mudah dipahami.
4. Jumlah responden berdasarkan negara asal: Aplikasi harus memberikan informasi tentang asal negara responden untuk memahami keragaman geografis dalam tanggapan survei.
5. Rata-rata umur responden total: Aplikasi harus mampu menghitung rata-rata umur dari semua responden survei.
6. Rata-rata IPK (GPA) responden total: Aplikasi harus dapat menghitung rata-rata Indeks Prestasi Kumulatif (IPK atau GPA) dari semua responden survei.
7. Detail hasil survey per responden: Aplikasi harus memberikan kemampuan untuk melihat hasil survei per individu responden, yang mungkin termasuk detail terkait faktor yang diangkat sebagai masalah.
8. Penyajian Data: Fitur 1 hingga 6 harus diwujudkan dalam satu halaman, sedangkan fitur 7 akan ditampilkan pada halaman yang berbeda untuk memudahkan akses.
9. Konversi Data: Aplikasi harus memungkinkan konversi data survei ke format lain seperti JSON, database, atau XML untuk keperluan analisis lebih lanjut.
10. Backend Laravel: Aplikasi mobile harus terintegrasi dengan backend yang dikembangkan dengan Laravel untuk mengelola data survei.
11. Visualisasi Grafik (Opsional): Untuk setiap fitur 2-4 (jumlah faktor, jumlah responden berdasarkan gender, jumlah responden berdasarkan negara asal), aplikasi dapat memperoleh nilai tambahan hingga +15 jika menampilkan visualisasi dalam bentuk pie chart atau bubble chart yang dapat membantu pengguna memahami data lebih efisien. <br>
Dengan memenuhi requirement-fitur ini, aplikasi mobile akan memberikan akses yang lebih baik ke hasil survei dan akan memudahkan Mr. X dan stafnya dalam mengambil keputusan berdasarkan data survei yang terkumpul.<br>
<br>
# Diagram Pendukung Lainnya
## 1. Flowchart
### a. Flowchart Perencanaan Pembuatan Aplikasi <br>
<p align ="center">
  <img src="image-2.png" alt="Alternative Text">
</p> <br>

#### Penjelasan : <br>
1. Start <br>
Pada titik ini, proses desain aplikasi mobile akan dimulai.
2. Desain Wireframe untuk Tampilan Aplikasi<br>
Pada tahap ini, desainer UI/UX akan membuat rancangan tampilan aplikasi secara kasar. Rancangan ini hanya berupa kerangka dasar yang menunjukkan layout, elemen, dan interaksi antar elemen dalam aplikasi. <br>
3. Slicing Desain Aplikasi<br>
Pada tahap ini, desainer UI/UX akan membagi desain aplikasi menjadi beberapa file atau elemen. Hal ini dilakukan untuk memudahkan proses pembuatan back-end.
4. Koneksi pada File CSV<br>
Pada tahap ini, desainer UI/UX akan menghubungkan desain aplikasi dengan file CSV. File CSV ini berisi data yang akan digunakan oleh aplikasi.
5. Proses Pembuatan Back-End (Query From Data)<br>
Pada tahap ini, pengembang akan membuat back-end aplikasi. Back-end ini akan menangani semua logika bisnis dan interaksi dengan database.
6. Pengujian Aplikasi Mobile<br>
Pada tahap ini, aplikasi akan diuji untuk memastikan bahwa aplikasi tersebut dapat berfungsi dengan baik. Uji coba dapat dilakukan dengan melibatkan pengguna atau tim pengembang.
7. End<br>
Jika aplikasi sudah tidak perlu direvisi lagi, maka proses desain aplikasi mobile sudah selesai.

### b. Flowchart Alur Kerja Sistem <br>
<p align ="center">
  <img src="image-3.png" alt="Alternative Text">
</p><br>

#### Penjelasan : <br>
1. Start<br>
Pada titik ini, proses visualisasi data akan dimulai.
2. Sistem Menampilkan Halaman Dashboard Visualisasi Data<br>
Pada tahap ini, sistem akan menampilkan halaman dashboard visualisasi data. Halaman ini berisi informasi umum tentang data hasil survei, seperti total pengisi survey (responden), jumlah faktor yang dipermasalahkan, jumlah responden berdasarkan gender, jumlah responden berdasarkan negara asal, rata-rata umur responden total, rata-rata IPK(GPK) responden total, dan juga button detail hasil survey per responden.
3. Pilih Menu?<br>
Pada tahap ini, pengguna dapat memilih menu yang ingin dilihat. Menu yang tersedia antara lain:
    - Menu Per-Fitur<br>
Menu ini dapat diakses pada menu jumlah faktor yang dipermasalahkan, jumlah responden berdasarkan gender, dan jumlah responden berdasarkan negara asal akan ditampilkan pada halaman selanjutnya, yaitu dalam bentuk chart atau diagram.
    - Menu Per-Responden<br>
Menu ini dapat diakses apabila kita mengklik button “Lihat Detail Responden”.
Menu Per-Fitur?
Jika pengguna memilih menu per-fitur, maka sistem akan menampilkan visualisasi data berupa chart atau diagram berdasarkan fitur-fitur yang ada di dalam survei.
4. Sistem Menampilkan Pie Chart atau Bar Chart<br>
Sistem akan menampilkan visualisasi data berupa pie chart atau bar chart. Pie chart digunakan untuk menampilkan data yang bersifat kategorik, sedangkan bar chart digunakan untuk menampilkan data yang bersifat numerik.
5. Sistem Menampilkan Halaman Daftar Faktor Permasalahan <br>
Sistem akan menampilkan halaman daftar faktor permasalahan. Halaman ini berisi informasi tentang faktor-faktor yang menjadi permasalahan berdasarkan hasil survei.
6. Klik Button “Lihat Detail Responden”<br>
Jika pengguna mengklik tombol "Lihat Detail Responden", maka sistem akan menampilkan detail hasil survei semua responden berdasarkan setiap faktor yang dipilih.
Sistem Menampilkan Halaman Detail Responden
7. Sistem akan menampilkan halaman detail responden <br>
Halaman ini berisi informasi tentang jawaban setiap responden pada setiap pertanyaan survei berdasarkan setiap faktor yang dipilih..
8. End<br>
Setelah pengguna selesai melihat hasil visualisasi data, maka proses visualisasi data akan berakhir. <br>
<br>
# Output Aplikasi
1. Tampilan Halaman Dahsboard Utama<br>
Berikut adalah halaman dashboard utama yang berasal dari hasil survey Responden. Yang berisikan : <br>
    * Total pengisi survey (responden) : hasil yang ditampilkan didapatkan dari keseluruhan total responden yang telah mengisi survey.
    * Rata-rata umur responden total : hasil yang ditampilkan didapatkan dari menghitung rata-rata umur seluruh total responden.
    * Rata-rata IPK (GPA) : hasil yang ditampilkan didapatkan dari menghitung rata-rata IPK / GPK seluruh total responden.
    * Jumlah faktor yang dipermasalahkan (per faktor),jumlah responden berdasarkan gender dan jumlah responden berdasar negara asal : hasil akan muncul apabila user meng-klik menu tersebut, yang selanjutnya akan diarahkan pada halaman hasil dan visualisasi data yang berupa angka dan chart. 
    * lihat detail responden : hasil akan muncul apabila gender mengklik menu tersebut, yang selanjutnya akan diarahkan pada halaman yang menampilkan  data dari responden. <br>
<p align ="center">
  <img src="image-5.png" alt="Alternative Text">
</p><br>

2. Tampilan Halaman Detail Chart<br>
Berikut adalah output chart atau diagram dari :
    * Data jumlah faktor yang dipermasalahkan (per faktor) : hasil yang ditampilkan didapatkan dari mengambil setiap data dari count of genre x. <br>
<div align="center">
    <img src="image-6.png" alt="Alternative Text">
    <img src="image-7.png" alt="Alternative Text">
</div>
    * Jumlah responden berdasarkan gender : hasil yang ditampilkan didapatkan dari data count of gender untuk Male dan Female.
<div align="center">
    <img src="image-8.png" alt="Alternative Text">
</div>
    * Jumlah responden berdasar negara asal : hasil yang ditampilkan didapatkan dari count of nasionality untuk setiap negara.<br>
<div align="center">
    <img src="image-9.png" alt="Alternative Text">
    <img src="image-10.png" alt="Alternative Text">
</div>
<br>
3. Tampilan Halaman Detail Responden<br>
Berikut adalah halaman Detail responden yang berisi nama genre setiap faktor permasalahan, report yang dituliskan oleh responden, dan juga GPA dari responden yang mengisi survey.
<div align="center">
    <img src="image-11.png" alt="Alternative Text">
</div>
<br>
<br>

# Daftar Kontributor
## Dokumentasi
<div style="text-align:center;">
    <img src="image-4.png" alt="Alt text" width="450px">
</div>
<br>
<div style="text-align: center;">
    <img src="dokumentasi_rizqi zamzami.jpg" alt="Alt text" width="250px" height="350px">
</div>


### 1. Anggota Kelompok 1

* **Nama:** Ahmad Hanafi Mubarok
* **NIM/Absen:** 2141762009 / 02
* **Akun Github:** [Github Ahmad Hanafi Mubarok](https://github.com/dantoel)
* **Tugas/Peran:**
    * **Back End Developer**
    * **Menyambungkan Front End dan Back End**

### 2. Anggota Kelompok 2
- **Nama :** Anisatul Latifah
- **NIM/Absen :** 2141762008 / 05
- **Akun Github :** [Github Anisatul Latifah](https://github.com/AnisatulLatifah)
- **Tugas/Peran :**
    * **Membuat Desain Interface / UI Designer**
    * **Visualisasi Data di Excel**
    * **Membuat Flowchart dan penjelasan**
    * **Pembuatan Laporan di readme.md**

### 3. Anggota Kelompok 3
- **Nama :** Margaretha Violina Putri
- **NIM/Absen :** 2141762056 / 13
- **Akun Github :** [Github Margaretha Violina Putri](https://github.com/MargarethaViolinaPutri)
- **Tugas/Peran :**
    * **Memperbaiki File CSV**
    * **Membuat Latar Belakang**
    * **Membuat Requirement Berdasarkan Problem**
    * **Menyambungkan Front End dan Back End**

### 4. Anggota Kelompok 4
- **Nama :** Rizqi Zamzami Jamil
- **NIM/Absen :** 2141762089 / 21
- **Akun Github :** [Github Rizqi Zamzami Jamil](https://github.com/RizqiZamzamiJamil)
- **Tugas/Peran :** 
    * **Front End Developer**
