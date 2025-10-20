require('dotenv').config();
const mysql = require("mysql2");

// Konfigurasi database untuk Railway (prioritaskan MYSQL_* variables)
const dbConfig = {
  host: process.env.MYSQL_HOST || process.env.DB_HOST || 'localhost',
  user: process.env.MYSQL_USER || process.env.DB_USER || 'root',
  password: process.env.MYSQL_PASSWORD || process.env.DB_PASSWORD || '',
  database: process.env.MYSQL_DATABASE || process.env.DB_NAME || 'pkm_app',
  port: process.env.MYSQL_PORT || process.env.DB_PORT || 3306,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
};

console.log("🔧 Database config:", {
  host: dbConfig.host,
  user: dbConfig.user,
  database: dbConfig.database,
  port: dbConfig.port
});

const pool = mysql.createPool(dbConfig);

// Test connection dengan retry logic
function testConnection(retries = 3) {
  pool.getConnection((err, connection) => {
    if (err) {
      console.error("❌ Database connection failed:", err.message);
      if (retries > 0) {
        console.log(`🔄 Retrying connection... (${retries} attempts left)`);
        setTimeout(() => testConnection(retries - 1), 5000);
      } else {
        console.error("❌ Max retries reached. Exiting...");
        process.exit(1);
      }
    } else {
      console.log("✅ Database connected successfully!");
      connection.release();
    }
  });
}

// Test connection
testConnection();

module.exports = pool;