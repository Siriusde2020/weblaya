# Stage 1: Build the UI (Vue 3 + pnpm)
FROM node:22-slim AS ui-builder
RUN corepack enable && corepack prepare pnpm@10.12.4 --activate
WORKDIR /workspace/ui
COPY ui/package.json ui/pnpm-lock.yaml ui/pnpm-workspace.yaml ./
COPY ui/packages ./packages
COPY ui/patches ./patches
RUN pnpm install --frozen-lockfile
COPY ui/ ./
RUN pnpm run build:packages && pnpm run build

# Stage 2: Build the Java backend with Gradle
FROM eclipse-temurin:21-jdk AS backend-builder
WORKDIR /workspace
COPY gradlew settings.gradle gradle.properties ./
COPY gradle/ gradle/
COPY buildSrc/ buildSrc/
COPY api/ api/
COPY application/ application/
COPY platform/ platform/
# Copy UI build output into the expected location
COPY --from=ui-builder /workspace/ui/build/dist/ ui/build/dist/
RUN chmod +x gradlew && ./gradlew :application:bootJar -x check -x test --no-daemon

# Stage 3: Extract Spring Boot layers
FROM eclipse-temurin:21-jre AS extractor
WORKDIR /application
COPY --from=backend-builder /workspace/application/build/libs/*.jar application.jar
RUN java -Djarmode=layertools -jar application.jar extract

# Stage 4: Runtime
FROM eclipse-temurin:21-jre
LABEL maintainer="johnniang <johnniang@foxmail.com>"
WORKDIR /application

COPY --from=extractor /application/dependencies/ ./
COPY --from=extractor /application/spring-boot-loader/ ./
COPY --from=extractor /application/snapshot-dependencies/ ./
COPY --from=extractor /application/application/ ./

ENV JVM_OPTS="-Xmx512m -Xms256m" \
    HALO_WORK_DIR="/data/halo2" \
    SPRING_CONFIG_LOCATION="optional:classpath:/;optional:file:/data/halo2/" \
    TZ=UTC

RUN mkdir -p /data/halo2 && chmod 777 /data/halo2 \
    && ln -sf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone

EXPOSE 8090

ENTRYPOINT ["sh", "-c", "java ${JVM_OPTS} -Dserver.port=${PORT:-8090} org.springframework.boot.loader.launch.JarLauncher ${0} ${@}"]
