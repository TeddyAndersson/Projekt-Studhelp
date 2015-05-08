<!doctype html>

<head>
  <meta charset="utf-8">

    <title>Studhelp - Ett forum för studenter</title>
    <meta name="description" content="Studhelp">
    <meta name="author" content="Grupp 6 - Studhelp">

    <link rel="stylesheet" href="Mainstyle.css">
    <link rel="stylesheet" href="Subjectpage-Style.css">  

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
                <li><a href="/IT">IT</a>
					<ul>
						<li><a href="/IT/Datavetenskap">Datavetenskap</a></li>
						<li><a href="/IT/Programmering">Programmering</a></li>
						<li><a href="/IT/Spelutveckling">Spelutveckling</a></li>
					</ul>
				</li>
                <li><a href="/Matematik">Matematik</a>
					<ul>
						<li><a href="/Matematik/Formler">Formler</a></li>
						<li><a href="/Matematik/Linjar_algebra">Linjär algebra</a></li>
						<li><a href="/Matematik/Endimensionell Matematik">Endimensionell Matematik</a></li>
						<li><a href="/Matematik/Flerdimensionell Matematik">Flerdimensionell Matematik</a></li>
					</ul>
				</li>
                <li><a href=/Ekonomi>Ekonomi</a>
					<ul>
						<li><a href="/Ekonomi/Marknadsföring">Marknadsföring</a></li>
						<li><a href="/Ekonomi/Ekonomistyrning">Ekonomistyrning</a></li>
						<li><a href="/Ekonomi/Bokförning&Bokslut ">Bokföring/Bokslut</a></li>
						<li><a href="/Ekonomi/Organisation&Ledarskap">Organisation & ledarskap</a></li>
					</ul>
				</li>
                <li><a href=/Fysik>Fysik</a>
					<ul>
						<li><a href="/Fysik/Lagar">Lagar</a></li>
						<li><a href="/Fysik/Formler">Formler</a></li>
                        
					</ul>
				</li>
                <li><a href=/Bygg>Bygg</a>
					<ul>
						<li><a href="/Bygg/Konstruktion">Konstruktion</a></li>
						<li><a href="/Bygg/Arkitektur">Arkitektur</a></li>
					</ul>
				</li>
                <li><a href=/Ovrigt>Övrigt</a>
					<ul>
						<li><a href="/Ovrigt/Uppsatser">Uppsatser</a></li>
						<li><a href="/Ovrigt/Tentafrågor">Tentafrågor</a></li>
					</ul>
				</li>
                <li><a href=#Objekt>Bli medlem</a></li>
                <li><a href=#Objekt>Login</a></li>
            </ul> 
        </nav>
      
    </header>
    
    <!-- HUVUDINNEHÅLL PÅ SIDAN !-->
    <section>
        
        <div class="informationContainer">
            
            % if header and content:
                    <h2>{{ header }}</h2>
                        <p>{{ content }}</p>
                % else:
                    <p>
                        ...Något gick fel, existerar filen?
                    </p>
                % end
        
        </div>
        
        <table>
                    
            <thead>
                        
                 <tr>
                    <th>Kategorier inom {{ header }}</th>
                </tr>
                
            </thead>
            
                 
            <tbody>
                %if fel == 1:
                    <p>{{ sub }}</p>
                %else:
                    %for keys in sub:   
                    <tr>
                        <td>
                         
                            <a href="/subcategory/{{keys}}">{{keys}}</a>
                        
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