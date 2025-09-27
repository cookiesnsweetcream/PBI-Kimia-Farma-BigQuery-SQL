# PBI-Kimia-Farma-BigQuery-SQL
📌 Deskripsi Proyek

Proyek ini merupakan bagian dari Big Data Analyst Challenge di Kimia Farma (2020–2023).
Tujuannya adalah untuk menganalisis kinerja bisnis Kimia Farma menggunakan Google BigQuery dan memvisualisasikannya di Google Looker Studio.

Dataset yang digunakan:
- kf_final_transaction.csv → Data transaksi
- kf_product.csv → Data produk
- kf_kantor_cabang.csv → Data kantor cabang
- kf_inventory.csv → Data inventory

Query ini menghasilkan tabel analisis dengan informasi:
- 📍 Identitas cabang (nama, kota, provinsi, rating cabang)
- 👤 Data customer & transaksi (customer, tanggal, rating transaksi)
- 💊 Data produk (nama produk, harga asli, diskon, stok tersisa)
- 💰 Metrik finansial:
  - nett_sales → harga jual setelah diskon
  - persentase_gross_laba → margin profit sesuai kategori harga
  - nett_profit → laba bersih
