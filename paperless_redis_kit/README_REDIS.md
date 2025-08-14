# Kit Redis pour Paperless-ngx (Railway + externe)

Ce kit t’aide à brancher **Redis** à Paperless-ngx, soit :
- via le **plugin Redis de Railway** (le plus simple),
- soit en **auto‑hébergé** (Docker sur un VPS).

## A) Railway — Plugin Redis (recommandé)
1. Dans ton projet Railway → **Add New → Redis**.
2. Ouvre le service **redis** → **Variables** → repère **REDIS_URL** (parfois `redis://…` ou `rediss://…`).
3. Va dans le service **app** (Paperless) → **Variables** → ajoute :
   ```
   PAPERLESS_REDIS=<colle exactement la valeur REDIS_URL>
   ```
   > Ou utilise une **Variable Reference** si dispo : `PAPERLESS_REDIS = ${{redis.REDIS_URL}}`.

4. **Deploy** le service **app**. Paperless utilisera Redis pour l’ingestion et les tâches async.

### Remarques
- Si l’URL commence par `rediss://` (TLS), Paperless sait gérer (la lib redis supporte TLS). Laisse tel quel.
- Pas besoin d’autre réglage côté Paperless.

## B) Redis externe (VPS, Docker)
Utilise le dossier `external_redis/` ci‑joint.

### Démarrage rapide (VPS Ubuntu)
```bash
sudo apt update && sudo apt install -y docker.io docker-compose-plugin
sudo systemctl enable --now docker
# Copie ce dossier sur le VPS puis :
cd external_redis
# ⚠️ Modifie REDIS_PASSWORD dans docker-compose.yml AVANT de lancer
docker compose up -d
```

- Redis écoute sur **port 6379**.
- Le mot de passe est imposé via `--requirepass`.
- Les données persistent dans `./data` (volume sur disque).

### Renseigner Paperless
Dans le service **app** (ou ton .env), mets :
```
PAPERLESS_REDIS=redis://:<TON_MOT_DE_PASSE>@<IP_DU_VPS>:6379/0
```
> Note : il n’y a **pas d’utilisateur** par défaut sur Redis OSS, uniquement le mot de passe (`:<pass>@`).

## C) Tests de connectivité (facultatif)
Avec redis‑cli installé :
```bash
redis-cli -u redis://:<PASS>@<HOST>:6379 ping
# Réponse attendue : PONG
```

## D) Dépannage
- **AUTH required** → Vérifie que l’URL contient bien `:<motdepasse>@`.
- **TLS requis** chez ton hébergeur → l’URL sera `rediss://…`. Utilise-la telle quelle dans `PAPERLESS_REDIS`.
- **Timeouts** → Vérifie pare‑feu VPS (ouvrir 6379/TCP si tu testes depuis l’extérieur).
