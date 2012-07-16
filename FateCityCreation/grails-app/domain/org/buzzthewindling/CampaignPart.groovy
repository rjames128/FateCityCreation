package org.buzzthewindling

import org.buzzthewindling.enums.CampaignPartType

class CampaignPart {

	String idea
	String aspect
	String name
	String description
	CampaignPartType type
	boolean isLocation
	
    static constraints = {
    }
	
	static belongsTo = [ city : City ]
	
	static hasMany = [ faces : Face ]
}
