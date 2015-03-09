angular.module('contactApp').service('LoginService',
		[ '$http', function($http) {
			return {
				doLogin : function(userName) {
					return $http.post('/AngularJS/app/doLogin', {
						'userName' : userName
					});
				},

				showRegister : function() {
					return $http.get('/AngularJS/app/showRegister');
				}
			}
		} ]).service('ContactService', [ '$http', function($http) {
	var contact = {};
	var service = {

		setContact : function(object) {
			console.log(object);
			contact = object;
		},

		getContact : function() {
			return contact;
		},
		
		registerUser : function(email, firstName, lastName){
			return $http.post('/AngularJS/app/registerUser', {
				'email' : email, 'firstName' : firstName , 'lastName' : lastName
			});
		}
	};
	return service;
} ]);