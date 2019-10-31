hostname = '127.0.0.1'
username = 'root'
password = ''
database = 'hr'

def doQuery( conn ) :
    cur = conn.cursor()

    cur.execute( "SELECT * FROM jobs" )

    for x in cur.fetchall() :
        print(x)

import mysql.connector
myConnection = mysql.connector.connect( host=hostname, user=username, passwd=password, db=database )
doQuery( myConnection )
myConnection.close()
