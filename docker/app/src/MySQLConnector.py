import time
import mysql.connector
from PropertiesReader import PropertiesReader
class MySQLConnector:
    def __init__(self):
        pass
    def connect(self):
        prop = PropertiesReader()
        cnx = mysql.connector.connect(
            user=prop.get("DB", "user"),
            password=prop.get("DB", "password"),
            host=prop.get("DB", "host"),
            database=prop.get("DB", "database"),
        )
        return cnx

if __name__=="__main__":
    print("Waiting MySQL ...")
    while True:
        try:
            MySQLConnector().connect()
            break
        except mysql.connector.errors.InterfaceError as e:
            print(".")
            time.sleep(1)
    exit(0)