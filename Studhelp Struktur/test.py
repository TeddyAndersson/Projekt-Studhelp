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
Matematik = {'Formler':'beskrivning', 'Linjar Algebra':'beskrivning', 'Endimensionell Analys':'beskrivning'}
Bygg = {'Test2':'beskrivning', 'Programmering':'beskrivning', 'Spelutveckling':'beskrivning'}
Ekonomi = {'Test3':'beskrivning', 'Programmering':'beskrivning', 'Spelutveckling':'beskrivning'}
Fysik = {'Test4':'beskrivning', 'Programmering':'beskrivning', 'Spelutveckling':'beskrivning'}
Ovrigt = {'Test5':'beskrivning', 'Programmering':'beskrivning', 'Spelutveckling':'beskrivning'}
Datavetenskap = {'Header1':['question1', 'user1'], 'Header2':['question2', 'user2'], 'Header3':['question3', 'user3']}
Programmering = {'Header1':['question1', 'user1'], 'Header2':['question2', 'user2'], 'Header3':['question3', 'user3']}
Spelutveckling = {'Header1':['question1', 'user1'], 'Header2':['question2', 'user2'], 'Header3':['question3', 'user3']}
M_Formler = {'Header1':['question1', 'user1'], 'Header2':['question2', 'user2'], 'Header3':['question3', 'user3']}
LinAlg = {'Header1':['question1', 'user1'], 'Header2':['question2', 'user2'], 'Header3':['question3', 'user3']}
Endim = {'Header1':['question1', 'user1'], 'Header2':['question2', 'user2'], 'Header3':['question3', 'user3']}

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
    "Genererar Templaten för underkategorier inom ämnet IT"
    "Anropar formulär datan från sidan för att skapa en ny tråd"
    key = pagename
    fel = None
    
    if key == 'Datavetenskap':
        value = IT.get(key, None)
        thread = Datavetenskap.keys()
        thread.sort()
        return template('subcat', header=key, content=value, thread=thread)
    if key == 'Programmering':
        value = IT.get(key, None)
        thread = Programmering.keys()
        thread.sort()
        return template('subcat', header=key, content=value, thread=thread)
    if key == 'Spelutveckling':
        value = IT.get(key, None)
        thread = Spelutveckling.keys()
        thread.sort()
        return template('subcat', header=key, content=value, thread=thread)

@route('/Matematik/<pagename>')
def list_subcategory(pagename):
    "Genererar Templaten för underkategorier inom ämnet: Matematik"
    "Anropar formulär datan från sidan för att skapa en ny tråd"
    key = pagename
    fel = None
    
    if key == 'Formler':
        value = Matematik.get(key, None)
        thread = M_Formler.keys()
        thread.sort()
        return template('subcat', header=key, content=value, thread=thread)
    
    if key == 'Linjar_algebra':
        value = Matematik.get(key, None)
        thread = LinAlg.keys()
        thread.sort()
        return template('subcat', header=key, content=value, thread=thread)
    
    if key == 'Endimensionell_Matematik':
        value = Matematik.get(key, None)
        thread = Endim.keys()
        thread.sort()
        return template('subcat', header=key, content=value, thread=thread)
    if key == 'Flerdimensionell_Matematik':
        value = Matematik.get(key, None)
        thread = Endim.keys()
        thread.sort()
        return template('subcat', header=key, content=value, thread=thread)
        
@route('/IT/Datavetenskap/Skapa-Ny', method="POST")
def update(pagename):
    thread_header = request.forms.nam
    question = request.forms.text
    Thread_DaVe.update({thread_header:[question, None]})
    return None     

#@route('/IT/Datavetenskap/<pagename>')
#def thread():
    

#get()

run(host='localhost', port=8080, debug=True, reloader=True)