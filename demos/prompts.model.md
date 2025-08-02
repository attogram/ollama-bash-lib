# Send a list of prompts to a model

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.41.19

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

 That's a reference to a humorous statement made by Douglas Adams in his book "The Hitchhiker's Guide to the Galaxy". The phrase, "The ships heading for the restaurant are made of a substance that glows with a soothing neon light, and is being powered at the moment by a small boy riding a biro" is another famous quote from the same series. These quotes showcase Adams' unique humor and creativity.

## Explain the theory of relativity in very simple terms.

 The Theory of Relativity, proposed by Albert Einstein, has two main parts: Special Relativity and General Relativity. I'll give a simplified explanation for each:

1. Special Relativity (1905): This part deals with objects moving at constant speeds, specifically the speed of light (approximately 299,792 kilometers per second). Here are its key concepts:
   - The laws of physics are the same for all observers moving at a constant velocity relative to each other.
   - The speed of light is always constant, regardless of the source's motion or the observer's motion. This means that light always appears to travel at 299,792 km/s.
   - Time and space are connected in a way that as an object moves faster, time passes more slowly for it relative to stationary objects (time dilation).
   - As an object moves toward or away from another object at high speeds, lengths appear contracted along the direction of motion (length contraction).

2. General Relativity (1915): This part extends Einstein's theory to include gravity and acceleration. The main idea is that massive objects cause a distortion in space-time, which we perceive as gravity. Some key concepts are:
   - Massive objects curve the fabric of space-time around them, causing other objects with mass to move along curved paths (gravitational fields).
   - The sun's gravity bends the path of light, a phenomenon known as gravitational lensing.
   - Einstein's field equations describe how energy and momentum (including matter and energy) affect the curvature of space-time.
   - Black holes are regions in space where the gravitational pull is so strong that nothing, not even light, can escape.

## Invent a new holiday and describe how people celebrate it.

 Holiday Name: Galactic Connection Day

Celebrated on the shortest day of the year, December 21st (winter solstice in the Northern Hemisphere), this unique holiday aims to foster a sense of unity among all species across the universe. The idea is to celebrate our interconnectedness and inspire exploration, understanding, and friendship with extraterrestrial life forms.

Here's how people celebrate Galactic Connection Day:

1. Space-Themed Decorations: Homes, offices, schools, and public spaces are adorned with space-themed decorations such as stars, planets, aliens, spaceships, and more. People dress up in creative alien costumes to spread joy and festive spirit.

2. Galactic Conferences: Schools, universities, and community centers organize conferences, seminars, and workshops on topics related to astronomy, space exploration, extraterrestrial life, and the search for intelligent life beyond Earth. These events aim to educate people about the universe and encourage them to explore and appreciate its mysteries.

3. Alien Encounter Simulation: In a fun and engaging way, various organizations create simulations that allow participants to experience an "alien encounter." These simulations use virtual reality technology, role-playing games, or interactive presentations to give people a glimpse of what it might be like to communicate with extraterrestrial beings.

4. Interstellar Message Sending: On this day, messages are sent into space as a symbolic gesture of unity and friendship towards any potential extraterrestrial life forms. These messages often contain images, sounds, and greetings from various cultures, expressing our hopes for peace, cooperation, and understanding among all beings in the universe.

5. Galactic Feast: Families and friends come together to share a special meal that represents unity and diversity. The menu might include dishes from different parts of the world, symbolizing the interconnectedness of Earth's cultures.

6. Stargazing Parties: Neighborhoods host stargazing parties where people gather to observe the night sky, share stories about constellations, and discuss their dreams for space exploration. These events often include telescopes, star maps, and educational activities for children.

7. Social Media Campaign: People participate in a global social media campaign using the hashtag #GalacticConnectionDay to share messages of peace, friendship, and unity with extraterrestrial life forms. Participants can also post photos from their celebrations, encouraging others to join in the festivities.

By celebrating Galactic Connection Day, people are reminded of the wonders of the universe, our place within it, and the importance of reaching out to other potential inhabitants of the cosmos. The holiday encourages curiosity, cooperation, and unity among all beings – both on Earth and beyond.

## If a train travels at 60 miles per hour for 3 hours, how far does it go?

 To find the distance traveled by the train, we can use the formula:

Distance = Speed * Time

Given that the speed of the train is 60 miles per hour and it travels for 3 hours, the distance would be:

Distance = 60 mph * 3 hours = 180 miles

So, the train goes 180 miles in 3 hours.

## Translate to French: 'The weather is nice today.'

 Le temps est beau aujourd'hui.

## Is the following review positive or negative? 'I loved the movie, it was fantastic!'

 The review is positive. The user expresses enjoyment and enthusiasm for the movie by using the words "loved" and "fantastic".

## If all cats are animals and some animals are playful, can we say some cats are playful?

 Yes, it is valid to say that some cats are playful because:

1. All cats are animals.
2. Some animals (including cats) are playful.

So, by logical deduction, some cats are playful.

## Write a Bash function that returns the sum of a list of numbers.

 Here's a simple Bash function that calculates the sum of a list of numbers. This function assumes that the list is passed as positional parameters (`$1`, `$2`, `$3`, etc.).

```bash
sum_list() {
    local sum=0
    for num in "$@"; do
        (( sum += num ))
    done
    echo $sum
}
```

You can use this function like so:

```bash
$ sum_list 1 2 3 4 5
25
```

This function uses a local variable `sum`, which ensures that the total is not modified outside of the function. The `for` loop iterates through each positional parameter, increments the sum by its value, and finally the sum is printed out with `echo`.

## If you drop a glass on the floor, what is most likely to happen?

 When a glass is dropped onto a hard surface like a floor, it is likely to break due to the impact. The exact outcome can depend on various factors such as the material of the glass (thinner glasses are more prone to breaking), the height from which it was dropped, the surface it hits (smoother surfaces may cause the glass to shatter more easily), and whether there is anything in the glass that might prevent it from breaking. However, if the glass is made of unbreakable material or if it lands in a way that absorbs the impact, it might not break.

## A rectangle has a length of 10 meters and a width of 4 meters. What is its area?

 The area of a rectangle can be calculated using the formula: Area = Length * Width

Given that the length of the rectangle is 10 meters, and the width is 4 meters, we can calculate its area as follows:

Area = 10 m * 4 m
Area = 40 square meters

So, the area of the rectangle is 40 square meters.

## What is the largest ocean on Earth?

 The Pacific Ocean is the largest ocean on Earth. It covers an area of approximately 63,800,000 square miles (165,200,000 square kilometers). It spans widely from the Arctic in the north to the Antarctic in the south and is bordered by Asia and Australia in the west and North and South America in the east. The Pacific Ocean contains several islands and island groups, including Japan, Hawaii, New Zealand, and many more.
