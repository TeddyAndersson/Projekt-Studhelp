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
            
            %for c in category_name:
                <h2>{{ c[0] }}</h2>
                <p>{{ c[1] }}</p>
        </div>
        
        <table>
                    
            <thead>
                        
                 <tr>
                    <th>Kategorier inom {{ c[0] }}</th>
                </tr>
                %end
            </thead>

            
            <tbody>
              
                    %for s in subcat_name:
                    <tr>
                        <td>
                         
                            <a href="/{{ s[2] }}/{{ s[0] }}">{{ s[0] }}</a>
                            <p>Antal trådar: {{ s[3]}}</p>

                        </td> 
                    </tr>
                    %end
            </tbody> 
                    
        </table>
        
    </section>
    
    <!-- INFORAMTION KONTAKT OCH SNABB LÄNKAR FÖR FORUMET !-->
    <footer>
    
    </footer>
</body>
</html>