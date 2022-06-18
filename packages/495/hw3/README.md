csv2tsv.sh script converts the input.csv named file into input.tsv. You can use this tsv for later.
To put the input file into hadoop: hadoop fs -put input.tsv .

You can use make to compile java program.

commands:
hadoop jar Hw3.jar Hw3 total input.tsv output_total
hadoop jar Hw3.jar Hw3 average input.tsv output_average
hadoop jar Hw3.jar Hw3 popular input.tsv output_popular
hadoop jar Hw3.jar Hw3 explicitlypopular input.tsv output_explicitlypopular
hadoop jar Hw3.jar Hw3 dancebyyear input.tsv output_dancebyyear