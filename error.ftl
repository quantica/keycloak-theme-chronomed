<#import "template.ftl" as layout>
<@layout.registeredLayout displayMessage=false; section>
    <#if section = "form">
        <div id="kc-error-message">
            <div class="alert alert-error">
                <span>✕</span>
                <p class="instruction">${kcSanitize(message.summary)?no_esc}</p>
            </div>
            
            <#if client?? && client.baseUrl?has_content>
                <div id="kc-form-options" style="margin-top: 30px; text-align: center;">
                    <a href="${client.baseUrl}" class="btn">${kcSanitize(msg("backToApplication"))?no_esc}</a>
                </div>
            </#if>
        </div>
    </#if>
</@layout.registeredLayout>

