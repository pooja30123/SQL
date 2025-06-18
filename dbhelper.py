import mysql.connector
import sys

class Dbhelper:
    
    def __init__(self):
        try:
            self.conn = mysql.connector.connect(
                host="127.0.0.1",
                port=3306,
                user="root",
                password="Pooja@424",
                database="flipcart"
            )
            self.mycursor = self.conn.cursor()
        except:
            print("Error while connecting to MySQL")
            sys.exit(0)
        else:
            print("Connected to MySQL Database")

    def register(self,name,email,password):
        try:
            sql = "INSERT INTO users(ID, NAME, EMAIL, PASSWORD) VALUES (NULL, %s, %s, %s)";
            values = (name,email,password)
            self.mycursor.execute(sql,values)
            self.conn.commit()
            return 1
        except:
            return -1
        else:
            return 1
    
    def search(self,email,password):
        
        sql = "SELECT * FROM users WHERE email LIKE %s AND password LIKE %s";
        values = (email,password)
        self.mycursor.execute(sql,values)
        data = self.mycursor.fetchall()
        return data