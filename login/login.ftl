<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Identity Service</title>
    <link rel="stylesheet" href="${url.resourcesPath}/css/styles.css">
    <link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet">

<body class="Body">
<div class="Main">
    <div class="Box">
        <div>
            <img class="Logo" src="${url.resourcesPath}/img/alfresco-logo.png">
        </div>
        <div>
            <p class="Application-Name">Alfresco Identity Service</p>
        </div>
        <div class="Form">
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
                <input class="Submit" type="submit" value="SIGN IN"></input>
            </form>
        <div>
            <a href="http://docs.alfresco.com" class="HelpLink"/>NEED HELP?</a>
        </div>
    </div>
    <div>
        <p class="Copyright">©2018 Alfresco Software, Inc. All Rights Reserved.</p>
    </div>
</div>
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
</body>
</html>