<#import "template.ftl" as layout>
<@layout.registeredLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <#if realm.password>
                    <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                        <#if !usernameHidden??>
                            <div class="form-group">
                                <label for="username" class="${properties.kcLabelClass!}">
                                    <#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>
                                </label>
                                <input 
                                    tabindex="1" 
                                    id="username" 
                                    class="${properties.kcInputClass!}" 
                                    name="username" 
                                    value="${(login.username!'')}" 
                                    type="text" 
                                    autofocus 
                                    autocomplete="username"
                                    aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                    placeholder="<#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>"
                                />
                                
                                <#if messagesPerField.existsError('username','password')>
                                    <span id="input-error" class="error-message" aria-live="polite">
                                        ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                                    </span>
                                </#if>
                            </div>
                        </#if>

                        <div class="form-group">
                            <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
                            <input 
                                tabindex="2" 
                                id="password" 
                                class="${properties.kcInputClass!}" 
                                name="password" 
                                type="password" 
                                autocomplete="current-password"
                                aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                placeholder="${msg("password")}"
                            />
                        </div>

                        <div id="kc-form-options">
                            <#if realm.rememberMe && !usernameHidden??>
                                <div class="checkbox">
                                    <input 
                                        tabindex="3" 
                                        id="rememberMe" 
                                        name="rememberMe" 
                                        type="checkbox"
                                        <#if login.rememberMe??>checked</#if>
                                    />
                                    <label for="rememberMe">${msg("rememberMe")}</label>
                                </div>
                            </#if>
                        </div>

                        <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                            <input 
                                type="hidden" 
                                id="id-hidden-input" 
                                name="credentialId" 
                                <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>
                            />
                            <input 
                                tabindex="4" 
                                class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" 
                                name="login" 
                                id="kc-login" 
                                type="submit" 
                                value="${msg("doLogIn")}"
                            />
                        </div>

                        <#if realm.resetPasswordAllowed>
                            <div id="kc-form-options" style="margin-top: 20px; text-align: center;">
                                <span><a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                            </div>
                        </#if>
                    </form>
                </#if>
            </div>
        </div>
    <#elseif section = "info">
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration">
                <span>${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
            </div>
        </#if>
    </#if>
</@layout.registeredLayout>

