<!DOCTYPE html>
<html>
    <body>
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
                } else {
                    e.target.parentNode.insertBefore(source, e.target.nextSibling);
                }
            }

            function dragstart(e) {
                source = e.target;
                e.dataTransfer.effectAllowed = 'move';
            }

        </script>


        <ul>
            <li draggable="true" ondragenter="dragenter(event)" ondragstart="dragstart(event)">Apples</li>
            <li draggable="true" ondragenter="dragenter(event)" ondragstart="dragstart(event)">Oranges</li>
            <li draggable="true" ondragenter="dragenter(event)" ondragstart="dragstart(event)">Bananas</li>
            <li draggable="true" ondragenter="dragenter(event)" ondragstart="dragstart(event)">Strawberries</li>
        </ul>

    </body>
</html>