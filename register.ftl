<#import "template.ftl" as layout>
<@layout.registeredLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm'); section>
    <#if section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post">
                    
                    <#-- First Name -->
                    <div class="form-group">
                        <label for="firstName" class="${properties.kcLabelClass!}">
                            ${msg("firstName")}
                            <#if !realm.registrationEmailAsUsername>
                                <span class="required">*</span>
                            </#if>
                        </label>
                        <input 
                            type="text" 
                            id="firstName" 
                            class="${properties.kcInputClass!}" 
                            name="firstName"
                            value="${(register.formData.firstName!'')}"
                            autocomplete="given-name"
                            aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"
                            placeholder="${msg("firstName")}"
                        />
                        
                        <#if messagesPerField.existsError('firstName')>
                            <span id="input-error-firstname" class="error-message" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <#-- Last Name -->
                    <div class="form-group">
                        <label for="lastName" class="${properties.kcLabelClass!}">
                            ${msg("lastName")}
                            <#if !realm.registrationEmailAsUsername>
                                <span class="required">*</span>
                            </#if>
                        </label>
                        <input 
                            type="text" 
                            id="lastName" 
                            class="${properties.kcInputClass!}" 
                            name="lastName"
                            value="${(register.formData.lastName!'')}"
                            autocomplete="family-name"
                            aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"
                            placeholder="${msg("lastName")}"
                        />
                        
                        <#if messagesPerField.existsError('lastName')>
                            <span id="input-error-lastname" class="error-message" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <#-- Email -->
                    <div class="form-group">
                        <label for="email" class="${properties.kcLabelClass!}">
                            ${msg("email")}
                            <span class="required">*</span>
                        </label>
                        <input 
                            type="email" 
                            id="email" 
                            class="${properties.kcInputClass!}" 
                            name="email"
                            value="${(register.formData.email!'')}"
                            autocomplete="email"
                            aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
                            placeholder="${msg("email")}"
                        />
                        
                        <#if messagesPerField.existsError('email')>
                            <span id="input-error-email" class="error-message" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('email'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <#-- Username (if not using email as username) -->
                    <#if !realm.registrationEmailAsUsername>
                        <div class="form-group">
                            <label for="username" class="${properties.kcLabelClass!}">
                                ${msg("username")}
                                <span class="required">*</span>
                            </label>
                            <input 
                                type="text" 
                                id="username" 
                                class="${properties.kcInputClass!}" 
                                name="username"
                                value="${(register.formData.username!'')}"
                                autocomplete="username"
                                aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                                placeholder="${msg("username")}"
                            />
                            
                            <#if messagesPerField.existsError('username')>
                                <span id="input-error-username" class="error-message" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('username'))?no_esc}
                                </span>
                            </#if>
                        </div>
                    </#if>

                    <#-- Password -->
                    <div class="form-group">
                        <label for="password" class="${properties.kcLabelClass!}">
                            ${msg("password")}
                            <span class="required">*</span>
                        </label>
                        <input 
                            type="password" 
                            id="password" 
                            class="${properties.kcInputClass!}" 
                            name="password"
                            autocomplete="new-password"
                            aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                            placeholder="${msg("password")}"
                        />
                        
                        <#if messagesPerField.existsError('password')>
                            <span id="input-error-password" class="error-message" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('password'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <#-- Password Confirm -->
                    <div class="form-group">
                        <label for="password-confirm" class="${properties.kcLabelClass!}">
                            ${msg("passwordConfirm")}
                            <span class="required">*</span>
                        </label>
                        <input 
                            type="password" 
                            id="password-confirm" 
                            class="${properties.kcInputClass!}" 
                            name="password-confirm"
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

                    <#-- Recaptcha (if enabled) -->
                    <#if recaptchaRequired??>
                        <div class="form-group">
                            <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                        </div>
                    </#if>

                    <#-- Terms and Conditions (if required) -->
                    <#if termsRequired??>
                        <div class="form-group">
                            <div class="checkbox">
                                <input 
                                    type="checkbox" 
                                    id="termsAccepted" 
                                    name="termsAccepted" 
                                    required
                                />
                                <label for="termsAccepted">
                                    ${msg("acceptTerms")}
                                    <span class="required">*</span>
                                </label>
                            </div>
                        </div>
                    </#if>

                    <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                        <input 
                            class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" 
                            type="submit" 
                            value="${msg("doRegister")}"
                        />
                    </div>

                    <div id="kc-form-options" style="margin-top: 20px; text-align: center;">
                        <span><a href="${url.loginUrl}">${msg("backToLogin")}</a></span>
                    </div>
                </form>
            </div>
        </div>
    </#if>
</@layout.registeredLayout>

