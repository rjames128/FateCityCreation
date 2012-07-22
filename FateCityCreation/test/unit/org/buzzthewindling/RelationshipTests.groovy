package org.buzzthewindling

import grails.test.mixin.*
import org.junit.*

import org.buzzthewindling.enums.CampaignPartType

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Relationship)
class RelationshipTests {

    void testEverythingNullSave() {
       def relationship = new Relationship()
	   assertFalse relationship.validate()
	   assertTrue relationship.hasErrors()
	   
	   def errors = relationship.errors
	   assertEquals "nullable", errors.getFieldError("relationshipType").code
    }
	
	void testSave() {
		def campaignPart = new CampaignPart(idea: 'Theme Idea', type: CampaignPartType.Theme)
		def face1 = new Face(faceName: 'Phoenix')
		def face2 = new Face(faceName: 'Phoenix')
		face1.campaignPart = campaignPart
		face2.campaignPart = campaignPart
		def relationship = new Relationship(relationshipType: 'brother')
		relationship.hasRelationship = face1
		relationship.withFace = face2
		
		assertTrue relationship.validate()
		assertFalse relationship.hasErrors()
	 }
	
	void testRelationshipTypeTooShort() {
		def relationship = new Relationship(relationshipType: 'Te')		
		assertFalse relationship.validate()
		assertTrue relationship.hasErrors()
		
		def errors = relationship.errors
		assertEquals "size.toosmall", errors.getFieldError("relationshipType").code
	 }
	
	void testRelationshipTypeTooLong() {
		def relationship = new Relationship(relationshipType: 'The test Relationship with a relationshipType too long')
		assertFalse relationship.validate()
		assertTrue relationship.hasErrors()
		
		def errors = relationship.errors
		assertEquals "size.toobig", errors.getFieldError("relationshipType").code
	 }
}
