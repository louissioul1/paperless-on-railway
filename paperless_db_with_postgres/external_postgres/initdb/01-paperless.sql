-- Exécuté automatiquement par Postgres au premier démarrage du conteneur
-- ⚠️ Changez les mots de passe!
CREATE ROLE paperless LOGIN PASSWORD 'ChangezCeMotDePasse!';
CREATE DATABASE paperless WITH OWNER = paperless ENCODING 'UTF8' TEMPLATE template0 LC_COLLATE 'C' LC_CTYPE 'C';

\connect paperless

CREATE EXTENSION IF NOT EXISTS unaccent;
CREATE EXTENSION IF NOT EXISTS pg_trgm;
