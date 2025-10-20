require('dotenv').config();
const mysql = require("mysql2");

// Konfigurasi database dengan fallback untuk Railway
const dbConfig = {
  host: process.env.DB_HOST || process.env.MYSQL_HOST || 'localhost',
  user: process.env.DB_USER || process.env.MYSQL_USER || 'root',
  password: process.env.DB_PASSWORD || process.env.MYSQL_PASSWORD || '',
  database: process.env.DB_NAME || process.env.MYSQL_DATABASE || 'pkm_app',
  port: process.env.DB_PORT || process.env.MYSQL_PORT || 3306,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
  acquireTimeout: 60000,
  timeout: 60000,
  reconnect: true
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