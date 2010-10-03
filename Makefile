default: all

all: clean generate build test

build: 
	ant
	rm -f sql-parser.jar
	jar cvfm sql-parser.jar manifest -C bin/ .

test:
	@echo "Testing..."
	@./test-runner.rb

generate:
	java -cp libs/antlr-3.2.jar org.antlr.Tool src/SQLFormatter.g
	mv SQLFormatter.tokens generated
	mv src/SQLFormatterLexer.java generated
	mv src/SQLFormatterParser.java generated

clean:
	ant clean


