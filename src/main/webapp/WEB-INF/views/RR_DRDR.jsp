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
        <script type="text/javascript">

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
                }
                else {
                    e.target.parentNode.insertBefore(source, e.target.nextSibling);
                }
            }

            function dragstart(e) {
                source = e.target;
                e.dataTransfer.effectAllowed = 'move';
            }

        </script>
    </head>
    <body>
        <div class="col-md-10 col-md-offset-1">
            <h1>Re-order paragraphs</h1>

            <p class="instruction">The text boxes in the left panel have been placed in a random order. Restore the original order by dragging the 
                text boxes from the left panel to the right panel.</p>

            <div class="col-md-6" style="float: left;">
                <h3>Source</h3>
                <ul class="source">
                    <li draggable="true" ondragenter="dragenter(event)" ondragstart="dragstart(event)">Video provides a powerful way to help you prove your point.</li>
                    <li draggable="true" ondragenter="dragenter(event)" ondragstart="dragstart(event)">When you click Online Video, you can paste in the embed code for the video you want to add.</li>
                    <li draggable="true" ondragenter="dragenter(event)" ondragstart="dragstart(event)">You can also type a keyword to search online for the video that best fits your document.</li>
                    <li draggable="true" ondragenter="dragenter(event)" ondragstart="dragstart(event)">Themes and styles also help keep your document coordinated.</li>
                    <li draggable="true" ondragenter="dragenter(event)" ondragstart="dragstart(event)">Save time in Word with new buttons that show up where you need them.</li>
                </ul>
            </div>

            <div class="col-md-6" style="float: left;">
                <h3>Target</h3>
                <ul class="target">
                    <li draggable="false" ondragenter="dragenter(event)" ondragstart="dragstart(event)">&nbsp;</li>
                </ul>
            </div>
            <p class="clear" />
        </div>


        <script src="<c:url value='/static/js/jquery-2.2.3.min.js' />"></script>
        <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
    </body>
</html>
