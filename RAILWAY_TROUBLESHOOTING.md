# Railway Troubleshooting Guide

## 🚨 Masalah: Aplikasi Masih Crash di Railway

### Langkah 1: Cek Environment Variables di Railway

1. **Buka Railway Dashboard**
   - Login ke https://railway.app
   - Pilih project `pkm_app_fixed`

2. **Set Environment Variables**
   - Klik pada service `pkm_app_fixed` (bukan MySQL)
   - Pergi ke tab **"Variables"**
   - Tambahkan environment variables berikut:

```
NODE_ENV=production
SESSION_SECRET=your-super-secret-key-here-change-this
```

3. **Cek MySQL Environment Variables**
   - Klik pada service **MySQL**
   - Pergi ke tab **"Variables"**
   - Copy semua environment variables MySQL ke service `pkm_app_fixed`:

```
MYSQL_HOST=<nilai-dari-mysql-service>
MYSQL_USER=<nilai-dari-mysql-service>
MYSQL_PASSWORD=<nilai-dari-mysql-service>
MYSQL_DATABASE=<nilai-dari-mysql-service>
MYSQL_PORT=<nilai-dari-mysql-service>
```

### Langkah 2: Deploy Ulang Aplikasi

1. **Trigger Manual Deploy**
   - Di Railway dashboard, klik tombol **"Deploy"** atau **"Redeploy"**
   - Tunggu sampai deployment selesai

2. **Cek Logs**
   - Setelah deploy, cek tab **"Deploy Logs"**
   - Pastikan tidak ada error

### Langkah 3: Test Database Connection

Jika masih error, jalankan setup database lagi:

```bash
# Di Railway terminal atau local dengan env Railway
npm run setup-db
```

### Langkah 4: Cek URL dan Port

- Pastikan aplikasi menggunakan port yang benar
- Railway akan otomatis set `PORT` environment variable
- Aplikasi sudah dikonfigurasi untuk menggunakan `process.env.PORT`

## 🔍 Debugging Steps

### Cek Logs di Railway:
1. Buka service `pkm_app_fixed`
2. Pergi ke tab **"Deploy Logs"** atau **"HTTP Logs"**
3. Cari error messages

### Common Errors:

#### Error: "Database connection failed"
- **Solusi**: Pastikan environment variables MySQL sudah di-set di service aplikasi

#### Error: "Port already in use"
- **Solusi**: Railway akan handle ini otomatis, pastikan menggunakan `process.env.PORT`

#### Error: "Session secret required"
- **Solusi**: Set `SESSION_SECRET` environment variable

## 📞 Quick Fix Commands

Jika masih bermasalah, coba:

```bash
# 1. Commit dan push ulang
git add .
git commit -m "Fix Railway deployment"
git push origin main

# 2. Set environment variables di Railway dashboard
# 3. Redeploy aplikasi
# 4. Test database connection
npm run setup-db
```

## ✅ Checklist Deployment

- [ ] Environment variables MySQL sudah di-set di service aplikasi
- [ ] `NODE_ENV=production` sudah di-set
- [ ] `SESSION_SECRET` sudah di-set
- [ ] Database sudah di-setup dengan `npm run setup-db`
- [ ] Aplikasi sudah di-redeploy
- [ ] Logs tidak menunjukkan error

## 🆘 Jika Masih Bermasalah

1. **Cek Railway Status**: https://status.railway.app
2. **Cek Logs**: Pastikan tidak ada error di deploy logs
3. **Test Database**: Pastikan MySQL service running dan accessible
4. **Contact Support**: Jika semua sudah benar tapi masih error
