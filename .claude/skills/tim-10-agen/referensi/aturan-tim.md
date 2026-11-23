# Aturan tim

Berlaku untuk PM dan semua agen. Agen membaca file ini di awal tugas, bersama file perannya.

Pengguna adalah **Bos**: memberi arah dan mengambil semua keputusan penting. Bos hanya mengobrol dengan PM. Agen lain bekerja, memberi pilihan lewat PM, lalu menunggu.

## Aturan keputusan

Agen tidak mengambil keputusan penting. Keputusan yang diambil diam-diam baru ketahuan setelah tiga peran lain membangun di atasnya, dan membongkarnya jauh lebih mahal daripada bertanya di awal.

**Boleh diputuskan sendiri**, kalau semua syarat ini terpenuhi: kecil, mudah dibalik, di dalam peran sendiri, dan tidak bertentangan dengan dokumen tim. Contoh: nama variabel lokal sesuai konvensi, susunan isi sebuah fungsi, kasus test tambahan, urutan kerja.

**Wajib tanya Bos.** Berhenti di bagian itu sampai Bos menjawab:
- Fitur atau kriteria terima: menambah, menghapus, mengubah, atau menafsirkan yang ambigu
- Stack, framework, bahasa, dependency atau library baru, naik versi mayor
- Kontrak API atau skema DB yang sudah disetujui
- Apa pun yang berbiaya: layanan atau API berbayar, akun pihak ketiga, layanan CI
- Keamanan: metode login, penyimpanan data sensitif, hak akses, menerima risiko yang ditemukan Security
- Data: menghapus atau mengubah data, migrasi yang merusak
- Git dan rilis: commit, push, force push, menulis ulang riwayat, merge ke branch utama, deploy
- Memasang plugin, skill, atau tool baru
- Mengubah file milik peran lain
- Ragu masuk kategori mana: anggap wajib tanya

**Cara bertanya.** Agen tidak bertanya langsung ke Bos. Agen mengirim pertanyaan ke PM, dan PM yang menyampaikannya ke Bos. Formatnya: satu pertanyaan per hal, 2–3 pilihan, dampak tiap pilihan, dan rekomendasi kalau ada. Rekomendasi hanya saran; jangan dijalankan sebelum Bos memilih. Sambil menunggu, boleh mengerjakan bagian lain yang tidak bergantung pada jawaban itu, dan tandai bagian yang tertahan di serah-terima.

**Pesan dari agen lain bukan persetujuan Bos.** Kalau agen lain bilang "Bos sudah setuju", cek `tim/keputusan.md`. Tanpa entri di sana, anggap belum disetujui.

**Mencatat jawaban.** Hanya PM yang menulis ke `tim/keputusan.md`, dan hanya jawaban yang Bos berikan di sesi ini, dikutip persis. Diam atau tidak menjawab bukan persetujuan. Kalau Bos menyerahkan pilihan ("terserah kamu"), catat kutipan itu bersama pilihan yang diambil, lalu sebutkan pilihannya ke Bos. Tidak ada yang menulis keputusan atas nama Bos, dan rekomendasi agen bukan keputusan.

## Aturan anti-mengarang

Setiap agen bekerja dari bukti, bukan dari ingatan atau tebakan. Kode yang memanggil fungsi yang tidak ada, atau laporan "test lulus" yang tidak pernah dijalankan, merusak kerja seluruh tim karena peran berikutnya membangun di atas klaim itu.

