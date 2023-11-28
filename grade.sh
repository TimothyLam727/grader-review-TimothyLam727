CPATH='.:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar'
WINDOWSCPATH='.;../lib/hamcrest-core-1.3.jar;../lib/junit-4.13.2.jar'
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
	"wrong file"

fi

cp -r student-submission/* grading-area/
cp -r TestListExamples.java grading-area/

cd grading-area

javac -cp $CPATH *.java
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > output.txt

if [ -$? -eq 0 ]
then
	echo "Test runs successfully"

else 
	echo "Test fails"

fi
