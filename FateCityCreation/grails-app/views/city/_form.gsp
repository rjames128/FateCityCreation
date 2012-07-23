<%@ page import="org.buzzthewindling.City" %>



<div class="fieldcontain ${hasErrors(bean: cityInstance, field: 'cityName', 'error')} ">
	<label for="cityName">
		<g:message code="city.cityName.label" default="City Name" />
		
	</label>
	<g:textField name="cityName" maxlength="30" value="${cityInstance?.cityName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cityInstance, field: 'campaignTitle', 'error')} ">
	<label for="campaignTitle">
		<g:message code="city.campaignTitle.label" default="Campaign Title" />
		
	</label>
	<g:textField name="campaignTitle" maxlength="60" value="${cityInstance?.campaignTitle}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cityInstance, field: 'supernaturalStatusQuo', 'error')} ">
	<label for="supernaturalStatusQuo">
		<g:message code="city.supernaturalStatusQuo.label" default="Supernatural Status Quo" />
		
	</label>
	<g:textArea name="supernaturalStatusQuo" maxlength="240" value="${cityInstance?.supernaturalStatusQuo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cityInstance, field: 'mundaneStatusQuo', 'error')} ">
	<label for="mundaneStatusQuo">
		<g:message code="city.mundaneStatusQuo.label" default="Mundane Status Quo" />
		
	</label>
	<g:textArea name="mundaneStatusQuo" maxlength="240" value="${cityInstance?.mundaneStatusQuo}"/>
</div>

