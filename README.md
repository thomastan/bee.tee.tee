# Bugfix for https://github.com/jey9711/bee.tee.tee

File ViewController.m ([c0822719](https://github.com/jey9711/bee.tee.tee/blob/c0822719fb2cfb6897798fc32dc6358b01ccedbd/ABC/ViewController.m)):

1. [c0822719](https://github.com/jey9711/bee.tee.tee/blob/c0822719fb2cfb6897798fc32dc6358b01ccedbd/ABC/ViewController.m) contains instance method `fibSe`, which calculates all Fibonacci numbers possible on the iPhone using unsigned integers, but does nothing with them -- effectively making loading time longer with no benefit.

2. [c0822719](https://github.com/jey9711/bee.tee.tee/blob/c0822719fb2cfb6897798fc32dc6358b01ccedbd/ABC/ViewController.m) has instance method `viewDidLoad` with an incorrect while() loop condition.  The correct condition is `while (oneAgo + twoAgo <= UINT_MAX)`, as it appears in subtractive form in method `fibSe` (to avoid overflow), on line 29.  The changed while condition, on line 43, is equivalent to `while (oneAgo + twoAgo <= UINT_MAX - current)` and is incorrect.  For `UINT_MAX` == 2³² - 1 (== 4,294,967,295), the last Fibonacci number under this is 2,971,215,073, and so the incorrect condition causes the search domain to be limited to 4,294,967,295 - `current` == 4,294,967,295 - 1,836,311,903 == 2,458,655,392.  In summary, `viewDidLoad` incorrectly stops at Fibonacci number 1,836,311,903 instead of 2,971,215,073.

3. [c0822719](https://github.com/jey9711/bee.tee.tee/blob/c0822719fb2cfb6897798fc32dc6358b01ccedbd/ABC/ViewController.m) instance method `fibSe` creates a correct NSMutableArray `fib` but it goes unused, while `viewDidLoad` creates an incorrect NSMutableArray `fib` and copies it into the NSArray instance variable `fibTerms`.

Fixes (see [9fa37bf1c8](https://github.com/thomastan/bee.tee.tee/commit/9fa37bf1c8820503589715e58d41f6d3c056ced9): [ViewController.h](https://github.com/thomastan/bee.tee.tee/blob/9fa37bf1c8820503589715e58d41f6d3c056ced9/ABC/ViewController.h) and [ViewController.m](https://github.com/thomastan/bee.tee.tee/blob/9fa37bf1c8820503589715e58d41f6d3c056ced9/ABC/ViewController.m):
- The instance variable is made and kept a NSMutableArray, set by a correct instance method and the incorrect instance method is removed.
- A proper class interface (.h header file) is written.
- Subtitles with ordinals.