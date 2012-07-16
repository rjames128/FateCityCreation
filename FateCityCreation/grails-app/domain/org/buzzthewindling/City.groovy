package org.buzzthewindling

class City {
	String cityName
	String campaignTitle
	String supernaturalStatusQuo
	String mundaneStatusQuo
	
    static constraints = {
    }
	
	static hasMany = {
		campaignParts : CampaignPart
	}
}
