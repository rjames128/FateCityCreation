
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
