<%@ page import="org.buzzthewindling.CampaignPart" %>



<div class="fieldcontain ${hasErrors(bean: campaignPartInstance, field: 'idea', 'error')} ">
	<label for="idea">
		<g:message code="campaignPart.idea.label" default="Idea" />
		
	</label>
	<g:textField name="idea" maxlength="60" value="${campaignPartInstance?.idea}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: campaignPartInstance, field: 'aspect', 'error')} ">
	<label for="aspect">
		<g:message code="campaignPart.aspect.label" default="Aspect" />
		
	</label>
	<g:textField name="aspect" maxlength="30" value="${campaignPartInstance?.aspect}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: campaignPartInstance, field: 'locationName', 'error')} ">
	<label for="locationName">
		<g:message code="campaignPart.locationName.label" default="Location Name" />
		
	</label>
	<g:textField name="locationName" value="${campaignPartInstance?.locationName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: campaignPartInstance, field: 'locationDescription', 'error')} ">
	<label for="locationDescription">
		<g:message code="campaignPart.locationDescription.label" default="Location Description" />
		
	</label>
	<g:textField name="locationDescription" maxlength="120" value="${campaignPartInstance?.locationDescription}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: campaignPartInstance, field: 'city', 'error')} required">
	<label for="city">
		<g:message code="campaignPart.city.label" default="City" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="city" name="city.id" from="${org.buzzthewindling.City.list()}" optionKey="id" required="" value="${campaignPartInstance?.city?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: campaignPartInstance, field: 'faces', 'error')} ">
	<label for="faces">
		<g:message code="campaignPart.faces.label" default="Faces" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${campaignPartInstance?.faces?}" var="f">
    <li><g:link controller="face" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="face" action="create" params="['campaignPart.id': campaignPartInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'face.label', default: 'Face')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: campaignPartInstance, field: 'isLocation', 'error')} ">
	<label for="isLocation">
		<g:message code="campaignPart.isLocation.label" default="Is Location" />
		
	</label>
	<g:checkBox name="isLocation" value="${campaignPartInstance?.isLocation}" />
</div>

<div class="fieldcontain ${hasErrors(bean: campaignPartInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="campaignPart.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${org.buzzthewindling.enums.CampaignPartType?.values()}" keys="${org.buzzthewindling.enums.CampaignPartType.values()*.name()}" required="" value="${campaignPartInstance?.type?.name()}"/>
</div>

