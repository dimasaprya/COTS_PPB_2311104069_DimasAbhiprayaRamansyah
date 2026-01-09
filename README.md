# App Screenshots

This file contains placeholders and instructions for the main app screenshots. Copy the screenshot image files into `docs/screenshots/` using the filenames below so they render in the documentation.

Recommended filenames and purpose:

- `docs/screenshots/dashboard.png` — Dashboard screen
- `docs/screenshots/daftar_resep.png` — Daftar Resep (list) screen
- `docs/screenshots/detail_resep.png` — Detail Resep screen
- `docs/screenshots/tambah_resep.png` — Tambah Resep / Tambah Tugas screen

Notes and guidance:

- Preferred image format: PNG
- Suggested size: mobile screenshot resolution (for iPhone/Android) — keep aspect ratio; cropping is okay.
- To add the screenshots to the repo: copy the four images (from your attachments) into the `docs/screenshots/` folder with the exact filenames listed above.

Once the images are in place, you can view them below. If the files are not present, these will show as broken image links.

---

## Dashboard

![Dashboard](docs/screenshots/dashboard.png)

## Daftar Resep

![Daftar Resep](docs/screenshots/daftar_resep.png)

## Detail Resep

![Detail Resep](docs/screenshots/detail_resep.png)

## Tambah Resep / Tambah Tugas

![Tambah Resep](docs/screenshots/tambah_resep.png)

# Resep Masakan — Dokumentasi Singkat

Terima kasih telah membuka repository aplikasi "Resep Masakan".

README ini berisi:

- Instruksi menambahkan screenshot aplikasi yang digunakan oleh dokumentasi.
- Gambaran struktur folder yang direkomendasikan.
- Saran state management yang cocok untuk aplikasi ini.

Pastikan menaruh screenshot pada folder `docs/screenshots/` dengan nama file yang tepat agar gambar ditampilkan di README.

---

## Tampilan / Screenshot

Letakkan screenshot (format PNG) ke folder `docs/screenshots/` dengan nama-nama berikut:

- `dashboard.png` — layar Dashboard
- `daftar_resep.png` — layar Daftar Resep
- `detail_resep.png` — layar Detail Resep
- `tambah_resep.png` — layar Tambah Resep / Tambah Tugas

Contoh path akhir (harus persis): `docs/screenshots/dashboard.png` dan seterusnya.

Jika gambar sudah ada, akan tampil di sini:

### Dashboard

![Dashboard](docs/screenshots/dashboard.png)

### Daftar Resep

![Daftar Resep](docs/screenshots/daftar_resep.png)

### Detail Resep

![Detail Resep](docs/screenshots/detail_resep.png)

### Tambah Resep / Tambah Tugas

![Tambah Resep](docs/screenshots/tambah_resep.png)

---

## Deskripsi singkat aplikasi

Aplikasi "Resep Masakan" adalah aplikasi mobile sederhana untuk menyimpan, menampilkan, dan mengelola resep makanan. Fitur utama yang terlihat pada tampilan adalah:

- Dashboard: ringkasan jumlah resep per kategori.
- Daftar Resep: daftar resep dengan filter dan pencarian.
- Detail Resep: menampilkan bahan dan langkah pembuatan.
- Tambah Resep: form untuk menambah resep baru.

---

## Struktur folder (disarankan)

Struktur yang direkomendasikan untuk `lib/`:

- `lib/main.dart` — entry point aplikasi
- `lib/presentation/`
  - `pages/` — layar (Dashboard, DaftarResep, DetailResep, TambahResep)
  - `widgets/` — komponen UI yang dapat dipakai ulang
- `lib/models/` — model domain (contoh: `recipe.dart`)
- `lib/services/` — layanan/data source (contoh: `recipe_service.dart`)
- `lib/design_system/` — warna, spacing, typography (contoh: `colors.dart`)

Struktur ini memisahkan tampilan, model, dan layanan sehingga memudahkan pemeliharaan dan testing.

---

## Saran State Management

Beberapa opsi yang sesuai beserta rekomendasi:

1. Provider + ChangeNotifier
  - Mudah dan cepat untuk aplikasi kecil.
2. Riverpod
  - Lebih scalable dan mudah di-test; cocok jika aplikasi dikehendaki berkembang.
3. Bloc / Cubit
  - Cocok untuk alur yang kompleks dan kebutuhan pemisahan event/state yang ketat.

Rekomendasi praktis: gunakan Provider untuk prototipe/penugasan cepat. Jika proyek akan berkembang, gunakan Riverpod.

---

## Contoh kontrak singkat (inputs/outputs)

