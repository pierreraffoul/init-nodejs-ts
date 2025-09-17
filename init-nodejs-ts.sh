#!/bin/bash

# Script de configuration automatique d'un projet Node.js avec TypeScript
# Usage: ./setup-nodejs-ts.sh [nom-du-projet]

set -e  # Arrêter le script en cas d'erreur

# Couleurs pour l'affichage
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Fonction pour afficher des messages colorés
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Vérifier si npm est installé
if ! command -v npm &> /dev/null; then
    print_error "npm n'est pas installé. Veuillez installer Node.js et npm d'abord."
    exit 1
fi

# Récupérer le nom du projet
if [ -z "$1" ]; then
    read -p "Nom du projet (défaut: mon-projet-ts): " PROJECT_NAME
    PROJECT_NAME=${PROJECT_NAME:-mon-projet-ts}
else
    PROJECT_NAME=$1
fi

print_info "Création du projet: $PROJECT_NAME"

# Créer le dossier du projet
if [ -d "$PROJECT_NAME" ]; then
    print_warning "Le dossier '$PROJECT_NAME' existe déjà."
    read -p "Voulez-vous continuer et écraser le contenu ? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_info "Opération annulée."
        exit 0
    fi
    rm -rf "$PROJECT_NAME"
fi

mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

print_info "Initialisation du projet npm..."
npm init -y

print_info "Installation des dépendances de développement..."
npm install -D typescript @types/node ts-node nodemon

print_info "Création de la structure du projet..."
mkdir -p src dist

# Création du fichier tsconfig.json
print_info "Création du fichier tsconfig.json..."
cat > tsconfig.json << 'EOF'
{
  "compilerOptions": {
    // File Layout
    "rootDir": "./src",
    "outDir": "./dist",

    // Environment Settings
    "module": "nodenext",
    "target": "esnext",
    "types": ["node"],

    // Other Outputs
    "sourceMap": true,
    "declaration": true,
    "declarationMap": true,

    // Stricter Typechecking Options
    "noUncheckedIndexedAccess": true,
    "exactOptionalPropertyTypes": true,

    // Recommended Options
    "strict": true,
    "jsx": "react-jsx",
    "verbatimModuleSyntax": true,
    "isolatedModules": true,
    "noUncheckedSideEffectImports": true,
    "moduleDetection": "force",
    "skipLibCheck": true
  },
  "include": ["src/**/*"],
  "exclude": ["node_modules", "dist"]
}
EOF

# Création du fichier index.tsx
print_info "Création du fichier src/index.tsx..."
cat > src/index.tsx << 'EOF'
console.log("🚀 Projet TypeScript initialisé avec succès !");

// Exemple de fonction TypeScript
function saluer(nom: string): string {
    return `Bonjour ${nom} !`;
}

console.log(saluer("Développeur"));
EOF

# Mise à jour du package.json avec les scripts
print_info "Configuration des scripts npm..."
npm pkg set scripts.dev="nodemon --watch 'src/**/*.{ts,tsx}' --exec ts-node src/index.tsx"
npm pkg set scripts.build="tsc"
npm pkg set scripts.start="node dist/index.js"
npm pkg set scripts.clean="rm -rf dist"

# Création du fichier .gitignore
print_info "Création du fichier .gitignore..."
cat > .gitignore << 'EOF'
# Dependencies
node_modules/
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Build output
dist/
build/

# Environment variables
.env
.env.local
.env.development.local
.env.test.local
.env.production.local

# IDE files
.vscode/
.idea/
*.swp
*.swo
*~

# OS generated files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# Logs
logs
*.log

# Runtime data
pids
*.pid
*.seed
*.pid.lock

# Coverage directory used by tools like istanbul
coverage/

# TypeScript cache
*.tsbuildinfo
EOF

# Création d'un README.md basique
print_info "Création du fichier README.md..."
cat > README.md << EOF
# $PROJECT_NAME

Projet Node.js avec TypeScript configuré automatiquement.

## Installation

\`\`\`bash
npm install
\`\`\`

## Scripts disponibles

- \`npm run dev\` - Démarre le serveur de développement avec rechargement automatique
- \`npm run build\` - Compile le projet TypeScript
- \`npm run start\` - Démarre l'application compilée
- \`npm run clean\` - Supprime le dossier de build

## Structure du projet

\`\`\`
$PROJECT_NAME/
├── src/
│   └── index.tsx      # Point d'entrée de l'application
├── dist/              # Fichiers compilés (généré après build)
├── package.json       # Configuration npm
├── tsconfig.json      # Configuration TypeScript
└── README.md         # Ce fichier
\`\`\`

## Développement

Pour commencer le développement :

\`\`\`bash
npm run dev
\`\`\`

Le serveur se rechargera automatiquement à chaque modification des fichiers source.
EOF

print_success "✨ Projet '$PROJECT_NAME' créé avec succès !"
print_info "📁 Emplacement: $(pwd)"
print_info ""
print_info "Pour commencer :"
print_info "  cd $PROJECT_NAME"
print_info "  npm run dev"
print_info ""
print_success "🎉 Bon développement !"
