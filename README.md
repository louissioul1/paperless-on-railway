# Paperless-ngx sur Railway

## Déploiement
1. Forkez ce dépôt sur votre GitHub.
2. Sur Railway → New Project → Deploy from GitHub → Sélectionnez votre fork.
3. Ajoutez les plugins :
   - PostgreSQL
   - Redis
4. Dans l'onglet Variables, configurez :
   - PAPERLESS_ADMIN_USER
   - PAPERLESS_ADMIN_PASSWORD
   - PAPERLESS_TIME_ZONE
   - PAPERLESS_OCR_LANGUAGE
   - PAPERLESS_CONSUMER_RECURSIVE
   - PAPERLESS_CONSUMER_SUBDIRS_AS_TAGS
   - PAPERLESS_SECRET_KEY (32 caractères aléatoires)
   - PAPERLESS_URL (URL Railway ou domaine custom)
   - PAPERLESS_ALLOWED_HOSTS (même valeur que PAPERLESS_URL sans https://)
   - Variables DB/Redis fournies par Railway :
     - PAPERLESS_DBHOST
     - PAPERLESS_DBUSER
     - PAPERLESS_DBPASS
     - PAPERLESS_DBNAME
     - PAPERLESS_REDIS
5. Dans l’onglet Volumes, créez et montez :
   - `/usr/src/paperless/data`
   - `/usr/src/paperless/media`
   - `/usr/src/paperless/export`
   - `/usr/src/paperless/consume`

## Connexion
- Utilisateur admin : défini dans PAPERLESS_ADMIN_USER
- Mot de passe admin : défini dans PAPERLESS_ADMIN_PASSWORD
