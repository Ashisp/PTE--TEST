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
            <h1>Highlight correct summary</h1>
            <p class="instruction">You will hear a recording. Click on the paragraph that best relates the recording.</p>
            <hr />
            <div class="col-md-5 audioBox">
                <h3 class="audioPlayer">Audio Player</h3>
                <audio controls="controls" src="../raw_res/audio"></audio>
            </div>
            <p class="clear" />
            <form action="" method="post">
                <div class="userspace">
                    <input type="radio" name="choice" value="value1"> The long statement number one.<br/>
                    <input type="radio" name="choice" value="value2"> The long statement number two.<br/>
                    <input type="radio" name="choice" value="value3"> The long statement number three.<br/>
                    <input type="radio" name="choice" value="value4"> The long statement number four.<br/>                    
                </div>
                <div>
                    <input type="submit" name="done" value="Done" class="form-control done" />
                </div>
            </form>
        </div>
    </body>

    <script src="<c:url value='/static/js/jquery-2.2.3.min.js' />"></script>
    <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
</html>
