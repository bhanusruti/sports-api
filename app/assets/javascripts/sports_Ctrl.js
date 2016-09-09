
(function () {
  "use strict";

  angular.module("app").controller("sportsCtrl", function($scope, $http) {

    $scope.setup = function() {
      $http.get("/api/v1/sports.json").then(function(response) {
        $scope.sports = response.data;
      }, function(error) {

      });
    }

    // $scope.toggleBio = function(sport) {
    //   sport.bioVisible = !sport.bioVisible;
    // }

    $scope.addSport = function(newName, newPlayers) {
      var sport = {
        name: newName,
        players: newPlayers
        
      };
      $http.post("/api/v1/sports.json", sport).then(function(response) {
        $scope.sports.push(response.data);
      }, function(error) {
        $scope.errors = error.data.errors;
      });
    }

    $scope.deleteSport = function(sport) {
      console.log(sport);
      $http.delete("api/v1/sports/" + sport.id).then(function(response){
        console.log("success!");
        var index = $scope.sports.indexOf(sport);
        $scope.sport.splice(index, 1);
      },function(error){
        console.log("fail!");
        $scope.deleteErrors = error.data.errors;
      });
    }

    $scope.toogleByAttribute = function(attribute){
      if(attribute == $scope.orderAttribute){
        $scope.descending = !$scope.descending
      } else{
        $scope.orderAttribute = attribute;
      }
    }

    window.$scope = $scope;
  });
})();