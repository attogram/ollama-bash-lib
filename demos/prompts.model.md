# Send a list of prompts to a model

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.1

model: mistral:7b

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

 That's a reference to a humorous sentence from Douglas Adams' book "The Hitchhiker's Guide to the Galaxy". In the book, a space-traveling alien named Fenchurch says, "The ships heading for Earth are all very strange shapes. I saw one that was just an enormous bee hive. Another was shaped like a barrel into which the ends had been lopped. And my next-door neighbor has one that's full of eels!"

This phrase has since become a popular catchphrase and internet meme, often used in humor and conversation.

## Explain the theory of relativity in very simple terms.

 The Theory of Relativity, proposed by Albert Einstein, has two parts: Special Relativity and General Relativity.

1. Special Relativity (1905): This theory explains that the laws of physics are the same for all observers moving at a constant velocity relative to each other. It introduces two key concepts:

   - Time Dilation: Time can appear to pass slower for an object in motion compared to one that is stationary. This means a clock on a fast-moving object would appear to tick more slowly from the perspective of a stationary observer.

   - Length Contraction: Objects in motion are perceived as contracted or shortened from the perspective of a stationary observer. This means if you were moving at high speeds and someone was observing you, they would see your car as shorter along its length.

2. General Relativity (1915): This theory is an extension of Special Relativity that includes gravity. It states that massive objects cause a distortion in space-time around them, which we perceive as gravity. This means instead of objects falling towards a gravitational source (like the Earth), they are actually following the curve in space-time created by the Earth's mass.

In very simple terms, Einstein's Theory of Relativity tells us that time and space aren't absolute but are interconnected and can be affected by motion and massive objects. It also predicts phenomena such as time dilation (clocks running slower in strong gravitational fields) and gravitational waves (ripples in space-time caused by accelerating massive objects).

## Invent a new holiday and describe how people celebrate it.

 Holiday Name: Solstice of the Shimmering Lights

This holiday is celebrated annually on June 21st, marking the summer solstice in the Northern Hemisphere and the winter solstice in the Southern Hemisphere. It's a global event that promotes unity, peace, and the appreciation of natural light.

Celebration:

1. Light Festivals: Cities worldwide organize grand light festivals featuring elaborate, eco-friendly light installations illuminating public spaces such as parks, gardens, and historic landmarks. These lights are designed to represent hope, unity, and the power of light over darkness.

2. Lantern Parades: A central part of the celebration is the night-time lantern parade. Participants create their own unique, biodegradable lanterns, often decorated with personal messages of hope, peace, or gratitude. The parade winds through town, creating a mesmerizing spectacle of moving light.

3. Community Gatherings: Neighborhoods host community gatherings where people share food, stories, and music. This is an opportunity for individuals to connect with their neighbors and celebrate the shared beauty of their communities.

4. Sky Gazing: The night before Solstice of the Shimmering Lights is dedicated to sky gazing. People gather at designated viewing points to observe the stars, constellations, and meteor showers, fostering a sense of wonder and appreciation for the cosmos.

5. Acts of Kindness: Participants are encouraged to perform acts of kindness throughout the day, symbolizing the power of light in dispelling darkness. This can range from donating to charity, volunteering at local shelters or hospitals, or simply helping a neighbor in need.

6. Artistic Expressions: Artists create works inspired by the Solstice of the Shimmering Lights theme, showcasing their creations during exhibitions and performances held across the globe. These artistic expressions serve as a testament to humanity's shared desire for peace, unity, and the celebration of light.

7. Environmental Awareness: The holiday also emphasizes environmental awareness, encouraging participants to make eco-friendly choices in their lantern designs, waste management practices, and energy consumption during celebrations. This helps instill a sense of responsibility towards preserving our planet for future generations.

## If a train travels at 60 miles per hour for 3 hours, how far does it go?

 To find the distance traveled by the train, we use the formula:

Distance = Speed * Time

Given that the speed of the train is 60 miles per hour and the time spent traveling is 3 hours, we can calculate the distance as follows:

Distance = 60 mph * 3 hours = 180 miles

So, if a train travels at 60 miles per hour for 3 hours, it covers a distance of 180 miles.

## Translate to French: 'The weather is nice today.'

 Le temps est beau aujourd'hui.

## Is the following review positive or negative? 'I loved the movie, it was fantastic!'

 The given review is positive. It indicates that the person enjoyed and appreciated the movie.

## If all cats are animals and some animals are playful, can we say some cats are playful?

 Yes, you can say that some cats are playful. The reasoning is as follows:

1. All cats are animals (a universal statement).
2. Some animals are playful (another universal statement).
3. Cats belong to the category of animals that are playful since they are animals and share this characteristic with other playful animals.

Hence, some cats are indeed playful.

## Write a Bash function that returns the sum of a list of numbers.

 You can create a Bash function named `sum_list` to calculate the sum of a list of numbers. Here's an example implementation:

```bash
sum_list() {
    local total=0
    for num in "$@"; do
        ((total += num))
    done
    echo $total
}
```

To use this function, simply call it with the list of numbers as arguments:

```bash
$ sum_list 1 2 3 4 5
25
```

This function uses a local variable `total` to keep track of the sum and iterates through each number passed as an argument, adding it to the total. After processing all numbers, the final total is printed on the screen.

## If you drop a glass on the floor, what is most likely to happen?

 When a glass is dropped onto a hard surface like a floor, it's most likely that the glass will shatter or break. This is due to the force of the impact causing stress within the glass that exceeds its strength, resulting in it breaking into pieces. However, if the glass is thick enough and falls on a soft surface, it might not break, but this would be an exception rather than the rule.

## A rectangle has a length of 10 meters and a width of 4 meters. What is its area?

 The area of a rectangle can be calculated by multiplying its length by its width:

Area = Length * Width
     = 10 m * 4 m
     = 40 square meters (or m^2)

So, the area of the rectangle with a length of 10 meters and a width of 4 meters is 40 square meters.

## What is the largest ocean on Earth?

 The Pacific Ocean is the largest ocean on Earth. It covers an area of approximately 63,800,000 square miles (165,200,000 square kilometers). The Pacific Ocean extends from the Arctic in the north to the Southern Ocean in the south and is bordered by Asia and Australia in the west and the Americas in the east. It's also home to some of the deepest parts of the world's oceans, including the Mariana Trench, which reaches a depth of 36,070 feet (10,994 meters).
