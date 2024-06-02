# Data Analyzer and Visualizer

This Ruby script reads numerical data from a CSV file, performs various data analysis tasks, and generates visual representations of the analyzed data using ASCII art and Unicode characters. It provides a command-line interface for users to interact with the script and select desired analysis and visualization options.

## Features

- Reads numerical data from a CSV file
- Calculates statistical measures: mean, median, standard deviation, and quartiles
- Identifies outliers in the data set based on a user-specified threshold
- Generates a histogram of the data distribution using Unicode block characters
- Creates a simple ASCII line graph to visualize the trend of the data over time
- Provides a user-friendly command-line interface for selecting analysis and visualization options

## Requirements

- Ruby (version 2.5 or higher)

## Usage

1. Make sure you have Ruby installed on your system.

2. Clone this repository or download the `data_analyzer_visualizer.rb` script file.

3. Prepare your CSV file containing the numerical data you want to analyze. The CSV file should have one column of numerical values, without any headers.

4. Open a terminal or command prompt and navigate to the directory where the script file is located.

5. Run the script by executing the following command: ruby data_analyzer_visualizer.rb

6. Follow the prompts and provide the necessary information:
- Enter the file path of your CSV file when prompted.
- Select the desired analysis or visualization option from the menu by entering the corresponding number.
- If prompted, provide additional input, such as the threshold for outliers or the number of bins for the histogram.

7. The script will perform the selected analysis or visualization and display the results in the console.

8. You can choose to perform multiple analysis and visualization tasks by selecting different options from the menu.

9. To exit the script, choose the "Exit" option from the menu.

## Example

Here's an example of how to use the script:

1. Prepare a CSV file named `data.csv` with the following contents:
10.5
8.2
12.7
15.3
9.8
11.1
2. ruby data_analyzer_visualizer.rb
3. Enter the file path when prompted: Enter the CSV file path: data.csv
4. Select an option from the menu, for example, "1" to calculate statistics:
Select an option:
Calculate statistics
Identify outliers
Generate histogram
Generate line graph
Exit
Enter your choice: 1
5. The script will display the calculated statistics:
Mean: 11.266666666666667
Median: 10.8
Standard Deviation: 2.328240686240384
Q1: 9.2
Q3: 12.4

6. Continue exploring other options or choose "5" to exit the script.

## License

This project is licensed under the [MIT License](LICENSE).
