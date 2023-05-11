#changed=4
FROM bitnami/keycloak:20.0.3-debian-11-r0
USER root

COPY --chown=keycloak:root keywind/theme/keywind /opt/bitnami/keycloak/themes/keywind
COPY --chown=keycloak:root theme /opt/bitnami/keycloak/themes/Cloudyne

RUN /opt/bitnami/scripts/keycloak/postunpack.sh
ENV APP_VERSION="20.0.3" \
    BITNAMI_APP_NAME="keycloak" \
    JAVA_HOME="/opt/bitnami/java" \
    PATH="/opt/bitnami/common/bin:/opt/bitnami/java/bin:/opt/bitnami/keycloak/bin:$PATH"

USER 1001
ENTRYPOINT [ "/opt/bitnami/scripts/keycloak/entrypoint.sh" ]
CMD [ "/opt/bitnami/scripts/keycloak/run.sh" ]