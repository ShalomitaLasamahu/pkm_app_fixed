#!/usr/bin/env node

/**
 * Script untuk cek status aplikasi dan database
 */

require('dotenv').config();
const mysql = require('mysql2');

console.log("🔍 Checking Application Status...\n");

// Cek environment variables
console.log("📋 Environment Variables:");
console.log("NODE_ENV:", process.env.NODE_ENV || "not set");
console.log("PORT:", process.env.PORT || "not set");
console.log("SESSION_SECRET:", process.env.SESSION_SECRET ? "✅ set" : "❌ not set");
console.log("DB_HOST:", process.env.DB_HOST || process.env.MYSQL_HOST || "not set");
console.log("DB_USER:", process.env.DB_USER || process.env.MYSQL_USER || "not set");
console.log("DB_NAME:", process.env.DB_NAME || process.env.MYSQL_DATABASE || "not set");
console.log("DB_PORT:", process.env.DB_PORT || process.env.MYSQL_PORT || "not set");
console.log("DB_PASSWORD:", process.env.DB_PASSWORD || process.env.MYSQL_PASSWORD ? "✅ set" : "❌ not set");

console.log("\n🔗 Testing Database Connection...");

// Test database connection
const dbConfig = {
  host: process.env.DB_HOST || process.env.MYSQL_HOST || 'localhost',
  user: process.env.DB_USER || process.env.MYSQL_USER || 'root',
  password: process.env.DB_PASSWORD || process.env.MYSQL_PASSWORD || '',
  database: process.env.DB_NAME || process.env.MYSQL_DATABASE || 'pkm_app',
  port: process.env.DB_PORT || process.env.MYSQL_PORT || 3306
};

const connection = mysql.createConnection(dbConfig);

connection.connect((err) => {
  if (err) {
    console.error("❌ Database connection failed:", err.message);
    console.log("\n🔧 Troubleshooting:");
    console.log("1. Check if MySQL service is running in Railway");
    console.log("2. Verify environment variables are set correctly");
    console.log("3. Make sure database exists");
    process.exit(1);
  }
  
  console.log("✅ Database connection successful!");
  
  // Test tables
  const tables = ['users', 'mahasiswa', 'tasks', 'rekap_kehadiran'];
  let completed = 0;
  
  tables.forEach(table => {
    connection.query(`SELECT COUNT(*) as count FROM ${table}`, (err, result) => {
      if (err) {
        console.log(`❌ Table ${table}: ${err.message}`);
      } else {
        console.log(`✅ Table ${table}: ${result[0].count} records`);
      }
      
      completed++;
      if (completed === tables.length) {
        connection.end();
        console.log("\n🎉 Application status check completed!");
        console.log("If all checks pass, your app should be working!");
      }
    });
  });
});

connection.on('error', (err) => {
  console.error("❌ Database error:", err.message);
  process.exit(1);
});
