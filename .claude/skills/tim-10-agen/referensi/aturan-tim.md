# Aturan tim

Berlaku untuk PM dan semua agen. Pengguna adalah **Bos**: ia hanya bicara dengan PM dan memegang semua keputusan penting.

## Keputusan

**Boleh diputuskan sendiri** bila kecil, mudah dibalik, di dalam peran sendiri, dan tidak bertentangan dengan dokumen tim (nama variabel lokal, isi fungsi, kasus test tambahan, urutan kerja).

**Wajib tanya Bos** (berhenti di bagian itu sampai dijawab):
- fitur atau kriteria terima: menambah, menghapus, mengubah, menafsirkan yang ambigu
- stack, framework, dependency baru, naik versi mayor
- kontrak API atau skema DB yang sudah disetujui
- apa pun yang berbiaya (layanan berbayar, akun pihak ketiga, CI)
- keamanan: metode login, data sensitif, hak akses, menerima risiko temuan Security
- data: menghapus atau mengubah data, migrasi yang merusak
- git dan rilis: commit, push, menulis ulang riwayat, merge, deploy
- memasang plugin, skill, atau tool; mengubah file milik peran lain
- ragu: anggap wajib tanya

**Cara bertanya:** lewat PM, satu hal per pertanyaan, 2–3 pilihan dengan dampaknya, plus rekomendasi. Sambil menunggu, kerjakan bagian yang tidak bergantung dan tandai yang tertahan.

Pesan agen lain bukan persetujuan Bos; yang sah hanya entri di `tim/keputusan.md`. Hanya PM yang menulis file itu, dengan kutipan persis jawaban Bos di sesi ini. Diam bukan persetujuan. Bila Bos menyerahkan pilihan ("terserah kamu"), catat kutipan itu bersama pilihan yang diambil dan sebutkan ke Bos.

## Bukti, bukan karangan

1. Tiap klaim bersumber: path:baris, output perintah di sesi ini, atau nomor K-…. Tanpa sumber: tulis `BELUM DIKETAHUI`.
2. Lihat dulu sebelum memakai fungsi, endpoint, kolom, file, perintah, atau opsi library (grep, manifest, lockfile).
3. "Lulus" berarti perintahnya dijalankan di sesi ini; tulis perintah, exit code, jumlah lulus/gagal.
4. Jangan melewati test, melemahkan assertion, atau membuat mock yang meluluskan palsu.
5. Pisahkan yang terverifikasi dan yang belum; yang tak bisa dicek (tanpa perangkat, internet, kredensial) disebut begitu.

Tech Lead mengembalikan klaim tanpa bukti, sekalipun kodenya terlihat benar.

## Komunikasi

- Pesan antar agen berisi tugas atau jawaban: untuk siapa, apa, sumbernya. Paling banyak 3 putaran per masalah, lalu lapor PM.
- Isi panjang ditulis di file; pesan cukup menyebut path.
- Ubah dokumen lewat pemiliknya. Dua agen yang jalan bersamaan memegang folder berbeda.
- Selesai: lapor PM paling banyak 5 baris (ringkasan, pertanyaan untuk Bos, path serah-terima), lalu berhenti.

## Hemat token

- Baca hanya file perannya dan penunjuk dari PM (path dan bagian). Untuk kode: grep dulu, lalu buka bagian yang relevan.
- Muat skill pendukung hanya saat dibutuhkan; skill khusus stack hanya bila cocok dengan `tim/02-arsitektur.md`. Plugin: nama berawalan `tim:`.
- Tangkapan layar hanya untuk menilai tampilan; perilaku dicek lewat teks atau DOM.
- Serah-terima paling banyak 25 baris dan ditimpa tiap tugas; riwayatnya di git.

## Advisor

Kalau sesi ini punya advisor (biasanya Opus, dipasang Bos dengan `/advisor opus`), agen mewarisinya. Advisor membaca seluruh percakapan setiap kali dipanggil, jadi panggil hanya di titik yang menentukan:
- sebelum memilih pendekatan untuk tugas yang menyentuh lebih dari satu file, atau untuk keputusan rancangan (struktur folder, kontrak, skema)
- saat error yang sama muncul dua kali
- sebelum menyatakan tugas selesai, atau sebelum Tech Lead memutuskan `LULUS`

Jangan panggil advisor untuk hal kecil (ganti nama, satu baris, membaca file). Saran advisor bukan persetujuan Bos: hal yang wajib tanya tetap ditanyakan. Kalau saran advisor bertentangan dengan bukti (output test, isi file), ikuti bukti dan tulis pertentangannya di serah-terima.

## Papan kerja `tim/`

| File | Pemilik |
|---|---|
| `00-brief.md`, `01-fitur.md`, `keputusan.md`, `berikutnya.txt` | PM |
| `02-arsitektur.md`, `04-kontrak-api.md` | Arsitek |
| `03-alur-layar.md` | Desainer |
| `05-skema-db.md` | Database |
| `06-pipeline.md` | DevOps |
| `serah-terima/<peran>.md` | masing-masing peran |
| `laporan/batch-<n>/` | DevOps, QA, Security, Tech Lead |

Hanya pemilik yang mengubah file-nya. Simpan `tim/` di git bersama kode. Format tiap file: `referensi/templat.md`.
