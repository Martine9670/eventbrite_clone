# 🎟️ Eventbrite Clone

**Ruby on Rails Project - THP (Moussaillon phase)**  
A simplified clone of the [Eventbrite](https://www.eventbrite.com/) platform,  
allowing users to **sign up, create, and manage events.**

---

## ⚙️ Versions Used

- **Ruby**: `3.4.x`  
- **Rails**: `8.x` *(⚠️ Not beyond, to stay in line with the course version)*

---

## 🧰 System & Dependencies

Here’s what you need to run this project locally:

- 🗃️ **SQLite** → for the development/test database  
- 🧵 **Node.js & Yarn** → for managing JavaScript assets  
- 🖼️ **ImageMagick** → for image processing with Active Storage  
- 💳 **Stripe** → for secure payment processing

---

## ✨ Main Features

- 🔐 User authentication with **Devise**
- ➕ Create, edit, and delete events
- 🛡️ **Only the event creator** can edit or delete their events
- 📅 Each event includes:
  - Title
  - Description
  - Start date
  - Duration
  - Price
  - Location
  - Image
- 💳 Secure payment with **Stripe** (to join an event)
- 🧑‍💼 **Admin interface** for managing users and events
- 🧑‍🎨 Clean and modern UI using **Bootstrap** or **TailwindCSS**

---

## 🧑‍💻 Author

- 👩‍💻 **Martine PINNA**  
- 🐙 [GitHub: Martine9670](https://github.com/Martine9670)  
- 💬 Discord: *Martine PINNA*

---

## 🚀 Run the Project Locally

```bash
git clone https://github.com/Martine9670/eventbrite_clone.git
cd eventbrite_clone
bundle install
yarn install
rails db:create db:migrate
rails s
