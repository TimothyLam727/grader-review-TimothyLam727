
CPATH='.:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

if [ -f $file ]
then
	echo "file exist"

else 
	echo "wrong file input"
	echo "Grade: 0/2"

fi

cp -r student-submission/* grading-area/
cp -r TestListExamples.java grading-area/

cd grading-area



javac -cp $CPATH *.java 2> error.txt

if [ $? -eq 0 ]
then
	java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > output.txt

	
	passed_line=$(grep "OK" output.txt)

	if [ -n "$passed_line" ]
       	then
	        grade=$(echo "$passed_line" | grep -oE '[0-9]+')
	        echo "Grade : $grade/$grade"
		echo "great job!"
	else 
	        num_tests_line=$(grep -oE "Tests run: [0-9]+" output.txt)
       		numTests=$(echo "$num_tests_line" | grep -oE '[0-9]+')
        	num_failed_line=$(grep -oE "Failures: [0-9]+" output.txt)
        	numFailed=$(echo "$num_tests_line" | grep -oE '[0-9]+')
        	numCorrect=$((numTests - numFailed))
        	echo "Grade : $numCorrect/$numTests"
		echo "good try"
	fi

else
	echo "Compilation error"
	echo "Grade: 0/2"
fi
