-- membuat tabel baru 
CREATE TABLE `sound-chimera-469004-j2.kimia_farma.tabel_analisis` AS
SELECT
   -- memanggil nama kolom dalam tabel yg ada
  ft.transaction_id,
  ft.date,
  kc.branch_id,
  kc.branch_name,
  kc.kota,
  kc.provinsi,
  kc.rating AS rating_cabang, -- mengganti nama kolom sesuai ketentuan dengan perintah AS
  ft.customer_name,
  p.product_id,
  p.product_name,
  p.price AS actual_price, -- mengganti nama kolom sesuai ketentuan dengan perintah AS
  ft.discount_percentage,
  inv.opname_stock AS stock_sisa,-- mengganti nama kolom sesuai ketentuan dengan perintah AS

  -- Persentase gross laba
  CASE
    WHEN p.price <= 50000 THEN 0.10
    WHEN p.price > 50000 AND p.price <= 100000 THEN 0.15
    WHEN p.price > 100000 AND p.price <= 300000 THEN 0.20
    WHEN p.price > 300000 AND p.price <= 500000 THEN 0.25
  ELSE 0.30
  END AS persentase_gross_laba,

  -- Nett Sales
  p.price * (1 - ft.discount_percentage/100) AS nett_sales,

  -- Nett Profit
  (p.price * (1 - ft.discount_percentage/100)) *
  (
    CASE
      WHEN p.price <= 50000 THEN 0.10
      WHEN p.price > 50000 AND p.price <= 100000 THEN 0.15
      WHEN p.price > 100000 AND p.price <= 300000 THEN 0.20
      WHEN p.price > 300000 AND p.price <= 500000 THEN 0.25
      ELSE 0.30
  END
  ) AS nett_profit,

  ft.rating AS rating_transaksi

-- melakukan JOIN beberapa tabel dan memberikan nama singkat/alias
FROM `sound-chimera-469004-j2.kimia_farma.kf_final_transaction` ft
LEFT JOIN `sound-chimera-469004-j2.kimia_farma.kf_product` p
  ON ft.product_id = p.product_id
LEFT JOIN `sound-chimera-469004-j2.kimia_farma.kf_kantor_cabang` kc
  ON ft.branch_id = kc.branch_id
LEFT JOIN `sound-chimera-469004-j2.kimia_farma.kf_inventory` inv
  ON ft.branch_id = inv.branch_id AND ft.product_id = inv.product_id;