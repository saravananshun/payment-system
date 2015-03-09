(function() {
	var User = function() {

	}
	User.prototype = {
        createUser : function (email, firstName, lastName){
        	this.email = email;
        	this.firstName = firstName;
        	this.lastName = lastName;
        } 
	};
}
);