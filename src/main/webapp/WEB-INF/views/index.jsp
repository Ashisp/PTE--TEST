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
        
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/main.css" />
    </head>
    <body>
        <ul style="list-style: none;">
            <li>
                <h1>Listening</h1>
                <ol>
                    <li><a href="<c:url value='/LW-GAPS' />" target="blank">Fill in the blanks (Listening)</a></li>
                    <li><a href="<c:url value='/LR-HOTS' />" target="blank">Highlight correct summary</a></li>
                    <li><a href="<c:url value='/LR-HILI' />" target="blank">Highlight incorrect words</a></li>
                    <li><a href="<c:url value='/LL-MAMC' />" target="blank">Multiple-choice, choose multiple answers (Listening)</a></li>
                    <li><a href="<c:url value='/LL-SAMC' />" target="blank">Multiple-choice, choose single answer (Listening)</a></li>
                    <li><a href="<c:url value='/LL-GAPS' />" target="blank">Select missing word</a></li>
                    <li><a href="<c:url value='/LW-SUMM' />" target="blank">Summarize spoken text</a></li>
                    <li><a href="<c:url value='/LW-DICT' />" target="blank">Write from dictation</a></li>
                </ol>
            </li>
            <li>
                <h1>Reading</h1>
                <ol>
                    <li><a href="<c:url value='/RR-SAMC' />" target="blank">Multiple-choice, choose single answer (Reading)</a></li>
                    <li><a href="<c:url value='/RW-GAPS' />" target="blank">Fill in the blanks (Reading & Writing)</a></li>
                    <li><a href="<c:url value='/RR-GAPS' />" target="blank">Fill in the blanks (Reading)</a></li>
                    <li><a href="<c:url value='/RR-SAMC' />" target="blank">Multiple-choice, choose multiple answers (Reading)</a></li>
                    <li><a href="<c:url value='/RR-DRDR' />" target="blank">Re-order paragraphs</a></li>
                </ol>
            </li>
            <li>
                <h1>Speaking</h1>
                <ol>
                    <li><a href="<c:url value='/SS-DESC' />" target="blank">Describe image</a></li>
                    <li><a href="<c:url value='/SR-READ' />" target="blank">Read aloud</a></li>
                    <li><a href="<c:url value='/LS-SAQS' />" target="blank">Answer short question</a></li>
                    <li><a href="<c:url value='/LS-PRES' />" target="blank">Re-tell lecture</a></li>
                    <li><a href="<c:url value='/LS-REPT' />" target="blank">Repeat sentence</a></li>
                </ol>
            </li>
            <li>
                <h1>Writing</h1>
                <ol>
                    <li><a href="<c:url value='/RW-SUMM' />" target="blank">Summarize written text</a></li>
                    <li><a href="<c:url value='/WW-ESSA' />" target="blank">Write essay</a></li>
                </ol>
            </li>
            <li>
                <h1>Break</h1>
                <ol>
                    <li><a href="<c:url value='/BB-BREAK' />" target="blank">Break</a></li>
                </ol>
            </li>
        </ul>
                
<a href="<c:url value='/logout' />" class="btn btn-success custom-width">Logout</a>
    </body>
    
    <script src="/js/jquery-2.2.3.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
</html>
