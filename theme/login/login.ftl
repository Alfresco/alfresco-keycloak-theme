<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
        ${msg("loginTitle",(realm.displayName!''))}
    <#elseif section = "header">
        <link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet"/>
        <script>
            function togglePassword() {
                var x = document.getElementById("password");
                var v = document.getElementById("vi");
                var btn = document.getElementById("v");
                if (x.type === "password") {
                    x.type = "text";
                    v.src = "${url.resourcesPath}/img/eye.png";
                    btn.setAttribute("aria-pressed", "true");
                } else {
                    x.type = "password";
                    v.src = "${url.resourcesPath}/img/eye-off.png";
                    btn.setAttribute("aria-pressed", "false");
                }
            }
        </script>
    <#elseif section = "form">
        <div>
            <img class="logo" src="${url.resourcesPath}/img/alfresco-logo.svg" alt="${msg("logoAlt")}">
        </div>
        <div class="box-container">
            <div>
                <h1 class="application-name">Alfresco Identity Service</h1>
            </div>
        <#if realm.password>
            <div>
               <form id="kc-form-login" class="form" onsubmit="return true;" action="${url.loginAction}" method="post">
                    <input id="username" class="login-field" placeholder="${msg("username")}" type="text" name="username" tabindex="0">
                    <div>
                        <button class="visibility" id="v" type="button" onclick="togglePassword()" aria-label="${msg("togglePasswordVisibility")}" aria-pressed="false"><img id="vi" src="${url.resourcesPath}/img/eye-off.png" aria-hidden="true"></button>
                    </div>
                <input id="password" class="login-field" placeholder="${msg("password")}" type="password" name="password" tabindex="0">
                <input class="submit" type="submit" value="${msg("doLogIn")}" tabindex="0">
                </form>
            </div>
        </#if>
        <#if social.providers?? && social.providers?has_content>
            <p class="para">${msg("selectAlternative")}</p>
            <div id="social-providers">
                <#list social.providers as p>
                <input class="social-link-style" type="button" onclick="location.href='${p.loginUrl}';" value="${p.displayName}"/>
                </#list>
            </div>
        </#if>
        </div>
        <div>
            <p class="copyright">&copy; ${msg("copyright", "${.now?string('yyyy')}")}</p>
        </div>
    </#if>
</@layout.registrationLayout>
