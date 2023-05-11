#changed=4
FROM bitnami/keycloak:21.1.1 AS GITTER
USER root

# COPY --chown=keycloak:root keywind/theme/keywind /opt/bitnami/keycloak/themes/keywind
RUN apt-get update && apt-get -y install git && \
    git clone https://github.com/lukin/keywind.git /tmp/keywind && \
    chown -R keycloak:root /tmp/keywind

FROM bitnami/keycloak:21.1.1
USER root

COPY --from=GITTER /tmp/keywind/theme/keywind /opt/bitnami/keycloak/themes/keywind
COPY --chown=keycloak:root theme /opt/bitnami/keycloak/themes/Cloudyne

RUN /opt/bitnami/scripts/keycloak/postunpack.sh
ENV APP_VERSION="20.0.3" \
    BITNAMI_APP_NAME="keycloak" \
    JAVA_HOME="/opt/bitnami/java" \
    PATH="/opt/bitnami/common/bin:/opt/bitnami/java/bin:/opt/bitnami/keycloak/bin:$PATH"

USER 1001
ENTRYPOINT [ "/opt/bitnami/scripts/keycloak/entrypoint.sh" ]
CMD [ "/opt/bitnami/scripts/keycloak/run.sh" ]