<p align="center">
    <a href="https://www.halo.run" target="_blank" rel="noopener noreferrer">
        <img width="100" src="https://www.halo.run/logo" alt="Halo logo" />
    </a>
</p>

<p align="center"><b>Halo</b> [ˈheɪloʊ] — A powerful and easy-to-use open-source website building tool.</p>
<p align="center">
<a href="https://github.com/halo-dev/halo/releases"><img alt="GitHub release" src="https://img.shields.io/github/release/halo-dev/halo.svg?style=flat-square&include_prereleases" /></a>
<a href="https://hub.docker.com/r/halohub/halo"><img alt="Docker pulls" src="https://img.shields.io/docker/pulls/halohub/halo?style=flat-square" /></a>
<a href="https://github.com/halo-dev/halo/commits"><img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/halo-dev/halo.svg?style=flat-square" /></a>
<a href="https://github.com/halo-dev/halo/actions"><img alt="GitHub Workflow Status" src="https://img.shields.io/github/actions/workflow/status/halo-dev/halo/halo.yaml?branch=main&style=flat-square" /></a>
<a href="https://codecov.io/gh/halo-dev/halo"><img alt="Codecov percentage" src="https://img.shields.io/codecov/c/github/halo-dev/halo/main?style=flat-square&token=YsRUg9fall"/></a>
<br />
<a href="https://www.halo.run">Website</a>
<a href="https://docs.halo.run">Documentation</a>
<a href="https://bbs.halo.run">Community</a>
<a href="https://github.com/halo-dev/halo">GitHub</a>
<a href="https://t.me/halo_dev">Telegram Channel</a>
</p>

------------------------------

## Quick Start

### Using Docker Compose (Recommended)

The easiest way to get Halo up and running is with Docker Compose:

```bash
# Clone the repository
git clone https://github.com/halo-dev/halo.git
cd halo

# Copy the environment configuration
cp .env.example .env

# Start the application
docker compose up -d
```

Halo will be available at `http://localhost:8090`. Follow the setup wizard to complete the initial configuration.

### Using Docker

If you have Docker installed, you can quickly start a Halo instance:

```bash
docker run -d --name halo \
  -p 8090:8090 \
  -v ~/.halo2:/root/.halo2 \
  halohub/halo:2.22
```

### Using Gitpod

Click the button below to launch a ready-to-use development environment in your browser:

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/halo-sigs/gitpod-demo)

### Using ClawCloud Run

[![Run on ClawCloud](https://raw.githubusercontent.com/ClawCloud/Run-Template/refs/heads/main/Run-on-ClawCloud.svg)](https://template.us-west-1.run.claw.cloud/deploy?templateName=halo)

> **Note:** The above methods are intended for quick trials. For production deployments, we recommend using [1Panel](https://github.com/1Panel-dev/1Panel), an open-source Linux server management panel, for deployment ([see documentation](https://docs.halo.run/getting-started/install/1panel)). It makes handling reverse proxies, SSL certificates, upgrades, and backups straightforward. For more deployment options, please [see the full guide](https://docs.halo.run/category/%E5%AE%89%E8%A3%85%E6%8C%87%E5%8D%97).

## Hosting & Deployment

### Prerequisites

- **Docker** 20.10+ and **Docker Compose** v2+
- At least **512 MB RAM** (1 GB recommended)
- **Java 21+** (only needed for building from source)

### Production Deployment with Docker Compose

1. **Clone and configure:**
   ```bash
   git clone https://github.com/halo-dev/halo.git
   cd halo
   cp .env.example .env
   ```

2. **Edit `.env`** to set your configuration:
   ```bash
   # Set your desired port
   HALO_PORT=8090

   # Set the timezone
   TZ=UTC

   # Set JVM memory options for your server
   JVM_OPTS=-Xmx512m -Xms256m
   ```

3. **Start the services:**
   ```bash
   docker compose up -d
   ```

4. **Set up a reverse proxy** (Nginx, Caddy, Traefik, etc.) to handle SSL/TLS and point your domain to port 8090.

### Building from Source

```bash
# Build the backend
./gradlew clean build -x check

# The JAR file will be at application/build/libs/
java -jar application/build/libs/application-*.jar
```

### Environment Variables

| Variable | Description | Default |
|---|---|---|
| `HALO_PORT` | Port to expose Halo on | `8090` |
| `HALO_WORK_DIR` | Halo data directory | `/root/.halo2` |
| `JVM_OPTS` | JVM options (memory, GC, etc.) | (empty) |
| `TZ` | Timezone | `Asia/Shanghai` |
| `SPRING_CONFIG_LOCATION` | Spring config file locations | `classpath:/` |

## Live Demo

- **Site:** <https://demo.halocms.site>
- **Admin Console:** <https://demo.halocms.site/console>
- **Username:** `demo`
- **Password:** `P@ssw0rd123..`

## Features

- **Content Management** — Create and manage posts, pages, categories, and tags with a rich text editor
- **Theme System** — Customize your site's appearance with installable themes
- **Plugin Architecture** — Extend functionality with a powerful plugin system
- **Multi-language Support** — Built-in i18n with English, Spanish, Chinese (Simplified & Traditional)
- **User Management** — Role-based access control with customizable permissions
- **Attachment Management** — Upload and manage media files with multiple storage backends
- **SEO Friendly** — Built-in SEO optimization tools
- **API First** — Full REST API for headless CMS usage

## Ecosystem

Visit the [official app marketplace](https://www.halo.run/store/apps) or the [awesome-halo repository](https://github.com/halo-sigs/awesome-halo) to browse themes and plugins for Halo 2.x.

## License

[![license](https://img.shields.io/github/license/halo-dev/halo.svg?style=flat-square)](https://github.com/halo-dev/halo/blob/master/LICENSE)

Halo is open-sourced under the GPL-v3.0 license. Please comply with the open-source license terms.

## Contributing

See [CONTRIBUTING](https://github.com/halo-dev/halo/blob/main/CONTRIBUTING.md) for guidelines on how to contribute.

<a href="https://github.com/halo-dev/halo/graphs/contributors"><img src="https://opencollective.com/halo/contributors.svg?width=890&button=false" /></a>

## Statistics

![Repobeats analytics](https://repobeats.axiom.co/api/embed/ad008b2151c22e7cf734d2688befaa795d593b95.svg "Repobeats analytics image")
