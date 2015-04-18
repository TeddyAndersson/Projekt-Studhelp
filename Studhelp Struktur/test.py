#coding: utf-8
# Author: <Teddy Andersson, Sebastian Jerre>
# -*- coding: utf-8 -*-
from bottle import route, run, template, request, static_file
from os import listdir
import os
import sys
reload(sys)  # Reload does the trick!
sys.setdefaultencoding('UTF8')
#import mysql.connector

#cnx = mysql.connector.connect(user='AE5701', database='ae5701', password='studhelp', host='195.178.232.16')
#cursor = cnx.cursor()
#query_Cat = "SELECT kategorinamn, beskrivning FROM kategori"
#cursor.execute(query_Cat)

d_sub = {'IT':'beskrivning','Matematik':'beskrivning','Fysik':'beskrivning', 'Bygg':'beskrivning', 'Ekonomi':'beskrivning', 'Ovrigt':'beskrivning'}
IT = {'Datavetenskap':'beskrivning', 'Programmering':'beskrivning', 'Spelutveckling':'beskrivning'}
Matematik = {'Test1':'beskrivning', 'Programmering':'beskrivning', 'Spelutveckling':'beskrivning'}
Bygg = {'Test2':'beskrivning', 'Programmering':'beskrivning', 'Spelutveckling':'beskrivning'}
Ekonomi = {'Test3':'beskrivning', 'Programmering':'beskrivning', 'Spelutveckling':'beskrivning'}
Fysik = {'Test4':'beskrivning', 'Programmering':'beskrivning', 'Spelutveckling':'beskrivning'}
Ovrigt = {'Test5':'beskrivning', 'Programmering':'beskrivning', 'Spelutveckling':'beskrivning'}
Thread_DaVe = {'Header':['question', 'user']}

'''def get():
    "Hämtar databasvärderna och sätter in dem i ett lexikon"
    results = cursor.fetchall()
    global d
    for row in results:
        category = str(row[0])
        content = str(row[1])
        d.update({category: content})'''


@route('/')
def index():
    return template('index')    

@route('/<pagename>')
def category(pagename):
    key = pagename
    fel = None
    value = d_sub.get(key, None)
    if key == 'IT':
        sub = IT.keys()
        return template('subject', header=key, content=value, sub=sub, fel=fel)
    if key == 'Matematik':
        sub = Matematik.keys()
        return template('subject', header=key, content=value, sub=sub, fel=fel)
    if key == 'Bygg':
        sub = Bygg.keys()
        return template('subject', header=key, content=value, sub=sub, fel=fel)
    if key == 'Ekonomi':
        sub = Ekonomi.keys()
        return template('subject', header=key, content=value, sub=sub, fel=fel)
    if key == 'Fysik':
        sub = Fysik.keys()
        return template('subject', header=key, content=value, sub=sub, fel=fel)
    if key == 'Ovrigt':
        sub = Ovrigt.keys()
        return template('subject', header=key, content=value, sub=sub, fel=fel)
    else:
        fel = 1
        sub = "Fel"
        return template('subject', header=key, content=value, sub=sub, fel=fel)


@route('/IT/<pagename>')
def list_subcategory(pagename):
    key = pagename
    fel = None
    if key == 'Datavetenskap':
        value = IT.get(key, None)
        return template('subcat', header=key, content=value)
    if key == 'Programmering':
        value = IT.get(key, None)
        return template('subcat', header=key, content=value)
    if key == 'Spelutvecklnig':
        value = IT.get(key, None)
        return template('subcat', header=key, content=value)
        
@route('/update/', method="POST")
def update():
    '''To-do lägg till en user input i formet'''
    thread_header = request.forms.name
    question = request.forms.text
    user = none
    Thread_DaVe.update({thread_header:[question, user]})
    return template('thread', thread_header=thread_header)       

@route('/IT/Datavetenskap/<pagename>')
def thread()


#get()

run(host='localhost', port=8080, debug=True, reloader=True)