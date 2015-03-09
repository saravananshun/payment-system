var app = angular.module('contactApp', [ 'ngRoute' ]).config(
		[ '$routeProvider', function($routeProvider) {
			$routeProvider.when('/home', {
				templateUrl : '/AngularJS/app/home',
				controller : "CodeReviewController"
			}).when('/showLogin', {
				templateUrl : '/AngularJS/app/showLogin',
				controller : "LoginController"
			}).when('/details', {
				templateUrl : '/AngularJS/app/details',
				controller : "ContactController"
			}).when('/register', {
				templateUrl : '/AngularJS/app/showRegister',
				controller : "RegisterController"
			}).when('/userstoryreviewdetails', {
				templateUrl : '/AngularJS/app/userstoryreviewdetails',
				controller : "CodeReviewController"
			})when('/createnewreview', {
				templateUrl : '/AngularJS/app/createnewreview'
			}).otherwise({
				redirectTo : '/showLogin'
			});
		} ]);
