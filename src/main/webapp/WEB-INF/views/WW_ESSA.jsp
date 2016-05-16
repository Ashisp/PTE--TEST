<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib uri="http://paginationtag.miin.com" prefix="pagination-tag"%>
<%@ taglib prefix="tag" uri="/WEB-INF/customTaglib.tld"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Express Edu.</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="<c:url value='/static/css/bootstrap.css' />" />
        <link rel="stylesheet" href="<c:url value='/static/css/main.css' />" />
        <script type="text/javascript">
            $('#submitbtn').click(function() {
$(this).attr('disabled', true);
            }
            (function ($, global) {

                var _hash = "!",
                        noBackPlease = function () {
                            global.location.href += "#";

                            setTimeout(function () {
                                global.location.href += "!";
                            }, 50);
                        };

                global.setInterval(function () {
                    if (global.location.hash != _hash) {
                        global.location.hash = _hash;
                    }
                }, 100);

                global.onload = function () {
                    noBackPlease();

                    // disables backspace on page except on input fields and textarea..
                    $(document.body).keydown(function (e) {
                        var elm = e.target.nodeName.toLowerCase();
                        if (e.which == 8 && elm !== 'input' && elm !== 'textarea') {
                            e.preventDefault();
                        }
                        // stopping event bubbling up the DOM tree..
                        e.stopPropagation();
                    });
                }

            })(jQuery, window);
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
            function noBack() {
                window.history.forward();
            }
        </script>
    </head>
    <body onload="noBack();
            startTimer(2400, 1);">
        <%
            int count_questions = 0;
            int previous_count = 0;

            if ((session.getAttribute("question_count") != "") && (session.getAttribute("question_count") != null)) {
                count_questions = Integer.parseInt(session.getAttribute("question_count").toString());

            }

            if ((session.getAttribute("previous_count") != "") && (session.getAttribute("previous_count") != null)) {

                previous_count = Integer.parseInt(session.getAttribute("previous_count").toString());
                ;

            }


        %>
        <c:forEach items="${listOfQuestions}" var="question">


            <c:set var="test" value="${offset+1}"/> 
            <%            int resp = previous_count;
                int test = Integer.parseInt(pageContext.getAttribute("test").toString());
                resp = resp + test;
                pageContext.setAttribute("resp", resp);

            %>
            <div id="logo_place_header"></div>

            <div class="col-md-10 col-md-offset-1">
                <div class="col-md-7"><h3>Write Essay</h3>
                </div>                

                <div class="pull-right" id="time_display_box">
                    <span id="time">00:00</span>/20:00
                   
                </div>
                <div class="pull-right" id="num_of_num">
                    <span id="question"><c:out value="<%=(resp)%>" /></span> of <span id="questions"> <c:out value="<%= (count_questions)%>"  /></span>
                </div> 
                <div class="clear"></div>
                <hr/>
                <p class="instruction"><c:out value="${question.sectionId.instructions}" /></p>

                <div class="question">
                    <c:out value="${question.question}" />
                </div>
                <p class="clear" />
                <form method="post" onsubmit="extractHiddenEssay()">

                    <div class="userspace">
                         <input type="hidden" name="elapsedTime" id="elapsedTime" value="" />
                        <h5><span id="wordCount">0</span>/300 Word Limit</h5>
                        <input type="hidden" name="userId" value="1000" />
                        <input type="hidden" name="questionId" value="${question.questionId}" />
                        <input type="hidden" name="offset" value="<c:out default="0" value="${offset}" />" />
                        <input type="hidden" name="count" value="${count}" />
                        <input type="hidden" value="${question.sectionId.sectionId}" name="currentSection" />

                        <input type="hidden" id="previous_count" name="previous_count" value="<c:out value="${resp}" />" />
                        <input type="hidden" value="" name="essay" id="hiddenEssay" />
                        <textarea id="essay" spellcheck="false" class="form-control" rows="7" style="max-height: 10" onkeyup="countWord();"></textarea>
                    </div>
                    <hr/>
                    <div>
                       <input type="submit" name="submit" value="Next" id="submitbtn" class="btn btn-primary" style="float:right">
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
