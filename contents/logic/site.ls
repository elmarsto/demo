site-controller = ($scope) ->
  console.log "Site initialized"

define <[ ng ]> ->
  angular.module \site <[   ]>
  .controller \Site  [\$scope site-controller]
