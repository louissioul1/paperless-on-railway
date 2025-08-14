# Postgres externe via Docker (VPS)

> Utile seulement si tu **n’utilises pas** le Postgres intégré de Railway.

## Prérequis
- VPS Ubuntu (22.04/24.04)
- Docker + plugin compose installés

```bash
sudo apt update && sudo apt install -y docker.io docker-compose-plugin
sudo systemctl enable --now docker
```

## Démarrer
1. Copie ce dossier `external_postgres` sur ton VPS.
2. Dans `docker-compose.yml`, **change** `POSTGRES_PASSWORD`.
3. Dans `initdb/01-paperless.sql`, **change** le mot de passe du rôle `paperless`.
4. Lance :
```bash
docker compose up -d
```
5. La base écoute sur `5432`. Renseigne ces variables dans Paperless (service app) :
```
PAPERLESS_DBHOST=<IP_de_ton_VPS>
PAPERLESS_DBPORT=5432
PAPERLESS_DBUSER=paperless
PAPERLESS_DBPASS=<mot_de_passe_de_paperless>
PAPERLESS_DBNAME=paperless
```

## Notes
- Les extensions `unaccent` et `pg_trgm` sont créées par le script `initdb/01-paperless.sql`.
- Les données sont stockées dans le dossier `pgdata/` (volume). Sauvegarde-le régulièrement.
