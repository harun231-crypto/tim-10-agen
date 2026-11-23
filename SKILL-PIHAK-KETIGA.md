# Skill pihak ketiga

Skill di bawah disalin apa adanya (tanpa diubah) dari repositori aslinya, lengkap dengan file lisensinya di dalam folder masing-masing. Hak cipta tetap milik pembuatnya. Lisensi MIT milik repo ini hanya berlaku untuk `tim-10-agen`, folder `.claude/agents/`, dan peluncur.

Diambil pada 23 November 2026. Isi tiap skill sudah diperiksa: tidak ada perintah yang mengunduh atau menjalankan kode dari internet.

| Skill | Bidang | Dipakai peran | Sumber (commit) | Lisensi |
|---|---|---|---|---|
| `ui-ux-pro-max` | Desain UI/UX: gaya, palet, font, pedoman UX | Desainer, Mobile | [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) `281e453` | MIT |
| `frontend-design` | Desain visual anti "AI slop" | Desainer, Mobile | [anthropics/skills](https://github.com/anthropics/skills) `e4bb5d9` | Apache 2.0 |
| `stop-slop` | Teks UI tanpa pola tulisan AI | Desainer | [hardikpandya/stop-slop](https://github.com/hardikpandya/stop-slop) `8da1f03` | MIT |
| `accessibility` | Aksesibilitas WCAG 2.2 | Desainer, QA | [addyosmani/web-quality-skills](https://github.com/addyosmani/web-quality-skills) `afa8da9` | MIT |
| `web-quality-audit` | Performa, aksesibilitas, SEO web | QA, DevOps | [addyosmani/web-quality-skills](https://github.com/addyosmani/web-quality-skills) `afa8da9` | MIT |
| `ponytail` | Kode sesedikit mungkin, tanpa over-engineering | Arsitek, Mobile, Backend | [DietrichGebert/ponytail](https://github.com/DietrichGebert/ponytail) `ebd8654` | MIT |
| `ponytail-review` | Review kode yang berlebihan | Tech Lead | [DietrichGebert/ponytail](https://github.com/DietrichGebert/ponytail) `ebd8654` | MIT |
| `react-best-practices` | Performa React dan Next.js | Arsitek, Mobile | [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) `5a37a63` | MIT |
| `react-native-skills` | React Native dan Expo | Arsitek, Mobile | [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) `5a37a63` | MIT |
| `flutter-apply-architecture-best-practices` | Arsitektur aplikasi Flutter | Arsitek, Mobile | [flutter/skills](https://github.com/flutter/skills) `ff6d472` | BSD-3-Clause |
| `supabase-postgres-best-practices` | Skema, index, query, RLS PostgreSQL | Database, Backend | [supabase/agent-skills](https://github.com/supabase/agent-skills) `c9be0e9` | MIT |
| `test-driven-development` | Test dulu, baru kode | Mobile, Backend, QA | [obra/superpowers](https://github.com/obra/superpowers) `22f0b46` | MIT |
| `systematic-debugging` | Mencari akar masalah bug | QA | [obra/superpowers](https://github.com/obra/superpowers) `22f0b46` | MIT |
| `verification-before-completion` | Tidak mengklaim selesai tanpa bukti | semua peran pelaksana | [obra/superpowers](https://github.com/obra/superpowers) `22f0b46` | MIT |
| `webapp-testing` | Uji aplikasi web dengan Playwright | QA | [anthropics/skills](https://github.com/anthropics/skills) `e4bb5d9` | Apache 2.0 |
| `differential-review` | Review keamanan atas perubahan kode | Security, Tech Lead | [trailofbits/skills](https://github.com/trailofbits/skills) `149d7b2` | CC BY-SA 4.0 |

Catatan:
- `systematic-debugging` menyebut nama skill lain dengan awalan `superpowers:`. Di repo ini skill yang sama terpasang tanpa awalan (`test-driven-development`, `verification-before-completion`).
- `webapp-testing` butuh Python dan Playwright; `web-quality-audit` butuh `jq`; `ui-ux-pro-max` butuh Python 3. Memasang alat itu termasuk keputusan Bos.

## Pilihan tambahan (tidak disertakan)

Skill ini bagus, tapi tidak disalin karena memasang program atau berukuran besar. Pasang sendiri kalau perlu.

| Skill | Kenapa menarik | Kenapa tidak disertakan | Cara pasang |
|---|---|---|---|
| [Impeccable](https://github.com/pbakaus/impeccable) | Paket desain anti "AI slop" terlengkap: audit, critique, polish, animate | Mengunduh program pendukungnya sendiri saat dipakai | `/plugin marketplace add pbakaus/impeccable`, lalu buka `/plugin` dan pasang Impeccable |
| [Taste Skill](https://github.com/Leonxlnx/taste-skill) | Anti-slop untuk landing page dan website perusahaan | Ukurannya sekitar 40 MB | `/plugin marketplace add Leonxlnx/taste-skill` lalu `/plugin install taste-skill@taste-skill` |
| [Expo skills](https://github.com/expo/skills) | Skill resmi Expo: router, EAS, upgrade | Banyak skill; pasang hanya kalau pakai Expo | `/plugin install expo@claude-plugins-official` |
| [Trail of Bits static-analysis](https://github.com/trailofbits/skills) | Semgrep dan CodeQL | Butuh Semgrep atau CodeQL terpasang | `/plugin marketplace add trailofbits/skills` |
| Skill ponytail lain (`ponytail-audit`, `ponytail-debt`) | Audit dan daftar utang teknis | Opsional | `/plugin marketplace add DietrichGebert/ponytail` |
