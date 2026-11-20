# tim-10-agen

Skill Claude Code untuk membangun aplikasi dengan **tim 10 agen**: Product Manager, Arsitek, Desainer, Mobile, Backend, Database, QA, Security, DevOps, dan Tech Lead. Kamu menjadi **Bos**: memberi arah dan mengambil keputusan.

*A Claude Code skill that splits app development across 10 role-based agents, one fresh session per role, with file-based handoffs. Docs in Indonesian.*

## Kenapa dipecah

Kalau satu AI disuruh mengerjakan semuanya, di fitur ketiga ia sudah lupa fitur pertama: konteksnya kepenuhan dan kodenya kusut. Di sini:

- **Satu sesi untuk satu peran.** Tiap peran mulai dari konteks bersih dan hanya membaca file yang ia butuhkan, jadi lebih hemat token.
- **Serah-terima lewat file** di folder `tim/`. Folder ini menjadi ingatan tim, bukan riwayat obrolan.
- **Agen tidak memutuskan hal penting.** Stack, library baru, kontrak API, skema DB, biaya, keamanan, data, commit, push, dan deploy selalu ditanyakan ke Bos. Jawabanmu dicatat persis di `tim/keputusan.md`.
- **Agen tidak boleh mengarang.** Setiap klaim harus ada buktinya: path file, output perintah, atau keputusan Bos. Yang belum pasti ditulis `BELUM DIKETAHUI`. Tech Lead menjalankan ulang test dan mengembalikan pekerjaan yang klaimnya tidak berbukti.

## Sepuluh peran

| # | Peran | Tugas |
|---|---|---|
| 1 | `pm` | Memecah ide jadi daftar fitur dengan kriteria terima |
| 2 | `arsitek` | Menyusun denah folder dan kontrak API |
| 3 | `desainer` | Membuat alur tiap layar |
| 4 | `mobile` | Membangun layar aplikasi (atau frontend web) |
| 5 | `backend` | Membangun endpoint persis sesuai kontrak |
| 6 | `database` | Menjaga tabel biar enggak dobel |
| 7 | `qa` | Mencari bug sampai ketemu |
| 8 | `security` | Menutup celah sebelum hacker menemukannya |
| 9 | `devops` | Build dan test tiap kode yang masuk |
| 10 | `tech-lead` | Me-review semua kerjaan; yang jelek dibalikin |

Ada juga `status` untuk melihat posisi tim, menjawab pertanyaan yang tertunda, dan memilih isi batch berikutnya.

## Pasang

