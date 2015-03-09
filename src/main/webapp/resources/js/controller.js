angular.module('contactApp').controller(
		"LoginController",
		[ 'LoginService', 'ContactService', '$location', '$scope',
				function(LoginService, ContactService, $location, $scope) {
					var self = this;
					self.login = function() {
						LoginService.doLogin('saro').then(function(success) {
							// alert(success.data.firstName);
							ContactService.setContact(success.data);
							$location.path("/details");
						}, function(error) {
							alert(error);
						});
					};

					self.showRegister = function() {
						$location.path("/register");
					};

				} ]).controller("MenuController",
		[ '$location', '$scope', function($location, $scope) {
			var self = this;
			self.homeLabel = 'Home';
			self.showLogin = function() {
				$location.path("/showLogin");
			}
			self.showHome = function() {
				$location.path("/home");
			}
			
			self.createNewReview = function() {
				$location.path("/createnewreview");
			}

		} ]).controller(
		"ContactController",
		[ 'ContactService', '$location', '$scope',
				function(ContactService, $location, $scope) {
					var self = this;
					self.data = ContactService.getContact();
					console.log(self.data);
				} ]).controller(
		"RegisterController",
		[
				'ContactService',
				'$location',
				'$scope',
				function(ContactService, $location, $scope) {
					var self = this;
					self.data = {};
					self.registerUser = function() {
						ContactService.registerUser(self.data.email,
								self.data.firstName, self.data.lastName).then(
								function(success) {
									console.log(success.data.status)
									alert(success);
								}, function(error) {
									alert(error);
								});
					}
				} ]).controller(
		"CodeReviewController",
		[
				'$location',
				'$scope',
				function($location, $scope) {
					var self = this;
					self.data = {};
					self.loadReviewDetails = function() {
						$location.path("/userstoryreviewdetails");
					}
				} ]);
