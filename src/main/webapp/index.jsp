<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
 
 <style>
 .navbar { border-radius:0; }
 /* .navbar navbar-inverse
 {
 } */
 </style>

<!-- JS (load angular, ui-router, and our custom js file) -->
<script src="http://code.angularjs.org/1.2.13/angular.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/angular-ui-router/0.2.8/angular-ui-router.min.js"></script>
  
</head>


<body ng-app="routerApp">


<nav class="navbar navbar-inverse" role="navigation" style="  background-color: #800000;">
    <div class="navbar-header">
        <a class="navbar-brand" ui-sref="foodie">Foodie</a>
    </div>
    <ul class="nav navbar-nav">
        <li><a ui-sref="home">Home</a></li>
        <li><a ui-sref="about">About</a></li>
         <li><a ui-sref="contact">Contact</a></li>
    </ul>
</nav>


<!-- MAIN CONTENT -->
<div class="container">

    <!-- THIS IS WHERE WE WILL INJECT OUR CONTENT ============================== -->
    <div ui-view></div>

</div>

</body>


<script>
var routerApp = angular.module('routerApp', ['ui.router']);

routerApp.config(function($stateProvider, $urlRouterProvider) {

  $urlRouterProvider.otherwise('/home'); 

    $stateProvider
       .state('home', {
            url: '/home',
            templateUrl: 'partial-home.html'
        })
        
         .state('foodie', {
            url: '/foodie',
            templateUrl: 'foodie.html'
        })
   
    .state('home.veg', {
        url: '/veg',
        templateUrl: 'partial-home-list.html',
        controller: function($scope) {
            $scope.veg_food = ['Paneer Makhani Biryani', 'Malai Kofta (Veggie Balls in a Thick Sauce)', 'Aaloo Paratha (Potato Paratha)','Kaali Daal (Black Lentils)'];
        }
    })

   
    .state('home.non-veg', {
        url: '/non-veg',
        template: 'Sorry,Non-Veg not Available now!!'
    })
    
     .state('contact', {
        url: '/contact',
        views: {

            // the main template will be placed here (relatively named)
            '': { templateUrl: 'contact.html' },

            // the child views will be defined here (absolutely named)
            'viewA@contact': { template: 'Phone Number:044-2329-459' },

            // for column two, we'll define a separate controller 
            'viewB@contact': { 
                template: 'Mobile Number:9444626495'
                
                
            },
            
            'viewC@contact': { 
                templateUrl: 'contact-display.html'
                
                
            }
        }

    })
     
    
   .state('about', {
          url: '/about',
          views: {

              // the main template will be placed here (relatively named)
              '': { templateUrl: 'partial-about.html' },

              // the child views will be defined here (absolutely named)
              'columnOne@about': { template: 'We have Good crispy taste foods with lot of hygenic!' },

              // for column two, we'll define a separate controller 
              'columnTwo@about': { 
                  templateUrl: 'table-data.html',
                  controller: 'scotchController'
                  
              }
          }

      });
   

});//closed our route config



routerApp.controller('scotchController', function($scope) {

    $scope.message = 'test';

    $scope.scotches = [
        {
            name:'Chettinadu Chicken',
            price: 380
        },
        {
            name: 'Parotta with Paneer Butter Masala',
            price: 100
            
        },
        {
            name: 'Malabar Fish Biryani. ',
            price: 560
        },
        {
            name: 'Curried Parmesan Fish Fingers',
            price:390
        },
        {
            name: 'Chicken 65',
            price: 458
        },
        {
            name: 'Mutton Biriyani',
            price: 300
        },
        {
            name: 'Fish Biriyani',
            price: 200
        },
        {
            name: 'Chappathi with salmon curry recipie',
            price: 400
        }
        
    ];

});

/* 
routerApp.controller('contactController', function($scope) {

    $scope.message = 'test';

    $scope.contacts = [
        {
            Landline-number:'044-232395',
            mobile number:9003636495
        }
       
        
    ];

}); */
</script>
</html>







