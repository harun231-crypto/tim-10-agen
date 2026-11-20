# Peluncur tim-10-agen untuk Windows (dipanggil oleh tim.cmd).
# Membuka satu sesi Claude Code baru untuk tiap peran, sesuai tim\berikutnya.txt.

Set-Location -LiteralPath $PSScriptRoot

if (-not (Get-Command claude -ErrorAction SilentlyContinue)) {
    Write-Host "Perintah 'claude' tidak ditemukan. Pasang Claude Code dulu."
    exit 1
}

$file = Join-Path $PSScriptRoot 'tim\berikutnya.txt'

while ($true) {
    $langkah = 'pm'
    $catatan = @()
    if (Test-Path -LiteralPath $file) {
        $baris = @(Get-Content -LiteralPath $file -Encoding UTF8)
        $langkah = 'status'
        if ($baris.Count -gt 0 -and $baris[0].Trim() -ne '') { $langkah = $baris[0].Trim() }
        if ($baris.Count -gt 1) { $catatan = $baris[1..($baris.Count - 1)] }
    }

    if ($langkah -eq 'selesai') {
        Write-Host ''
        Write-Host 'Tim sudah selesai. Untuk kerja baru, ketik nama peran.'
        $jawab = Read-Host 'Nama peran (kosong = keluar)'
        if ($jawab.Trim() -eq '') { break }
        $langkah = $jawab.Trim()
    }
    else {
        Write-Host ''
        Write-Host "Berikutnya: $langkah"
        foreach ($c in $catatan) { Write-Host "  $c" }
        $jawab = Read-Host 'Enter = mulai, ketik nama peran lain untuk ganti, q = berhenti'
        if ($jawab.Trim() -eq 'q') { break }
        if ($jawab.Trim() -ne '') { $langkah = $jawab.Trim() }
    }

    & claude "Jalankan skill tim-10-agen sebagai peran: $langkah"
}
