all: src/Main.java
	hadoop com.sun.tools.javac.Main src/*.java -cp opencsv-3.8.jar
	jar cf Hw3.jar src/*.class

clean:
	rm -rf Hw3.jar src/*.class