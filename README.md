# Max LED Lighting - Dynamic Programming Solution

## Overview

This project presents a dynamic programming solution to the Max LED Lighting problem, which involves determining the maximum number of LEDs that can be lighted on a circuit board without wire crossings. The repository contains a Flutter desktop application designed to solve this problem, offering both a user-friendly interface and the algorithmic backend to handle computations.

## Features

- **Dynamic Programming Algorithm**: Implements an efficient solution for finding the optimal number of LEDs that can be illuminated.
- **Custom Test Case Generator**: Allows for the creation of large test cases to thoroughly assess the program's functionality.
- **Interactive UI**: A clean and intuitive user interface that displays input options, results, and dynamic programming tables.
- **Result Visualization**: Visually demonstrates the optimal pairing between power sources and LEDs.

## Screenshots

*Input Screen*
![1 - input screen](https://github.com/3odeh/Max-LED-Lighting/assets/111912140/bd825e5d-9457-4c25-a516-833c85f327a6)

*Result Screen*
![2 - result screen](https://github.com/3odeh/Max-LED-Lighting/assets/111912140/ba1af44c-91fa-4cbe-b97d-f7cb1dc3ab8c)

*Dynamic Programming Table*
![3 - dynamic table screen](https://github.com/3odeh/Max-LED-Lighting/assets/111912140/3e6607d0-1ce2-4b78-91fe-96af507440f6)


## Installation

To run this project on your local machine, ensure you have Flutter installed and configured:

1. Clone the repository:
   ```
   git clone https://github.com/3odeh/Max-LED-Lighting.git
   ```
2. Navigate to the project directory:
   ```
   cd Max-LED-Lighting
   ```
3. Run the Flutter application:
   ```
   flutter run -d windows (or macos/linux)
   ```

## Usage

1. Enter the number of LEDs or upload a file containing the LED sequence.
2. Click `Generate` to compute the optimal configuration.
3. View the results, including the maximum number of LEDs lighted and their specific numbers.
4. The dynamic programming table is accessible via the `DP Table` button, illustrating the step-by-step computations.


## Input File Format

To run the algorithm with custom data, the application accepts an input file with the following format:

```
<number of LEDs>
<space-separated permutation of numbers from 1 to n>

```


## Contributions

We welcome contributions and suggestions! Please fork the repository and open a pull request with your proposed changes or open an issue to discuss what you would like to change.

