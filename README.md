### A docker farming python application that uses Selenium to help with your M$ Rewards

---

![Static Badge](https://img.shields.io/badge/Made_in-python-violet?style=for-the-badge)
![MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge)
![Maintained](https://img.shields.io/badge/Maintained%3F-yes-green.svg?style=for-the-badge)
![GitHub contributors](https://img.shields.io/github/contributors/klept0/MS-Rewards-Farmer?style=for-the-badge)
![GitHub issues](https://img.shields.io/github/issues/klept0/MS-Rewards-Farmer?style=for-the-badge)

---

> [!IMPORTANT]
> If you are multi-accounting and abusing the service for which this is intended - **_DO NOT COMPLAIN ABOUT BANS!!!_**

---

> [!CAUTION]
> Use it at your own risk, M$ may ban your account (and I would not be responsible for it)
>
> Do not run more than one account at a time.
>
> Do not use more than one phone number per 5 accounts.
>
> Do not redeem more than one reward per day.

---

#### Group Chat - [Telegram](https://t.me/klept0_MS_Rewards_Farmer/) (pay attention to captchas)

#### Original bot by [@charlesbel](https://github.com/charlesbel) - refactored/updated/maintained by [@klept0](https://github.com/klept0) and a community of volunteers.

---

## Installation

This installation allows you to have a system of 4 containers running at the same time to farm the rewards.
It is absolutely necessary to put different proxies for each container in: `docker-compose.yml`
You can delete or add containers, a container will need its `accounts(x).json` file

1. Make `git clone https://github.com/Tiwing/MS-Rewards-Farmer-Docker.git`

2. Create the docker image with the following command :

   `docker build -t <nom_voulue_de_l'image>:latest .`

3. Edit all `accounts(x).json` with your accounts credentials.

   The "proxy" field is not mandatory, you can omit it if you don't want to use proxy (don't keep it as an empty string, remove the line completely).

   - If you want to add more than one account, the syntax is the following:

   ```json
   [
     {
       "username": "Your Email 1",
       "password": "Your Password 1",
       "proxy": "http://user:pass@host1:port"
     },
     {
       "username": "Your Email 2",
       "password": "Your Password 2",
       "proxy": "http://user:pass@host1:port"
     }
   ]
   ```
   
When containers are launched in parallel, two containers must not use the same proxy. 
A container can have the same proxy in its `accounts.json` file, but different proxies are required from one `accounts.json` file to the next

4. Go crontab -e:
    ```text
      # MICROSOFT BOT

      0 1 * * * sleep $(shuf -i 1-15 -n 1)m && /usr/bin/docker-compose -f /<path_to_repository>/docker-compose.yml up -d --build

    ```

---

## Launch arguments

- -l/--lang to force a language (ex: en)
- -g/--geo to force a searching geolocation (ex: US)

  `https://trends.google.com/trends/ for proper geolocation abbreviation for your choice. These MUST be uppercase!!!`

- -p/--proxy to add a proxy to the whole program, supports http/https/socks4/socks5 (overrides per-account proxy in accounts.json)

  `(ex: http://user:pass@host:port)`

- -t/--telegram to add a telegram notification, requires Telegram Bot Token and Chat ID

  `(ex: 123456789:ABCdefGhIjKlmNoPQRsTUVwxyZ 123456789)`

- -d/--discord to add a discord notification, requires Discord Webhook URL

  `(ex: https://discord.com/api/webhooks/123456789/ABCdefGhIjKlmNoPQRsTUVwxyZ)`

- -vn/--verbose notifications to notification listeners (Discord, Telegram)

- -cv/--chromeversion to use a specifiv version of chrome

  `(ex: 118)`

---

> [!TIP]
> If you are having issues first ask - did I make sure I have updated all of the files and cleared the sessions folder before running again?

---

## Features

- Bing searches (Desktop and Mobile) with current User-Agents
- Complete the daily set automatically
- Complete punch cards automatically
- Complete the others promotions automatically
- Headless Mode - _not recommended at all_
- Multi-Account Management
- Session storing
- 2FA Support
- Notifications (Discord/Telegram)
- Proxy Support (3.0) - they need to be **high quality** proxies
- Logs to CSV file for point tracking

---

> [!NOTE]
> You may see [WARNING] in your logs - this is currently enabled for debugging and to provide in any issues you may need to open
