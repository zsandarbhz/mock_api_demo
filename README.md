# mock_api_demo


This Flutter application displays a list of products fetched from a mock API, shows product details, and allows users to add products to a cart. The app is designed to evaluate coding skills, architecture, state management, and Flutter proficiency.

## Features

- **Product List Screen**: Displays a list of products with thumbnails, names, and prices. Includes pull-to-refresh functionality.
- **Product Detail Screen**: Shows detailed information about a product (image, name, price, description) with an "Add to Cart" button.
- **Cart Screen**: Displays the list of added products with the total price and an option to remove items.

## State Management

The app uses the `MobX` package for state management.

## Setup Instructions

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Git: [Install Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

### Steps

1. **Clone the repository:**

    git clone https://github.com/zsandarbhz/mock_api_demo.git

    cd mock_api_demo

    flutter pub get

    flutter run

### Usage
*Product List Screen*
Launch the app to see a list of products.
Pull down to refresh the product list.
*Product Detail Screen*
Tap on any product from the list to view its details.
Click the "Add to Cart" button to add the product to your cart.
*Cart Screen*
Tap the cart icon in the app bar to view the cart screen.
See the list of added products with the total price.
Remove items from the cart by tapping the remove icon next to each product.
Clear the cart by tapping the "Clear Cart" button.
