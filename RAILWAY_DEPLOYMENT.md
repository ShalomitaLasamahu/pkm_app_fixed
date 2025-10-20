# Railway Deployment Guide

## Environment Variables yang Diperlukan

Setelah deploy ke Railway, pastikan untuk mengatur environment variables berikut:

### Database Configuration
```
DB_HOST=<railway-mysql-host>
DB_USER=<railway-mysql-user>
DB_PASSWORD=<railway-mysql-password>
DB_NAME=<railway-mysql-database>
DB_PORT=3306
```

### Alternative MySQL Variables (Railway Default)
```
MYSQL_HOST=<railway-mysql-host>
MYSQL_USER=<railway-mysql-user>
MYSQL_PASSWORD=<railway-mysql-password>
MYSQL_DATABASE=<railway-mysql-database>
MYSQL_PORT=3306
```

### Server Configuration
```
PORT=3000
NODE_ENV=production
SESSION_SECRET=<your-secure-session-secret>
```

## Cara Mengatur Environment Variables di Railway

1. Buka project di Railway dashboard
2. Klik pada service aplikasi Anda
3. Pergi ke tab "Variables"
4. Tambahkan semua environment variables di atas
5. Deploy ulang aplikasi

## Database Setup

Pastikan database MySQL sudah dibuat dengan tabel-tabel yang diperlukan:

1. `users` - untuk data pengguna
2. `mahasiswa` - untuk data mahasiswa
3. `tasks` - untuk data deadline tugas
4. `rekap_kehadiran` - untuk data rekap kehadiran

## Troubleshooting

### Error: Database connection failed
- Pastikan environment variables database sudah benar
- Cek apakah MySQL service sudah running
- Pastikan database name sudah dibuat

### Error: Session store warning
- Aplikasi sudah dikonfigurasi untuk production
- Session secret sudah menggunakan environment variable

### Error: Port binding
- Railway akan otomatis mengatur PORT environment variable
- Aplikasi sudah dikonfigurasi untuk menggunakan PORT dari environment
