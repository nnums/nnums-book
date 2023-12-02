# Colon Arithmatic -- `+:`, `-:`, `*:`, and `%:`

The [J Primer](https://code.jsoftware.com/wiki/Help/Primer/025_Checkpoint_A) has a check point that introduces four new `j` primitives.

The main point of the checkpoint isn't really to learn about the colon arithmetic primitives -- it's to learn about [NuVoc](https://code.jsoftware.com/wiki/NuVoc), which lets you look up all the primitives for yourself.

But here I'm going to put the operators in my own words so that they stick.

## As monads (a j monad is a unary operator that acts to the right)

As monads, these four operators are really simple:

- `+:` doubles the target
- `-:` halves it
- `*:` squares it
- `%:` square roots it

So, for example,

```j
   +: 10
20
   -: 10
5
   *: 10
100
   %: 10
3.16228
```

Note how closely related they are.

- `+:` and `-:` double and halve the numbers and `*:` and `%:` double and halve the logs of the numbers.
- `+:` and `-:` are reciprocals of each other, meaning that together they make the identity.  So are `*:` and `%:`.

## As dyads (a j dyad is an infix binary operator that operates both on the left and the right)

### `+:` as a dyad: `Not-Or`

`+:` only works with boolean arguments.

In that context, it means "neither".  If both sides are false, it gives 1.  Otherwise, it's a 0.

This is the opposite of an inclusive or, so its `not-or`.

I don't see any obvious relationship between this meaning and that of the monadic form.

Also, this operates on atoms, so it's a rank 0 operator.

### `-:` as a dyad: `Match`

This is a strong, noun level, equality check.
So it works to see if two strings or two lists are the same, checking every element as well as data shape.
If everything matches up, it returns 1.  Otherwise, 0.

Note that it's noun level, not atom level.
If you want to compare two lists element by element and get a bit mask as a result, use `=` instead.

### `*:` as a dyad: `Not-And`

This is an atomic operator that only accepts boolean inputs.
In ordinary English we might say "Not both" for nand.

```j
   0 0 1 1 *: 0 1 0 1
1 1 1 0
```

Notice that these two prioritized boolean operations Nor and Nand, are the two that are functionally complete, meaning that any boolean function can be created by a combination of only nand or only nor gates.

### `%:` as a dyad: 'root'

Finally, a dyad that makes sense when you know it's monad.
This is just a good old root operator.  It's monad is square root, meaning that it's the dyad with a default of 2 for the operation.

So some examples:

```j
   2 %: 25
5
   3 %: 125
5
   4 %: 16
2
   8 %: 16
1.41421
```
