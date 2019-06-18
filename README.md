# Object Oriented Ruby Assessment

This assessment is designed to test your understanding of Object Oriented Programming in Ruby. It covers:

- Object Oriented Ruby Syntax
- Relationships between Classes
- Designing Object Oriented Programs

Read these instructions carefully. They describe the code you'll be working with and what you need to do.

At the bottom of this file is the rubric used to evaluate your submission. You do not need to get everything right. Focus on getting each piece of code to work rather than writing partial solutions to each.

## Introduction

The program you are working with is a command line tool for analyzing city budgets. There are several classes involved in the application which are partially working. Your job is to fix the broken implementation, add the missing functionality, and refactor the code so that it uses good Object Oriented design.

### Files

In this directory, there are 6 files:

* `README.md`          - instructions for what to do
* `budget_analyzer.rb` - the entry point to the application. Running this file runs the analysis and prints output to the console.
* `city.rb`            - class to represent a city.
* `line_item.rb`       - class to represent an item in a city's budget
* `department.rb`      - empty file to hold your code for the `Department` class
* `city_data.rb`       - data for the application. You do not need to edit this file.

To run the application, run `ruby budget_analyzer.rb`. Since it's broken, you'll notice that it exits with an error instead of printing out the correct results.

You will make edits in `line_item.rb`, `city.rb`, `department.rb`, and `budget_analyzer.rb`.

## Instructions

Here is an overview of what you'll do. Each of these steps are described in more detail below.

1. Debug `format_for_display` so that the code runs without errors
2. Fix logic issue in calculating the total expenses
3. Fix logic issue in most_expensive_line_item
4. Add total_revenues method
5. Refactor `City.display_name` to an instance method
6. Create `Department` class
7. Add `.find_or_create` to Department
8. Add `.departments` to City
9. Add `.number_of_departments` to City

Follow each of the steps one by one. Don't worry if you do not finish - you can still submit your code and get useful feedback if you have only completed some of the tasks.

### 1. Debug `format_for_display` so that the code runs without errors

When you run `ruby budget_analyzer.rb`, there is a no method error. Debug the code so that the program runs without errors.

As you solve the rest of the tasks, make sure that the code continues to run without errors. If you introduce an error, debug it before moving on.

### 2. Fix logic issue in calculating the total expenses

Something is wrong with the way that the total expenses are being calculated. When you run the code, you can see that the total expenses for Pittsburgh are showing as `$-566481575`. The correct total for Pittsburgh is `$556414859`.

Debug the issue so that the correct total expenses print for each city. The correct total expenses for Chapel Hill are `$-122487684`. The correct total expenses for Seattle are `$-112512233`.

### 3. Fix logic issue in most_expensive_line_item

Something is wrong with the way the most expensive line item for each city is calculated. Pittsburgh's most expensive line item is displayed as:

```
Most Expensive Line Item: regular cc-general $-43637
```

The correct name and value are `principal $53000000`, so the line should print as: 

```
Most Expensive Line Item: principal $53000000
```

Debug the issue so that the correct line item is printed. 

As a check, for Chapel Hill, it should be `personnel $10367327`.  For Seattle, it should be `other general expenses $362531503`.

### 4. Add total_revenues method

