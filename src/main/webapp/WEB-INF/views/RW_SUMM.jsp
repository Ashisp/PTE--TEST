<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib uri="http://paginationtag.miin.com" prefix="pagination-tag"%>
<%@ taglib prefix="tag" uri="/WEB-INF/customTaglib.tld"%>
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
                        document.getElementById("summary").disabled = "true";
                    }
                    //alert("Timer: " + timer);
                }, 1000);
            }
            
            function extractHiddenSummary(){
                document.getElementById("hiddenSummary").value = document.getElementById("summary").value;
            }
        </script>
    </head>
    <body onload="startTimer(1200, 1)">
        <c:forEach var="question" items="${listOfQuestions}">
            <div class="col-md-10 col-md-offset-1">
                <h1>Summarize written text</h1>
                <p class="instruction"><c:out value="${question.sectionId.instructions}" /></p>
                <hr />
                <div class="question">
                    <p>
                        <c:out value="${question.passage}" />
                    </p>
                </div>
                <p class="clear" />
                <form onsubmit="extractHiddenSummary()" method="post">
                    <c:set var="offset" value="${offset}" />
                    <input type="hidden" name="questionId" value="${question.questionId}" />
                    <input type="hidden" name="userId" value="1000" />
                    <div class="userspace">
                        <h5><span id="wordCount">0</span>/75 Word Limit</h5>
                        <input type="hidden" name="summary" id="hiddenSummary" value="" />
                        <textarea id="summary" spellcheck="false" class="form-control" rows="7" style="max-height: 10" onkeyup="countWord();"></textarea>
                        <input type="hidden" name="offset" value="${offset}" />
                        <input type="hidden" name="count" value="${count}" />
                        <input type="hidden" value="${question.sectionId.sectionId}" name="currentSection" />
                    </div>
                    <div>
                        <span id="time">00:00</span>/10:00
                        <input type="hidden" name="elapsedTime" id="elapsedTime" value="" />
                    </div>
                      <div>
                        <input type="submit" name="submit" value="Finish" class="btn btn-primary" style="float:right" />
                    </div>
                </form>
             
            </div>
        </c:forEach>

        <script src="<c:url value='/static/js/jquery-2.2.3.min.js' />"></script>
        <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
        <script type="text/javascript">
                    var MAX_WORD_COUNT = 75;
                    function countWord() {
                        var essay = document.getElementById("summary").value;
                        var words = essay.split(" ");
                        document.getElementById("wordCount").innerHTML = (words.length);
                        if (words.length > MAX_WORD_COUNT) {
                            $("#submit").attr('disabled', 'true');
                        } else if (words.length <= MAX_WORD_COUNT) {
                            $("#submit").removeAttr('disabled');
                        }
                    }
        </script>
    </body>
</html>
