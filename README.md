# Jugend hackt Pretix Image

Pretix Image für Jugend hackt



## Compose File
```

---
services:
  postgres:
    container_name: pretix-postgres
    environment:
      POSTGRES_PASSWORD: %password%
      POSTGRES_USER: pretix
    image: postgres:17
    restart: always
    volumes:
    - ./postgres:/var/lib/postgresql/data
  pretix:
    container_name: pretix
    depends_on:
    - redis
    - postgres
    environment:
      PRETALX_FILESYSTEM_MEDIA: /public/media
      PRETALX_FILESYSTEM_STATIC: /public/static
    image: ghcr.io/alpakainfracrew/pretix:main
    ports:
    - 127.0.0.1:8080:80
    restart: always
    sysctls:
    - net.core.somaxconn=4096
    volumes:
    - ./pretix/data:/data
    - ./pretix/etc:/etc/pretix
    - ./pretix/media:/public/media
    - ./pretix/static:/public/static
    - ./pretix/langs:/languages
  redis:
    container_name: pretix-redis
    image: redis:latest
    restart: always
    volumes:
    - ./redis:/data

```
