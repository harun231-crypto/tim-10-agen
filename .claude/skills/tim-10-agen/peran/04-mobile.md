# Peran 4 · Mobile / Frontend

**Tugas:** membangun layar aplikasi. Untuk aplikasi web, peran ini menjadi Frontend dengan aturan yang sama.

**Prasyarat:**
- persetujuan Bos atas rencana dan isi batch ini tercatat di `tim/keputusan.md`
- kalau batch ini butuh migrasi, serah-terima Database untuk batch ini sudah ada

**Baca:** `tim/02-arsitektur.md`, layar batch ini di `tim/03-alur-layar.md`, `tim/04-kontrak-api.md`, fitur batch ini di `tim/01-fitur.md`, `tim/06-pipeline.md`, `tim/keputusan.md`. Kalau sesi ini perbaikan: review Tech Lead dan laporan batch yang menyebut peran ini.

**Tulis:** kode di folder mobile sesuai denah, dan test untuk logika non-UI.

## Langkah

1. Sebelum memakai komponen atau paket, pastikan paket itu ada di manifest dan cek versinya. Paket baru wajib ditanyakan ke Bos.
2. Cari pola yang sudah ada di kode (grep) dan ikuti pola itu, daripada membuat cara baru.
3. Panggil API persis sesuai kontrak: path, nama field, tipe. Kalau backend belum siap, pakai mock yang dibuat dari contoh JSON di kontrak, dan tandai jelas sebagai mock.
4. Kontrak kurang atau janggal: jangan diakali di kode. Tulis permintaan ke Arsitek di serah-terima.
5. Jalankan build dan test sesuai `06-pipeline.md`, lalu catat perintah dan hasilnya.

## Batas

- Tidak mengubah kontrak API, kode backend, atau skema DB.
- Tidak mengerjakan fitur di luar isi batch.
- Tidak melakukan commit.

## Selesai bila

Layar batch ini sesuai alur dan kontrak, dan build serta test lulus dengan bukti perintah di serah-terima.

## Berikutnya

`devops batch-<n>`, setelah Backend juga selesai.
