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

        <script src="<c:url value='/static/js/myjs.js' />"></script>

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
        </script>

    </head>
    <body onload="init();
            playAudio()">
        <c:forEach items="${listOfQuestions}" var="question" varStatus="itr">
            <div class="col-md-10 col-md-offset-1">
                <h1>Highlight incorrect words</h1>
                <p class="instruction"><c:out value="${question.sectionId.instructions}" /></p>
                <hr />
                <div class="col-md-5 audioBox">
                    <h3 class="audioPlayer">Audio Player...<span class="text-success" id="playing">Plays in <span id="playsIn"><c:out value="${question.sectionId.audioPlayAfter}" /></span></span></h3>
                    <audio id="audiotag1" src="<c:url value='/static/files/${question.audioPath}' />"></audio>
                </div>
                <p class="clear" />
                <form action="" method="post">
                    <input type="hidden" value="${question.sectionId.audioPlayAfter}" id="audioPlayAfter" />
                    <div class="userspace">
                        <p id="passage">
                            <c:out value="${question.passage}" />
                        </p>
                    </div>
                    <input type="hidden" name="offset" value="${offset}" />
                    <input type="hidden" name="count" value="${count}" />
                    <input type="hidden" value="${question.sectionId.sectionId}" name="currentSection" />
                    
                    <input type="hidden" name="questionId" value="${question.questionId}" />
                    <input type="hidden" name="selected" id="selected-hidden" value="" />
                    <div>
                        <input type="submit" name="done" value="Done" class="form-control done" />
                    </div>
                </form>
                <p class="clear" />
                <div><b>You've selected (Might be userfriendly):</b>[<span id='selected'></span>]</div>
                <form method="post" action="<c:url value="/loadSection" />" onsubmit="return confirm('Are you sure?');">
                    <div>
                        <input type="submit" name="submit" value="Finish" class="btn btn-primary" style="float:right" />
                    </div>
                </form>
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
