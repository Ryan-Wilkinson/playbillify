angular
  .module('playbillifyApp')
  .service('OrganizationsService', OrganizationsService);

OrganizationsService.$inject = ['$http', '$stateParams'];

function OrganizationsService($http, $stateParams) {
  const self = this;

  self.loadOrgDetails = loadOrgDetails;
  self.addOrganization = addOrganization;


  function loadOrgDetails() {
    var orgId = $stateParams.id;
    console.log('loadThisUsersOrgs function fired')
    return $http
      .get('/api/organizations/' + orgId)
  };

  function addOrganization(newOrg) {
  	return $http
  	.post('/api/organizations', newOrg)
  }

}
