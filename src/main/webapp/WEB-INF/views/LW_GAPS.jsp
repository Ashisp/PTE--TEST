<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
            <h1>Fill in the blanks (Listening)</h1>
            <p class="instruction">You will hear a recording. Type the missing words in each blank space.</p>
            <hr />
            <div class="col-md-5 audioBox">
                <h3 class="audioPlayer">Audio Player</h3>
                <audio controls="controls" src=""></audio>
            </div>
            <p class="clear" />
            <form action="" method="post">
                <div class="userspace">
                    <p>
                        One seminal difference in policy remains; the <input type="text" id="blank1" spellcheck="false" class="blanks form-control" /> 
                        has not matched what is Labor's most important innovation promise. 
                        That is to bring together responsibilities for innovation, industry, science and research under one single federal minister. 
                        Innovation responsibilities <input type="text" id="blank2" spellcheck="false" class="blanks form-control" /> 
                        lie within the powerful Department of Education and Science, and while there is a 
                        <input type="text" id="blank3" spellcheck="false" class="blanks form-control" /> 
                        industry department, it has little influence within Cabinet. This has 
                        <input type="text" id="blank4" spellcheck="false" class="blanks form-control" /> 
                        policy development and given Australia's innovation policies a distinctly science and research
                        <input type="text" id="blank5" spellcheck="false" class="blanks form-control" /> 
                       . It is the scientists rather than the engineers who call the tune in innovation policy in Canberra, 
                       so it's no surprise our policies are all about boosting government funded research and later 
                        their results.
                    </p>
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
