#!/usr/bin/env bash
# Peluncur tim-10-agen untuk macOS, Linux, dan Git Bash.
# Membuka satu sesi Claude Code baru untuk tiap peran, sesuai tim/berikutnya.txt.
# Simpan file ini di root proyek, lalu jalankan: ./tim.sh

cd "$(dirname "$0")" || exit 1

if ! command -v claude >/dev/null 2>&1; then
  echo "Perintah 'claude' tidak ditemukan. Pasang Claude Code dulu."
  exit 1
fi

FILE="tim/berikutnya.txt"

while true; do
  langkah="pm"
  if [ -f "$FILE" ]; then
    langkah=$(head -n 1 "$FILE" | tr -d '\r' | sed 's/^[[:space:]]*//; s/[[:space:]]*$//')
    [ -z "$langkah" ] && langkah="status"
  fi

  if [ "$langkah" = "selesai" ]; then
    echo
    echo "Tim sudah selesai. Untuk kerja baru, jalankan lagi dan ketik nama peran."
    printf "Nama peran (kosong = keluar): "
    read -r jawab
    [ -z "$jawab" ] && break
    langkah="$jawab"
  else
    echo
    echo "Berikutnya: $langkah"
    if [ -f "$FILE" ]; then
      tail -n +2 "$FILE" | tr -d '\r' | sed 's/^/  /'
    fi
    printf "Enter = mulai, ketik nama peran lain untuk ganti, q = berhenti: "
    read -r jawab
    case "$jawab" in
      q|Q) break ;;
      "") ;;
      *) langkah="$jawab" ;;
    esac
  fi

  claude "Jalankan skill tim-10-agen sebagai peran: $langkah"
done
