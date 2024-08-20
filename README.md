# Time Calculator

**Time Calculator** is a simple Dart application designed to help you calculate the total time you’ve worked by entering multiple time entries. Additionally, it calculates your earnings based on an hourly rate.

## Table of Contents

- [Features](#features)
- [How to Use](#how-to-use)
- [Screenshots](#screenshots)
- [Download](#download)
- [Exporting Executable](#exporting-executable)
  - [For Windows](#for-windows)
  - [For macOS](#for-macos)

## Features

- **Time Calculation**: Add multiple time entries in `hh:mm:ss` **or** `hh:mm` format and get the total time worked.
- **Price Calculation**: Enter your hourly rate to calculate your total price based on the time worked.

## How to Use

1. **Enter Times**: Input multiple time entries in the format `hh:mm:ss`.
2. **Calculate Total Time**: The program will sum up all the entered times and display the total.
3. **Calculate Earnings**: Enter your hourly rate, and the program will compute your total earnings based on the total time worked.

## Screenshots

Here’s a screenshot of the program showing how the program works:

<!-- ![time_calculator example](https://github.com/user-attachments/assets/e3812032-5c5a-41cb-b5dd-8c206ded4bc9) -->

![time_calculator_example_gif](https://github.com/user-attachments/assets/2c6ac238-1683-408d-be2d-ac6b52fff463)


## Download

You can download the executable files for Windows and macOS:

- [Download for Windows](./script_files/windows/time_calculator.exe)
- [Download for macOS](./script_files/mac/time_calculator)

## Exporting Executable

If you want to compile the application yourself, follow these instructions:

### For Windows:

```bash
dart compile exe lib/time_calculator.dart
```

### For macOS:

1. Compile the Dart script into a native executable:

   ```bash
   dart compile exe lib/time_calculator.dart -o time_calculator
   ```
   This generates a native executable (`time_calculator`) that doesn't require `dartaotruntime`.

2. Make the file executable:

  ```bash
   chmod +x time_calculator
  ```

  You can directly execute the time_calculator file from the terminal without additional commands. This is a more robust solution for production use.



For more details, see the [Dart dartaotruntime documentation](https://dart.dev/tools/dartaotruntime).

