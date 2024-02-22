### Game Design Document (GDD) for Ring Runner
---

![alt_text](docs\img\20240218_ring_runner.png)

# Table of Contents
- [Ring Runner](#ring-runner)
  - [1.0 Summary](#10-summary)
  - [2.0 Game Overview](#20-game-overview)
    - [2.1 References](#21-references)
    - [2.2 Terminology](#22-terminology)
    - [2.3 Game Flow Chart](#23-game-flow-chart)
  - [3.0 Objects/Components](#30-objectscomponents)
    - [3.1](#31)
  - [4.0 Gameplay](#40-gameplay)
    - [4.1](#41)
  - [5.0 Questions and Additional Ideas](#50-questions-and-additional-ideas)
    - [5.1 Questions](#51-questions)
    - [5.2 Additional ideas](#52-additional-ideas)
  - [6.0 Appendix](#60-appendix)
    - [References](#references)

# Ring Runner

An endless runner game crafted for the PICO-8 platform, featuring a donut that speeds through an obstacle course filled with springs, ramps, and spikes. The aim is to survive as long as possible by relying on quick reflexes, skill, and wit.

## 1.0 Summary

Ring Runner combines the charm of retro gaming with the thrill of modern endless runners, creating a unique and engaging experience. As a donut, the player rolls through an ever-changing track, encountering various obstacles that require precise movements and quick reflexes to overcome. The game's design emphasizes constant engagement, ensuring that players are always on their toes, ready to react to new challenges.

### Player Experience

The core experience is designed to keep players engaged and constantly involved in the game's action. We aim for the player to feel a continuous sense of progression and achievement, with each moment in the game offering a new challenge to overcome. The twitch action controls ensure that the player is always anticipating and reacting, providing a satisfying loop of action and reward.

### Core Design Values
<!-- What are your core design values? -->
- **Retro**: Ring Runner pays homage to the classic arcade and early console games, both in its pixel art aesthetics and in its straightforward, yet challenging gameplay mechanics. The PICO-8 platform is chosen specifically to enhance this retro feel, limiting the game's visual and technical aspects to what could be achieved with older hardware.

- **Fast-Paced**: The game is designed to keep players on the edge of their seats. The track speeds up as the player progresses, increasing the difficulty and requiring faster reflexes. This design choice ensures that the game remains challenging and engaging over time.

- **Reflex-Based**: Success in Ring Runner depends on the player's ability to quickly respond to obstacles and changing patterns on the track. The game rewards sharp reflexes and penalizes hesitation, pushing players to improve their reaction times and adapt to new obstacles and challenges.

### Desired Player Feel
<!-- You should also discuss here how you want the player to feel. -->
Ring Runner aims to immerse players in a flow state, where they are fully absorbed in the game's challenges, reacting instinctively to obstacles, and experiencing a deep sense of satisfaction with each successful maneuver. The goal is for players to come away feeling exhilarated by their ability to navigate the complex track, motivated to improve their skills and achieve higher scores.

By combining these core design values, Ring Runner strives to offer a compelling and addictive gameplay experience that appeals to fans of retro games and endless runners alike. The game's design ensures that players have a clear understanding of its mechanics from the outset, while the increasing difficulty and variety of obstacles keep the gameplay fresh and exciting.

---

## 2.0 Game Overview

### 2.1 References
<!-- What games are similar to your game? What are you referencing in your designs? You can use your competitive research homework here. Competitive research helps you as the designer know what you are going for, as well as for anyone reading your doc. If they are familiar with the game, you are referencing this immediately clues them in to what you want to do. -->
Ring Runner draws inspiration from a blend of classic and modern games, combining elements of rapid gameplay, precise control demands, and unique thematic settings to create an engaging experience. Two primary references stand out in the development and conceptualization of Ring Runner:

- **Geometry Dash**: Similar to Geometry Dash, Ring Runner challenges players with a side-scrolling obstacle course that requires precise timing and quick reflexes. The aesthetic simplicity, alongside the concept of navigating through geometric obstacles, is a core similarity. While Geometry Dash focuses on rhythm-based levels with a cube protagonist, Ring Runner introduces a playful twist with a rolling donut navigating through a kitchen-themed obstacle course.

- **Sonic the Hedgehog (Sega Genesis)**: The fast-paced action and platforming elements of the original Sonic the Hedgehog games heavily influence Ring Runner's design. Like Sonic, players must make split-second decisions to avoid obstacles and navigate through the levels. The inclusion of springs and ramps in Ring Runner is a nod to the classic Sonic mechanics, allowing for dynamic movements and exciting gameplay. However, Ring Runner incorporates a unique mechanic of color matching with springs, adding an additional layer of strategy to the fast-paced action.

Through these inspirations, Ring Runner aims to capture the essence of engaging platformers and endless runners, while offering a fresh and distinctive gameplay experience rooted in the nostalgia of classic games.

### 2.2 Terminology
<!-- If you have any made up terminology in your game, or you are using words in a different way than we would expect them to be used this a place where you can identify that. -->
Understanding the unique elements of Ring Runner is essential for players to navigate the game effectively. Here are some specific terms used within the game:

- **Match Spring**: A core mechanic of Ring Runner, Match Springs are special platforms that can either aid or hinder the player's progress. When the player's donut lands on a spring with icing that matches the spring's color, the donut is propelled forward, allowing the player to bypass obstacles and continue their run. However, if the icing color does not match the spring's color, the player will not be able to use the spring, leading to potential game-ending scenarios. This mechanic encourages players to strategize their movements and adds a layer of complexity to the gameplay.

By incorporating these elements, Ring Runner sets itself apart from other games in the genre, offering players a unique challenge that combines speed, strategy, and quick reflexes.

### 2.3 Game Flow Chart
<!-- You will put your games flow chart here to show the flow of your game. From this flow chart you can define the main actions, objects, and rules that you will need to explain more in detail. -->
![alt_text](docs/img/GameFlowChart.png "Picture")

## 3.0 Objects/Components
*In this section you would break down the objects of your game that need to be detailed out. For example, if your game is a card game you would detail the cards here.  Or if it was a board game maybe you would have a section showing the board layout and considerations for the board we need to keep in mind, as well as maybe one for the player tokens etc.*

**DONUT**
**SPIKES**
**ICING POWER-UP**


### 3.1 

## 4.0 Gameplay
*In this section you would start going through all the considerations in the flow of your gameplay. Consider: What can the player do? Are their turns? What can players do on their turns? This is probably going to be the meatiest section of your GDD and should cover how the game is supposed to run, and potential edge cases.*



### 4.1 [An example section about Player’s Turns]
<!-- On a player’s turn they can take one of three following actions: 
- d.	Discard Cards and Draw up to their Hand Limit
  Here is where I would describe what it means to discard (Players can add cards to the discard deck.) I also mentioned a Hand Limit…what is that? How many cards is in the hand limit? Is that something I should put in the components section?  
- e.	Play a Pair
  What does it mean to play a pair? Where do pairs go? Does something happen when you play a pair? 
- f.	Trade Cards with an Opponent
  You get the gist of it now, right? (Unfortunately, yes GDDs require detail!) Usually when I am writing a GDD I do a lot of hopping around between sections. I might move info from the gameplay section into the components section or vice versa.*
-->

## 5.0 Questions and Additional Ideas
*This is a kind of free-from section that I include in a lot of my personal project documentation. It’s useful for projects that are ongoing with a living doc, or things that need to be tested out.*  



### 5.1 Questions
*In this section I like to identify any questions I have about my design or that I will need to answer to execute my design. When I am working on the doc sometimes I will jot little footnotes down here that need to be included in a section (ie What do players do if they run out of cards?) This reminds me to get that edge case detailed up.* 

### 5.2 Additional ideas.
*This is where I jot down ideas I might want to explore with this game/system in the future. This is only useful if I am using this doc on an ongoing basis, and I plan to come back to it and make edits.*

### Difficulty settings:
- As of now, we have a difficult setting where the player gains more colors as the game progresses. I may include a selector for this difficulty setting

### Levels:
- i'm considering adding other levels to the game, with different backgrounds, floor tiles, and difficulties to them.  

### Game Setup: 
I may introduce springs in a different way: 
- Instead of starting the game with the player as one color, start them as two colors.
- Have a white spring that players may jump on regardless of color. 
- have patterns of mostly white springs, with one colored spring in the mix
- slowly increase the number of red, blue, (and eventually green, and yellow) springs as the game progresses and make the white springs less common. 

### Power-ups:
- Include a power-up where the player turns entirely white in their icing and may jump on any spring whatsoever. 
- Use Icing colors as power-ups/health. the more icing collected, the more springs they could jump on, but when they get hurt, they lose the color that touches the spike and get downgraded. 

### Game Goals:
- I may decide to change the goal of the game (this would build on the level Part) alongside the endless run mode I may include a story mode in which case, here is the story: You're a donut and your want to be eaten. You're rolling through a series of obstacles and crazy environments in the hopes that you roll into the mouth that eats you. 

## 6.0 Appendix
### References
*This section is for linking other relative documentation or resources needed.*