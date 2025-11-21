import sqlite3
from pathlib import Path

db_path = Path(__file__).parent / "test.db"
print(f"Creating DB at: {db_path}")

# create DB
conn = sqlite3.connect(db_path)
cur = conn.cursor()

cur.execute("""
CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT NOT NULL
);
""")

cur.execute("""
INSERT INTO users (name, email) VALUES
('standard_user', 'standard_user@example.com'),
('locked_out_user', 'locked_out@example.com');
""")

conn.commit()
conn.close()

print("Database created successfully!")
