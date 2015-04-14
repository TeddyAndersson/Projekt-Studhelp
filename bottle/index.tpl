<!DOCTYPE html>
<html>
    <head>
        <title>Min Wiki</title>
        <link type="text/css" rel="stylesheet" href="/static/mainstyle.css">
    </head>
    <body>
        
        <nav> 
            <h1>My Wiki</h1>
            <ul>
                <li><a href="/">Home</a></li>
                <li><a id="selected"  href="/edit/">Add/Edit article</a></li>
                <li><a href="/list/">Wiki list</a></li>
                <li><a href="/remove_article/">Remove article</a></li>
            </ul>
        </nav>
        
        <section>
            <article>
                <h2>Add an articel!</h2>
                <em>OBS! Do not use å, ä or ö in the textfields.</em>
                <form action="/update_edit/" method="post">

                    <div>
                        <label for="name">Article name:</label><br>
                        <input type="text" name="name" id="name">
                    </div>

                    <div>
                        <label for="text">Article fact:</label><br>
                        <textarea name="text" id="text"></textarea>
                    </div>


                    <p><input type="submit" value="Continue &rarr;"></p>
                </form>
            </article>
        </section>
        
        <footer>
            <em>Author and Creator of the wiki: Teddy Andersson</em>
        </footer>
        
    </body>
</html>