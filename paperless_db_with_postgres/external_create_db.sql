-- PostgreSQL externe : créer base, rôle et extensions pour Paperless-ngx
-- À exécuter avec un rôle ayant CREATE ROLE/DB et CREATE EXTENSION.

-- ⚠️ Changez ce mot de passe avant exécution.
DO $$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'paperless') THEN
        CREATE ROLE paperless LOGIN PASSWORD 'ChangezCeMotDePasse!';
    END IF;
END$$;

-- Crée la base si absente, propriétaire = paperless, encodage UTF-8
DO $$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_database WHERE datname = 'paperless') THEN
        CREATE DATABASE paperless
            WITH OWNER = paperless
                 ENCODING = 'UTF8'
                 TEMPLATE = template0
                 LC_COLLATE = 'C'
                 LC_CTYPE   = 'C';
    END IF;
END$$;

ALTER DATABASE paperless OWNER TO paperless;

\connect paperless

CREATE EXTENSION IF NOT EXISTS unaccent;
CREATE EXTENSION IF NOT EXISTS pg_trgm;
