# Palindromes in J

The goal: solve a simple leetcode problem, <https://leetcode.com/problems/palindrome-number/>, but in J.

In other words, define a function that takes an integer as an input and returns true if the number, as written in decimal form, is a palindrome and false otherwise.

## Cast a number as a string

How do I convert a number from a decimal to a string?

In J, the answer is `":`

```j
    ": 10
10
```

## Reverse a string

In J, reverse is `|.`.

```j
    |. 'hi'
ih
```

## Compare

In J, comparing two nouns (like string arrays or number arrays or just atoms) is done using `-:` .

```j
    2 -: 3
0

    2 -: 2
1

    'hi' -: 'ih'
0

    'hi' -: 'hi'
1
```

Note that in J 0 represents `false` and 1 represents `true`.

## Putting it together

```j
    y =: 10
    (|. ": y) -: (": y)
0

    y =: 101
    (|. ": y) -: (": y)
1
```

## Function syntax

Rather than define a function formally, I'll give a couple of examples to follow:

```j
identity =: 3 : 'y'
```

```j
double =: 3 : '2 * y'
```

Yep, there's a random `3 :` there that basically means you're defining a function aka `verb`.

You can actually use the word `verb` instead but the [book I'm starting to read](https://www.jsoftware.com/help/learning/contents.htm) recommends against it.  I haven't found out why yet.  It hides information, but I don't know what :-D.

## Making the expression into a function

```j
    isPalindrome =: 3 : '(|. ": y) -: (": y)'
    isPalindrome 10
0
    isPalindrome 11
1
```

## Get more efficient

One inefficiency above is that we cast y as a string twice.
We can avoid doing that by defining separating concerns between casting and palindrome testing like this:

```j
    isPalindromeString =: 3 : '(|. y) -: y'
    isPalindrome =: 3 : 'isPalindromeString ": y'
    isPalindrome 10
0
    isPalindrome 11
1
```
