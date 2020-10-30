# MarvelCharacters

App that shows a list of Marvel characters and a detail screen of each one

## Description

The project has been developed using a VIPER architecture following the single responsability principle.

There are two modules, CharactersList and CharacterDetail, made with a protocol oriented programming, avoiding dependencies and decoupling the layers. 

Each module has a contract (moduleNameProtocols.swift) defining the relationship between layers and making easier to understand at once what each module does.

Networking folder contains all the classes involved in the Marvel API, including configuration, keys, parameters, etc.

### Development info 

Xcode version: v12.0
iOS deployment target: iOS 12
Cocoapods: v1.9.3
Swiftlint
Gitflow


## Tests ⚙️

Tests has been done for CharacterModel and CharactersListPresenter. Presenter has been choosen because of the relationship this class has with other layers (view, interactor and router) so most of them could be tested in just one place. 

For this all the classes involved has been mocked making testing easier and more readable

Tests coverage could be improved but i thought it would be enough for the purpose.


## Author

* **David Noeda** - *iOS Developer*
