
<%@ page import="org.buzzthewindling.CampaignPart" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'campaignPart.label', default: 'CampaignPart')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-campaignPart" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="createThemeThreat"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-campaignPart" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="idea" title="${message(code: 'campaignPart.idea.label', default: 'Idea')}" />
					
						<g:sortableColumn property="aspect" title="${message(code: 'campaignPart.aspect.label', default: 'Aspect')}" />
					
						<g:sortableColumn property="locationName" title="${message(code: 'campaignPart.locationName.label', default: 'Location Name')}" />
					
						<g:sortableColumn property="locationDescription" title="${message(code: 'campaignPart.locationDescription.label', default: 'Location Description')}" />
					
						<th><g:message code="campaignPart.city.label" default="City" /></th>
					
						<g:sortableColumn property="isLocation" title="${message(code: 'campaignPart.isLocation.label', default: 'Is Location')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${campaignPartInstanceList}" status="i" var="campaignPartInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="showThemeThreat" id="${campaignPartInstance.id}">${fieldValue(bean: campaignPartInstance, field: "idea")}</g:link></td>
					
						<td>${fieldValue(bean: campaignPartInstance, field: "aspect")}</td>
					
						<td>${fieldValue(bean: campaignPartInstance, field: "locationName")}</td>
					
						<td>${fieldValue(bean: campaignPartInstance, field: "locationDescription")}</td>
					
						<td>${fieldValue(bean: campaignPartInstance, field: "city")}</td>
					
						<td><g:formatBoolean boolean="${campaignPartInstance.isLocation}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${campaignPartInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
