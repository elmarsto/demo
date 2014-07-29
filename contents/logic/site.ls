site-controller = ($scope) ->
  console.log "Site initialized"

define <[ ng ]> ->
  angular.module \site <[ logo  ]>
  .controller \Site  [\$scope site-controller]
