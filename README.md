# Alfresco Keycloak Theme

## Overview

Keycloak allows a user to provide alternative themes to replace the default
Keycloak themes.

The following themes can be replaced.
 
* login
* account
* email
* admin 
 
This projects contains a possible theme to replace the login theme.  It was done as an experiment to understand the level of effort and options.

## Design

Several approaches are possible.  
1. **Extend the existing themes**.  With this approach, a copy of the default theme is made and selective
edits are made to the theme.  For example, different style sheets can be
used but otherwise the layout provide by Keycloak could stay the same.
2. **Use ADF**.  With this approach, the ADF component is used directly, effectively making Keycloak 
and ADF app.
3. **Custom login page**.  With this approach, a page is provided that uses the same approved Alfresco
styles.

This project currently uses the approach of a custom login page (option #3).

## Implementation

Since Keycloak supports Freemarker, [a template file](./login/login.ftl) is provided along with 
[css styles](./login/resources/css) and [images](./login/resources/img) like those documented in o look like the [approved designs](https://app.zeplin.io/project/57d69ef9c8a62bb604985525/screen/5a4dfb3c92a348c3fbe1c586)

## Deployment

1. After installing Keycloak, navigate to the these directory (e.g. ~/development/keycloak-3.4.3.Final/themes).
2. Create a directory named Alfresco.  
3. Copy the login directory from this project to a login directory in the Alfresco directory you 
just created
4. Start Keycloak and navigate to the admin console theme.  Choose the *Alfresco*
these as [illustrated](./screen-captures/admin-console-themes.png).  Click *Save*.
5. Login to the Alfresco realm (e.g. http://localhost:8080/auth/realms/Alfresco/account/) and
you should see a screen like this.

![](screen-captures/example-login.png)

## Next Steps

This is a candidate to include in the Alfresco Identity Service.  

Internationalization needs to be added as well as message handling.
