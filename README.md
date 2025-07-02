# Institut Froebel API

API Multi-Tenant pour la gestion de l'Institut Froebel - Système de gestion scolaire moderne.

## 🚀 Déploiement sur Railway

### Prérequis
- Compte Railway (gratuit avec $5 de crédit/mois)
- Repository GitHub connecté
- Base de données PostgreSQL

### Étapes de déploiement

#### 1. Préparation du projet
Le projet est déjà configuré pour Railway avec :
- `railway.toml` - Configuration Railway
- `appsettings.Production.json` - Configuration production
- `.dockerignore` - Optimisation du build

#### 2. Connexion à Railway
1. Allez sur [railway.app](https://railway.app)
2. Connectez-vous avec votre compte GitHub
3. Cliquez sur "New Project"
4. Sélectionnez "Deploy from GitHub repo"
5. Choisissez votre repository `API_InstitutFroebel`

#### 3. Configuration de la base de données
1. Dans votre projet Railway, cliquez sur "New"
2. Sélectionnez "Database" → "PostgreSQL"
3. Railway créera automatiquement une base de données PostgreSQL

#### 4. Configuration des variables d'environnement
Dans votre projet Railway, allez dans l'onglet "Variables" et ajoutez :

```env
# Base de données (Railway les fournit automatiquement)
DATABASE_HOST=your-railway-postgres-host
DATABASE_PORT=5432
DATABASE_NAME=railway
DATABASE_USERNAME=postgres
DATABASE_PASSWORD=your-railway-postgres-password

# JWT Configuration
JWT_SECRET_KEY=your-super-secure-jwt-secret-key-at-least-32-characters-long

# Environnement
ASPNETCORE_ENVIRONMENT=Production
```

**Note :** Railway fournit automatiquement les variables de base de données. Vous n'avez qu'à ajouter `JWT_SECRET_KEY`.

#### 5. Déploiement
1. Railway détectera automatiquement que c'est un projet .NET
2. Le build se lancera automatiquement
3. Votre API sera accessible via l'URL fournie par Railway

### Configuration automatique
Le projet est configuré pour :
- Utiliser le port fourni par Railway (`$PORT`)
- Écouter sur `0.0.0.0` pour accepter les connexions externes
- Utiliser les variables d'environnement pour la configuration
- Appliquer les migrations automatiquement au démarrage

## 🏗️ Architecture

### Structure du projet
```
InstitutFroebel/
├── InstitutFroebel.API/          # API Web (ASP.NET Core)
├── InstitutFroebel.Core/         # Entités et interfaces
└── InstitutFroebel.Infrastructure/ # Implémentations
```

### Fonctionnalités principales
- **Multi-tenant** : Support de plusieurs écoles
- **Authentification JWT** : Sécurisé et scalable
- **Gestion des rôles** : SuperAdmin, Admin, Teacher, Parent
- **API RESTful** : Documentation Swagger incluse
- **Base de données PostgreSQL** : Performante et fiable

### Endpoints principaux
- `POST /api/auth/login` - Connexion
- `POST /api/auth/register` - Inscription
- `GET /api/schools` - Liste des écoles
- `GET /api/students` - Liste des étudiants
- `GET /api/announcements` - Annonces

## 🔧 Développement local

### Prérequis
- .NET 9.0 SDK
- PostgreSQL
- Visual Studio 2022 ou VS Code

### Installation
```bash
# Cloner le repository
git clone https://github.com/votre-username/API_InstitutFroebel.git
cd API_InstitutFroebel

# Restaurer les packages
dotnet restore

# Appliquer les migrations
dotnet ef database update --project InstitutFroebel.API

# Lancer l'API
dotnet run --project InstitutFroebel.API
```

### Configuration locale
Modifiez `appsettings.Development.json` pour votre base de données locale.

## 📚 Documentation API
Une fois l'API lancée, accédez à :
- **Local** : `https://localhost:5001/swagger`
- **Railway** : `https://votre-app.railway.app/swagger`

## 🔒 Sécurité
- Authentification JWT avec expiration
- Validation des données avec FluentValidation
- CORS configuré pour la production
- Variables d'environnement pour les secrets

## 🚀 Avantages Railway
- **Gratuit** : $5 de crédit/mois
- **Déploiement automatique** : Depuis GitHub
- **Base de données incluse** : PostgreSQL géré
- **Interface moderne** : Simple et intuitive
- **Scaling automatique** : Selon la charge

## 📞 Support
Pour toute question ou problème :
1. Vérifiez les logs dans Railway
2. Consultez la documentation Swagger
3. Ouvrez une issue sur GitHub

---

**Institut Froebel API** - Système de gestion scolaire moderne et sécurisé. 