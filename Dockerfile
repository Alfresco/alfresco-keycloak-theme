FROM bitnami/keycloak:20.0.3-debian-11-r0
ADD theme /opt/bitnami/keycloak/themes/Cloudyne
RUN ls -al /opt/bitnami/keycloak/themes/