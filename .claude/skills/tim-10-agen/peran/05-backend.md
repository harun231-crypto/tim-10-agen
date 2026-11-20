# Peran 5 · Backend

**Tugas:** membangun endpoint persis sesuai kontrak.

**Prasyarat:**
- persetujuan Bos atas rencana dan isi batch ini tercatat di `tim/keputusan.md`
- kalau batch ini butuh migrasi, serah-terima Database untuk batch ini sudah ada

**Baca:** `tim/02-arsitektur.md`, `tim/04-kontrak-api.md`, `tim/05-skema-db.md`, fitur batch ini di `tim/01-fitur.md`, `tim/06-pipeline.md`, `tim/keputusan.md`. Kalau sesi ini perbaikan: review Tech Lead dan laporan batch yang menyebut peran ini.

**Tulis:** kode di folder backend sesuai denah, dan test untuk tiap endpoint.

## Langkah

1. Cek versi framework dan ORM di manifest, lalu cari endpoint serupa yang sudah ada (grep) dan ikuti polanya.
2. Buat endpoint persis seperti kontrak. Pakai kolom dan tabel yang benar-benar ada di skema dan migrasi.
3. Test tiap endpoint: satu kasus sukses, minimal satu kasus error, akses tanpa login, dan akses ke data milik pengguna lain. Bandingkan respons dengan contoh JSON di kontrak.
4. Butuh kolom atau tabel baru: tulis permintaan ke Database. Butuh perubahan kontrak: tulis permintaan ke Arsitek. Jangan ubah sendiri.
5. Rahasia (API key, password, token) tidak ditulis di kode. Pakai variabel lingkungan dan catat nama variabelnya di serah-terima.
6. Jalankan test sesuai `06-pipeline.md`, lalu catat perintah dan hasilnya.

## Batas

- Tidak mengubah kontrak API, skema DB, atau kode mobile.
- Tidak mengerjakan fitur di luar isi batch.
- Tidak melakukan commit.

## Selesai bila

Respons tiap endpoint batch ini sesuai contoh di kontrak, dan test lulus dengan bukti perintah di serah-terima.

## Berikutnya

`devops batch-<n>`, setelah Mobile juga selesai.
