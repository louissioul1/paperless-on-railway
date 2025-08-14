# Kit base de données Paperless-ngx (Railway + Postgres externe)

Ce dossier complète le **paperless_db_bootstrap.zip** en ajoutant une option **Postgres externe** prête à l’emploi.
Tu peux l’utiliser si tu veux héberger Postgres ailleurs que sur Railway, ou simplement garder des scripts propres.

## Contenu
- `railway_enable_extensions.sql` — à exécuter dans le service **Postgres de Railway** (onglet *Query*) pour activer `unaccent` et `pg_trgm` si permis.
- `external_create_db.sql` — script SQL pour **créer** le rôle `paperless`, la base `paperless` et les extensions sur un serveur Postgres existant.
- `external_postgres/docker-compose.yml` — déploiement **Postgres 16** prêt, avec volume et scripts d’initialisation.
- `external_postgres/initdb/01-paperless.sql` — crée le rôle, la base, et les extensions automatiquement au premier démarrage.
- `external_postgres/README_POSTGRES_DOCKER.md` — pas-à-pas pour démarrer Postgres sur un VPS (si tu ne veux pas utiliser le Postgres de Railway).
- `pg_backup_restore.md` — commandes simples de **sauvegarde / restauration**.

> **Important** : sur ton vieux Mac, tu ne pourras peut‑être pas lancer Docker localement. Ce kit *externe* est pensé pour un **VPS** (Ubuntu) au besoin. Pour Railway, le plus simple reste d’utiliser **le plugin Postgres** intégré et d’exécuter `railway_enable_extensions.sql`.
