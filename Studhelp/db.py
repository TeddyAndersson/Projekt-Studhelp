# coding=utf-8
# Skapare: Teddy Andersson och Sebastian Jerre.
import mysql.connector
import datetime
 
cnx = mysql.connector.connect(user='root', database='DBStudhelp', password='123', host='localhost', charset= "utf8" )
cursor = cnx.cursor()

#Funktion som hämtar data från tabellen kategori
def get_category(category):
    try:
        #Frågar efter en kategori
        sql_query="SELECT * FROM kategori WHERE Namn='" + category + "'"
        cursor.execute(sql_query)
        value = cursor.fetchall()
    except:
        value = [('Felmeddelande', 'Någonting gick fel när information skulle hämtas från databasen. Prova att kolla din internet       uppkoppling ')]
    
    return value

#Funktion som hämtar data från tabellen underkategori
def get_subcat_list(category):
    
    #Frågar efter alla underkategorier för en specifik kategori
    sql_query="select underkategori.Namn, underkategori.Beskrivning, underkategori.Kategorinamn, COUNT( trådar.UnderkategoriNamn) as Antal_trådar FROM underkategori left JOIN trådar ON trådar.UnderkategoriNamn = underkategori.Namn WHERE underkategori.Kategorinamn='" + category +"' GROUP BY underkategori.Namn"
    cursor.execute(sql_query)
    value = cursor.fetchall()
    return value

#Hämtar en tråd
def get_thread(key):
    
    #Frågar efter alla trådar med ett specifkt id
    sql_query="SELECT * FROM trådar WHERE ID='" + str(key) + "'"
    cursor.execute(sql_query)
    value = cursor.fetchall()
    return value

#Hämtar alla inlägg i en tråd
def get_posts(thread):
    
    #Frågar efter alla inlägg som har samma trådID
    sql_query="SELECT * FROM inlägg WHERE TrådID=" + str(thread)
    cursor.execute(sql_query)
    value = cursor.fetchall()
    return value

#Hämtar alla trådar för en underkategori
def get_subcat_threads(subcat):
    
    #Frågar efter alla trådar som har samma underkategori
    #sql_query="SELECT * FROM trådar WHERE UnderkategoriNamn='" + subcat + "'"
    sql_query = "select trådar.ID, trådar.Namn, trådar.Beskrivning, trådar.UnderkategoriNamn, trådar.Kategorinamn, trådar.Användare, trådar.Datum, COUNT(inlägg.ID) as Antal_Inlägg FROM trådar LEFT JOIN inlägg ON inlägg.TrådID = trådar.ID WHERE UnderkategoriNamn='" + subcat + "' GROUP BY trådar.ID"
    cursor.execute(sql_query)
    value = cursor.fetchall()
    return value


#Hämtar en underkategori
def get_subcat(subcat):
    
    #Frågar efter en underkategori
    sql_query="SELECT * FROM underkategori WHERE Namn='" + subcat + "'"
    cursor.execute(sql_query)
    value = cursor.fetchall()
    return value


def save_thread(subcat, name, text, category, username):  
    
    #Sparar datumet då tråden är skapad i en variabel.
    Date_Now = datetime.datetime.now()
    
    #Sparar en tråd    
    #Skickar informationen för en tråd till databasen som lägger till den i tabellen trådar. 
    add_thread = ("INSERT INTO trådar "
               "(Namn, Beskrivning, UnderkategoriNamn, Kategorinamn, användare, Datum) "
               "VALUES (%s, %s, %s, %s, %s, %s)")
    thread_data = (name, text, subcat, category, username, Date_Now)
    cursor.execute(add_thread, thread_data)
    
    #hämtar ut tråd id:et för tråden som sparats
    var = cursor.lastrowid
    cnx.commit()
    return var
    
def save_post(post, thread, username):
    
    Date_Now = datetime.datetime.now()
    
    #skickar inläggs infomration till databasen 
    #Datum ska också skickas med men behövs fixas först.
    add_post = ("INSERT INTO inlägg "
               "(Beskrivning, Datum, TrådID, användare) "
               "VALUES (%s, %s, %s, %s)")
    post_data = (post, Date_Now, thread, username)
    cursor.execute(add_post, post_data)
    var = cursor.lastrowid
    cnx.commit()
    
    
    
def save_user(username, password):
    #Sparar användare med tillhörande lösenord i databasen genom en SQL query.
    insert_user = ("INSERT INTO user "
               "(Namn, Lösenord) "
               "VALUES (%s, %s)")
    user_data = (username, password)
    cursor.execute(insert_user, user_data)
    cnx.commit()
    
def check_login(username, password):
    #Kollar ifall användarnamn och lösenord hör ihop.
    sql_query ="SELECT * FROM user WHERE Namn='" + username + "'"
    cursor.execute(sql_query)
    value = cursor.fetchall()
    
    user = [(username, password)]
    
    if user == value:
        #Hör de ihop returnerar funktionen TRUE.
        return True
    
    else: 
        #Om de inte hör ihop returneras FALSE.
        return False

def get_all_posts():
    post_count = "select TrådID from inlägg"
    cursor.execute(post_count)
    value = cursor.fetchall()
    
    return value

    