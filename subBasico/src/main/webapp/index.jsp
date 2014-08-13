<html>
    <head>
        <title>BasicBackbone</title>
        <meta charset='UTF-8'>
        <meta name='viewport' content='width=device-width'>
        <link rel='stylesheet' href='http://bootswatch.com/journal/bootstrap.min.css'>
 
        <script src='http://code.jquery.com/jquery-1.10.2.min.js'></script>
        <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
        <script src='http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js'></script>
        <script src='http://underscorejs.org/underscore-min.js'></script>
        <script src='http://backbonejs.org/backbone-min.js'></script>
        <script src='bootstrap-datepicker.js'></script>
        <script>
            $.fn.serializeObject = function() {
        var o = {};
        var form = this;
        var a = this.serializeArray();
        
        $.each(a, function() {
            if (o[this.name] !== undefined) {
                if (!o[this.name].push) {
                    o[this.name] = [o[this.name]];
                }
                o[this.name].push(this.value || '');
            } else {
                o[this.name] = this.value || '';
            }
        });
        return o;
            };
        </script>
        <script>
            var App=App||{};
            App.Controller=App.Controller||{};
            App.Model=App.Model||{};
 
            $(document).ready(function() {
                $.ajax({
                    url: './src/view/userTemplate.html',
                    method: 'GET',
                    async: false,
                    contentType: 'text/html',
                    dataType: 'html',
                    success: function(data) {
                        $('body').append($(data));
                    }
                });
 
                var controlador = new App.Controller.UserController();
                Backbone.history.start();
                
            });
        </script>
        <script src='src/model/userModel.js'></script>
        <script src='src/controller/userController.js'></script>
 
    </head>
    <body>
        <div class='container'>
            <h1>Backbone Básico</h1>
            <button class="btn btn-primary btn-lg" onclick="Backbone.trigger('user-create');return false;">Create User </button>
 
            <div id='main'></div>
        </div>
        <div id="rta"></div>
    </body>
</html>