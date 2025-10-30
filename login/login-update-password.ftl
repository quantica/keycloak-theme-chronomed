<#import "template.ftl" as layout>
<@layout.registeredLayout displayMessage=!messagesPerField.existsError('password','password-confirm'); section>
    <#if section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <form id="kc-passwd-update-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                    <input type="text" id="username" name="username" value="${username}" autocomplete="username" readonly="readonly" style="display:none;"/>
                    <input type="password" id="password" name="password" autocomplete="current-password" style="display:none;"/>

                    <#if message?has_content && message.type = 'success'>
                        <div class="alert alert-success">
                            <span>✓</span>
                            <span class="kc-feedback-text">${kcSanitize(message.summary)?no_esc}</span>
                        </div>
                    </#if>

                    <div class="form-group">
                        <label for="password-new" class="${properties.kcLabelClass!}">
                            ${msg("passwordNew")}
                            <span class="required">*</span>
                        </label>
                        <input 
                            type="password" 
                            id="password-new" 
                            name="password-new" 
                            class="${properties.kcInputClass!}"
                            autofocus 
                            autocomplete="new-password"
                            aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                            placeholder="${msg("passwordNew")}"
                        />

                        <#if messagesPerField.existsError('password')>
                            <span id="input-error-password" class="error-message" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('password'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <div class="form-group">
                        <label for="password-confirm" class="${properties.kcLabelClass!}">
                            ${msg("passwordConfirm")}
                            <span class="required">*</span>
                        </label>
                        <input 
                            type="password" 
                            id="password-confirm" 
                            name="password-confirm" 
                            class="${properties.kcInputClass!}"
                            autocomplete="new-password"
                            aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                            placeholder="${msg("passwordConfirm")}"
                        />

                        <#if messagesPerField.existsError('password-confirm')>
                            <span id="input-error-password-confirm" class="error-message" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                        <#if isAppInitiatedAction??>
                            <input 
                                class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" 
                                type="submit" 
                                value="${msg("doSubmit")}" 
                                style="margin-bottom: 10px;"
                            />
                            <button 
                                class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!}" 
                                type="submit" 
                                name="cancel-aia" 
                                value="true" 
                                formnovalidate
                                style="background: white; color: var(--text-dark); border: 2px solid var(--border-color);"
                            >
                                ${msg("doCancel")}
                            </button>
                        <#else>
                            <input 
                                class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" 
                                type="submit" 
                                value="${msg("doSubmit")}"
                            />
                        </#if>
                    </div>

                    <#if !isAppInitiatedAction?? && client.baseUrl?has_content>
                        <div id="kc-form-options" style="margin-top: 20px; text-align: center;">
                            <span><a href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a></span>
                        </div>
                    </#if>
                </form>
            </div>
        </div>
    </#if>
</@layout.registeredLayout>

