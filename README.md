# LaCoro Q-commerce app
<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-1-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->

This app is an open source quick commerce app in flutter. 
Feel free to go to the issues list and comment on them to get assigned.

## Architecture diagram

This project uses the concept of [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) which will divide the project into theses layers.

- Presentation
- Domain
- Data

![Image](https://github.com/LaCoro/ConsumerFlutterApp/blob/master/screens/lacoro_consumer_arch.png?raw=true)

## How to configure the backend

LaCoro uses [back4app](https://www.back4app.com/) as backend as service. You need to have a back4app account or create a new one to configure your instance of the LaCoro backend. Then, you need to go to our [LaCoro public DB](https://www.back4app.com/database/admin7/lacoro) and clone that into your back4app account.

After that, you will be able to get the keys to establishing a connection for the Consumer App and Admin App with your brand new backend.

## Setting up your dot.env file
LaCoro uses [flutter_dotenv](https://pub.dev/packages/flutter_dotenv) package in order to set the envrionment variables.
Once you get the back4app credentials you need to add a `development.env` file.

Follow the strucutre defined in [`mock-development.env`](https://github.com/LaCoro/ConsumerFlutterApp/blob/develop/mock-development.env)

## How to contribute ❤️
* Fork this repository
* Clone the repository on your computer.
* Do changes and push to origin.
* Make pull request to this repository.
* Wait for comments or changes requested
* Wait for get merged your PR
 
## Screenshots 
![Image](https://github.com/LaCoro/ConsumerFlutterApp/blob/master/screens/lacoro_consumer_screenshots.png?raw=true)

---
## Try it out!
<a href='https://play.google.com/store/apps/details?id=co.lacoro.consumer'><img alt='Get it on Google Play' src='https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png'/></a>





## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://www.linkedin.com/in/llanox"><img src="https://avatars0.githubusercontent.com/u/282575?v=4" width="100px;" alt=""/><br /><sub><b>Juan Gabriel Gutierrez</b></sub></a><br /><a href="https://github.com/LaCoro/ConsumerFlutterApp/commits?author=llanox" title="Code">💻</a></td>
  </tr>
</table>

<!-- markdownlint-enable -->
<!-- prettier-ignore-end -->
<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!