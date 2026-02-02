# wolfram

A command-line tool written in Haskell for generating and displaying patterns from one-dimensional elementary cellular automata, such as those described by Stephen Wolfram.

## Features

*   Generates patterns for Wolfram's Rule 30, Rule 90, and Rule 110.
*   Customizable simulation parameters via command-line arguments.
*   Control the starting generation, number of lines, display width, and horizontal view offset.
*   Built with the Haskell Tool Stack.

## Prerequisites

To build and run this project, you need the [Haskell Tool Stack](https://docs.haskellstack.org/en/stable/install_and_upgrade/).

## Build

1.  Clone the repository:
    ```sh
    git clone https://github.com/EliasJHL/Wolfram.git
    cd wolfram
    ```
2.  Build the project using Stack:
    ```sh
    stack build
    ```
3.  Alternatively, you can use the provided `Makefile` to build the project and copy the executable to the root directory, renaming it to `wolfram`:
    ```sh
    make
    ```

## Usage

Run the executable from the root directory with the necessary flags to configure the simulation. The program prints the generated automaton pattern to the standard output.

```sh
./wolfram --rule <RULE_NUMBER> --lines <NUM_LINES> [OPTIONS]
```

### Command-Line Options

| Flag | Argument | Description | Required |
|---|---|---|:---:|
| `--rule` | `30 \| 90 \| 110` | The cellular automaton rule to apply. | **Yes** |
| `--lines` | `<integer>` | The number of generations (lines) to generate and display. | **Yes** |
| `--start` | `<integer>` | The generation number to start displaying from. Defaults to `0`. | No |
| `--window` | `<integer>` | The width of the output display in characters. Defaults to `80`. | No |
| `--move` | `<integer>` | A horizontal offset for the display. Positive values shift the view right, negative values shift left. Defaults to `0`. | No |

### Examples

**Generate 15 lines of Rule 30:**
```sh
./wolfram --rule 30 --lines 15
```

**Generate 30 lines of Rule 90, starting from generation 10, with a display width of 120:**
```sh
./wolfram --rule 90 --start 10 --lines 30 --window 120
```

**Generate 20 lines of Rule 110, shifting the view 15 characters to the left:**
```sh
./wolfram --rule 110 --lines 20 --move -15
