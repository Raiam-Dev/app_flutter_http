# app_http

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Estrutura de Pastas

lib/
├── core/                  # Funcionalidades genéricas e reutilizáveis
│   ├── constants/         # Constantes globais (cores, textos, etc.)
│   ├── exceptions/        # Classes para tratamento de erros
│   ├── globals/           # Variáveis globais acessíveis por todo o app
│   ├── utils/             # Funções auxiliares
│   └── services/          # Serviços genéricos (ex: API, conexão)
│
├── data/                  # Camada de dados
│   ├── models/            # Modelos (User, Post, etc.)
│   ├── datasources/       # Fontes de dados (API, banco local)
│   └── repositories/      # Interfaces com a lógica de negócio
│
├── domain/ (opcional)     # Camada de domínio (Clean Architecture)
│   └── usecases/          # Casos de uso (regras de negócio)
│
├── presentation/          # Camada de apresentação (UI)
│   ├── pages/             # Telas/Páginas (HomePage, LoginPage)
│   ├── widgets/           # Componentes reutilizáveis
│   └── controllers/       # Gerência de estado (ex: GetX, MobX)
│
├── routes/                # Rotas do app
│   └── app_routes.dart    # Definições de rotas nomeadas
│
└── main.dart              # Ponto de entrada do aplicativo
