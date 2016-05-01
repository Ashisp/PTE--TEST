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
            <h1>Write Essay</h1>
            <p class="instruction">You will have 20 minutes to plan, write and revise an essay about the topic below. Your response will be judged on 
                how well you develop a position, organize your ideas, present supporting details, and control the elements of standard written English.
                You should write 200-300 words.</p>
            <hr />
            <div class="question">
                <p>Some people believe that exploring outer space is important because it expands human knowledge and might lead to discoveries that will 
                    benefit humanity in the future. Other people believe that space exploration is a waste of money that could be better spent solving 
                    immediate problems here on Earth.</p>
                <p>Choose which position you most agree with and discuss why you chose that position. Support your point of view with details from your 
                    own experiences, observations or reading.</p>
            </div>
            <p class="clear" />
            <form action="" method="post">
                <div class="userspace">
                    <h5><span id="wordCount">0</span>/300 Word Limit</h5>
                    <textarea name="essay" spellcheck="false" class="form-control" rows="7" style="max-height: 10"></textarea>
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
