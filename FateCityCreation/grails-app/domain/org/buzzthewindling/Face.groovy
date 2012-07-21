package org.buzzthewindling

class Face {

	String faceName
	String highConcept
	String motivation
	
    static constraints = {
		faceName(size:3..30)
		highConcept(maxSize:60, nullable: true)
		motivation(maxSize:60, nullable: true)
    }
	
	static hasMany = [
		hasRelationships : Relationship,
		relationshipsWith : Relationship
		]
	
	static mappedBy = [
		hasRelationships : 'hasRelationship',
		relationshipsWith : 'withFace'
		]
	
	static belongsTo = [ campaignPart : CampaignPart ]
}
