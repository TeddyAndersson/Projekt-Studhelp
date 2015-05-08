<!doctype html>

<head>
  <meta charset="utf-8">

    <title>Studhelp - Ett forum för studenter</title>
    <meta name="description" content="Studhelp">
    <meta name="author" content="Grupp 6 - Studhelp">

    <link rel="stylesheet" href="/static/Mainstyle.css">
    <link rel="stylesheet" href="/static/Subjectpage-Style.css">
	<link rel="stylesheet" href="/static/Linepage-Style.css">

  <!--[if lt IE 9]>
  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
</head>

<body>
    
    <!-- NAVIGATION FÖR HEMSIDAN SAMT LOGA !-->
    <header>
        
        <nav>
            <div id="logo"><a href="/">STUDHELP</a></div>
            
            <ul>
                <li><a href="/Programmering">Programmering</a>
					<ul>
						<li><a href="/Programmering/Java">Java</a></li>
						<li><a href="/Programmering/SQL">SQL</a></li>
						<li><a href="/Programmering/C++">C++</a></li>
						<li><a href="/Programmering/Python">Python</a></li>
						<li><a href="/Programmering/PHP">PHP</a></li>
					</ul>
				</li>
                <li><a href="/Webbutveckling">Webbutveckling</a>
					<ul>
						<li><a href="/Webbutveckling/HTML">HTML</a></li>
						<li><a href="/Webbutveckling/CSS">CSS</a></li>
						<li><a href="/Webbutveckling/JavaScript">JavaScript</a></li>
						
					</ul>
				</li>
                <li><a href=/Teori>Teori</a>
					<ul>
						<li><a href="/Teori/Interaktionsdesign">Interaktionsdesign</a></li>
						<li><a href="/Teori/Informationsarkitektur">Informationsarkitektur</a></li>
						<li><a href="/Teori/Datavetenskap">Datavetenskap</a></li>
						<li><a href="/Teori/Informationssäkerhet">Informationssäkerhet</a></li>
						<li><a href="/Teori/Användbarhet">Användbarhet</a></li>
						<li><a href="/Teori/Datastruktur och Algoritmer">Datastruktur och Algoritmer</a></li>
					</ul>
				</li>
                  <li><a href="/Spelutveckling">Spelutveckling</a>
					<ul>
						<li><a href="/Spelutveckling/Speldesign">Speldesign</a></li>
						<li><a href="/Spelutveckling/Modellering">Modellering</a></li>
						<li><a href="/Spelutveckling/Datorgrafik">Datorgrafik</a></li>
                        
					</ul>
				</li>
                <li><a href="/Övrigt">Övrigt</a>
					<ul>
						<li><a href="/Övrigt/Uppsatser">Uppsatser</a></li>
						<li><a href="/Övrigt/Tentafrågor">Tentafrågor</a></li>
					</ul>
				</li>
                <li><p>|</p></li>
                 %if username == None:
                    <li><a href="/Medlem">Bli medlem</a></li>
                    <li><a href="/Login">Login</a></li>
                    
               %else:
                    <li class="nohover">{{username}}</li>
                    <li><a href="/Logout">Logout</a></li>
               %end
            </ul> 
        </nav>
      
    </header>
    
    <!-- HUVUDINNEHÅLL PÅ SIDAN !-->
    <section>
    
        <table>
            <thead>
                <tr>
                    %for i in thread_values:
                    <th colspan="2" class="thread_table">
                        <p>{{ i[1] }}</p>
                        <p class="created">Skapad av: {{i[5]}}</p>
                    </th>
                    %end
                    
                </tr>
            </thead>
            
            <tbody>
    
                <tr>
                    %for i in thread_values:
                    <td colspan="2" class="threadQ">
                        <p>{{ i[2] }}</p>
                    </td>
                    %end
                </tr>
                
                <tr>
                    <th colspan="2" class="posts">
                        <p>Inlägg i tråden visas nedanför</p>
                    </th>
                </tr>
                %if posts:
                %for p in posts:
                <tr>

                            <td class="user">
                                %if p[4] == None:
                                <p>Guest</p>
                                %else:
                                <p>{{p[4]}}</p>
                                %end
                            </td>

                            <td class="content">
                                <p>{{p[1]}}</p>
                                <p>Inlägg Skapat: {{p[2]}}</p>
                            </td>
                    
                        
                    
                </tr>
                %end
                %else:
                    <tr>
                        <td colspan="2" class="threadQ">
                            <p>Det finns inga inlägg i denna tråd, var först med att skriva ett!</p>
                        </td>
                    </tr>
                %end
            </tbody>
        </table>
        
        <div class="answerbox"> 
            <form action="/{{category}}/{{subcat}}/{{thread}}" method="post">
                <textarea rows="6" cols="95" name="post" placeholder="Skriv ett inlägg..."></textarea>
                <input type="submit" value="SKICKA" id="button">
            </form>
        </div>
        
		
        
    </section>
    
    <!-- INFORAMTION KONTAKT OCH SNABB LÄNKAR FÖR FORUMET !-->
    <footer>
    
    </footer>
</body>
</html>