<!doctype html>

<head>
  <meta charset="utf-8">

    <title>Studhelp - Ett forum för studenter</title>
    <meta name="description" content="Studhelp">
    <meta name="author" content="Grupp 6 - Studhelp">

    <link rel="stylesheet" href="/static/Mainstyle.css">
    <link rel="stylesheet" href="/static/Subjectpage-Style.css">  

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
        
        <div class="informationContainer">
            %for i in subcat_name:
                    <h2>{{ i[0] }}</h2>
                        <p>{{ i[1] }}</p>
            %end
        
        </div>
        
        
        <table>
            %if thread_name:
            <thead class="subcat_thead">
                <tr>
                    <th>
                        <p>Trådnamn</p>
                    </th>
                    
                    <th>
                        <p>Skapad av</p>
                    </th>
                    
                    <th>
                        <p>Datum Skapad</p>
                    </th>
                    
                    <th>
                        <p>Svar</p>
                    </th>
                </tr>
            </thead>
            
            <tbody class="subcat_tbody">

                %for i in thread_name:
                <tr>
                    <td class="cell_1">
                        <a href="/{{ i[4] }}/{{ i[3] }}/{{ i[0] }}">{{i[1]}}</a>
                    </td>
                    
                    <td class="cell_2">
                        <p>Användare:{{i[5]}}</p>
                    </td>
                    
                    <td class="cell_3">
                        <p>{{i[6]}}</p>
                    </td>
                    
                    <td class="cell_4">
                        <p> {{ i[7] }} </p>
                    </td>
                </tr>
                %end
            </tbody>
        
            %else:
                <thead>
                    <tr>
                        <th colspan="4">
                            <p>Trådar saknas</p>
                        </th>
                    </tr>
                </thead>
                <tbody>  
                    <tr>
                        <td colspan="4">
                            <p>Det finns inga trådar i denna underkategori, var först med att skapa en!</p>
                        </td>
                    </tr>
                
                </tbody>
            %end
    </section>
    
    <!-- INFORAMTION KONTAKT OCH SNABB LÄNKAR FÖR FORUMET !-->
    <footer>
    
    </footer>
</body>
</html>