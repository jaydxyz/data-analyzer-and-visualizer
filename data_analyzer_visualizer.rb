require 'csv'

def read_data(file_path)
  data = []
  CSV.foreach(file_path, headers: false) do |row|
    data << row[0].to_f
  end
  data
end

def calculate_stats(data)
  sorted_data = data.sort
  len = data.length

  mean = data.sum / len
  median = len.odd? ? sorted_data[len / 2] : (sorted_data[len / 2 - 1] + sorted_data[len / 2]) / 2.0
  std_dev = Math.sqrt(data.map { |x| (x - mean)**2 }.sum / (len - 1))
  q1, q3 = len.odd? ? [sorted_data[len / 4], sorted_data[len * 3 / 4]] : [sorted_data[len / 4 - 1], sorted_data[len * 3 / 4]]

  { mean: mean, median: median, std_dev: std_dev, q1: q1, q3: q3 }
end

def identify_outliers(data, threshold)
  stats = calculate_stats(data)
  iqr = stats[:q3] - stats[:q1]
  lower_bound = stats[:q1] - threshold * iqr
  upper_bound = stats[:q3] + threshold * iqr
  data.select { |x| x < lower_bound || x > upper_bound }
end

def generate_histogram(data, bins)
  min_val, max_val = data.minmax
  bin_width = (max_val - min_val) / bins
  histogram = Array.new(bins, 0)

  data.each do |x|
    bin_index = ((x - min_val) / bin_width).floor
    histogram[bin_index] += 1
  end

  max_count = histogram.max
  scale_factor = 10.0 / max_count

  puts "Histogram:"
  histogram.each_with_index do |count, index|
    bar_length = (count * scale_factor).round
    bar = "█" * bar_length
    puts "#{min_val + index * bin_width}-#{min_val + (index + 1) * bin_width}: #{bar}"
  end
end

def generate_line_graph(data)
  min_val, max_val = data.minmax
  y_scale = 10.0 / (max_val - min_val)

  puts "Line Graph:"
  data.each_with_index do |value, index|
    y_pos = ((value - min_val) * y_scale).round
    line = " " * y_pos + "●"
    puts "#{index}: #{line}"
  end
end

puts "Data Analyzer and Visualizer"
print "Enter the CSV file path: "
file_path = gets.chomp

data = read_data(file_path)

loop do
  puts "\nSelect an option:"
  puts "1. Calculate statistics"
  puts "2. Identify outliers"
  puts "3. Generate histogram"
  puts "4. Generate line graph"
  puts "5. Exit"
  print "Enter your choice: "
  choice = gets.chomp.to_i

  case choice
  when 1
    stats = calculate_stats(data)
    puts "Mean: #{stats[:mean]}"
    puts "Median: #{stats[:median]}"
    puts "Standard Deviation: #{stats[:std_dev]}"
    puts "Q1: #{stats[:q1]}"
    puts "Q3: #{stats[:q3]}"
  when 2
    print "Enter the threshold for outliers: "
    threshold = gets.chomp.to_f
    outliers = identify_outliers(data, threshold)
    puts "Outliers: #{outliers}"
  when 3
    print "Enter the number of bins for the histogram: "
    bins = gets.chomp.to_i
    generate_histogram(data, bins)
  when 4
    generate_line_graph(data)
  when 5
    break
  else
    puts "Invalid choice. Please try again."
  end
end
