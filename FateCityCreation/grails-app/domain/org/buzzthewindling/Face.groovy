package org.buzzthewindling

class Face {

	String faceName
	String highConcept
	String motivation
	
    static constraints = {
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
