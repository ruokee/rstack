# Keep Laziness

A solution creates work twice: during implementation and whenever someone changes it later. Prefer the option with the lowest combined cost that fulfills the complete requirement.

Suppose an export command needs a different filename suffix. Its writer already decides filenames. Changing that decision there is cheaper to maintain than introducing a naming service and a setting passed through every processing stage. If upstream stages actually use the suffix to choose their behavior, their dependency needs an explicit representation.

Compare alternatives by what remains to maintain: decisions, state, contracts, and coordination between owners. An existing operation may already do the job. A redundant path may be removable. Count the work displaced as well as the work introduced.

A small patch can preserve an expensive design. Replacing several duplicated paths with one complete operation can justify a larger patch. Line counts and call depth help locate costs; responsibilities determine whether those costs are useful.

For removal opportunities, read [Subtract before add](./subtract-before-add.md). For the cost of understanding the result, read [Minimize reader load](./minimize-reader-load.md).
