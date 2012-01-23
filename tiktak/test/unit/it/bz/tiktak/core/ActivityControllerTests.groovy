package it.bz.tiktak.core

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(ActivityController)
@Mock(Activity)
class ActivityControllerTests {

	void testIndex() {
        controller.index()
		
		assert response.redirectedUrl == '/activity/list'
    }
	
	void testModelMethods() {
		controller.model = Activity
		
		def testValue = controller.getModelName()
		assert testValue == 'Activity'
		
		testValue = controller.getModelLabel()
		assert testValue == 'activity.label'

		testValue = controller.getModelXmlKey()
		assert testValue == 'activity'
		
		testValue = controller.getInstanceListKey()
		assert testValue == 'activityInstanceList'
		
		testValue = controller.getInstanceKey()
		assert testValue == 'activityInstance'

		testValue = controller.getInstanceTotalKey()
		assert testValue == 'activityInstanceTotal'
	}
	
	
	
}
