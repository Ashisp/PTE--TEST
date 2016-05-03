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
        <c:forEach items="${listOfQuestions}" var="question">
            <div class="col-md-10 col-md-offset-1">
                <h1>Write Essay</h1>
                <p class="instruction"><c:out value="${question.sectionId.instructions}" /></p>
                <hr />
                <div class="question">
                    <c:out value="${question.question}" />
                </div>
                <p class="clear" />
                <form method="post">
                    <div class="userspace">
                        <h5><span id="wordCount">0</span>/300 Word Limit</h5>
                        <input type="hidden" name="userId" value="1000" />
                        <input type="hidden" name="questionId" value="${question.questionId}" />
                        <textarea name="essay" id="essay" spellcheck="false" class="form-control" rows="7" style="max-height: 10" onkeyup="countWord();"></textarea>
                    </div>
                    <div>
                        <input id="submit" type="submit" name="done" value="Done" class="form-control done" />
                    </div>
                </form>
            </div>
        </c:forEach>

        <script src="<c:url value='/static/js/jquery-2.2.3.min.js' />"></script>
        <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
        <script type="text/javascript">
            var MAX_WORD_COUNT = 300;
            function countWord() {
                var essay = document.getElementById("essay").value;
                var words = essay.split(" ");
                document.getElementById("wordCount").innerHTML = (words.length);
                if(words.length > MAX_WORD_COUNT){
                    $("#submit").attr('disabled','true');
                }else if(words.length <= MAX_WORD_COUNT){
                    $("#submit").removeAttr('disabled');
                }
            }
        </script>
    </body>
</html>
