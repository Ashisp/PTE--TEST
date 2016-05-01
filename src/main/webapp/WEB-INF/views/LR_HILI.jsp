<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="<c:url value='/static/css/bootstrap.css' />" />
        <link rel="stylesheet" href="<c:url value='/static/css/main.css' />" />

        <script src="../js/myjs.js"></script>

        <script type="text/javascript">
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
                    //alert("You selected:\n"+st);
                    document.getElementById("selected").innerHTML = listOfSelectedWords;
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
        </script>

    </head>
    <body>
        <div class="col-md-10 col-md-offset-1">
            <h1>Highlight incorrect words</h1>
            <p class="instruction">You will hear a recording. Below is a transcript of the recording. 
                Some words in the transcription differ from what the speaker(s) said. Please click on the words that are different.</p>
            <hr />
            <div class="col-md-5 audioBox">
                <h3 class="audioPlayer">Audio Player</h3>
                <audio controls="controls" src="../raw_res/audio.mp3"></audio>
            </div>
            <p class="clear" />
            <form action="" method="post">
                <div class="userspace">
                    <p id="passage">
                        Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code 
                        for the video you want to add. You can also type a keyword to search online for the video that best fits your document.
                        To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that 
                        complement each other. 
                        For example, you can add a matching cover page, header, and sidebar. Click Insert and then choose the elements you want 
                        from the different galleries.
                        Themes and styles also help keep your document coordinated. When you click Design and choose a new Theme, the pictures, 
                        charts, and SmartArt graphics change to match your new theme. When you apply styles, your headings change to match the new theme.
                        Save time in Word with new buttons that show up where you need them. To change the way a picture fits in your document, 
                        click it and a button for layout options appears next to it. When you work on a table, click where you want to add a row
                        or a column, and then click the plus sign.
                        Reading is easier, too, in the new Reading view. You can collapse parts of the document and focus on the text you want. 
                        If you need to stop reading before you reach the end, Word remembers where you left off - even on another device.
                    </p>
                </div>
                <div>
                    <input type="submit" name="done" value="Done" class="form-control done" />
                </div>
            </form>
            <p class="clear" />
            <div><b>You've selected (Might be userfriendly):</b>[<span id='selected'></span>]</div>
        </div>
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
