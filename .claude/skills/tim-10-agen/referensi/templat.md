# Templat papan kerja tim

Dibaca hanya saat `tim/` belum ada. Buat folder dan file berikut di root proyek, lalu isi sesuai peranmu. File milik peran lain dibiarkan sampai peran itu jalan.

```
tim/
├── 00-brief.md
├── keputusan.md
├── berikutnya.txt
├── serah-terima/
└── laporan/
```

## tim/00-brief.md

```markdown
# Brief

## Kata-kata Bos
> <kutipan persis permintaan Bos>

## Sudah pasti
- <fakta> (sumber: K-001)

## Belum diketahui
- <pertanyaan yang harus dijawab Bos>
```

## tim/keputusan.md

```markdown
# Keputusan Bos

Berisi hanya jawaban Bos, dikutip persis. Agen tidak menulis keputusan atas nama Bos.

## K-001 · YYYY-MM-DD
- Pertanyaan: <pertanyaan dan pilihan yang diajukan>
- Jawaban Bos: "<kutipan persis>"
- Dicatat oleh: <peran>
```

Nomor K- berurutan dan tidak pernah dipakai ulang. Kalau Bos mengubah keputusan, tambahkan entri baru yang menyebut "menggantikan K-…"; entri lama tidak dihapus.

## tim/berikutnya.txt

```
<peran> [batch-n]   atau   selesai
<alasan singkat, paling banyak 3 baris>
```

Baris pertama dibaca oleh peluncur `tim`, jadi hanya berisi nama peran, ditambah `batch-<n>` kalau perlu.

## tim/serah-terima/<peran>.md

```markdown
# Serah terima · <peran> · YYYY-MM-DD · <tahap atau batch-n>

## Ringkasan
<paling banyak 5 baris>

## File diubah
- <path>: <apa yang berubah>

## Terverifikasi
- `<perintah>` → <hasil: exit code, jumlah lulus/gagal>
- <klaim> → <sumber: path:baris atau K-…>

## Belum diverifikasi
- <apa> → <kenapa belum bisa>

## Menunggu Bos
- P-<peran>-<n>: <pertanyaan> | Pilihan: A) … B) … | Dampak: … | Rekomendasi: …
- Bagian yang tertahan: <apa>

## Permintaan ke peran lain
- <peran>: <apa yang dibutuhkan> → <alasan dan sumber>

## Langkah berikutnya
- <isi baris pertama tim/berikutnya.txt> → <kenapa>
```

Isi bagian yang kosong dengan "tidak ada", jangan dihapus, supaya peran berikutnya tahu bagian itu memang sudah diperiksa.

## tim/laporan/batch-<n>/<peran>.md

```markdown
# <Peran> · batch-<n> · YYYY-MM-DD
Fitur di batch ini: <F.. sesuai K-…>

## Hasil
<LULUS / GAGAL / KEMBALIKAN, atau jumlah temuan per tingkat>

## Temuan
| ID | Tingkat | Lokasi (path:baris) | Bukti | Pemilik |
|---|---|---|---|---|

## Perintah yang dijalankan
- `<perintah>` → <hasil>
```
