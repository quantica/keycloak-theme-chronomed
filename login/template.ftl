<#macro registeredLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false showAnotherWayIfPresent=true>
<!DOCTYPE html>
<html lang="${.locale}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>

    <title>${msg("loginTitle",(realm.displayName!''))}</title>
    
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
    
    <#if properties.stylesCommon?has_content>
        <#list properties.stylesCommon?split(' ') as style>
            <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
</head>

<body class="${properties.kcBodyClass!} ${bodyClass}">
    <div class="login-pf-page">
        <div id="kc-container" class="${properties.kcFormCardClass!}">
            <div id="kc-container-wrapper" class="${properties.kcFormCardAccountClass!}">
                
                <#-- Header -->
                <div id="kc-header" class="${properties.kcFormHeaderClass!}">
                    <div id="kc-header-wrapper" class="${properties.kcFormHeaderAccountClass!}">
                        <div class="kc-logo">
                            <span class="kc-logo-text">ChronoMed</span>
                        </div>
                        ${kcSanitize(msg("loginTitleHtml",(realm.displayNameHtml!'')))?no_esc}
                    </div>
                </div>

                <#-- Messages -->
                <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
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
                        <span class="kc-feedback-text">${kcSanitize(message.summary)?no_esc}</span>
                    </div>
                </#if>

                <#-- Content -->
                <div id="kc-content">
                    <div id="kc-content-wrapper">
                        <#nested "form">

                        <#if displayInfo>
                            <div id="kc-info" class="${properties.kcSignUpClass!}">
                                <div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                                    <#nested "info">
                                </div>
                            </div>
                        </#if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
</#macro>

