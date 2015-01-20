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
            $scope.categories = Cat.query();
        };

        $scope.delCategory = function (delCat) {
            delCat.$delete(function () {
                $scope.categories = Cat.query();
            });
        };   
}]);

app.controller("prodController", ['$scope', '$resource', function ($scope, $resource) {
        var Prod = $resource(
                'http://localhost:8084/PWA_Banque_RestServer/products/:identifiant/:mode',
                {},
                {
                    query: {method: 'GET', isArray: true},
                    save: {method: 'POST'},
                    addSub: {method: 'PUT', params: {identifiant: '@name', mode: 'add'}},
                    delSub: {method: 'PUT', params: {identifiant: '@name', mode: 'del'}},
                    delete: {method: 'DELETE', params: {identifiant: '@name'}}
                }
        );

        function Subscription() {
            this.name;
            this.price;
            this.duration;
        }

        $scope.products = Prod.query();
        
        $scope.newSub = new Subscription();
        $scope.newProd = new Prod();
        $scope.addProduct = function () {
            $scope.newProd.$save();
            
            $scope.newProd = new Prod();
            $scope.newSub = new Subscription();
            $scope.products = Prod.query();
        };
       
        $scope.sub = new Subscription();
        
        $scope.addSub = function (prod) {
            prod.$addSub($scope.sub);
            
            $scope.sub = new Subscription();
        };
        
        $scope.delSub = function (prod, sub) {
            prod.$delSub(sub);
        };      

        $scope.delProduct = function (delProd) {
            delProd.$delete(function () {
                $scope.products = Prod.query();
            });
        };
    }]);