
<%@ page import="org.buzzthewindling.City" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'city.label', default: 'City')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-city" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-city" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list city">
			
				<g:if test="${cityInstance?.cityName}">
				<li class="fieldcontain">
					<span id="cityName-label" class="property-label"><g:message code="city.cityName.label" default="City Name" /></span>
					
						<span class="property-value" aria-labelledby="cityName-label"><g:fieldValue bean="${cityInstance}" field="cityName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cityInstance?.campaignTitle}">
				<li class="fieldcontain">
					<span id="campaignTitle-label" class="property-label"><g:message code="city.campaignTitle.label" default="Campaign Title" /></span>
					
						<span class="property-value" aria-labelledby="campaignTitle-label"><g:fieldValue bean="${cityInstance}" field="campaignTitle"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cityInstance?.campaignParts?.any {it -> !it.isLocation} }">
				<li class="fieldcontain">
					<span id="themeThreat-label" class="property-label"><g:message code="city.themeThreat.label" default="Themes and Threats" /></span>
					<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="idea" title="${message(code: 'campaignPart.idea.label', default: 'Idea')}" />
					
						<g:sortableColumn property="aspect" title="${message(code: 'campaignPart.aspect.label', default: 'Aspect')}" />
						
						<g:sortableColumn property="type" title="${message(code: 'campaignPart.type.label', default: 'Theme or Threat')}" />
					
					</tr>
				</thead>
				<tbody>
					<g:findAll in="${cityInstance?.campaignParts}" expr="!it.isLocation">
					<tr>
					
						<td><g:link action="showThemeThreat" controller="CampaignPart" id="${it.id}">${fieldValue(bean: it, field: "idea")}</g:link></td>
						
						<td>${fieldValue(bean: it, field: "aspect")}</td>
						
						<td>${fieldValue(bean: it, field: "type")}</td>
					
						</tr>
					</g:findAll>
					</tbody>
					</table>
				</li>
				</g:if>				
				
				<g:link controller="campaignPart" action="createThemeThreat" params="['city.id': cityInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'themeThreat.label', default: 'Theme or Threat')])}</g:link>				
				
				<g:if test="${cityInstance?.supernaturalStatusQuo}">
				<li class="fieldcontain">
					<span id="supernaturalStatusQuo-label" class="property-label"><g:message code="city.supernaturalStatusQuo.label" default="Supernatural Status Quo" /></span>
					
						<span class="property-value" aria-labelledby="supernaturalStatusQuo-label"><g:fieldValue bean="${cityInstance}" field="supernaturalStatusQuo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cityInstance?.mundaneStatusQuo}">
				<li class="fieldcontain">
					<span id="mundaneStatusQuo-label" class="property-label"><g:message code="city.mundaneStatusQuo.label" default="Mundane Status Quo" /></span>
					
						<span class="property-value" aria-labelledby="mundaneStatusQuo-label"><g:fieldValue bean="${cityInstance}" field="mundaneStatusQuo"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${cityInstance?.campaignParts?.any {it -> it.isLocation} }">
				<li class="fieldcontain">
					<span id="themeThreat-label" class="property-label"><g:message code="city.themeThreat.label" default="Locations" /></span>
					<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="locationName" title="${message(code: 'campaignPart.idea.label', default: 'Location Name')}" />
					
						<g:sortableColumn property="locationDescription" title="${message(code: 'campaignPart.aspect.label', default: 'Description')}" />
						
						<g:sortableColumn property="type" title="${message(code: 'campaignPart.type.label', default: 'Theme or Threat')}" />
					
					</tr>
				</thead>
				<tbody>
					<g:findAll in="${cityInstance?.campaignParts}" expr="it.isLocation">
					<tr>
					
						<td><g:link action="showLocation" controller="CampaignPart" id="${it.id}">${fieldValue(bean: it, field: "locationName")}</g:link></td>
						
						<td>${fieldValue(bean: it, field: "locationDescription")}</td>
						
						<td>${fieldValue(bean: it, field: "type")}</td>
					
						</tr>
					</g:findAll>
					</tbody>
					</table>
				</li>
				</g:if>				
				
				<g:link controller="campaignPart" action="createLocation" params="['city.id': cityInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'themeThreat.label', default: 'Location')])}</g:link>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${cityInstance?.id}" />
					<g:link class="edit" action="edit" id="${cityInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
