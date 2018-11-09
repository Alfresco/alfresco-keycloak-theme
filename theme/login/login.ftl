<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
        ${msg("loginTitle",(realm.displayName!''))}
    <#elseif section = "header">
        <link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet" />
        <link rel="icon" href="${url.resourcesPath}/img/favicon.png" />
        <script>
            function togglePassword() {
                var x = document.getElementById("password");
                var v = document.getElementById("vi");
                if (x.type === "password") {
                    x.type = "text";
                    v.src = "${url.resourcesPath}/img/eye.png";
                } else {
                    x.type = "password";
                    v.src = "${url.resourcesPath}/img/eye-off.png";
                }
            }
        </script>
    <#elseif section = "form">
        <#if realm.password>
                <div>
                    <img class="logo" src="${url.resourcesPath}/img/alfresco-logo.svg"  alt="Alfresco">
                </div>  
                <div class="box-container">
                    <div>
                        <p class="application-name">Alfresco Identity Service</p>
                    </div>
                    <div>
                        <form id="kc-form-login" class="form" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                            <input id="username" class="login-field" placeholder="${msg("username")}" type="text" name="username" tabindex="1">

                            <div>
                                <label class="visibility" id="v" onclick="togglePassword()"><img id="vi" src="${url.resourcesPath}/img/eye-off.png"></label>
                            </div>
                            <input id="password" class="login-field" placeholder="${msg("password")}" type="password" name="password" tabindex="2">

                            <input class="submit" type="submit" value="${msg("doLogIn")}" tabindex="3">
                        </form>
                    </div>
                </div>
                <div>
                    <p class="copyright">&copy; ${msg("copyright", "${.now?string('yyyy')}")}</p>
                </div>
        </#if>
    </#if>
</@layout.registrationLayout>
