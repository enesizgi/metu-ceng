import os
import csv
import sys

if len(sys.argv) != 2:
    print("Usage: python3 main.py input.csv")
    exit()

file_name = sys.argv[1].split('.')[0]

with open(sys.argv[1], 'r') as csvfile:
    csvin = csv.reader(csvfile, delimiter=',')
    tsv_file = open(f'{file_name}.tsv', 'w')
    tsvout = csv.writer(tsv_file, delimiter='\t')
    for row in list(csvin)[1:]:
        tsvout.writerow(row)
    
os.system("make clean")
os.system("make all")

os.system(f"hadoop fs -rm \"input/{file_name}.tsv\"")
os.system(f"hadoop fs -put \"{file_name}.tsv\" input")

os.system("hadoop fs -rm -R output_total")
os.system(f"hadoop jar Hw3.jar Hw3 total \"input/{file_name}.tsv\" output_total")

os.system("hadoop fs -rm -R output_average")
os.system(f"hadoop jar Hw3.jar Hw3 average \"input/{file_name}.tsv\" output_average")

os.system("hadoop fs -rm -R output_popular")
os.system(f"hadoop jar Hw3.jar Hw3 popular \"input/{file_name}.tsv\" output_popular")

os.system("hadoop fs -rm -R output_explicitlypopular")
os.system(f"hadoop jar Hw3.jar Hw3 explicitlypopular \"input/{file_name}.tsv\" output_explicitlypopular")

os.system("hadoop fs -rm -R output_dancebyyear")
os.system(f"hadoop jar Hw3.jar Hw3 dancebyyear \"input/{file_name}.tsv\" output_dancebyyear")

print("First task: output_total")
os.system("hadoop fs -cat output_total/part-r-00000")

print("Second task: output_average")
os.system("hadoop fs -cat output_average/part-r-00000")

print("Third task: output_popular")
os.system("hadoop fs -cat output_popular/part-r-00000")

print("Fourth task: output_explicitlypopular")
os.system("hadoop fs -cat output_explicitlypopular/part-r-00000")
os.system("hadoop fs -cat output_explicitlypopular/part-r-00001")

print("Fifth task: output_dancebyyear")
os.system("hadoop fs -cat output_dancebyyear/part-r-00000")
os.system("hadoop fs -cat output_dancebyyear/part-r-00001")
os.system("hadoop fs -cat output_dancebyyear/part-r-00002")
