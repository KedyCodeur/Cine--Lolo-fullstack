# Ciné Lolo

Plateforme e-commerce full-stack de vente de films, développée en **PHP** et **SQL** dans le cadre d'un projet académique à SUPINFO (2026), inspiré du concept IMDB. Le cahier des charges imposait une contrainte forte : **aucun JavaScript autorisé** — toute l'interactivité (authentification, panier persistant, navigation) repose donc sur du PHP côté serveur et des requêtes SQL avancées.

## Fonctionnalités

- 🔐 **Authentification sécurisée** — inscription et connexion (`register.php`, `login.php`)
- 🎬 **Catalogue de films** — parcours par film, catégorie ou réalisateur (`movie.php`, `all_movie.php`, `categorie.php`, `director.php`)
- 🛒 **Panier persistant côté serveur** — le panier est conservé sans recourir au JavaScript (`panier.php`)
- 👤 **Profil utilisateur** — gestion du compte et historique d'achats (`profile.php`)
- 🗄️ **Base de données relationnelle avancée** — schéma et requêtes SQL structurées (`lolodb.sql`, `prepera.sql`)
- 📱 **UI 100% responsive**, entièrement en HTML/CSS
- 🚫 **Zéro JavaScript** — contrainte imposée par le cahier des charges de l'école

## Stack technique

| Côté | Technologies |
|---|---|
| Backend | PHP |
| Base de données | MySQL / SQL |
| Frontend | HTML, CSS *(sans JavaScript)* |

## Structure du projet

```
Cine--Lolo-fullstack/
├── Documentation/     # Documentation du projet
├── assets/            # Ressources statiques (images, médias)
├── backhand/          # Logique backend / accès aux données
├── css/                # Feuilles de style
├── htmlElements/       # Composants HTML réutilisables
├── index.php           # Page d'accueil
├── login.php            # Connexion
├── register.php         # Inscription
├── profile.php           # Profil utilisateur
├── movie.php               # Fiche film
├── all_movie.php            # Liste de tous les films
├── categorie.php             # Films par catégorie
├── director.php               # Films par réalisateur
├── panier.php                  # Panier / commande
├── error404.php                 # Page d'erreur 404
├── lolodb.sql                    # Schéma de la base de données
├── prepera.sql                    # Script de préparation / peuplement
└── help.txt                        # Notes complémentaires
```

## Installation

### Prérequis
- PHP 7.4+ avec un serveur (Apache/Nginx) ou le serveur intégré PHP
- MySQL / MariaDB

### Étapes

```bash
git clone https://github.com/KedyCodeur/Cine--Lolo-fullstack.git
cd Cine--Lolo-fullstack
```

1. Créer une base de données MySQL, puis importer le schéma :
   ```bash
   mysql -u <user> -p <nom_de_la_base> < lolodb.sql
   mysql -u <user> -p <nom_de_la_base> < prepera.sql
   ```
2. Configurer les identifiants de connexion à la base de données dans le dossier `backhand/`.
3. Lancer un serveur local :
   ```bash
   php -S localhost:8000
   ```
4. Ouvrir [http://localhost:8000](http://localhost:8000) dans le navigateur.

## Contexte académique

Projet réalisé dans le cadre du Bachelor Informatique à **SUPINFO** (2026). La contrainte principale du cahier des charges — l'interdiction du JavaScript — a orienté l'ensemble de l'architecture vers une logique 100% serveur (sessions PHP, formulaires natifs, rechargements de page) tout en conservant une interface responsive.

## Auteur

**Cem Sah Ozdemirel**
[GitHub](https://github.com/KedyCodeur) · [Portfolio](https://kedycodeur.vercel.app) · [LinkedIn](https://linkedin.com/in/cemsahozdemirel)
