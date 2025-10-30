<#import "template.ftl" as layout>
<@layout.registeredLayout displayMessage=false; section>
    <#if section = "form">
        <div id="kc-info-message">
            <div class="alert alert-${message.type}">
                <#if message.type = 'success'>
                    <span>✓</span>
                <#elseif message.type = 'warning'>
                    <span>⚠</span>
                <#elseif message.type = 'error'>
                    <span>✕</span>
                <#elseif message.type = 'info'>
                    <span>ℹ</span>
                </#if>
                <p class="instruction">${kcSanitize(message.summary)?no_esc}</p>
            </div>

            <#if skipLink??>
            <#else>
                <#if pageRedirectUri?has_content>
                    <div id="kc-form-options" style="margin-top: 30px; text-align: center;">
                        <a href="${pageRedirectUri}" class="btn">${kcSanitize(msg("backToApplication"))?no_esc}</a>
                    </div>
                <#elseif actionUri?has_content>
                    <div id="kc-form-options" style="margin-top: 30px; text-align: center;">
                        <a href="${actionUri}" class="btn">${kcSanitize(msg("proceedWithAction"))?no_esc}</a>
                    </div>
                <#elseif (client.baseUrl)?has_content>
                    <div id="kc-form-options" style="margin-top: 30px; text-align: center;">
                        <a href="${client.baseUrl}" class="btn">${kcSanitize(msg("backToApplication"))?no_esc}</a>
                    </div>
                </#if>
            </#if>
        </div>
    </#if>
</@layout.registeredLayout>

