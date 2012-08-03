package org.buzzthewindling

class City {
	String cityName
	String campaignTitle
	String supernaturalStatusQuo
	String mundaneStatusQuo
	
    static constraints = {
		cityName(size:3..30, blank: false)
		campaignTitle(maxSize:60, nullable: true)
		supernaturalStatusQuo(maxSize:240, nullable: true)
		mundaneStatusQuo(maxSize:240, nullable: true)
    }
	
	static hasMany = [
		campaignParts : CampaignPart
	]
}
