var app = angular.module("PWA_project", []); 

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

app.controller("subController", ['$scope', '$resource', function ($scope, $resource) {
        var Sub = $resource(
                'http://localhost:8084/PWA_Banque_RestServer/subscriptions/:identifiant',
                {},
                {
                    save: {method: 'PUT'},
                    delete: {method: 'DELETE', params: {identifiant: '@name'}}
                }
        );

        $scope.subscriptions = Sub.query();

        $scope.newsub = new Sub();
        $scope.addSubscription = function () {
            $scope.newSub.$save(function (addSub) {
                $scope.subscriptions.push(addSub);
            });
            $scope.newSub = new Sub();
        };

        $scope.delSubscription = function (delSub) {
            delSub.$delete(function () {
                $scope.subscriptions = Sub.query();
            });
        }
        
        var Cat = $resource(
                'http://localhost:8084/PWA_Banque_RestServer/categories/:identifiant',
                {},
                {
                    save: {method: 'PUT'},
                    delete: {method: 'DELETE', params: {identifiant: '@name'}}
                }
        );

        $scope.categories = Cat.query();

        $scope.newCat = new Cat();
        $scope.addCategory = function () {
            $scope.newCat.$save(function (addCat) {
                $scope.categories.push(addCat);
            });
            $scope.newCat = new Cat();
        };

        $scope.delCategory = function (delCat) {
            delCat.$delete(function () {
                $scope.categories = Cat.query();
            });
        }      
        
    }]);