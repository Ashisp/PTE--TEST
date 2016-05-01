<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="stylesheet" href="<c:url value='/static/css/bootstrap.css' />" />
        <link rel="stylesheet" href="<c:url value='/static/css/main.css' />" />
    </head>
    <body>
        <div class="col-md-10 col-md-offset-1">
            <h1>Summarize written text</h1>
            <p class="instruction">Read the passage below and summarize it using one sentence. 
                Type your response in the box at the bottom of the screen. You have 10 minutes to finish this task. 
                Your response will be judged on the quality of your writing and on how well your response presents the key points in the passage.</p>
            <hr />
            <div class="question">
                <p>For millions of years, Mediterranean sea turtles have been coming to the shore of southern Lebanon to lay their eggs. 
                Every summer, their babies hatch and literally run for their lives on the strip of sand that separates their nests from the sea. 
                An endangered species, they had been largely ignored in this part of Lebanon until two women set out to protect them. 
                Mona Khalil was inspired by a walk on the beach during a visit to her homeland, when she first saw the turtles. 
                Upon learning that they were close to disappearing from her country, Khalil decided to "come back and do something about them."</p>
                <p>The next year, 2000, she returned and teamed up with Habiba Fayed, who shares her passion for the environment. 
                    They opened a bed-and-breakfast in the Khalil family home to finance their efforts. 
                    Guests could simply vacation or, in the spirit of ecotourism, they could help the owners protect the turtles' nests and keep the 
                    beach clean.</p>
                <p>Female turtles travel to the exact spot where they were born to dig their nests in the sand, laying an average of 70 to 100 eggs. 
                    This is the moment when the women intervene. They protect the nests from predators by burying an iron grid in the sand above the eggs. 
                    The spaces on the grid are large enough to allow the baby turtles to emerge after a month and find their way to the sea…and to a 
                    chance at life.</p>
            </div>
            <p class="clear" />
            <form action="" method="post">
                <div class="userspace">
                    <h5><span id="wordCount">0</span>/75 Word Limit</h5>
                    <textarea name="summary" spellcheck="false" class="form-control" rows="7" style="max-height: 10"></textarea>
                </div>
                <div>
                    <input type="submit" name="done" value="Done" class="form-control done" />
                </div>
            </form>
        </div>
        
        
        <script src="<c:url value='/static/js/jquery-2.2.3.min.js' />"></script>
        <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
    </body>
</html>
