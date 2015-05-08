# coding=utf-8
# Skapare: Teddy Andersson och Sebastian Jerre.
from bottle import route, run, template, request, response, static_file, redirect
from db import * 
from operator import itemgetter, attrgetter, methodcaller
    
'''--------------------------------Kod för Routes börjar här-----------------------------'''    
@route('/static/<filename>')
def send_static(filename):
    "Hanterar css filen"
    return static_file(filename, root='./static/') 
    

@route('/')
def index():
    #Visar templaten index som är första sidan
    return our_template('index')

@route('/<category>')
def generate_category_tpl(category):
    
    #Kategorinamn, kategoribeskrinving och underkategorinamn hämtas från databasen i funktionerna get_category och get_subcat. 
    category_name = get_category(category)
    subcat_name = get_subcat_list(category)
    
    #Sedan returneraras category_name och subcat_name till tpl:en med rätt värden
    return our_template('category', category_name=category_name, subcat_name=subcat_name)
    
@route('/<category>/<subcat>')
def generate_subcat_tpl(category, subcat):
    #När användaren klickar på en länk i menyn hämtas data från databasen, som sedan genereras ut i templaten.
    #Alla trådar för <subcat> hämtas och returneras till tpl:en subcategory.
    #Underkategorins namn och beskrivning hämtas och returneras till tpl:en subcategory.
    subcat_name = get_subcat(subcat)
    thread_name = get_subcat_threads(subcat)
    
    sorted_threads = sorted(thread_name, key=itemgetter(6), reverse=True)
        
    return our_template('subcategory', subcat_name=subcat_name, thread_name=sorted_threads, category=category, subcat=subcat)

@route('/<category>/<subcat>/create_thread')
def new_thread(category, subcat):
    #Användaren skickas till en sida där denne kan skapa en ny tråd
    return our_template('newthreadpage', category=category, subcat=subcat)

@route('/<category>/<subcat>/new_thread', method="POST")
#Funktion för att skapa ny tråd.
def create_new_thread(category, subcat):
    # cookie som innehåller användarnamnet hämtas
    username = request.get_cookie("username")
    
    #Trådnamn(name) och trådfråga(text) tas emot från formuläret.
    name = request.forms.thread_name
    text = request.forms.thread_question
    
    
    #save_thread sparar datan från formuläret i databasen inuti tabellen trådar.
    thread = save_thread(subcat, name, text, category, username)
    
    #Användaren omdirigerad till sidan för den skapade tråden.
    redirect('/' + category + '/' + subcat + '/' + str(thread))

@route('/<category>/<subcat>/<thread>')
#Funktion för att generera tråd template
def generate_thread_tpl(category, subcat, thread):
    
    #Inlägg för ett specifikt trådID hämtas från databasen
    posts = get_posts(thread)
    
    #trådnamnet med rätt trådID hämtas från databasen.
    thread_values = get_thread(thread)

    #trådnamn, inlägg, kategorinamn, underkategorinamn och trådID returneras till tpl:en threadpage.
    return our_template('threadpage', thread_values=thread_values, category=category, subcat=subcat, thread=thread, posts=posts)

@route('/<category>/<subcat>/<thread>', method='post')
#Funktion för att skapa ett nytt inlägg.
def new_post(category, subcat, thread):
    #Hämtar en cookie med användarnamnet för den som är inloggad.
    username = request.get_cookie("username")
    
    #Tar emot inälgget som användaren har skrivit.
    post = request.forms.post
    
    #användarnamnet, trådID och inlägget skickas till funktionen save_thread som sparar datan i databasen.
    save_post(post,thread, username)
 
    #Hämtar information om tråden
    thread_values = get_thread(thread)
    
    #Hämtar alla inlägg för en tråd.
    posts = get_posts(thread)
    
    #Kategorinamn, trådvärde, underkategori, trådID och inlägg returneras till tpl:en threadpage
    return our_template('threadpage', category=category, thread_values=thread_values, subcat=subcat, thread=thread, posts=posts)

@route('/Medlem')
#Funktion för att generera bli medlemssidan.
def generate_user_tpl():
    new_user = None
    return our_template('newmember', new_user=new_user)


@route('/Medlem/New_Member', method='POST')
#Funktion för att lägga till användare
def add_user():
    
    #Hämtar användarnamnet som skrivits in i fromuläret
    new_user = request.forms.username
    
    #Hämtar lösenordet som skrivits in i formuläret
    password = request.forms.password
    
    password2 = request.forms.password2
    #--Lägg till email i databasen senare
    if password == password2:
    #Skickar värdena för användarnamn och lösenord till funktionen save_user()
        save_user(new_user, password)
    
    #användarnamnet returneras till tpl:en memberregistrerad.
        return our_template('memberregistrerad', new_user=new_user)
    else:
        new_user = False
        return our_template('newmember', new_user=new_user)

@route('/Login')
#Funktion för att visa login template
def login():
    return our_template('userlogin')

@route('/Login', method="post")
#funktion för att kolla om användaren finns i databasen
def do_login():
    
    #Tar emot användarnamnet från formuläret.
    username = request.forms.username
    
    #Tar emot lösenordet från formuläret
    password = request.forms.password
    
    
    #Kollar om användarnamn och tillhörande lösenord finns i databasen
    if check_login(username, password) == True:
        
        #Om de har tagits emot så skapas en cookie med användarnamnet
        response.set_cookie('username', username)
        
        #sedan returneras tpl:en userlogin
        return template('userlogin', username=username)
    
    #Om användaren har glömt att skriva in lösenord, användarnamn eller skrivit någon av dessa fel:
    elif check_login(username, password) == False:
        username = False
        return template('userlogin', username=username)
    else:
        username = None
        
        #Så returneras userlogin och användaren får försöka logga in igen.
        return template('userlogin', username=username)
    
@route('/Logout')
#Utlognings funktion
def logout():
    #Hämtar cookie med användarens namn.
    cookie = request.get_cookie("username")
    
    #Ändrar cookie så att den är utgången.( username = None )
    username = response.set_cookie("username", cookie, expires=0)
    
    #Returnerar användarenamnet och tpl:en index.
    return template('index', username=username)
    
#Funktion som hämtar cookie med användarnamnet i och tar emot argument från olika routes.
def our_template(template_name, **kwargs):
    
    #Hämtar cookie med användarnamn
    username = request.get_cookie("username")
    
    #användarnamn och de argument som skickats med till funktionen returneras till den tpl som skickats med i template_name.
    return template(template_name,  username=username, **kwargs)



#Kör bottle på localhost med porten 8080.
run(host='localhost', port=8080, debug=True, reloader=True)