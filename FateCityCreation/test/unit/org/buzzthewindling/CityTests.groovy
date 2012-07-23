package org.buzzthewindling

import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(City)
class CityTests {

    void testEverythingNullSave() {
       def city = new City()
	   assertFalse city.validate()
	   assertTrue city.hasErrors()
	   
	   def errors = city.errors
	   assertEquals "nullable", errors.getFieldError("cityName").code
    }
	
	void testSave() {
		def city = new City(cityName: 'Phoenix')
		assertTrue city.validate()
		assertFalse city.hasErrors()
	 }
	
	void testCityNameBlank() {
		def city = new City(cityName: '')
		assertFalse city.validate()
		assertTrue city.hasErrors()
		
		def errors = city.errors
		assertEquals "blank", errors.getFieldError("cityName").code
	 }
	
	void testCityNameTooShort() {
		def city = new City(cityName: 'Te')		
		assertFalse city.validate()
		assertTrue city.hasErrors()
		
		def errors = city.errors
		assertEquals "size.toosmall", errors.getFieldError("cityName").code
	 }
	
	void testCityNameTooLong() {
		def city = new City(cityName: 'The test city with a name too long')
		assertFalse city.validate()
		assertTrue city.hasErrors()
		
		def errors = city.errors
		assertEquals "size.toobig", errors.getFieldError("cityName").code
	 }
	
	void testCampaignTitleTooLong() {
		def city = new City(cityName: 'Phoenix', 
			campaignTitle: 'The test city with a campaignTitle too long, The test campaignTitle with a name too long')
		assertFalse city.validate()
		assertTrue city.hasErrors()
		
		def errors = city.errors
		assertEquals "maxSize.exceeded", errors.getFieldError("campaignTitle").code
	 }
	
	void testSupernaturalStatusQuoTooLong() {
		def city = new City(cityName: 'Phoenix',
			supernaturalStatusQuo: 'The test city with a supernaturalStatusQuo too long, The test city with a supernaturalStatusQuo too long The test city with a supernaturalStatusQuo too long, The test city with a supernaturalStatusQuo too long The test city with a supernaturalStatusQuo too long, The test city with a supernaturalStatusQuo too long The test city with a supernaturalStatusQuo too long, The test city with a supernaturalStatusQuo too long')
		assertFalse city.validate()
		assertTrue city.hasErrors()
		
		def errors = city.errors
		assertEquals "maxSize.exceeded", errors.getFieldError("supernaturalStatusQuo").code
	 }
	
	void testMundaneStatusQuoTooLong() {
		def city = new City(cityName: 'Phoenix',
			mundaneStatusQuo: 'The test city with a mundaneStatusQuo too long, The test city with a mundaneStatusQuo too long The test city with a mundaneStatusQuo too long, The test city with a mundaneStatusQuo too long The test city with a mundaneStatusQuo too long, The test city with a mundaneStatusQuo too long The test city with a mundaneStatusQuo too long, The test city with a mundaneStatusQuo too long')
		assertFalse city.validate()
		assertTrue city.hasErrors()
		
		def errors = city.errors
		assertEquals "maxSize.exceeded", errors.getFieldError("mundaneStatusQuo").code
	 }
}
