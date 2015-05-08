<!doctype html>

<head>
  <meta charset="utf-8">

  <title>Studhelp - Ett forum för studenter</title>
  <meta name="description" content="Studhelp">
  <meta name="author" content="Grupp 6 - Studhelp">

  <link rel="stylesheet" href="/static/Mainstyle.css">

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
            
            <h2>Välkommen till Forumet StudHelp</h2>
            <p>StudHelp är ett webbaserat forum där användaren ska kunna få hjälp med uppgifter och problem relaterade till skolan.
			Vi upplever att många studenter idag hjälper varandra med olika saker genom att diskutera och dela information kring ett 
			visst problem eller ämne. Detta för att få bättre förståelse om ett visst problem eller ämne och för att klara av sina studier.
			StudHelp ska underlätta situationen för många studenter på Malmö Högskola inom fakulteten för teknik och samhälle.</p>
        
        </div>
        
        <div class="subject-container">
            
            <div class="subjectBox">
                <h2><a href="/Programmering">Programmering</a></h2>
                <div class="borderSurround">
                    <ul>
                        <li><a href="/Programmering/Java"> Java</a></li>
                        <li><a href="/Programmering/SQL"> SQL</a></li>
                        <li><a href="/Programmering/C++"> C++</a></li>
						<li><a href="/Programmering/Python"> Python</a></li>
						<li><a href="/Programmering/PHP"> PHP</a></li>
                    </ul>
                </div>
            </div>
            
            <div class="subjectBox">
                <h2>Webbutveckling</h2>
                <div class="borderSurround">
                    <ul>
                        <li><a href="/Webbutveckling/HTML"> HTML</a></li>
                        <li><a href="/Webbutveckling/CSS"> CSS</a></li>
                        <li><a href="/Webbutveckling/JavaScript"> JavaScript</a></li>
                    </ul>
                </div>
            </div>
            
            <div class="subjectBox">
                <h2>Teori</h2>
                <div class="borderSurround">
                    <ul>
                        <li><a href="/Teori/Interaktionsdesign"> Interaktionsdesign</a></li>
                        <li><a href="/Teori/Infomrationsarkitektur"> Informationsarkitektur</a></li>
                        <li><a href="/Teori/Datavetenskap"> Datavetenskap</a></li>
                        <li><a href="/Teori/Informationssäkerhet"> Informationssäkerhet</a></li>
						<li><a href="/Teori/Användbarhet"> Användbarhet</a></li>
						<li><a href="/Teori/Datastruktur och Algoritmer"> Datastruktur & Algoritmer</a></li>
                    </ul>
                </div>
            </div>
            
            <div class="subjectBox">
                <h2>Spelutveckling</h2>
                <div class="borderSurround">
                    <ul>
                        <li><a href="/Spelutveckling/Speldesign"> Speldesign</a></li>
						<li><a href="/Spelutveckling/Modellering"> Modellering</a></li>
						<li><a href="/Spelutveckling/Datorgrafik"> Datorgrafik</a></li>
                    </ul>
                </div>
            </div>
            
            <div class="subjectBox">
                <h2>Övrigt</h2>
                <div class="borderSurround">
                    <ul>
                        <li><a href="/Övrigt/Uppsatser"> Uppsatser</a></li>
                        <li><a href="/Övrigt/Tentafrågor"> Tentafrågor</a></li>
                    </ul>
                </div>
            </div>
            
            <div class="subjectBox">
                <h2>Konto</h2>
                <div class="borderSurround">
                    <ul>
                        <li><a href="/Medlem"> Bli medlem</a></li>
                        <li><a href="/Login"> Logga in</a></li>
                    </ul>
                </div>
            </div>
            
        </div>
        
    </section>
    
    <!-- INFORMATION KONTAKT OCH SNABB LÄNKAR FÖR FORUMET !-->
    <footer>
    
    </footer>
</body>
</html>