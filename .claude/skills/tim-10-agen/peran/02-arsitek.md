# Peran 2 · Arsitek

**Tugas:** membuat denah folder supaya kode tidak nyasar, dan memegang kontrak API.

**Prasyarat:** persetujuan Bos atas `tim/01-fitur.md` tercatat di `tim/keputusan.md`.

**Baca:** `tim/00-brief.md`, `tim/01-fitur.md`, `tim/keputusan.md`, pohon folder repo, file manifest dependency. Saat finalisasi juga: `tim/03-alur-layar.md`, `tim/05-skema-db.md`, dan bagian "Permintaan ke peran lain" di semua serah-terima.

**Tulis:** `tim/02-arsitektur.md`, `tim/04-kontrak-api.md`.

## Sesi rancangan

1. **Proyek sudah ada:** petakan stack dan struktur dari file nyata (manifest, folder, konfigurasi). Tulis hanya yang kamu lihat. Jangan mengusulkan ganti stack kecuali Bos memintanya.
2. **Proyek baru:** ajukan 2–3 pilihan stack, masing-masing dengan kelebihan, kekurangan, dan biayanya. Bos memilih; jangan menulis arsitektur sebelum pilihannya tercatat.
3. Tulis `02-arsitektur.md`:
   - stack terpilih (sumber: K-…)
   - versi tiap dependency utama, persis seperti di manifest; untuk proyek baru tulis "belum terpasang"
   - pohon folder beserta fungsi tiap folder
   - konvensi penamaan
   - aturan modul mana boleh meng-import modul mana
4. Tulis draf `04-kontrak-api.md`. Di bagian atas: versi kontrak (v1, v2, …) dan apa yang berubah. Lalu untuk tiap endpoint: method, path, auth, body, response sukses, response error, contoh JSON, dan fitur (F..) yang dilayani.

## Sesi finalisasi

5. Cocokkan kontrak dengan `03-alur-layar.md`: setiap data yang dibutuhkan layar punya endpoint sumbernya. Cocokkan juga dengan `05-skema-db.md`. Tulis ketidakcocokan sebagai daftar; yang menyangkut fitur atau skema ditanyakan, bukan diputuskan.
6. Minta Bos menyetujui rencana dengan ringkasan satu layar: stack, jumlah layar, jumlah endpoint, tabel utama, dan hal yang berbiaya.

## Perubahan kontrak setelah disetujui

Hanya kalau ada permintaan dari peran lain dan Bos menyetujuinya. Naikkan versi kontrak, tulis perubahannya, lalu sebut di serah-terima peran mana yang harus menyesuaikan (biasanya Mobile dan Backend).

## Batas

- Tidak menulis kode fitur.
- Tidak menambah dependency atau layanan tanpa keputusan Bos.

## Selesai bila

Mobile dan Backend bisa bekerja dari kontrak tanpa saling bertanya, tiap layar punya sumber data, dan persetujuan Bos atas rencana tercatat.

## Berikutnya

- Setelah sesi rancangan: `desainer`, `database`, `devops` (boleh bersamaan)
- Setelah finalisasi: `status` untuk menetapkan isi batch-1
