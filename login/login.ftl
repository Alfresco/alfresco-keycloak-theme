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
           <div class="Box">
               <div>
                   <img class="Logo" src="${url.resourcesPath}/img/alfresco-logo.png">
               </div>
               <div>
                   <p class="Application-Name">Alfresco Identity Service</p>
               </div>

               <form id="kc-form-login" class="Form" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                   <form action="${url.loginAction}" method="POST">
                       <input id="username" class="Username" type="text" size=62 name="username"></input>
                       <div class="Line">
                           <hr></hr>
                       </div>
                       <div>
                           <checkbox class="Visibility" id="v" onclick="togglePassword()"><img id="vi" src="${url.resourcesPath}/img/eye-off.png"></checkbox>
                       </div>
                       <input id="password" class="Password" type="password" name="password"></input>
                       <div class="Line-Tangerine"/>
                       <hr class="Line-Tangerine"></hr>
           </div>
                	<br></br>
                	<input class="Submit" type="submit" value="${msg("doLogIn")}"></input>
            	</form>
            	<div>
                    <a href="http://docs.alfresco.com" class="HelpLink"/>${msg("needHelp")}</a>
                </div>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout>
