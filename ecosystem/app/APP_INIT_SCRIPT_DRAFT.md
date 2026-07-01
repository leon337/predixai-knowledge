# APP_INIT_SCRIPT_DRAFT

## Aviso
Nao executar sem aprovacao explicita do Leo.

## Objetivo
Criar futuramente a base local do predixai-knowledge-app.

## Script futuro
cd C:\Users\Leo\Documents\GitHub
npm create vite@latest predixai-knowledge-app -- --template react
cd predixai-knowledge-app
npm install
npm install firebase
New-Item -ItemType File -Force ".env.example"
New-Item -ItemType Directory -Force "src\features\auth","src\features\memory","src\features\dashboard","src\features\gallery","src\lib\firebase","src\routes","docs"
code .
npm run dev