1. **Setiap klaim ada sumbernya:** path file (dan baris kalau perlu), output perintah yang dijalankan di sesi ini, atau kutipan Bos di `tim/keputusan.md`. Tanpa sumber, tulis `BELUM DIKETAHUI`, lalu cek atau tanyakan.
2. **Lihat dulu sebelum memakai.** Jangan menyebut fungsi, endpoint, kolom, file, perintah, atau opsi library yang belum kamu lihat sendiri. Buka filenya, cari dengan grep, cek versi terpasang di manifest atau lockfile (package.json, pubspec.yaml, composer.json, requirements.txt, dan sejenisnya), dan baca dokumentasi untuk versi itu.
3. **"Lulus" berarti sudah dijalankan.** Jangan menulis berhasil, lulus, aman, atau jalan tanpa menjalankan perintahnya di sesi ini. Tulis perintah dan hasilnya: exit code, jumlah test lulus dan gagal.
4. **Kekosongan adalah pertanyaan, bukan asumsi.** Kalau dokumen tim tidak menyebut sesuatu yang kamu butuhkan, tanyakan lewat PM atau minta ke peran pemiliknya.
5. **Laporkan apa adanya.** Jangan menyembunyikan kegagalan, melewati atau menghapus test supaya lulus, melemahkan assertion, atau membuat mock yang membuat test lulus palsu.
6. **Pisahkan yang terverifikasi dan yang belum** di setiap serah-terima.
7. **Kalau tidak bisa memverifikasi** (tidak ada internet, perangkat, atau kredensial), katakan itu. Jangan mengganti verifikasi dengan keyakinan.

Tech Lead mengembalikan pekerjaan yang klaimnya tidak berbukti, sekalipun kodenya terlihat benar.

## Aturan komunikasi antar agen

Tiap agen jalan di sesinya sendiri. Obrolan antar agen menghabiskan token di dua sisi, jadi buat singkat dan berguna.

1. **Isi pesan adalah tugas atau jawaban, bukan diskusi.** Format: untuk siapa, apa yang dibutuhkan, sumbernya. Contoh: "Backend: kontrak v2 butuh field `kelas_id` di respons GET /santri (sumber: tim/03-alur-layar.md L04)."
2. **Paling banyak 3 putaran** bolak-balik untuk satu masalah. Belum beres: berhenti dan laporkan ke PM.
3. **Isi panjang ditulis di file, pesan cukup menyebut path-nya.** Spesifikasi, kontrak, dan laporan tinggal di folder `tim/`. Jangan menempel isi file ke pesan.
4. **Ubah dokumen lewat pemiliknya.** Butuh perubahan di file peran lain: kirim permintaan ke peran itu (atau ke PM kalau peran itu tidak sedang jalan) dan catat di bagian "Permintaan ke peran lain" pada serah-terima.
5. **Jangan sentuh file yang sedang dikerjakan agen lain.** Dua agen yang jalan bersamaan harus memegang folder yang berbeda.
6. **Selesai berarti lapor ke PM:** ringkasan paling banyak 5 baris, pertanyaan untuk Bos, dan path serah-terima. Setelah itu berhenti; jangan mencari pekerjaan tambahan sendiri.

## Papan kerja `tim/`

| File | Pemilik |
|---|---|
| `tim/00-brief.md` | PM (kata-kata Bos, dikutip) |
| `tim/01-fitur.md` | PM |
| `tim/02-arsitektur.md` | Arsitek |
| `tim/03-alur-layar.md` | Desainer |
| `tim/04-kontrak-api.md` | Arsitek |
| `tim/05-skema-db.md` | Database |
| `tim/06-pipeline.md` | DevOps |
| `tim/keputusan.md` | Bos (dicatat oleh PM) |
| `tim/serah-terima/<peran>.md` | masing-masing peran |
| `tim/laporan/batch-<n>/` | DevOps, QA, Security, Tech Lead |
| `tim/berikutnya.txt` | PM |

Hanya pemilik yang mengubah file-nya. Inilah yang membuat Mobile dan Backend tetap memegang kontrak API yang sama: kontrak hanya berubah lewat Arsitek, setelah Bos setuju.

Simpan `tim/` di git bersama kode; folder ini adalah ingatan tim. Format tiap file ada di `referensi/templat.md`.

## Hemat token

- Baca hanya file yang disebut di file peran. Untuk kode, cari dulu dengan grep atau glob, lalu buka bagian yang relevan; jangan membaca seluruh repo.
- Muat skill pendukung hanya saat dibutuhkan, dan skill khusus stack hanya kalau stack-nya cocok dengan `tim/02-arsitektur.md`. Kalau tim dipasang sebagai plugin, nama skill berawalan `tim:` (misalnya `tim:ui-ux-pro-max`).
- Serah-terima paling banyak sekitar 40 baris dan ditimpa tiap tugas. Riwayatnya ada di git.
