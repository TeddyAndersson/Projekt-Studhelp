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
                <li><a href="/Medlem">Bli medlem</a></li>
                <li><a href="/Login">Login</a></li>
            </ul> 
        </nav>
      
    </header>
    
    <!-- HUVUDINNEHÅLL PÅ SIDAN !-->
    <section>
        
        <div class="line-container">
            
            <div class="newmemberHead">
                <h2>Skapa ett konto</h2>
            </div>
			
			<div class="newMember">
                %if new_user == None:
					<form action="/Medlem/New_Member" method="POST">
                        
                        <label for="uname">Användarnamn</label>
						<input type="text" name="username" id="uname" placeholder="Skriv ett användarnamn">
                        
                        <label for="pass">Lösenord</label>
						<input type="password" name="password" id="pass" placeholder="Skriv ett lösenord">
                        
                        <label for="pass">Upprepa lösenord</label>
						<input type="password" name="password2" id="pass2" placeholder="Upprepa lösenord">
						
                        <label for="email">E-mail</label>
                        <input type="email" name="email" id="email" placeholder="Skriv din e-mail">
                        
                        <label class="btn_fix"></label>
				        <input type="submit" value="Registrera" id="skapa" class="submit_btn">
                        
					</form>
                %elif new_user == False:
                    <form action="/Medlem/New_Member" method="POST">
                        
                        <label for="uname">Användarnamn</label>
						<input type="text" name="username" id="uname" placeholder="Skriv ett användarnamn">
                        
                        <label for="pass">Lösenord</label>
						<input type="password" name="password" id="pass" placeholder="Skriv ett lösenord">
                        
                        <label for="pass">Upprepa lösenord</label>
						<input type="password" name="password2" id="pass2" placeholder="Upprepa lösenord">
						
                        <label for="email">E-mail</label>
                        <input type="email" name="email" id="email" placeholder="Skriv din e-mail">
                        
                        <label class="btn_fix"></label>
				        <input type="submit" value="Registrera" id="skapa" class="submit_btn">
                        
					</form>
                    <p>Ojsan någonting blev fel! Kolla så att lösenordet stämmer överens i båda rutorna!</p>
                %end
                    
			</div>
		</div>
        
    </section>
    
    <!-- INFORAMTION KONTAKT OCH SNABB LÄNKAR FÖR FORUMET !-->
    <footer>
    
    </footer>
</body>
</html>