FROM bitnami/keycloak:20.0.3-debian-11-r0
COPY --chown=keycloak:root theme /opt/bitnami/keycloak/themes/Cloudyne
RUN ls -al /opt/bitnami/keycloak/themes/Cloudyne