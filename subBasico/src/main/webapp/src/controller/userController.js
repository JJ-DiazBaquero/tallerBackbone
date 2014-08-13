    App.Controller.UserController = Backbone.View.extend({
        el: '#main',
        initialize: function(options) {
            this.editTemplate = _.template($('#user').html());
            var self = this;
            
            Backbone.on('user-create', function(params) {
                self.create(params);
                $('#birthday').datepicker();
            });
            Backbone.on('user-save', function(params) {
                self.save(params);
            });
            Backbone.on('user-cancel', function(params) {
                self.cancel(params);
            });
            Backbone.on('user-calendar', function(params) {
                self.calendar(params);
            });
        },
        create: function() {
            this.userModel = new App.Model.UserModel();
            this._renderEdit();
        },
        save:function() { 
            var model = $('#userForm').serializeObject();
            nombre = model.firstName;
            apellido = model.lastName;
            cumpleanos = model.birthday;
            document.getElementById("msj").innerHTML = "<a href=\"#\" class=\"close\" data-dismiss=\"alert\">&times</a>El usuario " + nombre +" "+ apellido + " nacio el " +  cumpleanos + "</div>";
        },
        cancel: function(){
            alert('Cancel');
        },
        calendar: function(){
            
            //  var datepicker = $.fn.datepicker.noConflict(); // return $.fn.datepicker to previously assigned value
            //$.fn.bootstrapDP = datepicker;
        },
        _renderEdit: function() {
            var self = this;
            self.$el.html(self.editTemplate({user: self.userModel}));
        }
    });