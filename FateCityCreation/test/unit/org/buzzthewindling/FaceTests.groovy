package org.buzzthewindling

import grails.test.mixin.*
import org.junit.*

import org.buzzthewindling.enums.CampaignPartType

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Face)
class FaceTests {

    void testEverythingNullSave() {
       def face = new Face()
	   assertFalse face.validate()
	   assertTrue face.hasErrors()
	   
	   def errors = face.errors
	   assertEquals "nullable", errors.getFieldError("faceName").code
    }
	
	void testSave() {
		def face = new Face(faceName: 'Phoenix')
		face.campaignPart = new CampaignPart ( idea: 'Theme Idea', type: CampaignPartType.Theme )
		assertTrue face.validate()
		assertFalse face.hasErrors()
	 }
	
	void testFaceNameTooShort() {
		def face = new Face(faceName: 'Te')		
		assertFalse face.validate()
		assertTrue face.hasErrors()
		
		def errors = face.errors
		assertEquals "size.toosmall", errors.getFieldError("faceName").code
	 }
	
	void testFaceNameTooLong() {
		def face = new Face(faceName: 'The test face with a name too long')
		assertFalse face.validate()
		assertTrue face.hasErrors()
		
		def errors = face.errors
		assertEquals "size.toobig", errors.getFieldError("faceName").code
	 }
	
	void testHighConceptTooLong() {
		def face = new Face(faceName: 'Phoenix', 
			highConcept: 'The test face with a highConcept too long, The test highConcept with a name too long')
		assertFalse face.validate()
		assertTrue face.hasErrors()
		
		def errors = face.errors
		assertEquals "maxSize.exceeded", errors.getFieldError("highConcept").code
	 }
	
	void testMotivationTooLong() {
		def face = new Face(faceName: 'Phoenix',
			motivation: 'The test face with a motivation too long, The test motivation with a name too long')
		assertFalse face.validate()
		assertTrue face.hasErrors()
		
		def errors = face.errors
		assertEquals "maxSize.exceeded", errors.getFieldError("motivation").code
	 }
}
