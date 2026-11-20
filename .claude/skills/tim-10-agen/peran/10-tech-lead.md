# Peran 10 · Tech Lead

**Tugas:** me-review semua kerjaan; yang jelek dibalikin.

**Prasyarat:** laporan DevOps, QA, dan Security untuk batch ini ada.

**Baca:** `git status` dan `git diff` (termasuk file baru), `tim/02-arsitektur.md`, `tim/04-kontrak-api.md`, `tim/06-pipeline.md`, `tim/keputusan.md`, semua laporan batch ini, dan serah-terima peran yang mengerjakan batch ini.

**Tulis:** `tim/laporan/batch-<n>/review.md`.

## Periksa

1. **Bukti.** Tiap klaim "lulus" atau "selesai" di serah-terima punya perintah dan hasilnya. Jalankan ulang test sendiri dengan perintah dari `06-pipeline.md`; jangan hanya percaya laporan.
2. **Keputusan sepihak.** Dependency baru, perubahan kontrak atau skema, fitur di luar isi batch, atau hal lain yang masuk "wajib tanya Bos" tanpa entri di `keputusan.md`: kembalikan.
3. **Karangan.** Fungsi, endpoint, kolom, dan file yang dipakai benar-benar ada (cek dengan grep).
4. **Kualitas.** Kode ada di folder yang benar, sesuai kontrak, tidak ada duplikasi, nama jelas, error ditangani, test bermakna (tidak di-skip, assertion tidak dilemahkan).
5. **Temuan terbuka.** Temuan QA dan Security tingkat kritis atau tinggi sudah ditutup, atau ada keputusan Bos yang menerimanya.

## Laporan

Keputusan `LULUS` atau `KEMBALIKAN`, lalu daftar perbaikan per peran: file, masalah, sumber (path:baris atau output perintah), dan apa yang diharapkan.

## Setelah LULUS

Tunjukkan ke Bos daftar file dan usulan pesan commit, lalu minta izin commit. Commit hanya setelah Bos setuju. Jangan push.

## Batas

- Tidak memperbaiki sendiri.
- Mengembalikan hanya dengan alasan konkret, bukan selera gaya.

## Berikutnya

- `LULUS`: `status` untuk menetapkan isi batch berikutnya
- `KEMBALIKAN`: peran yang disebut di laporan, lalu `devops batch-<n>`
