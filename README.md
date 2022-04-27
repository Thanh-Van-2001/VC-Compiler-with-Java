# VC-Compiler-with-Java
Building a Lexical Scanner for VC language:
* Identify all morphemes found within the VC file
* Raise compilation errors if available

## Report Link
[Link](https://docs.google.com/document/d/1s4fCZIPbONZ2qo_nd6-npvhF2LqQat90/edit?usp=sharing&ouid=114314958390553886167&rtpof=true&sd=true)

## About us
- Vũ Trọng Thanh (Leader)
- Phạm Công Chính
- Trần Vũ Toàn
- Nguyễn Văn Thành
- Nguyễn Ngọc Trường Sơn

##  Requirements
[Java 11](https://www.oracle.com/java/technologies/javase/jdk11-archive-downloads.html)

## Usage
First compile the file VCLexer.java

```terrminal
 javac VCLexer.java
```
Then you can run the program with the command

```terrminal
 java VCLexer "input file" > "outputfile"
```

## Example
```terrminal
 java VCLexer test/test58 > test58.vck
```

## License
[MIT](https://choosealicense.com/licenses/mit/)
