package it.bz.tiktak.core

import it.bz.tiktak.core.Service;
import it.bz.tiktak.core.ServiceController;

import org.junit.*
import grails.test.mixin.*

@TestFor(ServiceController)
@Mock(Service)
class ServiceControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/service/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.serviceInstanceList.size() == 0
        assert model.serviceInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.serviceInstance != null
    }

    void testSave() {
        controller.save()

        assert model.serviceInstance != null
        assert view == '/service/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/service/show/1'
        assert controller.flash.message != null
        assert Service.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/service/list'


        populateValidParams(params)
        def service = new Service(params)

        assert service.save() != null

        params.id = service.id

        def model = controller.show()

        assert model.serviceInstance == service
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/service/list'


        populateValidParams(params)
        def service = new Service(params)

        assert service.save() != null

        params.id = service.id

        def model = controller.edit()

        assert model.serviceInstance == service
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/service/list'

        response.reset()


        populateValidParams(params)
        def service = new Service(params)

        assert service.save() != null

        // test invalid parameters in update
        params.id = service.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/service/edit"
        assert model.serviceInstance != null

        service.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/service/show/$service.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        service.clearErrors()

        populateValidParams(params)
        params.id = service.id
        params.version = -1
        controller.update()

        assert view == "/service/edit"
        assert model.serviceInstance != null
        assert model.serviceInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/service/list'

        response.reset()

        populateValidParams(params)
        def service = new Service(params)

        assert service.save() != null
        assert Service.count() == 1

        params.id = service.id

        controller.delete()

        assert Service.count() == 0
        assert Service.get(service.id) == null
        assert response.redirectedUrl == '/service/list'
    }
}
