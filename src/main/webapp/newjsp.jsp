<!DOCTYPE html>
<html>
    <head>
        <title>Dynamic Field</title>
        <script src="static/js/jquery.js"></script>
    </head>

    <body>
        <form role="form" action="/wohoo" method="POST">
            <label>Stuff</label>
            <div class="multi-field-wrapper">
                <div class="multi-fields">
                    <div class="multi-field">
                        <input type="text" name="stuff[]">
                        <button type="button" class="remove-field">Remove</button>
                    </div>
                </div>
                <button type="button" class="add-field">Add field</button>
            </div>
        </form>
        <script type="text/javascript">
            $('.multi-field-wrapper').each(function () {
                var $wrapper = $('.multi-fields', this);
                $(".add-field", $(this)).click(function (e) {
                    $('.multi-field:first-child', $wrapper).clone(true).appendTo($wrapper).find('input').val('').focus();
                });
                $('.multi-field .remove-field', $wrapper).click(function () {
                    if ($('.multi-field', $wrapper).length > 1)
                        $(this).parent('.multi-field').remove();
                });
            });
        </script>
    </body>
</html>