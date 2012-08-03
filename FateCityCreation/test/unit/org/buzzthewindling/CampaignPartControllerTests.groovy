package org.buzzthewindling

import org.junit.*
import grails.test.mixin.*

import org.buzzthewindling.enums.CampaignPartType

@TestFor(CampaignPartController)
@Mock(CampaignPart)
class CampaignPartControllerTests {


    def populateValidParams(params) {
      assert params != null
      params["idea"] = 'someValidName'
	  params["city"] = new City(cityName: 'Phoenix')
	  params["type"] = CampaignPartType.Theme
    }

    void testIndex() {
        controller.index()
        assert "/campaignPart/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.campaignPartInstanceList.size() == 0
        assert model.campaignPartInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.createThemeThreat()

       assert model.campaignPartInstance != null
    }

    void testSave() {
        controller.save()

        assert model.campaignPartInstance != null
        assert view == '/campaignPart/createThemeThreat'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/campaignPart/showThemeThreat/1'
        assert controller.flash.message != null
        assert CampaignPart.count() == 1
    }

    void testShow() {
        controller.showThemeThreat()

        assert flash.message != null
        assert response.redirectedUrl == '/campaignPart/list'


        populateValidParams(params)
        def campaignPart = new CampaignPart(params)

        assert campaignPart.save() != null

        params.id = campaignPart.id

        def model = controller.showThemeThreat()

        assert model.campaignPartInstance == campaignPart
    }

    void testEdit() {
        controller.editThemeThreat()

        assert flash.message != null
        assert response.redirectedUrl == '/campaignPart/list'


        populateValidParams(params)
        def campaignPart = new CampaignPart(params)
		campaignPart.validate()
        assert campaignPart.save() != null

        params.id = campaignPart.id

        def model = controller.editThemeThreat()

        assert model.campaignPartInstance == campaignPart
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/campaignPart/list'

        response.reset()


        populateValidParams(params)
        def campaignPart = new CampaignPart(params)

        assert campaignPart.save() != null

        // test invalid parameters in update
        params.id = campaignPart.id
        params.idea = 'Te'

        controller.update()

        assert view == "/campaignPart/editThemeThreat"
        assert model.campaignPartInstance != null

        campaignPart.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/campaignPart/showThemeThreat/$campaignPart.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        campaignPart.clearErrors()

        populateValidParams(params)
        params.id = campaignPart.id
        params.version = -1
        controller.update()

        assert view == "/campaignPart/editThemeThreat"
        assert model.campaignPartInstance != null
        assert model.campaignPartInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/campaignPart/list'

        response.reset()

        populateValidParams(params)
        def campaignPart = new CampaignPart(params)

        assert campaignPart.save() != null
        assert CampaignPart.count() == 1

        params.id = campaignPart.id

        controller.delete()

        assert CampaignPart.count() == 0
        assert CampaignPart.get(campaignPart.id) == null
        assert response.redirectedUrl == '/campaignPart/list'
    }
}
