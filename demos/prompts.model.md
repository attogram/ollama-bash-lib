# Send a list of prompts to a model

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.8

model: granite3.3:2b

prompts:
* [My hovercraft is full of eels](#my-hovercraft-is-full-of-eels)
* [Explain the theory of relativity in very simple terms.](#explain-the-theory-of-relativity-in-very-simple-terms)
* [Invent a new holiday and describe how people celebrate it.](#invent-a-new-holiday-and-describe-how-people-celebrate-it)
* [If a train travels at 60 miles per hour for 3 hours, how far does it go?](#if-a-train-travels-at-60-miles-per-hour-for-3-hours-how-far-does-it-go)
* [Translate to French: 'The weather is nice today.'](#translate-to-french-the-weather-is-nice-today)
* [Is the following review positive or negative? 'I loved the movie, it was fantastic!'](#is-the-following-review-positive-or-negative-i-loved-the-movie-it-was-fantastic)
* [If all cats are animals and some animals are playful, can we say some cats are playful?](#if-all-cats-are-animals-and-some-animals-are-playful-can-we-say-some-cats-are-playful)
* [Write a Bash function that returns the sum of a list of numbers.](#write-a-bash-function-that-returns-the-sum-of-a-list-of-numbers)
* [If you drop a glass on the floor, what is most likely to happen?](#if-you-drop-a-glass-on-the-floor-what-is-most-likely-to-happen)
* [A rectangle has a length of 10 meters and a width of 4 meters. What is its area?](#a-rectangle-has-a-length-of-10-meters-and-a-width-of-4-meters-what-is-its-area)
* [What is the largest ocean on Earth?](#what-is-the-largest-ocean-on-earth)

## My hovercraft is full of eels

This phrase is a famous line from the Monty Python comedy skit "The Meaning of Life". It's meant to be nonsensical and humorous, not a literal statement. So, your hovercraft doesn't actually have eels in it. Enjoy the absurdity!

## Explain the theory of relativity in very simple terms.

The Theory of Relativity is a scientific concept proposed by Albert Einstein. It's divided into two parts: Special Relativity and General Relativity.

1. Special Relativity (1905): This part states that the laws of physics are the same for all observers moving at constant speeds relative to each other. An important consequence is that time and space are not absolute but relative, depending on an observer's frame of reference. For example, a clock moving past you will appear to tick slower than your own clock.

2. General Relativity (1915): This is an extension of Special Relativity. It says that massive objects cause a distortion in space-time, which we perceive as gravity. So instead of thinking of gravity as a force pulling objects together, imagine it as them following the curves created by large masses in space-time.

In simpler terms, imagine you're on a bus moving at a constant speed (Special Relativity). If someone outside the bus throws a ball straight up, it would still come down in your hands due to gravity (General Relativity). But if the bus were accelerating or decelerating, the ball's path would appear different - this is because motion affects our perception of time and space.

## Invent a new holiday and describe how people celebrate it.

Holiday Name: Harvestia - The Festival of Abundance

Harvestia is a newly invented holiday celebrated in the third quarter, specifically during the period when most harvests have been reaped worldwide. It falls on the first Sunday after the Autumnal Equinox, marking the peak of the harvest season across various regions. The primary objective of Harvestia is to celebrate the Earth's bounty, express gratitude for a fruitful harvest, and renew community bonds through communal meals and festivities.

Celebration Details:

1. Gratitude Ceremonies: Communities organize gatherings in local parks or common areas where people come together to express their gratitude for the Earth's abundant harvest. These ceremonies involve personal reflections on what they have been provided and commitments to sustainable living moving forward.

2. Communal Feasts: A central aspect of Harvestia is the preparation and sharing of a grand feast, featuring local and seasonal ingredients representing the best of each region's harvest. This meal symbolizes unity, equality, and celebration of diverse cultural contributions to global food production.

3. Artistic Expressions: Handcrafted decorations, including nature-inspired art pieces using harvested materials, adorn public spaces. These creations serve as visual reminders of the Earth's nurturing power and human appreciation for its gifts.

4. Storytelling Sessions: Elder storytellers gather to share tales passed down through generations about agricultural practices, harvest-related legends, and historical significance tied to Harvestia celebrations. These narratives foster cultural continuity and appreciation for traditional wisdom.

5. Charitable Acts: Many communities organize charity drives during Harvestia to support those experiencing food insecurity or facing challenges due to seasonal unemployment related to agriculture. Donations of locally grown produce, handmade crafts, and financial contributions are encouraged.

6. Education Initiatives: Educational programs take place in schools and community centers to teach children about the importance of sustainable farming practices, local food systems, and global interconnectedness through agriculture.

7. Music and Dance Performances: Cultural events showcasing traditional songs and dances tied to Harvestia celebrations foster a sense of shared identity and cultural pride. These performances often incorporate instruments made from natural materials, emphasizing harmony with nature.

8. Eco-Friendly Practices: Harvestia serves as an opportunity for communities to implement eco-friendly initiatives, such as tree planting, composting workshops, and beekeeping demonstrations, promoting environmental stewardship and sustainable living.

In essence, Harvestia is a holiday that encourages gratitude, unity, and celebration of Earth's bounty while fostering personal growth, community bonding, and ecological responsibility – making it an ideal addition to the calendar for those seeking to honor nature's generosity.

## If a train travels at 60 miles per hour for 3 hours, how far does it go?

The distance traveled can be calculated using the formula: Distance = Speed × Time. Here, the speed of the train is 60 miles per hour, and it travels for 3 hours. So, Distance = 60 mph × 3 hours = 180 miles. The train goes 180 miles.

## Translate to French: 'The weather is nice today.'

'Le temps est beau aujourd'hui.'

## Is the following review positive or negative? 'I loved the movie, it was fantastic!'

The review is positive. The user expresses admiration and enjoyment for the movie with exclamations such as "loved" and "fantastic," indicating a favorable opinion of the film.

## If all cats are animals and some animals are playful, can we say some cats are playful?

Yes, based on the given premises, we can indeed conclude that some cats are playful. This is because if all cats are animals (a fact) and some animals are playful (another fact), it logically follows that some cats, being a subset of animals, must also be playful.

## Write a Bash function that returns the sum of a list of numbers.

Here is a simple Bash function that takes a list of numbers separated by spaces as input and returns their sum:

```bash
sum_numbers() {
  # Remove any trailing newline from stdin
  local nums=("$@")

  # Calculate the sum using a loop
  local sum=0
  for num in "${nums[@]}"; do
    ((sum += num))
  done

  echo $sum
}
```

You can use this function like this:

```bash
echo "1 2 3 4 5" | sum_numbers
# Output: 15
```

Note that Bash functions can accept multiple arguments using the `@` symbol, which creates an array from the arguments passed to the function. The `for` loop then iterates over this array and calculates the sum of its elements.

## If you drop a glass on the floor, what is most likely to happen?

When you drop a glass on the floor, it's most likely to shatter due to the sudden impact and potential for uneven surface. However, the outcome can depend on factors like the glass's condition, the dropping point, and whether it lands on a hard or soft surface.

## A rectangle has a length of 10 meters and a width of 4 meters. What is its area?

The area of a rectangle can be calculated by multiplying its length by its width. In this case, the length is 10 meters and the width is 4 meters. So, the area would be:

Area = Length × Width
        = 10 m × 4 m
        = 40 square meters

Therefore, the area of the rectangle is 40 square meters.

## What is the largest ocean on Earth?

The largest ocean on Earth is the Pacific Ocean. It covers an area of about 63 million square miles (163 million square kilometers), making up approximately 41% of the Earth's surface.
