# CatanCards
A very primitive iOS app to be used instead of the dice in Settlers of Catan

This built in late 2014 when I wrote it. It hasn't really been maintained.

# Background
This came about because random number generation doesn't feel fair in a game like Settlers of Catan.

Check out [this article about randomness](http://www.empiricalzeal.com/2012/12/21/what-does-randomness-look-like/).

What you really want is an *even* distribution of numbers, not an endless stream of clumpy randomness.
With an even distribution, the 2 and the 12 don't come up very often, the robber moves around a lot, and those 6's and 8's are prime real estate.

# How
This works by taking all of the possible combinations, shuffling them randomly, and then feeding them back out.

To make it hard to guess what's going to come next we reshuffle when there are a few cards left.

This gives you an unpredictable, but fair feeling, distribution of numbers.

There's also some noises and colors and stuff to make it easy to identify which number came up.

Works pretty well on a small iPad, but anything will work.
