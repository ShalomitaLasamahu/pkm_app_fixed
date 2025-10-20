#!/usr/bin/env node

/**
 * Database Setup Script untuk Railway
 * Script ini akan membuat semua tabel yang diperlukan
 */

require('dotenv').config();
const mysql = require('mysql2');
const fs = require('fs');
const path = require('path');

// Konfigurasi database dengan fallback untuk Railway
const dbConfig = {
  host: process.env.DB_HOST || process.env.MYSQL_HOST || 'localhost',
  user: process.env.DB_USER || process.env.MYSQL_USER || 'root',
  password: process.env.DB_PASSWORD || process.env.MYSQL_PASSWORD || '',
  database: process.env.DB_NAME || process.env.MYSQL_DATABASE || 'pkm_app',
  port: process.env.DB_PORT || process.env.MYSQL_PORT || 3306,
  multipleStatements: true // Untuk menjalankan multiple SQL statements
};

console.log("🔧 Database Setup Configuration:");
console.log({
  host: dbConfig.host,
  user: dbConfig.user,
  database: dbConfig.database,
  port: dbConfig.port
});

// Buat koneksi database
const connection = mysql.createConnection(dbConfig);

// Baca file SQL
const sqlFile = path.join(__dirname, 'database_setup.sql');
const sqlContent = fs.readFileSync(sqlFile, 'utf8');

console.log("📖 Reading SQL file...");

// Jalankan setup database
connection.query(sqlContent, (err, results) => {
  if (err) {
    console.error("❌ Database setup failed:", err.message);
    process.exit(1);
  }
  
  console.log("✅ Database setup completed successfully!");
  console.log("📊 Tables created/updated:");
  console.log("  - users (login system)");
  console.log("  - mahasiswa (student data)");
  console.log("  - tasks (deadline management)");
  console.log("  - rekap_kehadiran (attendance tracking)");
  
  // Test koneksi dengan query sederhana
  connection.query("SELECT COUNT(*) as user_count FROM users", (err, result) => {
    if (err) {
      console.error("❌ Test query failed:", err.message);
    } else {
      console.log(`👥 Users in database: ${result[0].user_count}`);
    }
    
    connection.end();
    console.log("🔌 Database connection closed.");
    process.exit(0);
  });
});

// Handle connection errors
connection.on('error', (err) => {
  console.error("❌ Database connection error:", err.message);
  process.exit(1);
});
