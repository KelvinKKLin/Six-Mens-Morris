all: classes run manifest

run: $(classes)
	echo "#!/bin/bash" > run.sh
	echo "java -jar Main.jar" >> run.sh
	chmod 754 run.sh 

classes:
	javac sixmensmorris/*.java

manifest: $(classes)
	echo "Manifest-Version: 1.0" > Manifest.txt
	echo "Class-Path: ." >> Manifest.txt l
	echo "Main-Class: sixmensmorris.Game" >> Manifest.txt 
	jar cfm Main.jar Manifest.txt sixmensmorris/*.class

clean:
	rm sixmensmorris/*.class
	rm *.jar
	rm run.sh
	rm Manifest.txt
