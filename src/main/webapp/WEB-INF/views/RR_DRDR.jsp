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
        <title>Express Edu.</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="<c:url value='/static/css/bootstrap.css' />" />
        <link rel="stylesheet" href="<c:url value='/static/css/main.css' />" />
        <script src="<c:url value='/static/js/mytimer.js' />"></script>
        <script type="text/javascript">

            /** SHOW WARNING WHILE USER TRIES TO LEAVE PAGE IN ANY WAY **/

            $('#submitbtn').click(function () {
                $(this).attr('disabled', true);
            });
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

            var source;

            function isbefore(a, b) {
                if (a.parentNode == b.parentNode) {
                    for (var cur = a; cur; cur = cur.previousSibling) {
                        if (cur === b) {
                            return true;
                        }
                    }
                }
                return false;
            }

            function dragenter(e) {
                if (isbefore(source, e.target)) {
                    e.target.parentNode.insertBefore(source, e.target);
                } else {
                    e.target.parentNode.insertBefore(source, e.target.nextSibling);
                }
            }

            function dragstart(e) {
                source = e.target;
                e.dataTransfer.effectAllowed = 'move';
            }

            function setAnswer() {
                document.getElementById("answer").value = document.getElementById("target").innerHTML;
            }

            function startExamTimer() {
                var duration = document.getElementById("categoryTime").value;
                var start = document.getElementById("startTimerAt").value;
                startTimer(duration, start);
            }
            function noBack(){window.history.forward();}
            
        </script>
    </head>
    <body onload="noBack();startExamTimer();">

        <%
            int startTime = 0;

            if ((session.getAttribute("startTime") != "") && (session.getAttribute("startTime") != null)) {
                startTime = Integer.parseInt(session.getAttribute("startTime").toString());

            }

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

            <%                        int resp = previous_count;
                int test = Integer.parseInt(pageContext.getAttribute("test").toString());
                resp = resp + test;
                pageContext.setAttribute("resp", resp);

            %>
            <div id="logo_place_header"></div>

            <div class="col-md-10 col-md-offset-1">
                <div class="col-md-7"><h3>Re-order Paragraphs)</h3>
                </div>
                <div class="pull-right" id="time_display_box">
                    Time: <span id="time">00:00</span>/<span id="duration"> <c:out value="${question.catId.totalTime/60}" />:00</span>
                </div>
                <div class="pull-right" id="num_of_num">
                    <span id="question"><c:out value="<%=(resp)%>" /></span> of <span id="questions"> <c:out value="<%= (count_questions)%>"  /></span>
                </div>
                <div class="clear"></div>
                <hr/>
                <p class="instruction"><c:out value="${question.sectionId.instructions}" /></p>

                <form method="POST"  onsubmit="setAnswer()">
                    <div class="col-md-6" style="float: left;">
                        <input type="hidden" id="categoryTime" value="<c:out value="${question.catId.totalTime}" />" />
                        <input type="hidden" id="startTimerAt" value="<%= (startTime)%>" />
                        <input type="hidden" id="elapsedTime" name="elapsedTime" value="" />
                        <input type="hidden" id="previous_count" name="previous_count" value="<c:out value="${resp}" />" />
                        <input type="hidden" value="${question.questionId}" name="questionId" />
                        <input type="hidden" name="answer" id="answer" />


                        <input type="hidden" name="offset" value="<c:out value="${offset}" />" />
                        <input type="hidden" value="${question.sectionId.sectionId}" name="currentSection" />

                        <h3>Source</h3>
                        <ul class="source" id="source">
                            <li draggable="false" ondragenter="dragenter(event)" ondragstart="dragstart(event)">&nbsp;</li>
                                <c:forEach items="${question.answerOptionsCollection}" var="option" varStatus="itr">

                                <li draggable="true" ondragenter="dragenter(event)" ondragstart="dragstart(event)">
                                    <c:out value="${option.ansOption}" />
                                </li>
                            </c:forEach>
                        </ul>
                    </div>

                    <div class="col-md-6" style="float: left;">
                        <h3>Target</h3>
                        <ul class="target" id="target">
                            <li draggable="false" ondragenter="dragenter(event)" ondragstart="dragstart(event)">&nbsp;</li>
                        </ul>
                    </div>
                    <p class="clear" />
                    <hr/>
                    <div>
                        <input type="submit" name="submit" value="Next" id="submitbtn" class="btn btn-primary" style="float:right">
                    </div>
                </form>

            </div>
        </c:forEach>

        <script src="<c:url value='/static/js/jquery-2.2.3.min.js' />"></script>
        <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
    </body>
</html>
