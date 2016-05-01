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
            <h1>Multiple-choice, choose multiple answers (Listening)</h1>
            <p class="instruction">Listen to the recording and answer the question by selecting the correct responses. You will need to select more than one response.</p>
            <hr />
            
            <div class="question">
                Q. What are your favorite colors?
            </div>
            
            <div class="col-md-5 audioBox">
                <h3 class="audioPlayer">Audio Player</h3>
                <audio controls="controls" src="../raw_res/audio.mp3"></audio>
            </div>
            <p class="clear" />
            
            <form action="" method="post">
                <div class="userspace">
                    <input type="checkbox" name="choice" value="v1"> Green<br/>
                    <input type="checkbox" name="choice" value="v1"> Blue<br/>
                    <input type="checkbox" name="choice" value="v1"> Red<br/>
                    <input type="checkbox" name="choice" value="v1"> Yellow<br/>
                    <input type="checkbox" name="choice" value="v1"> Purple<br/>
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