- Inputs: aksi pengguna (tambah resep, cari, filter), input form.
- Outputs: perubahan UI (daftar, jumlah per kategori), navigasi, penyimpanan data.
- Error modes: validasi form, kegagalan simpan data.

---

## Petunjuk menambahkan screenshot

1. Buat/temukan screenshot aplikasi (format PNG).
2. Salin ke folder `docs/screenshots/` dengan nama sesuai (contoh: `dashboard.png`).
3. Commit dan push perubahan, README akan menampilkan gambar.

Contoh perintah git (jalankan di direktori project):

```bash
git add docs/screenshots/* README.md
git commit -m "docs: add screenshots and update README"
git push origin main
```

---

## Testing & Edge cases singkat

- Tampilkan empty state saat list kosong.
- Gunakan `ListView.builder` untuk daftar panjang.
- Validasi input pada form tambah resep (judul & kategori minimal).

---

Jika Anda mau, saya bisa:

- Menambahkan contoh `RecipesProvider` sederhana di `lib/presentation/providers/`.
- Membuat unit test kecil untuk provider.
- Commit perubahan README + placeholder screenshot files sekarang.

Silakan beri tahu langkah berikutnya.

---

## Tampilan Aplikasi (Screenshots)

Jika file sudah ditambahkan ke `docs/screenshots/`, gambar akan tampil di sini.

### Dashboard

![Dashboard](docs/screenshots/dashboard.png)

### Daftar Resep

![Daftar Resep](docs/screenshots/daftar_resep.png)

### Detail Resep

![Detail Resep](docs/screenshots/detail_resep.png)

### Tambah Resep / Tambah Tugas

![Tambah Resep](docs/screenshots/tambah_resep.png)

---

## Struktur Folder yang Disarankan

Struktur saat ini sudah mengikuti pola umum Flutter. Berikut susunan yang disarankan beserta fungsinya:

- `lib/`
  - `main.dart` — entry point aplikasi
  - `presentation/`
    - `pages/` — layar/screen (Dashboard, DaftarResep, DetailResep, TambahResep)
    - `widgets/` — komponen UI yang dapat dipakai ulang
  - `models/` — model domain (mis. `recipe.dart`)
  - `services/` — service atau penyedia data (mis. `recipe_service.dart`)
  - `design_system/` — warna, spacing, typography (mis. `colors.dart`, `spacing.dart`)

Struktur ini memisahkan tanggung jawab UI, data, dan model sehingga kode lebih mudah dipelihara.

## Rekomendasi State Management

Pilihan bebas, namun beberapa opsi yang sesuai:

1. Provider + ChangeNotifier
   - Kelebihan: sederhana dan cepat diimplementasikan.
   - Cocok untuk: aplikasi kecil atau kebutuhan state sederhana.

2. Riverpod
   - Kelebihan: lebih mudah diuji, aman pada waktu kompilasi, cocok untuk aplikasi yang akan berkembang.
   - Cocok untuk: proyek yang ingin lebih scalable dan testable.

3. Bloc / Cubit
   - Kelebihan: pemisahan event/state yang jelas, bagus untuk alur kompleks.
   - Cocok untuk: aplikasi besar atau alur bisnis rumit.

Rekomendasi praktis: gunakan Provider untuk pengembangan cepat; gunakan Riverpod jika ingin struktur yang lebih baik dan kemudahan testing.

## Kontrak Singkat (Inputs / Outputs / Error)

- Inputs: aksi pengguna (tambah resep, cari, filter), data lokal.
- Outputs: update UI (daftar & jumlah resep), navigasi, penyimpanan data.
- Error mode: validasi input, kegagalan penyimpanan/pengambilan data.

## Implementasi Minimal (contoh Provider)

- Tambahkan file `lib/presentation/providers/recipes_provider.dart` yang:
  - Menyimpan daftar `Recipe`.
  - Menyediakan metode: `loadRecipes()`, `addRecipe(Recipe)`, `deleteRecipe(id)`, `filterByCategory(String)`.
  - Memanggil `notifyListeners()` saat data berubah.
- Daftarkan provider di `main.dart` (contoh: `MultiProvider`).

## Edge cases yang perlu diperhatikan

- Daftar kosong (tampilkan empty state yang ramah)
- Daftar panjang (gunakan ListView.builder / pagination)
- Aksi ganda (hindari double submit)
- Validasi input (judul & kategori wajib)

## Testing rekomendasi singkat

- Unit test untuk provider (tambah/hapus/filter).
- Widget test untuk `Daftar Resep` dan `Detail Resep`.

---

Jika Anda mau, saya dapat menambahkan file placeholder di `docs/screenshots/` (mis. `README.md`) atau menyiapkan `lib/presentation/providers/recipes_provider.dart` contoh. Beritahu saya langkah berikutnya yang diinginkan.
