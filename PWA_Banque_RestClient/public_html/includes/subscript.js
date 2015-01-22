var app = angular.module("PWA_project", ["ngResource",function($locationProvider){$locationProvider.html5Mode(true);}]); 

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
                    getOrder: {method: 'GET', params: {mode: 'ord'}},
                    save: {method: 'POST'},
                    addSub: {method: 'PUT', params: {identifiant: '@name', mode: 'add'}},
                    delSub: {method: 'PUT', params: {identifiant: '@name', mode: 'del'}},
                    addOrder: {method: 'PUT', params: {identifiant: '@name', mode: 'ord'}},
                    delete: {method: 'DELETE', params: {identifiant: '@name'}}
                }
        );
        
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
            this.prod;
        }
        
        $('#formOrd').modal({
          backdrop: false,
          keyboard: true,
          show: false
        });
        
        $('#formSub').modal({
          backdrop: false,
          keyboard: true,
          show: false
        });
        
        $('#formProd').modal({
          backdrop: false,
          keyboard: true,
          show: false
        });
        
        $scope.products = Prod.query();

        $scope.newSub = new Subscription();
        $scope.newProd = new Prod();
        $scope.addProduct = function () {
            $scope.newProd.$save();
            
            $('#formProd').modal('hide');
            $scope.newProd = new Prod();
            $scope.newSub = new Subscription();
        };
       
        $scope.sub = new Subscription();
        
        $scope.setSub = function (prod) {
            $scope.prodSub = prod;
        };
        
        $scope.addSub = function (prod) {
            prod.$addSub($scope.sub);
            
            $('#formSub').modal('hide');
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
            $scope.newOrder.prod = prod.name;
            
            prod.$addOrder($scope.newOrder);
            
            $('#formOrd').modal('hide');
            $scope.newOrder = new Order();
        };
    }]);

app.controller("ordController", ['$scope', '$resource', '$location', function ($scope, $resource, $location) {
        var Order = $resource(
                'http://localhost:8084/PWA_Banque_RestServer/orders/:id',
                {},
                {
                    getOrder: {method: 'GET', params: {id: '@orderNum'}, isArray: false}
                }
        );

        $scope.ordSet = false;
        $scope.order = Order.getOrder({id:-1});
        
        $scope.toggleSetOrd = function () {
            $scope.ordSet = !$scope.ordSet;
        };
        
        var params = $location.search();
        
        if(params.id >= 0){
            $scope.toggleSetOrd();
            $scope.order = Order.getOrder({id:params.id});
        }
        
        $scope.getOrd = function () {
            $scope.order = Order.getOrder({id:$scope.numOrd});
            $scope.toggleSetOrd();
        };
    }]);