Yang dibutuhkan: [Claude Code](https://docs.claude.com/en/docs/claude-code/overview) dan git. Jalankan perintah di bawah dari **folder root proyekmu**.

**Windows (PowerShell)**

```powershell
$src = "$env:TEMP\tim-10-agen"
Remove-Item -Recurse -Force $src -ErrorAction SilentlyContinue
git clone --depth 1 https://github.com/harun231-crypto/tim-10-agen $src
New-Item -ItemType Directory -Force .claude\skills | Out-Null
Remove-Item -Recurse -Force .claude\skills\tim-10-agen -ErrorAction SilentlyContinue
Copy-Item -Recurse "$src\.claude\skills\tim-10-agen" .claude\skills\
Copy-Item "$src\tim.cmd", "$src\tim-peluncur.ps1", "$src\tim.sh" .
Remove-Item -Recurse -Force $src
```

**macOS, Linux, atau Git Bash**

```bash
git clone --depth 1 https://github.com/harun231-crypto/tim-10-agen /tmp/tim-10-agen
mkdir -p .claude/skills
rm -rf .claude/skills/tim-10-agen
cp -r /tmp/tim-10-agen/.claude/skills/tim-10-agen .claude/skills/
cp /tmp/tim-10-agen/tim.sh /tmp/tim-10-agen/tim.cmd /tmp/tim-10-agen/tim-peluncur.ps1 .
chmod +x tim.sh
rm -rf /tmp/tim-10-agen
```

Hasilnya:

```
proyekmu/
├── .claude/skills/tim-10-agen/   ← skill-nya
├── tim.cmd, tim-peluncur.ps1     ← peluncur untuk Windows
└── tim.sh                        ← peluncur untuk macOS, Linux, Git Bash
```

Mau dipakai di semua proyek? Salin folder `tim-10-agen` ke `~/.claude/skills/` (Windows: `%USERPROFILE%\.claude\skills\`). Peluncurnya tetap disalin ke tiap proyek.

Untuk memperbarui, jalankan perintah pasang yang sama. Folder `tim/` milik proyekmu tidak tersentuh.

## Cara pakai

### Dengan peluncur (disarankan)

Dari root proyek:

- Windows: `.\tim` di PowerShell, atau `tim` di Command Prompt
- macOS, Linux, Git Bash: `./tim.sh`

```
Berikutnya: arsitek
  Daftar fitur disetujui Bos (K-001).
Enter = mulai, ketik nama peran lain untuk ganti, q = berhenti:
```

1. Tekan **Enter**. Claude Code terbuka sebagai peran itu, dalam sesi baru.
2. Kerjakan bersama peran itu dan jawab pertanyaannya.
3. Setelah ia menulis serah-terima, tutup sesinya dengan `/exit` atau **Ctrl+C dua kali**.
4. Peluncur menawarkan peran berikutnya. Tekan Enter lagi, atau ketik nama peran lain kalau mau ganti urutan.

Di awal proyek (belum ada folder `tim/`), peluncur mulai dari `pm`.

### Tanpa peluncur

Di dalam Claude Code:

- `/tim-10-agen pm`, `/tim-10-agen backend batch-1`, dan seterusnya
- `/tim-10-agen status` untuk melihat posisi tim
- Setelah satu peran selesai: `/clear`, lalu ketik `lanjut`. Claude membaca `tim/berikutnya.txt` dan menawarkan peran berikutnya.

### Kerja paralel

Mobile dan Backend boleh jalan bersamaan, begitu juga QA dan Security, serta Desainer, Database, dan DevOps di tahap perencanaan. Buka terminal kedua, jalankan `claude`, lalu panggil perannya, misalnya `/tim-10-agen backend batch-1`. Agen tidak melakukan commit, jadi dua sesi tidak saling bentrok di git. Commit dilakukan Tech Lead setelah batch lulus, dengan izinmu.

## Alur kerja

```
PERENCANAAN
pm → arsitek → desainer + database + devops → arsitek (finalisasi) → status (pilih batch)

TIAP BATCH (1-3 fitur)
database → mobile + backend → devops → qa + security → tech-lead
                                 ↑                          │
                                 └──── KEMBALIKAN ──────────┘
LULUS → status (batch berikutnya) … → devops (rilis, setelah Bos setuju) → selesai
```

Untuk kerja kecil tidak perlu sepuluh sesi. Contohnya bug: `qa` → peran pemilik kode → `devops` → `tech-lead`.

## Folder `tim/`

| File | Isi |
|---|---|
| `00-brief.md` | Permintaanmu, dikutip persis |
| `01-fitur.md` | Daftar fitur, prioritas, kriteria terima |
| `02-arsitektur.md` | Stack, denah folder, konvensi |
| `03-alur-layar.md` | Layar dan navigasi |
| `04-kontrak-api.md` | Kontrak antara Mobile dan Backend |
| `05-skema-db.md` | Tabel, relasi, index |
| `06-pipeline.md` | Perintah build, test, lint |
| `keputusan.md` | Semua keputusanmu, dikutip persis |
| `berikutnya.txt` | Peran berikutnya (dibaca peluncur) |
| `serah-terima/` | Hasil terakhir tiap peran |
| `laporan/batch-n/` | Laporan DevOps, QA, Security, Tech Lead |

Simpan `tim/` di git bersama kode.

## Kenapa semi-otomatis, bukan otomatis penuh

Peluncur sudah tahu peran berikutnya, jadi kamu tinggal menekan Enter. Tapi ia tetap berhenti sebentar di antara peran karena tiga alasan:

1. Kalau semua peran dirangkai dalam satu sesi, konteksnya menumpuk lagi dan tujuan utama skill ini hilang.
2. Banyak titik di alur kerja memang butuh keputusanmu: daftar fitur, pilihan stack, rencana, isi batch, commit, dan rilis.
3. Kesalahan ketahuan di peran tempat ia muncul, tidak terbawa ke lima peran berikutnya sambil menghabiskan kuota.

## Tips hemat

- Satu sesi untuk satu peran. Jangan lanjut ke peran lain di sesi yang sama.
- Peran rutin seperti DevOps bisa memakai model yang lebih ringan (`/model`). Arsitek, Security, dan Tech Lead sebaiknya memakai model yang lebih kuat.
- Serah-terima dibatasi sekitar 40 baris dan ditimpa tiap sesi. Riwayatnya ada di git.

## Lisensi

MIT. Bebas dipakai, diubah, dan dibagikan.
