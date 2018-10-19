FROM khinkali/wildfly:0.0.3

MAINTAINER Robert Brem <brem_robert@hotmail.com>

ENV KEYCLOAK_VERSION 4.0.0.Final
WORKDIR /opt/jboss/wildfly
RUN curl -L https://downloads.jboss.org/keycloak/$KEYCLOAK_VERSION/adapters/keycloak-oidc/keycloak-wildfly-adapter-dist-$KEYCLOAK_VERSION.tar.gz | tar zx
WORKDIR /opt/jboss
RUN sed -i -e 's/<extensions>/&\n        <extension module="org.keycloak.keycloak-adapter-subsystem"\/>/' $JBOSS_HOME/standalone/configuration/standalone.xml && \
    sed -i -e 's/<profile>/&\n        <subsystem xmlns="urn:jboss:domain:keycloak:1.1"\/>/' $JBOSS_HOME/standalone/configuration/standalone.xml