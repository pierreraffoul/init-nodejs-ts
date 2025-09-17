# 🚀 Initialisation Projet Node.js TypeScript

Un script bash pour créer rapidement un projet Node.js avec TypeScript, Nodemon et une configuration optimisée.

## ✨ Fonctionnalités

- ⚡ Configuration TypeScript moderne
- 🔄 Nodemon pour le développement avec rechargement automatique
- 📦 Structure de projet optimisée
- 🛠️ Scripts npm préconfigurés
- 📝 .gitignore complet
- 📚 Documentation automatique
- 🎨 Messages colorés et interface utilisateur agréable

## 🚀 Installation

1. **Clonez ce dépôt :**
```bash
git clone https://github.com/votre-nom/initialisation-nodejs-ts.git
```

2. **Ajoutez l'alias à votre shell :**
```bash
echo "alias init-nodejs-ts='bash ~/chemin/vers/le/fichier/init-nodejs-ts.sh'" >> ~/.bashrc
```

3. **Rechargez votre shell :**
```bash
source ~/.bashrc
```

## 💻 Utilisation

Pour créer un nouveau projet Node.js avec TypeScript, exécutez simplement :

```bash
init-nodejs-ts nom_du_projet
```

### Exemple :
```bash
init-nodejs-ts mon-super-projet
cd mon-super-projet
npm run dev
```

## 🏗️ Ce que fait le script automatiquement

Le script va automatiquement :

- ✅ Créer un nouveau dossier avec le nom de votre projet
- ✅ Initialiser un projet Node.js (`npm init -y`)
- ✅ Installer les dépendances de développement :
  - `typescript`
  - `@types/node`
  - `ts-node`
  - `nodemon`
- ✅ Créer un fichier `tsconfig.json` optimisé
- ✅ Mettre en place la structure de base du projet (`src/`, `dist/`)
- ✅ Créer un point d'entrée `src/index.tsx` avec exemple
- ✅ Configurer les scripts npm :
  - `npm run dev` - Développement avec rechargement automatique
  - `npm run build` - Compilation TypeScript
  - `npm run start` - Lancement de l'application compilée
  - `npm run clean` - Nettoyage du dossier de build
- ✅ Créer un fichier `.gitignore` approprié
- ✅ Générer un `README.md` avec la documentation du projet

## 📦 Structure du projet généré

```
mon-projet/
├── src/
│   └── index.tsx          # Point d'entrée avec exemple TypeScript
├── dist/                  # Dossier de compilation (généré après build)
├── node_modules/          # Dépendances npm
├── package.json           # Configuration npm avec scripts
├── tsconfig.json          # Configuration TypeScript optimisée
├── .gitignore            # Fichiers à ignorer par Git
└── README.md             # Documentation du projet
```

## ⚙️ Configuration TypeScript

Le `tsconfig.json` généré inclut :

- **Modules modernes** : `nodenext` pour une compatibilité optimale
- **Target ES moderne** : `esnext` pour les dernières fonctionnalités
- **Strict mode** : Vérifications TypeScript strictes activées
- **Source maps** : Pour un debugging facilité
- **Déclarations** : Génération automatique des fichiers `.d.ts`
- **Options de sécurité** : `noUncheckedIndexedAccess`, `exactOptionalPropertyTypes`

## 🎯 Scripts disponibles

| Script | Description |
|--------|-------------|
| `npm run dev` | Lance le serveur de développement avec rechargement automatique |
| `npm run build` | Compile le projet TypeScript vers JavaScript |
| `npm run start` | Lance l'application compilée |
| `npm run clean` | Supprime le dossier de build |

## 🛠️ Personnalisation

Vous pouvez facilement personnaliser le script en modifiant :

- Les dépendances installées (ligne ~65)
- La configuration TypeScript (tsconfig.json template)
- Le contenu du fichier de démarrage
- Les scripts npm ajoutés

## 🤝 Contribution

Les contributions sont les bienvenues ! N'hésitez pas à :

1. Fork le projet
2. Créer une branche pour votre fonctionnalité (`git checkout -b feature/ma-fonctionnalite`)
3. Commiter vos changements (`git commit -am 'Ajout de ma fonctionnalité'`)
4. Pusher vers la branche (`git push origin feature/ma-fonctionnalite`)
5. Ouvrir une Pull Request

## 📄 Licence

Ce projet est sous licence MIT. Voir le fichier `LICENSE` pour plus de détails.

## 🙏 Remerciements

Inspiré par les meilleures pratiques de développement Node.js et TypeScript.

---

**Créé avec ❤️ pour simplifier l'initialisation de projets Node.js TypeScript**
# init-nodejs-ts
