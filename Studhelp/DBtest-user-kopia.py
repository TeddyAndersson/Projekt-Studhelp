# coding=utf-8
from bottle import route, run, template, request, static_file
from os import listdir
import os
import sys
reload(sys)  # Reload does the trick!
sys.setdefaultencoding('UTF8')
import mysql.connector
 
cnx = mysql.connector.connect(user='root', database='DBStudhelp', password='123', host='localhost', charset= "utf8" )
cursor = cnx.cursor()

def get_category(category):
    #Läs: http://dev.mysql.com/doc/connector-python/en/connector-python-example-cursor-select.html
    sql_query="SELECT * FROM kategori WHERE Namn='" + category + "'"
    cursor.execute(sql_query)
    value = cursor.fetchall()
    return value

def get_subcat_list(category):
    sql_query="SELECT * FROM underkategori WHERE Kategorinamn='" + category + "'"
    cursor.execute(sql_query)
    value = cursor.fetchall()
    return value

def get_thread(key):
    sql_query="SELECT * FROM trådar WHERE ID='" + str(key) + "'"
    cursor.execute(sql_query)
    value = cursor.fetchall()
    return value

    

def get_subcat_threads(subcat):
    sql_query="SELECT * FROM trådar WHERE UnderkategoriNamn='" + subcat + "'"
    cursor.execute(sql_query)
    value = cursor.fetchall()
    return value

def get_subcat(subcat):
    sql_query="SELECT * FROM underkategori WHERE Namn='" + subcat + "'"
    cursor.execute(sql_query)
    value = cursor.fetchall()
    return value

def save_thread(subcat, name, text, category):  
    #Första försöket att hämta sidan
    #sql_query="INSERT INTO trådar (Rubrik, Beskrivning, UnderkategoriNamn) VALUES ('" + name + "','" + text + "','" + subcat + "')" 
    
    #Prova denna metod för att spara data till databasen ett klart exemple från Mysqls hemsidan
    #Exempel hittas här: http://dev.mysql.com/doc/connector-python/en/connector-python-example-cursor-transaction.html
    add_thread = ("INSERT INTO trådar "
               "(Namn, Beskrivning, UnderkategoriNamn, Kategorinamn) "
               "VALUES (%s, %s, %s, %s)")
    thread_data = (name, text, subcat, category)
    cursor.execute(add_thread, thread_data)
    var = cursor.lastrowid
    cnx.commit()
    
def save_user(username, password):
    insert_user = ("INSERT INTO användare "
               "(Namn, Lösenord) "
               "VALUES (%s, %s)")
    user_data = (username, password)
    cursor.execute(insert_user, user_data)
    cnx.commit()

def check_login(username, password):
    sql_query="SELECT * FROM användare WHERE Namn='" + username + "'"
    cursor.execute(sql_query)
    value = cursor.fetchall()
    
    user = [(username, password)]
    
    if user == value:
        
        return True
    else: 
        
        return False
        
    
    
    
'''--------------------------------Kod för Routes börjar här-----------------------------'''    

    
    
@route('/static/<filename>')
def send_static(filename):
    "Hanterar css filen"
    return static_file(filename, root='./static/') 
    

@route('/')
def index():
    return template('index')

@route('/<category>')
def generate_category_tpl(category):
    #Kategorins namn och beskrinving hämtas och skrivs ut av en for loop i tpl:en.
    category_name = get_category(category)
    subcat_name = get_subcat_list(category)
    return template('category', category_name=category_name, subcat_name=subcat_name)
    
@route('/<category>/<subcat>')
def generate_subcat_tpl(category, subcat):
    
    #När användaren klickar på en länk i menyn hämtas data från databasen, som sedan genereras ut i templaten
    #Alla trådar för <subcat> hämtas och skrivs ut genom en loop i tpl:en
    #Underkategorins namn och beskrinving hämtas och skrivs ut av en for loop i tpl:en.
    subcat_name = get_subcat(subcat)
    thread_name = get_subcat_threads(subcat)
    
    return template('subcategory', subcat_name=subcat_name, thread_name=thread_name)

@route('/<category>/<subcat>/create_thread')
def new_thread(category, subcat):
    #Användaren skickas till en sida där denne kan skapa en ny tråd
    
    return template('newthreadpage', category=category, subcat=subcat)

@route('/<category>/<subcat>/new_thread', method="POST")
def create_new_thread(category, subcat):
    #Data som har skrivits in formuläret skickas hit och plockas ut i två varibaler name och text
    name = request.forms.thread_name
    text = request.forms.thread_question
    thread_values = [('ID', name, text)]
    
    #Sedan skickas datan vidare till funktionen add_value
    #save_thread sparar datan i databasen tabellen trådar
    save_thread(subcat, name, text, category)
    return template('threadpage', thread_values=thread_values)

@route('/<category>/<subcat>/<thread>')
def generate_thread_tpl(category, subcat, thread):
    name = None
    text = None
    thread_values = get_thread(thread)

    
    return template('threadpage', thread_values=thread_values, name=name, text=text)

@route('/Medlem')
def generate_user_tpl():

    
    return template('newmember')


@route('/Medlem/New_Member', method='POST')
def add_user():
    username = request.forms.username
    password = request.forms.password
    #Lägg till email i databasen senare
    
    save_user(username, password)
    
    return template('memberregistrerad', password=password, username=username)

@route('/Login')
def login():
    Logged_in = False
    return template('userlogin', Logged_in=Logged_in)
@route('/Login', method="post")
def do_login():
    username = request.forms.username
    password = request.forms.password
    
    
    if check_login(username, password) == True:
        Logged_in = True
        return template('userlogin', Logged_in=Logged_in , username=username)
    else:
        Logged_in = False
        return template('userlogin', Logged_in=Logged_in)



    
run(host='localhost', port=8080, debug=True, reloader=True)