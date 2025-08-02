# Anything commented out is the CS50 version vs the sqlite3 version.
# from cs50 import SQL
import sqlite3


# db = SQL("sqlite:///dont-panic.db")

conn = sqlite3.connect("dont-panic.db")
db = conn.cursor() # Called cursor by convention using db to stay consistent with CS50
password = input("Enter a password: ")
db.execute(
    """
    UPDATE "users"
    SET "password" = ?
    WHERE "username" = 'admin';
    """,
    (password,)
)

conn.commit()
conn.close()