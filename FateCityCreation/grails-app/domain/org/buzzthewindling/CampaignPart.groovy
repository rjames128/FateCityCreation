package org.buzzthewindling

import org.buzzthewindling.enums.CampaignPartType

class CampaignPart {

	String idea
	String aspect
	String locationName
	String locationDescription
	CampaignPartType type
	boolean isLocation
	
    static constraints = {
		idea(maxSize: 60, nullable: true, validator: { ideaPart, part -> 
			part.isLocation ? (ideaPart == null): (ideaPart != null && ideaPart.length() > 3) })
		aspect(maxSize: 30, nullable: true)
		locationName(nullable: true, validator: { locName, part -> 
			part.isLocation ? (locName != null && locName.length() > 3 && locName.length() < 30) : 
				locName == null
		})
		locationDescription(maxSize: 120, nullable: true)
    }
	
	static belongsTo = [ city : City ]
	
	static hasMany = [ faces : Face ]
}
