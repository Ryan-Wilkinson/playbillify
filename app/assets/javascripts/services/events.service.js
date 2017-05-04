angular
  .module('playbillifyApp')
  .service('EventsService', EventsService);

EventsService.$inject = ['$http', '$stateParams'];

function EventsService($http, $stateParams) {
  const self = this;

  self.addEvent = addEvent;

  function addEvent(newEvent) {
    console.log(newEvent)
    var orgId = $stateParams.id;
    return $http
    .post('/api/organizations/' + orgId + '/events', newEvent);
  }

}
