package org.buzzthewindling

class Relationship {

	Face hasRelationship
	String relationshipType
	Face withFace

    static constraints = {
		relationshipType(size:3..30)
    }
	
}
