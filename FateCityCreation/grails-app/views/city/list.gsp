
<%@ page import="org.buzzthewindling.City" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'city.label', default: 'City')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-city" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-city" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="cityName" title="${message(code: 'city.cityName.label', default: 'City Name')}" />
					
						<g:sortableColumn property="campaignTitle" title="${message(code: 'city.campaignTitle.label', default: 'Campaign Title')}" />
					
						<g:sortableColumn property="supernaturalStatusQuo" title="${message(code: 'city.supernaturalStatusQuo.label', default: 'Supernatural Status Quo')}" />
					
						<g:sortableColumn property="mundaneStatusQuo" title="${message(code: 'city.mundaneStatusQuo.label', default: 'Mundane Status Quo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${cityInstanceList}" status="i" var="cityInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${cityInstance.id}">${fieldValue(bean: cityInstance, field: "cityName")}</g:link></td>
					
						<td>${fieldValue(bean: cityInstance, field: "campaignTitle")}</td>
					
						<td>${fieldValue(bean: cityInstance, field: "supernaturalStatusQuo")}</td>
					
						<td>${fieldValue(bean: cityInstance, field: "mundaneStatusQuo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${cityInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
