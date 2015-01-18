var app = angular.module("PWA_project", ["ngResource", "ngRoute"]); 

app.config(['$routeProvider', function ($routeProvider) {
        $routeProvider.when('/Abonnements', {
            templateUrl: 'subscriptions.html',
            controller: 'subController'
        }).when('/Accueil', {
            templateUrl: 'index.html'
        }).otherwise({
            redirectTo: '/Accueil'
        });
    }]);

app.controller("catController", ['$scope', '$resource', function ($scope, $resource) {     
        var Cat = $resource(
                'http://localhost:8084/PWA_Banque_RestServer/categories/:identifiant',
                {},
                {
                    query: {method: 'GET', isArray:true},
                    save: {method: 'PUT'},
                    delete: {method: 'DELETE', params: {identifiant: '@name'}}
                }
        );

        $scope.categories = Cat.query();

        $scope.newCat = new Cat();
        $scope.addCategory = function () {
            $scope.newCat.$save();
            $scope.newCat = new Cat();
        };

        $scope.delCategory = function (delCat) {
            delCat.$delete(function () {
                $scope.categories = Cat.query();
            });
        };   
}]);

app.controller("subController", ['$scope', '$resource', function ($scope, $resource) {     
        var Sub = $resource(
                'http://localhost:8084/PWA_Banque_RestServer/subscriptions/:identifiant',
                {},
                {
                    query: {method: 'GET', isArray:true},
                    save: {method: 'PUT'},
                    delete: {method: 'DELETE', params: {identifiant: '@name'}}
                }
        );

        $scope.subscriptions = Sub.query();

        $scope.newsub = new Sub();
        $scope.addSubscription = function () {
            $scope.newSub.$save();
            $scope.newSub = new Sub();
        };

        $scope.delSubscription = function (delSub) {
            delSub.$delete(function () {
                $scope.subscriptions = Sub.query();
            });
        };
    }]);