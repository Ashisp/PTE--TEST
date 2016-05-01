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
            <h1>Summarize spoken text</h1>
            <p class="instruction">You will hear a short interview. Write a summary for a fellow student who was not present at the interview. 
                You should write 50-70 words. You have 10 minutes to finish this task. Your response will be judged on the quality of your writing 
                and on how well your response presents the key points presented in the interview.</p>
            <hr />
            <div class="col-md-5 audioBox">
                <h3 class="audioPlayer">Audio Player</h3>
                <audio controls="controls" src="../raw_res/audio.mp3"></audio>
            </div>
            <p class="clear" />
            <form action="" method="post">
                <div class="userspace">
                    <h5><span id="wordCount">0</span>/70 Word Limit</h5>
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
