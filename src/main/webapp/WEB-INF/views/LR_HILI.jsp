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
        <script type="text/javascript" src="<c:url value='static/js/mytimer.js' />"></script>
        <script src="<c:url value='/static/js/myjs.js' />"></script>

        <script type="text/javascript">
            $('#submitbtn').click(function() {
$(this).attr('disabled', true);
});
            /*(function ($, global) {
             
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
             
             })(jQuery, window);*/
            /** SHOW WARNING WHILE USER TRIES TO LEAVE PAGE IN ANY WAY **/
//            window.onbeforeunload = function (e) {
//                e = e || window.event;
//
//                // For IE and Firefox prior to version 4
//                if (e) {
//                    e.returnValue = 'You sure?';
//                }
//
//                // For others
//                return 'You sure?';
//            };


            var listOfSelectedWords = [];

            if (!window.Kolich) {
                Kolich = {};
            }

            Kolich.Selector = {};
            // getSelected() was borrowed from CodeToad at
            // http://www.codetoad.com/javascript_get_selected_text.asp
            Kolich.Selector.getSelected = function () {
                var t = '';
                if (window.getSelection) {
                    t = window.getSelection();
                } else if (document.getSelection) {
                    t = document.getSelection();
                } else if (document.selection) {
                    //t = document.selection.createRange().text;
                }
                return t;
            };

            Kolich.Selector.mouseup = function () {
                var st = Kolich.Selector.getSelected();
                if (st != "" && st != " ") {
                    var word = (st + "").trim();
                    var slices = word.split(" ");
                    if (slices.length > 1) {
                        alert("Please only select single word.");
                    } else {
                        if (wordExistsInList(word + "") > -1) {
                            removeWord(word + "");
                        } else {
                            listOfSelectedWords.push(word + "");
                        }
                    }
                    document.getElementById("selected").innerHTML = listOfSelectedWords;
                    updateSelectedValue();
                }
            };

            /*$(document).ready(function(){
             $(document).bind("mouseup", Kolich.Selector.mouseup);  
             });*/

            function wordExistsInList(word) {
                var index = -1;
                for (var i = 0; i < listOfSelectedWords.length; i++) {
                    index = listOfSelectedWords.indexOf(word);
                    if (index > -1) {
                        break;
                    }
                }
                return index;
            }

            function removeWord(word) {
                var index = wordExistsInList(word);
                listOfSelectedWords.splice(index, 1);
            }

            function updateSelectedValue() {
                document.getElementById("selected-hidden").value = document.getElementById('selected').innerHTML;
            }

            /** FOR AUDIO PLAYBACK **/
            var time, counter;
            function init() {
                time = parseInt(document.getElementById("audioPlayAfter").value) * 1000;
                counter = time / 1000 - 1;
            }

            function playAudio() {
                var interval = setInterval(function () {
                    //alert(counter);
                    if (counter >= 0) {
                        document.getElementById("playsIn").innerHTML = counter;
                    }
                    counter--;
                    if (counter < 0) {
                        clearInterval(interval);
                        clearInterval();
                        document.getElementById("playing").innerHTML = "Playing...";
                    }
                }, 1000);
                setTimeout(function () {
                    document.getElementById('audiotag1').play();
                }, time);
            }

            function startExamTimer() {
                var duration = document.getElementById("categoryTime").value;
                var start = document.getElementById("startTimerAt").value;
                startTimer(duration, start);
            }
            function noBack(){window.history.forward();}
        </script>

    </head>
    <body onload="noBack();startExamTimer();
            init();
            playAudio()">



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



        <c:forEach items="${listOfQuestions}" var="question" varStatus="itr">

            <c:set var="test" value="${offset+1}"/> 

            <%                        int resp = previous_count;
                int test = Integer.parseInt(pageContext.getAttribute("test").toString());
                resp = resp + test;
                pageContext.setAttribute("resp", resp);

            %>   
            <div id="logo_place_header"></div>
            <div class="col-md-10 col-md-offset-1">
                <div class="col-md-7"><h3>Highlight Incorrect Words</h3>
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
                
                <div class="col-md-5 audioBox">
                    <h3 class="audioPlayer">Audio Player...<br/><span class="text-success" id="playing">Plays in <span id="playsIn"><c:out value="${question.sectionId.audioPlayAfter}" /></span></span></h3>
                    <audio id="audiotag1" src="<c:url value='../media/files/${question.audioPath}' />"></audio>
                </div>
                <p class="clear" />
                <form method="post">
                    <input type="hidden" name="elapsedTime" id="elapsedTime" value="" />
                    <input type="hidden" id="categoryTime" value="<c:out value="${question.catId.totalTime}" />" />
                    <input type="hidden" id="startTimerAt" value="<%= (startTime)%>" />
                    <input type="hidden" id="previous_count" name="previous_count" value="<c:out value="${resp}" />" />
                    <input type="hidden" value="${question.sectionId.audioPlayAfter}" id="audioPlayAfter" />
                    <div class="userspace">
                        <p id="passage">
                            <c:out value="${question.passage}" />
                        </p>
                    </div>
                    <input type="hidden" name="offset" value="<c:out default="0" value="${offset}" />" />
                    <input type="hidden" name="count" value="${count}" />
                    <input type="hidden" value="${question.sectionId.sectionId}" name="currentSection" />

                    <input type="hidden" name="questionId" value="${question.questionId}" />
                    <input type="hidden" name="selected" id="selected-hidden" value="" />
                    <hr/>
                    <div>
                       <input type="submit" name="submit" value="Next" id="submitbtn" class="btn btn-primary" style="float:right">
                    </div>
                </form>
                <p class="clear" />

            </div>
        </c:forEach>
    </body>



    <script src="<c:url value='/static/js/jquery-2.2.3.min.js' />"></script>
    <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
    <script>
        $(document).bind("mouseup", Kolich.Selector.mouseup);

        var words = formatPassage();
        for (var i = 0; i < words.length; i++) {
            addAttributeToWord(words[i]);
        }
        document.getElementById("passage").innerHTML = formattedPassage;
    </script>
</html>
