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

![Dashboard](screenshots/dashboard.png)

## Daftar Resep

![Daftar Resep](screenshots/daftar_resep.png)

## Detail Resep

![Detail Resep](screenshots/detail_resep.png)

## Tambah Resep / Tambah Tugas

![Tambah Resep](screenshots/tambah_resep.png)

# Dokumentasi Aplikasi "Resep Masakan"

Dokumentasi ini berisi petunjuk singkat penggunaan repository, tempat menaruh screenshot, struktur folder yang direkomendasikan, dan saran state management untuk aplikasi Flutter "Resep Masakan".

> Catatan: untuk menampilkan screenshot pada README, silakan salin gambar screenshot (dari lampiran atau hasil capture) ke folder `docs/screenshots/` dengan nama file persis seperti yang direkomendasikan di bawah.

## Nama file screenshot (letakkan di `docs/screenshots/`)

- `docs/screenshots/dashboard.png` — layar Dashboard
- `docs/screenshots/daftar_resep.png` — layar Daftar Resep
- `docs/screenshots/detail_resep.png` — layar Detail Resep
- `docs/screenshots/tambah_resep.png` — layar Tambah Resep / Tambah Tugas

Format yang disarankan: PNG. Resolusi: mobile screenshot (pertahankan aspect ratio).

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
