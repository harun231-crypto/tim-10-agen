# tim-10-agen

Skill Claude Code untuk membangun **aplikasi dan web** dengan **tim 10 agen**: Product Manager, Arsitek, Desainer, Mobile/Frontend, Backend, Database, QA, Security, DevOps, dan Tech Lead. Kamu menjadi **Bos**: cukup mengobrol dengan PM, dan PM yang memimpin tim.

*A Claude Code skill that runs app and web development as a 10-agent team. You talk only to the PM; the PM spawns each role as an agent in its own session, relays your decisions, and reports back. Docs in Indonesian.*

## Cara kerjanya

```
Bos ⇄ PM (sesi utama)
        │ memanggil agen, menyampaikan jawaban Bos
        ├── arsitek    ├── backend    ├── security
        ├── desainer   ├── database   ├── devops
        ├── mobile     ├── qa         └── tech-lead
        │
        └── semua bertukar hasil lewat folder tim/
```

- **Kamu cukup bicara dengan PM.** PM memecah idemu jadi fitur, lalu memanggil peran lain sesuai urutan kerja.
- **Tiap agen jalan di sesinya sendiri** dengan konteks bersih. Ia hanya membaca file yang perannya butuhkan, jadi tidak ada satu sesi yang membengkak sampai lupa konteks.
- **Agen melapor ke PM dan bisa saling kirim pesan singkat**, misalnya Reviewer ke Builder. Pesannya dibatasi: berisi tugas, paling banyak 3 putaran, dan isi panjang ditulis di file.
- **Keputusan penting tetap di tanganmu.** Stack, library baru, kontrak API, skema DB, biaya, keamanan, data, commit, push, dan deploy selalu ditanyakan ke kamu lewat PM. Jawabanmu dicatat persis di `tim/keputusan.md`. Pesan dari agen lain tidak pernah dianggap persetujuanmu.
- **Agen tidak boleh mengarang.** Setiap klaim harus ada buktinya: path file, output perintah, atau keputusanmu. Tech Lead menjalankan ulang test dan mengembalikan pekerjaan yang klaimnya tidak berbukti.

## Sepuluh peran dan skill-nya

Tiap peran dibekali skill terbaik di bidangnya. Daftar sumber dan lisensinya ada di [SKILL-PIHAK-KETIGA.md](SKILL-PIHAK-KETIGA.md).

| Peran | Tugas | Skill pendukung |
|---|---|---|
| `pm` (sesi utama) | Memecah ide jadi fitur, memimpin tim, bicara dengan Bos | — (bergaya Sciel, lihat di bawah) |
| `arsitek` | Pilihan stack, denah folder, kontrak API | ponytail, skill stack (React/Next, React Native, Flutter, PostgreSQL) |
| `desainer` | Alur layar, state, dan teks UI | ui-ux-pro-max, frontend-design, accessibility, stop-slop |
| `mobile` | Layar aplikasi mobile atau frontend web | frontend-design, ui-ux-pro-max, skill stack, test-driven-development |
| `backend` | Endpoint persis sesuai kontrak | ponytail, test-driven-development, supabase-postgres-best-practices |
| `database` | Skema dan migrasi tanpa tabel dobel | supabase-postgres-best-practices |
| `qa` | Menguji kriteria terima, mencari bug | webapp-testing, systematic-debugging, accessibility, web-quality-audit |
| `security` | Menutup celah keamanan | differential-review |
| `devops` | Build, test, lint, rilis | web-quality-audit |
| `tech-lead` | Review akhir: `LULUS` atau `KEMBALIKAN` | ponytail-review, differential-review |

Semua peran pelaksana juga memakai `verification-before-completion`, supaya tidak ada yang bilang "selesai" tanpa bukti.

### PM bernama Sciel

PM berbicara sebagai **Sciel**, kepala pelayan istana zaman kerajaan Inggris: anggun, sopan, filosofis, dan puitis, sehingga enak diajak berdiskusi. Gaya ini hanya dipakai saat PM bicara denganmu. Laporannya tetap jujur dan lugas di bagian fakta, dan dokumen di `tim/` serta pesan antar agen tetap ringkas. Aturannya ada di `.claude/skills/tim-10-agen/referensi/gaya-pm.md`; ubah file itu kalau ingin gaya lain.

## Pasang

