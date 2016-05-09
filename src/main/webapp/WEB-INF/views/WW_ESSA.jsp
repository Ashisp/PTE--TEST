<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib uri="http://paginationtag.miin.com" prefix="pagination-tag"%>
<%@ taglib prefix="tag" uri="/WEB-INF/customTaglib.tld"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="<c:url value='/static/css/bootstrap.css' />" />
        <link rel="stylesheet" href="<c:url value='/static/css/main.css' />" />
        <script type="text/javascript">
            /** SHOW WARNING WHILE USER TRIES TO LEAVE PAGE IN ANY WAY **/
            window.onbeforeunload = function (e) {
                e = e || window.event;

                // For IE and Firefox prior to version 4
                if (e) {
                    e.returnValue = 'You sure?';
                }

                // For others
                return 'You sure?';
            };
        </script>
        <script type="text/javascript">
            function startTimer(duration, start) {
                var timer = start, minutes, seconds;
                var display = document.querySelector('#time');
                var elapsedTime = document.getElementById("elapsedTime");
                setInterval(function () {
                    minutes = parseInt(timer / 60, 10)
                    seconds = parseInt(timer % 60, 10);

                    minutes = minutes < 10 ? "0" + minutes : minutes;
                    seconds = seconds < 10 ? "0" + seconds : seconds;

                    display.textContent = minutes + ":" + seconds;
                    elapsedTime.value = timer;
                    if (++timer > duration) {
                        timer = duration;
                        document.getElementById("essay").disabled = "true";
                    }
                    //alert("Timer: " + timer);
                }, 1000);
            }

            function extractHiddenEssay() {
                document.getElementById("hiddenEssay").value = document.getElementById("essay").value;
            }
        </script>
    </head>
    <body onload="startTimer(2400, 1);">
        <c:forEach items="${listOfQuestions}" var="question">
            <div class="col-md-10 col-md-offset-1">
                <h1>Write Essay</h1>
                <p class="instruction"><c:out value="${question.sectionId.instructions}" /></p>
                <hr />
                <div class="question">
                    <c:out value="${question.question}" />
                </div>
                <p class="clear" />
                <form method="post" onsubmit="extractHiddenEssay()">
                    
                    <div class="userspace">
                        <h5><span id="wordCount">0</span>/300 Word Limit</h5>
                        <input type="hidden" name="userId" value="1000" />
                        <input type="hidden" name="questionId" value="${question.questionId}" />
                        <input type="hidden" name="offset" value="<c:out default="0" value="${offset}" />" />
                        <input type="hidden" name="count" value="${count}" />
                        <input type="hidden" value="${question.sectionId.sectionId}" name="currentSection" />
                        <input type="hidden" value="" name="essay" id="hiddenEssay" />
                        <textarea id="essay" spellcheck="false" class="form-control" rows="7" style="max-height: 10" onkeyup="countWord();"></textarea>
                    </div>
                    <div>
                        <span id="time">00:00</span>/20:00
                        <input type="hidden" name="elapsedTime" id="elapsedTime" value="" />
                    </div>
                    <div>
                        <input id="submit" type="submit" name="done" value="Done" class="form-control done" />
                    </div>
                </form>
                <form method="post" action="<c:url value="/loadSection" />" onsubmit="return confirm('Are you sure?');">
                    <input type="hidden" value="${question.sectionId.sectionId}" name="currentSection" />
                    <div>
                        <input type="submit" name="submit" value="Finish" class="btn btn-primary" style="float:right" />
                    </div>
                </form>
            </div>
        </c:forEach>
        <p class="clear" />

        <script src="<c:url value='/static/js/jquery-2.2.3.min.js' />"></script>
        <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
        <script type="text/javascript">
                    var MAX_WORD_COUNT = 300;
                    function countWord() {
                        var essay = document.getElementById("essay").value;
                        var words = essay.split(" ");
                        document.getElementById("wordCount").innerHTML = (words.length);
                        if (words.length > MAX_WORD_COUNT) {
                            //$("#submit").attr('disabled', 'true');
                        } else if (words.length <= MAX_WORD_COUNT) {
                            $("#submit").removeAttr('disabled');
                        }
                    }
        </script>
    </body>
</html>
