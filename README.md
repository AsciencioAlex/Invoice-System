<div align="center">

  <br/>

  <h3><b>Invoice System README</b></h3>

</div>

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
- [💻 Getting Started](#getting-started)
  - [Setup Instructions](#setup)
  - [Prerequisites](#prerequisites)
  - [Screenshots](#screenshots)
  - [APK Download link](#apk-download)
  - [Appetize showcase](#appetize-showcase)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [❓ FAQ ](#faq)
- [📝 License](#license)

# 📖 Invoice System <a name="about-project"></a>

**Invoice System** is a mobile app that integrates with an M-Pesa payment API to generate and process invoices.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Backend</summary>
  <ul>
    <li><a href="https://laravel.com/">Laravel</a></li>
  </ul>
</details>

<details>
  <summary>Frontend</summary>
  <ul>
    <li><a href="https://flutter.dev/">Flutter</a></li>
  </ul>
</details>

### Key Features <a name="key-features"></a>

- **Invoice Generation**
- **M-Pesa Payment Processing**
- **Transaction History Display**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project, you need the following:
- Visual Studio Code IDE
- Flutter SDK
- PHP 5.6 or higher
- Composer

### Setup Instructions

#### Backend

1. Clone the repository: `git clone https://github.com/AsciencioAlex/Invoice-System.git`
2. Navigate to the project directory: `cd Invoice-System/invoice-backend`
3. Install dependencies: `composer install`
4. Create a copy of `.env.example` and rename it to `.env`: `cp .env.example .env`
5. Generate an application key: `php artisan key:generate`
6. Configure your `.env` file with the appropriate database and M-Pesa API credentials.
7. Run the migrations: `php artisan migrate`
8. Start the development server: `php artisan serve`

#### Frontend

1. Clone the repository: `git clone https://github.com/AsciencioAlex/Invoice-System.git`
2. Navigate to the project directory: `cd Invoice-System/invoice_frontend`
3. Install dependencies: `flutter pub get`
4. Run the app on an emulator or physical device: `flutter run`


<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 👥 Authors <a name="authors"></a>

👤 **Your Name**
- GitHub: [@AsciencioAlex](https://github.com/YourUsername)
- LinkedIn: [Alex Asciencio](https://linkedin.com/in/your-profile)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name="future-features"></a>

- [ ] Additional payment methods
- [ ] Detailed transaction reports
- [ ] Multi-currency support

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/AsciencioAlex/Invoice-System/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ⭐️ Show your support <a name="support"></a>

If you like this project, feel free to clone it and incorporate features that enhance your own projects.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🙏 Acknowledgements <a name="acknowledgements"></a>

I thank all contributors and the open-source community for their support.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ❓ FAQ <a name="faq"></a>

- **Can I run the project without installing on the terminal?**

  - Yes, you can run it directly on the browser using Flutter Web.

- **Can I build such a page from scratch and where can I learn?**

  - Yes, it's possible. You can start by learning Flutter and Laravel from their official documentation.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
