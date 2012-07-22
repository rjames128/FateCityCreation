package org.buzzthewindling

import grails.test.mixin.*
import org.junit.*

import org.buzzthewindling.enums.CampaignPartType
/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(CampaignPart)
class CampaignPartTests {

    void testEverythingNullSave() {
       def campaignPart = new CampaignPart()
	   campaignPart.validate()
	   
	   assertFalse campaignPart.validate()
	   assertTrue campaignPart.hasErrors()
	   
	   def errors = campaignPart.errors
	   assertEquals "validator.invalid", errors.getFieldError("idea").code
    }
	
	void testSave() {
		def city = new City(cityName: 'Phoenix')
		def campaignPart = new CampaignPart(type: CampaignPartType.Theme, idea: 'A city theme idea')
		campaignPart.city = city
		
		campaignPart.validate()
		def errors = campaignPart.errors
		
		assertTrue campaignPart.validate()
		assertFalse campaignPart.hasErrors()
	 }
	
	void testNoIdeaError() {
		def city = new City(cityName: 'Phoenix')
		def campaignPart = new CampaignPart(type: CampaignPartType.Theme)
		campaignPart.city = city
		assertFalse campaignPart.validate()
		assertTrue campaignPart.hasErrors()
		
		def errors = campaignPart.errors
		assertEquals "validator.invalid", errors.getFieldError("idea").code
	}
	
	void testShortIdeaError() {
		def city = new City(cityName: 'Phoenix')
		def campaignPart = new CampaignPart(type: CampaignPartType.Theme, idea: 'Te')
		campaignPart.city = city
		assertFalse campaignPart.validate()
		assertTrue campaignPart.hasErrors()
		
		def errors = campaignPart.errors
		assertEquals "validator.invalid", errors.getFieldError("idea").code
	}
	
	void testLongIdeaError() {
		def city = new City(cityName: 'Phoenix')
		def campaignPart = new CampaignPart(type: CampaignPartType.Theme, 
			idea: 'The idea behind a City theme, that is too long. This is an idea')
		campaignPart.city = city
		assertFalse campaignPart.validate()
		assertTrue campaignPart.hasErrors()
		
		def errors = campaignPart.errors
		assertEquals "maxSize.exceeded", errors.getFieldError("idea").code
	}
	
	void testLocationNoIdeaError() {
		def city = new City(cityName: 'Phoenix')
		def campaignPart = new CampaignPart(type: CampaignPartType.Theme, isLocation: true,
			locationName: "Govonor Hunt's Tomb")
		campaignPart.city = city
		
		campaignPart.validate()
		def errors = campaignPart.errors
		
		assertTrue campaignPart.validate()
		assertFalse campaignPart.hasErrors()
	}
	
	void testLocationLocationNameTooShortError() {
		def city = new City(cityName: 'Phoenix')
		def campaignPart = new CampaignPart(type: CampaignPartType.Theme, isLocation: true,
			locationName: "Te")
		campaignPart.city = city
		
		assertFalse campaignPart.validate()
		assertTrue campaignPart.hasErrors()
		
		def errors = campaignPart.errors
		assertEquals "validator.invalid", errors.getFieldError("locationName").code
	}
	
	void testLocationLocationNameTooLongError() {
		def city = new City(cityName: 'Phoenix')
		def campaignPart = new CampaignPart(type: CampaignPartType.Theme, isLocation: true,
			locationName: "Govonor Hunt's Tomb, Govonor Hunt's Tomb")
		campaignPart.city = city
		
		assertFalse campaignPart.validate()
		assertTrue campaignPart.hasErrors()
		
		def errors = campaignPart.errors
		assertEquals "validator.invalid", errors.getFieldError("locationName").code
	}
}
