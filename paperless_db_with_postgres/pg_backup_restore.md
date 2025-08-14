# Sauvegarde / Restauration Postgres (Paperless)

## Sauvegarde (dump)
```bash
pg_dump -h <host> -p <port> -U <user> -d paperless -Fc -f paperless_$(date +%F).dump
```
- `-Fc` → format custom (compressé)
- Astuce Railway : utilise le bouton **Connect** de Postgres pour obtenir `PGHOST/PGPORT/PGUSER/PGPASSWORD`.

## Restauration
```bash
createdb -h <host> -p <port> -U <user> paperless_restored
pg_restore -h <host> -p <port> -U <user> -d paperless_restored -Fc paperless_YYYY-MM-DD.dump
```
Ensuite (facultatif) tu peux renommer les bases si tu veux remplacer la prod après vérification.
