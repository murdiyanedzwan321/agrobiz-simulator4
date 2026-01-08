# AgroBiz Simulator: Studi Kasus VCO (Virgin Coconut Oil)

**Nama Pengembang:** Murdiyan Edzwan Nazib  
**NIM:** [NIM ANDA]  
**Proyek:** Digital Agro Systems - Factory Feasibility Calculator

## Deskripsi Aplikasi
AgroBiz Simulator adalah aplikasi "Kalkulator Cerdas" berbasis Flutter yang membantu pelaku UMKM agroindustri menghitung kelayakan finansial pabrik VCO. Aplikasi ini melakukan simulasi instan terhadap:
- **BEP (Break Even Point)**: Titik impas (Unit & Rupiah).
- **Laba Bersih**: Estimasi keuntungan bulanan.
- **ROI (Return on Investment)**: Persentase pengembalian modal per tahun.

Aplikasi ini bersifat **Stateless**, artinya data tidak disimpan ke server dan hanya bertahan selama aplikasi dibuka, menjamin privasi dan kecepatan akses.

## Fitur Utama
1.  **Input Real-time**: Geser slider untuk mengubah harga mesin, biaya bahan baku, atau target penjualan, dan hasil akan langsung berubah.
2.  **Multi-Platform**:
    *   **Android (.apk)**: Untuk penggunaan mobile di lapangan (Offline).
    *   **Web**: Untuk simulasi di laptop/browser (Online).
3.  **Visualisasi Data**: Grafik Pie Chart menampilkan proporsi biaya Fixed vs Variable vs Profit.

## Link Akses (Deliverables)
| Platform | Link |
| :--- | :--- |
| **Demo Web (Vercel)** | [Klik di sini untuk membuka Aplikasi](https://agrobiz-simulator.vercel.app/) |
| **Download APK** | [Klik di sini untuk unduh .apk](https://github.com/USERNAME/REPO/releases) |

## Rumus Finansial yang Digunakan

### 1. Break Even Point (BEP)
Menentukan jumlah unit yang harus dijual agar tidak rugi.
$$ BEP_{unit} = \frac{Fixed Cost}{Harga Jual - Variable Cost_{unit}} $$
$$ BEP_{rupiah} = BEP_{unit} \times Harga Jual $$

### 2. Net Profit (Laba Bersih Bulanan)
$$ Revenue = Target Penjualan \times Harga Jual $$
$$ Total Cost = Fixed Cost + (Variable Cost_{unit} \times Target Penjualan) $$
$$ Profit = Revenue - Total Cost $$

### 3. Return on Investment (ROI) - Tahunan
$$ ROI = \left( \frac{Profit_{bulanan} \times 12}{Total Investasi (CAPEX)} \right) \times 100\% $$

## Struktur Biaya (Studi Kasus VCO)
*   **CAPEX (Modal Awal)**: Mesin Centrifuge/Press, Renovasi Ruang Produksi, Perizinan (PIRT/Halal).
*   **OPEX (Biaya Operasional)**:
    *   *Variable*: Kelapa (Bahan Baku), Botol & Label (Kemasan).
    *   *Fixed*: Gaji Karyawan, Listrik, Air.

## Cara Menjalankan Project (Local Development)

1.  Pastikan Flutter SDK terinstall.
2.  Clone repository ini or download source code.
3.  Jalankan perintah berikut di terminal:
    ```bash
    flutter pub get
    flutter run
    ```
4.  Untuk build Android APK:
    ```bash
    flutter build apk --release
    ```
5.  Untuk build Web:
    ```bash
    flutter build web --release
    ```

## Screenshot
*(Silakan jalankan aplikasi untuk melihat antarmuka yang responsif)*
- **Tampilan Mobile:** UI menyesuaikan lebar layar sempit dengan list vertikal.
- **Tampilan Web/Desktop:** UI menggunakan layout dua kolom (Split View) untuk memudahkan simulasi.

---
*Dibuat untuk memenuhi tugas UAS Mata Kuliah Digital Agro Systems.*
