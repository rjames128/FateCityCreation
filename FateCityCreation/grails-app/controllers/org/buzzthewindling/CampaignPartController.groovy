package org.buzzthewindling

import org.springframework.dao.DataIntegrityViolationException

class CampaignPartController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [campaignPartInstanceList: CampaignPart.list(params), campaignPartInstanceTotal: CampaignPart.count()]
    }

    def createThemeThreat() {
        [campaignPartInstance: new CampaignPart(params)]
    }
	
	def createLocation() {
		[campaignPartInstance: new CampaignPart(params)]
	}

    def save() {
        def campaignPartInstance = new CampaignPart(params)
        if (!campaignPartInstance.save(flush: true)) {
            render(view: "createThemeThreat", model: [campaignPartInstance: campaignPartInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'campaignPart.label', default: 'CampaignPart'), campaignPartInstance.id])
        redirect(action: "showThemeThreat", id: campaignPartInstance.id)
    }

    def showThemeThreat() {
        def campaignPartInstance = CampaignPart.get(params.id)
        if (!campaignPartInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'campaignPart.label', default: 'CampaignPart'), params.id])
            redirect(action: "list")
            return
        }

        [campaignPartInstance: campaignPartInstance]
    }
	
	def showLocation() {
		def campaignPartInstance = CampaignPart.get(params.id)
		if (!campaignPartInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'campaignPart.label', default: 'CampaignPart'), params.id])
			redirect(action: "list")
			return
		}

		[campaignPartInstance: campaignPartInstance]
	}

    def editThemeThreat() {
        def campaignPartInstance = CampaignPart.get(params.id)
        if (!campaignPartInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'campaignPart.label', default: 'CampaignPart'), params.id])
            redirect(action: "list")
            return
        }

        [campaignPartInstance: campaignPartInstance]
    }
	
	def editLocation() {
		def campaignPartInstance = CampaignPart.get(params.id)
		if (!campaignPartInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'campaignPart.label', default: 'CampaignPart'), params.id])
			redirect(action: "list")
			return
		}

		[campaignPartInstance: campaignPartInstance]
	}

    def update() {
        def campaignPartInstance = CampaignPart.get(params.id)
        if (!campaignPartInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'campaignPart.label', default: 'CampaignPart'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (campaignPartInstance.version > version) {
                campaignPartInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'campaignPart.label', default: 'CampaignPart')] as Object[],
                          "Another user has updated this CampaignPart while you were editing")
                render(view: "editThemeThreat", model: [campaignPartInstance: campaignPartInstance])
                return
            }
        }

        campaignPartInstance.properties = params

        if (!campaignPartInstance.save(flush: true)) {
            render(view: "editThemeThreat", model: [campaignPartInstance: campaignPartInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'campaignPart.label', default: 'CampaignPart'), campaignPartInstance.id])
        redirect(action: "showThemeThreat", id: campaignPartInstance.id)
    }

    def delete() {
        def campaignPartInstance = CampaignPart.get(params.id)
        if (!campaignPartInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'campaignPart.label', default: 'CampaignPart'), params.id])
            redirect(action: "list")
            return
        }

        try {
            campaignPartInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'campaignPart.label', default: 'CampaignPart'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'campaignPart.label', default: 'CampaignPart'), params.id])
            redirect(action: "showThemeThreat", id: params.id)
        }
    }
}
