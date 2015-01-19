var app = angular.module("PWA_project", ["ngResource", "ngRoute"]); 

app.config(['$routeProvider', function ($routeProvider) {
        $routeProvider.when('/Produits', {
            templateUrl: 'products.html',
            controller: 'prodController'
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

app.controller("prodController", ['$scope', '$resource', function ($scope, $resource) {
        var Prod = $resource(
                'http://localhost:8084/PWA_Banque_RestServer/products/:identifiant',
                {},
                {
                    query: {method: 'GET', isArray: true},
                    save: {method: 'PUT'},
                    delete: {method: 'DELETE', params: {identifiant: '@name'}}
                }
        );

        $scope.products = Prod.query();

        $scope.newProd = new Prod();
        $scope.addProduct = function () {
            $scope.newProd.$save();
            $scope.newProd = new Prod();
        };

        $scope.delProduct = function (delProd) {
            delProd.$delete(function () {
                $scope.products = Prod.query();
            });
        };
    }]);