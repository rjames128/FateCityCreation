
<%@ page import="org.buzzthewindling.CampaignPart" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'campaignPart.label', default: 'Theme or Threat')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-campaignPart" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="createThemeThreat"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-campaignPart" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list campaignPart">
			
				<g:if test="${campaignPartInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="campaignPart.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${campaignPartInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${campaignPartInstance?.idea}">
				<li class="fieldcontain">
					<span id="idea-label" class="property-label"><g:message code="campaignPart.idea.label" default="Idea" /></span>
					
						<span class="property-value" aria-labelledby="idea-label"><g:fieldValue bean="${campaignPartInstance}" field="idea"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${campaignPartInstance?.aspect}">
				<li class="fieldcontain">
					<span id="aspect-label" class="property-label"><g:message code="campaignPart.aspect.label" default="Aspect" /></span>
					
						<span class="property-value" aria-labelledby="aspect-label"><g:fieldValue bean="${campaignPartInstance}" field="aspect"/></span>
					
				</li>
				</g:if>
							
				<g:if test="${campaignPartInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="campaignPart.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:link controller="city" action="show" id="${campaignPartInstance?.city?.id}">${campaignPartInstance?.city?.cityName}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${campaignPartInstance?.faces}">
				<li class="fieldcontain">
					<span id="faces-label" class="property-label"><g:message code="campaignPart.faces.label" default="Faces" /></span>
					
						<g:each in="${campaignPartInstance.faces}" var="f">
						<span class="property-value" aria-labelledby="faces-label"><g:link controller="face" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${campaignPartInstance?.id}" />
					<g:link class="edit" action="editThemeThreat" id="${campaignPartInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
