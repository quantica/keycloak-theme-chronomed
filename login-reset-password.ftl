<#import "template.ftl" as layout>
<@layout.registeredLayout displayInfo=true displayMessage=!messagesPerField.existsError('username'); section>
    <#if section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                    
                    <div class="form-group">
                        <label for="username" class="${properties.kcLabelClass!}">
                            <#if !realm.loginWithEmailAllowed>
                                ${msg("username")}
                            <#elseif !realm.registrationEmailAsUsername>
                                ${msg("usernameOrEmail")}
                            <#else>
                                ${msg("email")}
                            </#if>
                        </label>

                        <input 
                            type="text" 
                            id="username" 
                            name="username" 
                            class="${properties.kcInputClass!}" 
                            autofocus 
                            value="${(auth.attemptedUsername!'')}"
                            aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                            placeholder="<#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>"
                        />

                        <#if messagesPerField.existsError('username')>
                            <span id="input-error-username" class="error-message" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('username'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                        <input 
                            class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" 
                            type="submit" 
                            value="${msg("doSubmit")}"
                        />
                    </div>

                    <div id="kc-form-options" style="margin-top: 20px; text-align: center;">
                        <span><a href="${url.loginUrl}">${msg("backToLogin")}</a></span>
                    </div>
                </form>
            </div>
        </div>
    <#elseif section = "info">
        <div class="instruction">
            ${msg("emailInstruction")}
        </div>
    </#if>
</@layout.registeredLayout>

