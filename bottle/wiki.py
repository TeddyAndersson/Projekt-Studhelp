# coding: utf-8
# Author: <Teddy Andersson>
# -*- coding: utf-8 -*-
 
from bottle import route, run, template, request, static_file
from os import listdir
import os
# Static Routes
@route('/static/<filename>')
def send_static(filename):
    "Hanterar css filen"
    return static_file(filename, root='./static/')

@route('/')
def index():
    ''' Kör index templaten som visar första sidan '''
    return template('index')

@route("/list/")
def list_articles():
    ''' hämtar alla filer i mappen '.../Wiki/' och smalar dem i en lista som sorteras alfabetiskt. Sedan tas filändelsen bort (.txt) så att bara filnamnet återstår när listan sedan skall skrivas ut i templaten. '''  
    files = os.listdir('Wiki')
    files.sort()
    articles = [os.path.splitext(x)[0] for x in files]
                          
    return template('list', articles=articles)
 
@route('/Wiki/<pagename>/')
def show_article(pagename):
    """Visar en artikel som laddas från en text fil i mappen '.../Wiki/'."""
    
    f = open('Wiki/' + pagename + '.txt', 'r')
    article = f.read()
    return template('show_article', article=article, pagename=pagename )
    
 
@route('/edit/')
def edit_form():
    '''Visar ett formulär där man kan lägga till en fil '''
    return template('edit')
 
@route('/update_edit/', method="POST")
def update_article():
    '''Hämtar fomrulär data som skrevs in i routen /edit/ för att sedan öppna mappen '.../Wiki/' och spara innehållet i en text fil. '''
    name = request.forms.name
    text = request.forms.text
    f = open('wiki/' + name + '.txt', 'w')
    f.write(text)
    f.close
    return template('edit_result', name=name, text=text)
 
@route('/remove_article/')
def remove_form():
    ''' Tar bort en artikel ur wiki '''
    files = os.listdir('Wiki')
    files.sort()
    articles = [os.path.splitext(x)[0] for x in files]
            
    return template('remove', articles=articles)

@route('/update_remove/', method="POST")
def remove_article():
    ''' Hämtar fomrulär data som skrevs in i routen /remove_article/ och tar sedan bort filen från mappen .../Wiki/ '''
    name = request.forms.name
    filename = name + '.txt'
    os.remove('Wiki/' + filename)
    
    return template('remove_update', filename=filename)


    
run(host='localhost', port=8080, debug=True, reloader=True)
