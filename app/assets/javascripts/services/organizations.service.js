angular
  .module('playbillifyApp')
  .service('OrganizationsService', OrganizationsService);

OrganizationsService.$inject = ['$http', '$stateParams'];

function OrganizationsService($http, $stateParams) {
  const self = this;

  self.loadOrgDetails = loadOrgDetails;


  function loadOrgDetails() {
    var orgId = $stateParams.id;
    console.log('loadThisUsersOrgs function fired')
    return $http
      .get('/api/organizations/' + orgId)
  };

}