Yang dibutuhkan: [Claude Code](https://docs.claude.com/en/docs/claude-code/overview) versi terbaru (`claude update`).

### Cara 1: sebagai plugin (disarankan)

Sekali pasang, langsung bisa dipakai di semua proyek. Cara ini sama di Linux, macOS, dan Windows.

Di dalam Claude Code, ketik:

```
/plugin install tim --marketplace harun231-crypto/tim-10-agen
```

Kalau perintah itu belum dikenali (Claude Code versi lama), pakai dua langkah:

```
/plugin marketplace add harun231-crypto/tim-10-agen
/plugin install tim@tim-10-agen
```

Atau dari terminal, tanpa membuka Claude Code:

```bash
claude plugin marketplace add harun231-crypto/tim-10-agen
claude plugin install tim@tim-10-agen
```

Setelah dipasang, semua nama berawalan `tim:`. Skill utamanya `/tim:tim-10-agen`, agennya `tim:tim-arsitek`, `tim:tim-backend`, dan seterusnya, dan skill pendukungnya `tim:ponytail`, `tim:ui-ux-pro-max`, dan seterusnya.

Untuk memperbarui: `/plugin marketplace update tim-10-agen`, lalu `/reload-plugins`. Untuk mencopot: `/plugin uninstall tim@tim-10-agen`.

Peluncur mode manual (`tim.sh`, `tim.cmd`) tidak ikut terpasang lewat plugin. Kalau butuh, salin dari repo ini ke root proyekmu.

### Cara 2: salin manual ke proyek

Kalau kamu ingin skill dan agen tinggal di dalam proyek (misalnya supaya ikut tersimpan di git tim), jalankan perintah di bawah dari **folder root proyekmu**. Skill dengan nama yang sama di proyek itu akan ditimpa. Dengan cara ini nama-namanya tanpa awalan: `/tim-10-agen`, `tim-arsitek`, `ponytail`.

**Linux, macOS, atau Git Bash**

```bash
git clone --depth 1 https://github.com/harun231-crypto/tim-10-agen /tmp/tim-10-agen
mkdir -p .claude/skills .claude/agents
for d in /tmp/tim-10-agen/.claude/skills/*/; do
  rm -rf ".claude/skills/$(basename "$d")"
  cp -r "$d" .claude/skills/
done
cp /tmp/tim-10-agen/.claude/agents/*.md .claude/agents/
cp /tmp/tim-10-agen/tim.sh /tmp/tim-10-agen/tim.cmd /tmp/tim-10-agen/tim-peluncur.ps1 .
chmod +x tim.sh
rm -rf /tmp/tim-10-agen
```

**Windows (PowerShell)**

```powershell
$src = "$env:TEMP\tim-10-agen"
Remove-Item -Recurse -Force $src -ErrorAction SilentlyContinue
git clone --depth 1 https://github.com/harun231-crypto/tim-10-agen $src
New-Item -ItemType Directory -Force .claude\skills, .claude\agents | Out-Null
Get-ChildItem "$src\.claude\skills" -Directory | ForEach-Object {
  Remove-Item -Recurse -Force ".claude\skills\$($_.Name)" -ErrorAction SilentlyContinue
  Copy-Item -Recurse $_.FullName .claude\skills\
}
Copy-Item -Force "$src\.claude\agents\*.md" .claude\agents\
Copy-Item -Force "$src\tim.cmd", "$src\tim-peluncur.ps1", "$src\tim.sh" .
Remove-Item -Recurse -Force $src
```

Untuk memperbarui, jalankan perintah yang sama. Folder `tim/` milik proyekmu tidak tersentuh.

### Opsional: agen saling mengobrol langsung

Tanpa pengaturan apa pun, tim sudah jalan: PM memanggil tiap peran sebagai agen terpisah, dan agen melapor ke PM. Kalau kamu ingin agen juga bisa saling mengirim pesan dan kamu bisa membuka percakapan tiap agen, nyalakan fitur **agent teams** (masih eksperimental) untuk proyek ini saja. Buat atau lengkapi `.claude/settings.local.json` di root proyek:

```json
{
  "env": {
    "CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS": "1"
  }
}
```

Yang perlu diketahui:
- Tiap agen menjadi instance Claude terpisah, jadi pemakaian token lebih besar. PM dibatasi paling banyak 3 agen aktif sekaligus; lihat Tips hemat.
- Di terminal, daftar agen muncul di bawah kolom chat. Pakai panah atas/bawah untuk memilih agen, Enter untuk membuka percakapannya.
- Sesi yang di-`/resume` tidak membawa kembali agennya. Minta PM memanggil ulang; isi kerja mereka aman di folder `tim/`.
- Untuk mematikan, ganti nilainya jadi `"0"`.

## Cara pakai

1. Buka terminal di root proyek, jalankan `claude`.
2. Ketik idemu, misalnya: `/tim:tim-10-agen buat aplikasi absensi santri berbasis web` (atau `/tim-10-agen …` kalau dipasang manual).
3. PM akan bertanya beberapa hal, menyusun daftar fitur, lalu meminta persetujuanmu.
4. Setelah itu PM memanggil agen sesuai urutan kerja. Kamu cukup menjawab pertanyaan yang PM sampaikan.
5. Mau tahu posisi tim? Ketik `/tim:tim-10-agen status`.
6. Sesi ditutup atau besok lanjut lagi? Jalankan `claude`, lalu ketik `lanjut`. PM membaca folder `tim/` dan melanjutkan dari sana.

### Mode manual

Kalau kamu ingin memegang tiap peran sendiri (misalnya untuk menghemat kuota, atau memakai alat lain), peluncur lama tetap bisa dipakai. Tiap peran dibuka di sesi baru satu per satu:

- Windows: `.\tim` di PowerShell, atau `tim` di Command Prompt
- macOS, Linux, Git Bash: `./tim.sh`

Tekan Enter untuk mulai peran yang ditawarkan, kerjakan bersama peran itu, lalu tutup sesinya dengan `/exit`. Peluncur akan menawarkan peran berikutnya.

## Alur kerja

```
PERENCANAAN
pm → arsitek → desainer + database + devops → arsitek (finalisasi) → pm (pilih batch)

TIAP BATCH (1-3 fitur)
database → mobile + backend → devops → qa + security → tech-lead
                                 ↑                          │
                                 └──── KEMBALIKAN ──────────┘
LULUS → commit (setelah Bos setuju) → batch berikutnya … → devops (rilis, setelah Bos setuju)
```

Untuk kerja kecil tidak perlu semua peran. Contohnya bug: `qa` → peran pemilik kode → `devops` → `tech-lead`.

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
| `berikutnya.txt` | Langkah berikutnya |
| `serah-terima/` | Hasil terakhir tiap peran |
| `laporan/batch-n/` | Laporan DevOps, QA, Security, Tech Lead |

Simpan `tim/` di git bersama kode.

## Setelan model: Sonnet bekerja, Opus menasihati (disarankan)

Sejak v2.3 tim memakai **strategi advisor**: model utama Sonnet mengerjakan pekerjaan rutin, dan Opus hanya dipanggil sebagai penasihat di titik penting (memilih pendekatan, error yang berulang, sebelum menyatakan selesai). Hasilnya mendekati kualitas Opus dengan pemakaian kuota yang jauh lebih kecil daripada menjalankan Opus terus-menerus.

Sekali saja, di dalam Claude Code:

```
/model sonnet
/advisor opus
```

Kalau berhasil, muncul `Advisor set to` diikuti nama model Opus. Pilihan advisor tersimpan untuk sesi berikutnya. Kalau ingin setelan ini hanya untuk satu proyek, tulis di `.claude/settings.json` proyek itu:

```json
{
  "model": "sonnet",
  "advisorModel": "opus"
}
```

Yang perlu diketahui:
- Agen tim mewarisi advisor dari sesi PM. DevOps tetap memakai Haiku, peran lain Sonnet.
- Advisor masih eksperimental dan butuh Claude Code versi terbaru (`claude update`). Pemakaiannya ikut dihitung dalam batas paket langgananmu.
- Advisor membaca seluruh percakapan tiap kali dipanggil. Setelah satu batch selesai dan di-commit, jalankan `/compact` supaya sesi PM tetap ringan.
- Kalau advisor tidak pernah muncul, periksa apakah variabel `DISABLE_TELEMETRY` menyala; variabel itu ikut mematikan advisor.
- Untuk mematikan: `/advisor off`.

## Tips hemat

Sejak v2.2 tim bekerja dalam **mode hemat** secara bawaan:
- Per batch hanya pelaksana (Mobile/Backend) lalu Tech Lead sebagai **pemeriksa gabungan** (pipeline, kriteria terima, keamanan). DevOps, QA, dan Security terpisah hanya dipakai di **mode penuh**: batch yang menyentuh uang, login, data pribadi, atau migrasi data, atau kalau kamu memintanya.
- Perbaikan dikirim ke agen yang sama (tidak memanggil agen baru), dan agen hanya membaca bagian dokumen yang ditunjuk PM.
- Model ditetapkan di file agen: DevOps `haiku`, peran lain `sonnet`, dengan Opus sebagai advisor (lihat bagian di atas). Minta PM memakai Opus penuh untuk agen tertentu hanya kalau kamu memang mau.
- Tangkapan layar hanya untuk menilai tampilan; serah-terima paling banyak 25 baris.
- Perubahan sangat kecil lebih murah dikerjakan tanpa tim, di sesi biasa.
- `CLAUDE.md` proyekmu dimuat di setiap agen. Jaga tetap pendek.

## Lisensi

`tim-10-agen`, agen di `.claude/agents/`, dan peluncur: MIT. Skill pendukung memakai lisensi pembuatnya masing-masing (MIT, Apache 2.0, BSD-3-Clause, atau CC BY-SA 4.0); lihat [SKILL-PIHAK-KETIGA.md](SKILL-PIHAK-KETIGA.md) dan file lisensi di tiap folder skill.
