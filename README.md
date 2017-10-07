# Omnicalc Ruby

## Introduction

The goal of this project is to get more practice with writing Ruby programs. You will execute the code simply by visiting a particular URL in your browser. **Your visit will trigger the execution of the Ruby code, and the output will appear in your browser window.**

## Target

Ultimately, you will build this application:

http://omnicalc-target.herokuapp.com/

It is a collection of calculators that do various things; count the number of words in a block of text, the monthly payment for a loan, etc. Over time, we may add more and more calculators if we feel like it (if you have a suggestion for a calculator you think we should add, please let us know).

## Setup

 1. Copy the URL of this repository.
 1. In your Cloud9 workspace, open a Terminal window and type `git clone [PASTE THE URL OF THIS REPOSITORY]` and press <kbd>return</kbd>.
 1. After it downloads the code, `cd omnicalc_ruby` and press <kbd>return</kbd>.
 1. Then type `bin/setup` and press <kbd>return</kbd>.
 1. After it completes, type `bin/server` and press <kbd>return</kbd>.
 1. Now paste the URL of your running application into a Chrome tab. If all went well, you should see the New Word Count form. **If not, let us know right away.**
 1. Type in some text and submit the form.
 1. On the results page, you will currently see just a bunch of placeholders. Your job will be to replace the placeholders with correctly computed values.
 1. In Atom, find the `/app/controllers/calculations_controller.rb` file.
 1. Locate the part of the file that looks like this:

        def word_count
          @text = params[:user_text]
          @special_word = params[:user_word]

          # ================================================================================
          # Your code goes below.
          # The text the user input is in the string @text.
          # The special word the user input is in the string @special_word.
          # ================================================================================


          @character_count_with_spaces = "Replace this string with your answer."

          @character_count_without_spaces = "Replace this string with your answer."

          @word_count = "Replace this string with your answer."

          @occurrences = "Replace this string with your answer."
        end

 1. The code between the `def word_count` and `end` is the program that gets executed. I have already written some code that retrieves the inputs from the form and places them into variables for you to use, `@text` and `@special_word`.
 1. Your job is to write code below the comments and, ultimately, store the correct values in the variables I created at the bottom of the method. For example, to solve the first part, call `.length` on the user's input, `@text`, and assign the result to `@character_count_with_spaces`.

        @character_count_with_spaces = @text.length

 1. You have to figure out how to calculate the correct value for the rest: `@character_count_without_spaces`, `@word_count`, and `@occurrences`. Don't change the names of these variables; if you do, your results won't appear in the browser in the end.
 1. Refresh the results page in your browser to re-run your code and see new output.
 1. You can write as much or as little code as it takes to produce the correct answer; create intermediate variables if you want, or do anything else that you learned about from class. It's all just the same Ruby as before.
 1. Next, work on the [Loan Payment calculator](http://localhost:3000/loan_payment/new). You'll again be working in the same file, `/app/controllers/calculations_controller.rb`. This time, scroll down to the method `def loan_payment` and write your code in there as indicated by the comments.
 1. Some tasks are easier, some are much harder. For example, in the Descriptive Statistics calculator, finding the mode (the number that occurs most frequently in a list of numbers) is surprisingly hard. Do your best, but don't get discouraged if you can't quite solve it.
 1. The [Ruby Intro](https://guides.firstdraft.com/introduction-to-ruby.html) contains enough tools to solve all of the Omnicalc challenges. (You can build up almost anything from scratch given conditionals, loops, and variables.) You should attempt to solve it using the tools you've already seen.
 1. For the mode calculation, just worry about the simplest case; when there's one number that occurs most frequently, that should be shown as the mode. I won't be testing the case that there's a tie.
 1. When you're ready for some feedback, or to submit your work, run `rails grade:all` in a Terminal tab. (Make sure that you in the `~/workspace/omnicalc_ruby` folder; if not, `cd omnicalc_ruby`.)
 1. The first time you run `rails grade:all`, it will ask you for a personal access token. Copy-paste it from the assignment page in Canvas.
 1. Ask lots of questions!
