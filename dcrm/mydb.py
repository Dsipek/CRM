import mysql.connector

dataBase = mysql.connector.connect(
    host = 'localhost',
    user = 'root',
    passwd = 'django123',
)

# preparing a cursor object
cursorObject = dataBase.cursor()

# creatign a database
cursorObject.execute("CREATE DATABASE crmdb")

print("All done!")