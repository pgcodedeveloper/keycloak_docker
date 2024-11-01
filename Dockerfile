# Usar la imagen oficial de Keycloak basada en Quarkus
FROM quay.io/keycloak/keycloak:latest

# Setear las variables de entorno para el administrador
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Añadir configuraciones personalizadas (opcional)
COPY keycloak.conf /opt/keycloak/conf/

# Importar configuraciones de realms (opcional)
COPY realm-export.json /opt/keycloak/data/import/

# Exponer el puerto 9090
EXPOSE 9090

# Ejecutar Keycloak en modo producción (usar start-dev para desarrollo)
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--optimized", "--import-realm"]
