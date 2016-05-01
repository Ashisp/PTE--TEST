<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <script>
            function allowDrop(ev) {
                ev.preventDefault();
            }

            function drag(ev) {
                ev.dataTransfer.setData("text", ev.target.id);
            }

            function drop(ev) {
                ev.preventDefault();
                var data = ev.dataTransfer.getData("text");
                ev.target.appendChild(document.getElementById(data));
            }
        </script>
    </head>
    <body>
        <div class="col-md-10 col-md-offset-1">
            <h1>Fill in the blanks (Reading)</h1>
            <p class="instruction">In the text below some words are missing. Drag words from the box below to the appropriate place in the text. 
                To undo an answer choice, drag the word back to the box below the text.</p>
            <hr />
            <p class="clear" />
            <form action="" method="post">
                <div class="userspace">
                    <p id="paragraph">
                        Video provides a powerful way to help you <span class="blank-box" ondrop="drop(event)" ondragover="allowDrop(event)"></span> 
                        your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword 
                        to search online for the <span class="blank-box" ondrop="drop(event)" ondragover="allowDrop(event)"></span> that best fits your 
                        document.To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that 
                        <span class="blank-box" ondrop="drop(event)" ondragover="allowDrop(event)"></span> each other. For example, you can add a matching 
                        cover page, header, and sidebar. Click Insert and then choose the elements you want from the different galleries.
                    </p>
                    <br>

                    <div style="height:50px">
                        <span class="blank-box" ondrop="drop(event)" ondragover="allowDrop(event)"><div id="drag1" class="answer-box" draggable="true" ondragstart="drag(event)">prove</div></span>
                        <span class="blank-box" ondrop="drop(event)" ondragover="allowDrop(event)"><div id="drag2" class="answer-box" draggable="true" ondragstart="drag(event)">video</div></span>
                        <span class="blank-box" ondrop="drop(event)" ondragover="allowDrop(event)"><div id="drag3" class="answer-box" draggable="true" ondragstart="drag(event)">complement</div></span>
                    </div>
                </div>
                <div>
                    <!-- SHOULD SENED AJAX REQUEST ON CLICK -->
                    <input type="submit" name="done" value="Done" class="form-control done" />
                </div>
            </form>
        </div>


        <script src="<c:url value='/static/js/jquery-2.2.3.min.js' />"></script>
        <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
    </body>
</html>
