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
            <h1>Multiple-choice, choose multiple answers (Reading)</h1>
            
            <div class="question col-md-6" style="float: left;">
                In many ways Britten's most ambitious effort is the War Requiem of 1961, a flawed but still impressive work for chorus, soloists, 
                and orchestra. It weaves together the traditional Latin Mass for the Dead with antiwar poems by Wilfrid Owen, a young officer killed
                in World War I. The point of War Requiem is how the words of the liturgical text are reinterpreted and often rendered hollow by the 
                realities of death in war. In this work we see Britten's prodigal inconsistencies on display. For all its problems, the War Requiem 
                will probably survive as one of our time's most impassioned indictments of war and its heroic myth.
            </div>
            
            <p class="instruction">Read the text and answer the multiple-choice question by selecting the correct response. Only one response is correct.</p>
            
            <form action="" method="post">
                <div class="userspace col-md-5">
                    <p>Which of the following most accurately summarizes the opinion of the author in the text?</p>
                    <input type="radio" name="choice" value="v1"> Answer 1<br/>
                    <input type="radio" name="choice" value="v1"> Answer 2<br/>
                    <input type="radio" name="choice" value="v1"> Answer 3<br/>
                    <input type="radio" name="choice" value="v1"> Answer 4<br/>
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
