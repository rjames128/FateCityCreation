package org.buzzthewindling

import grails.test.mixin.*
import org.junit.*

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
		def relationship = new Relationship(faceName: 'brother')
		assertTrue relationship.validate()
		assertFalse relationship.hasErrors()
	 }
	
	void testRelationshipTypeTooShort() {
		def relationship = new Relationship(faceName: 'Te')		
		assertFalse relationship.validate()
		assertTrue relationship.hasErrors()
		
		def errors = relationship.errors
		assertEquals "size.toosmall", errors.getFieldError("relationshipType").code
	 }
	
	void testRelationshipTypeTooLong() {
		def relationship = new Relationship(faceName: 'The test Relationship with a relationshipType too long')
		assertFalse relationship.validate()
		assertTrue relationship.hasErrors()
		
		def errors = relationship.errors
		assertEquals "size.toobig", errors.getFieldError("relationshipType").code
	 }
}
