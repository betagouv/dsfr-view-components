# Composants du DSFR

[![Tests](https://github.com/betagouv/dsfr-view-components/workflows/Tests/badge.svg)](https://github.com/betagouv/dsfr-view-components/actions?query=workflow%3ATests)
[![Gem Version](https://badge.fury.io/rb/dsfr-view-components.svg)](https://badge.fury.io/rb/dsfr-view-components)
[![Gem](https://img.shields.io/gem/dt/dsfr-view-components?logo=rubygems)](https://rubygems.org/gems/dsfr-view-components)
[![GitHub license](https://img.shields.io/github/license/betagouv/dsfr-view-components)](https://github.com/betagouv/dsfr-view-components/blob/main/LICENSE)
[![Rails](https://img.shields.io/badge/Rails-6.1.5%20%E2%95%B1%207.0.3-E16D6D)](https://weblog.rubyonrails.org/releases/)
[![Ruby](https://img.shields.io/badge/Ruby-2.7.6%20%20%E2%95%B1%203.0.3%20%20%E2%95%B1%203.1.2-E16D6D)](https://www.ruby-lang.org/en/downloads/)

[![Design Système de lʼÉtat](https://img.shields.io/badge/Design%20Système%20de%20lʼÉtat-1.8.4-brightgreen)](https://www.systeme-de-design.gouv.fr/)

Cette gem fournit des composants pour le Design Système de l'État (DSFR) en s'appuyant sur le [framework ViewComponent](https://github.com/ViewComponent/view_component).

C'est un fork de [govuk-components](https://github.com/DFE-Digital/govuk-components) qui propose l'équivalent pour le GOV.UK Design System.

## Documentation

Un [guide complet est disponible](https://betagouv.github.io/dsfr-view-components/). Il contient des instructions pour l'installation et l'usage de cette gem. Les exemples présents éxecutent le code et seront donc toujours à jour.

## Installation

Pour utiliser cette gem dans votre application Rails, il faut ajouter cette ligne dans `config/application.rb`:

```ruby
require "dsfr/components"
```

## Composants disponibles

Cette gem a pour but de supporter tous les composants proposés par le Design Système de l'État hormis ceux concernant les formulaires. Ceux-ci seront fournis dans une gem indépendante dans le futur.

La [liste des composants implémentés ou restants est consultable grâce au label `composant`](https://github.com/betagouv/dsfr-view-components/issues?page=2&q=is%3Aissue+label%3Acomposant) sur ce même dépôt.

<!--
This library also provides helpers for creating [links](https://govuk-components.netlify.app/helpers/link),
[buttons](https://govuk-components.netlify.app/helpers/button), [skip links](https://govuk-components.netlify.app/helpers/skip-link)
and [back to top links](https://govuk-components.netlify.app/helpers/back-to-top-link).
-->

## Services utilisant cette gem

- [Collectif Objets](https://collectif-objets.beta.gouv.fr/) - [code source](https://github.com/betagouv/collectif-objets)

## Contribuer

Nous conseillons d'utiliser [rbenv](https://github.com/rbenv/rbenv) pour gérer vos versions de ruby :

```sh
rbenv local 3.3.6
rbenv install
```

Lancer les tests :

```sh
bundle install
bundle exec rspec spec
```

Pour développer avec les tests en continu :

```sh
bundle exec guard
```

Lancer le guide de documentation :

```sh
make watch-guide
```

Utilisez le générateur pour créer un nouveau composant :

```sh
bin/rails g dsfr_component FancyButton --params title:String count:Integer
```


Lancer la dummy app pour itérer sur les composants :

```sh
cd spec/dummy
bundle install && npm install
bundle exec rails server
```

Déployer une nouvelle version de la gem :

```sh
VERSION=1.3.2 make deploy_gem
```


## Licence

Le code source et la gem sont ouverts sous la licence [MIT](https://opensource.org/licenses/MIT).
