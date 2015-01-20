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
                    addOrder: {method: 'PUT', params: {identifiant: '@name', mode: 'ord'}},
                    delete: {method: 'DELETE', params: {identifiant: '@name'}}
                }
        );

        var regexEmail = /^[a-z0-9._-]+@[a-z0-9._-]{2,}\.[a-z]{2,4}$/;
        
        function Subscription() {
            this.name;
            this.price;
            this.duration;
        }
        
        function Order() {
            this.firstName;
            this.lastName;
            this.email;
            this.iban;
            this.sub;
        }
        
        $('#formOrd').modal({
          backdrop: false,
          keyboard: true,
          show: false
        });
        
        $scope.products = Prod.query();

        $scope.newSub = new Subscription();
        $scope.newProd = new Prod();
        $scope.addProduct = function () {
            $scope.newProd.$save();
            
            $scope.newProd = new Prod();
            $scope.newSub = new Subscription();
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
        
        $scope.newOrder = new Order();
        $scope.setOrder = function(prod, sub){
            $scope.subOrder = sub;
            $scope.prodOrder = prod;
        };
        
        $scope.addOrder = function (prod) {
            $scope.newOrder.sub = $scope.subOrder.name;
            if($scope.newOrder.firstName === null || $scope.newOrder.lastName === null || $scope.newOrder.email === null || $scope.newOrder.iban === null || $scope.newOrder.sub === null){
                if (regexEmail.test($scope.newOrder.email)) {
                    prod.$addOrder($scope.newOrder);
                }
                else {
                    alert("Adresse mail invalide.");
                }
            }
            else{
                alert("Paramètre manquant");
            }
            $scope.newOrder = new Order();
        };
    }]);