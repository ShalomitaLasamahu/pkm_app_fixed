const mysql = require("mysql2");

// PAKAI INI - untuk Railway
const conn = mysql.createConnection(process.env.DATABASE_URL);

conn.connect((err) => {
  if (err) {
    console.error("❌ Database connection failed:", err.message);
    process.exit(1);
  }
  console.log("✅ Database connected...");
});

module.exports = conn;