Line 18 of `budget_analyzer.rb` calls the non-existent method `total_revenues` of the City class. (The line is commented out so that the code doesn't exit with an error).

Add the method `total_revenues` to the City class and uncomment the line in `budget_analyzer.rb`. It should add up the amount of all the line items categorized as `'revenue'`.

When the method is working and the line is uncommented, it should print out (for each city):

- `Total Revenues: $-566481575` (Pittsburgh)
- `Total Revenues: $-122487684` (Chapel Hill)
- `Total Revenues: $-112512233` (Seattle)

Note that the total revenues should be printed as negative. That's standard accounting practice.

#### 5. Refactor `City.display_name` to an instance method

`City.display_name` is a class method that takes in a name and returns a formatted version. Refactor the method from class method to instance method.

`City#display_name` (the instance method) should not take in any arguments, but should perform the same formatting logic.

Update the code in `budget_analyzer.rb` to call the instance method instead of the class method.

### 6. Create `Department` class

Create a class in `department.rb` to represent a department. 

A department should have instance variables for:

- `name` (should be a string from the budget data)
- `city` (should be an instance of City)

Define the initialize method so that it takes in a name and a city. The instance variables storing the name and city should be set on initialization. For both name and city, there should be a reader method but no writer method. 

Department should have a class variable `@@all` with an array of all the instances of Department. When any instance of Department is initialized, it should be added to the `@@all` array.

Add a class method `Department.all` that returns the array of all departments.

### 7. Add `.find_or_create` to Department

Add a class method `find_or_create` to Department. The method should take in name and city as arguments. It should look through the array of all Department instances to find a Department with that name and city. 

If there is already a department with that name and city, `find_or_create` should return that department.

If there is not already a department with that name and city, `find_or_create` should return a new city.

In `LineItem#initialize`, use the `Department.find_or_create` method to find or create an instance of a Department with that name and city. 

### 8. Add `departments` method to City

Add an instance method `departments` to the City class. It should use the array of all Departments. It should return an array of all the Departments that belong to the city.

### 9. Add `number_of_departments` to City

Add a method `number_of_departments` to the City class to count the number of departments that belong to that city. Feel free to use the methods you've already written as helper methods. 

On line 19 of `budget_analyzer.rb`, there's a commented-out line for printing the number of departments in a city. Uncomment this line of code and test that the number of departments is printing correctly. Here's what each city should print:

- `Number of Departments: 27` (Pittsburgh)
- `Number of Departments: 23` (Chapel Hill)
- `Number of Departments: 247` (Seattle)

### Test, Cleanup, and Submission

If you run `ruby budget_analyzer.rb` after all the fixes are made, the whole output should be:

```
Analyzing budgets...
--
Pittsburgh
Total Expenses: $556414859
Most Expensive Line Item: principal $53000000
Total: $-10066716
Total Revenues: $-566481575
Number of Departments: 27
--
Chapel Hill
Total Expenses: $122277684
Most Expensive Line Item: personnel $10367327
Total: $-210000
Total Revenues: $-122487684
Number of Departments: 23
--
Seattle
Total Expenses: $6121946257
Most Expensive Line Item: other general expenses $362531503
Total: $6009434024
Total Revenues: $-112512233
Number of Departments: 247
```

If you'd like to test your output against the sample, you can run `diff sample_output.txt <(ruby budget_analyzer.rb)`. This will show any different lines between your output and the sample output. If they are an exact match, no lines will be printed.

Clean up your application. Remove commented out code, check that your indentation is correct, and make sure that your variables are named correctly. Submit your code for feedback.

## Rubric

### Object Oriented Ruby Syntax

1. Invalid syntax, program exits with syntax error when run
2. Incorrect use of syntax, program exits with runtime errors
3. Program runs without raising an error, but is incomplete or has logic bugs
4. Program executes successfully, but code may have minor flaws or non-idiomatic Ruby
5. Program executes successfully, code uses clear variable names, comments, formatting, and idiomatic Ruby

### Relationships between Classes and Objects

1. Code does not successfully connect classes with relationships or inheritance
2. Code connects classes incompletely or with errors; it may have relationships but not inheritance or inheritance but not relationships
3. Inheritance and Class relationships mostly correct, but with some design errors
4. Code correctly connects classes with relationships and inheritance,
5. Code correctly connects classes with relationships and inheritance,

### OO Design

1. Code design does not correctly choose class vs. instance methods
2. Code correctly chooses class vs. instance methods, but does not successfully extract helper methods
3. Code correctly chooses class vs. instance methods and extracts helper methods, but there are some errors.
4. Code correctly selects class and instance methods and successfully extracts helper methods. Code may choose wrong models to implement certain methods on or choose wrong levels of visibility for methods.
5. Code correctly selects class and instance methods and successfully extracts helper methods. Code chooses appropriate models to implement methods on and correct levels of visibility.
