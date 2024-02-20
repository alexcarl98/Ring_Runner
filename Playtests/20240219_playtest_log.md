# 2-19-24 Entry
## Summary
*Two Sentences: What your game is. What are your design values. This should be your elevator pitch.*

Ring Runner is a fast paced, reflex based, 2D endless runner where the player is a donut rolling on a track. They interact with obstacles where player’s movements in response determine the game outcome.

## Playtest Rules and Parameters

### The Win Condition
There is no win condition in this game. It's a challenge of endurance for the player, survive as long as possible. 

### Actions
The player is a donut rolling on a track. While rolling on the ground, the player can jump. While in the air, the player may orient themselves forward or backwards and move faster in the downward direction. 

### Obstacles and Objects
The player must evade obstacles and survive for as long as possible:
- **Springs** Jumping on springs with the same color as donuts icing will give the player an extra jump
- **Spikes** If you land on a spike, you die.
- **NOT YET IMPLEMENTED-Ramps** Rolling down a ramp will speed the player up and give them some air time. 
- **NOT YET IMPLEMENTED-Platforms** can jump onto platforms with springs. Platforms and ramps go hand in hand.
- **NOT YET IMPLEMENTED-Coins** Thinking of having coins to help guide the player

## What Happened During the Playtest
After some adjustments, I had a friend of mine (who never played it before) try it out with the new controls. It seems like they were able to grasp it fairly well. I also started the game out with a single color donut, rather than the dual colored donut, that seemed to help get the player's accustomed to the controls.
- *Idea*: maybe instead of having the tutorial, I will make the players have to use the controls of tilting somewhere before they actually would need it.


### What was working? 
We're still going to keep the existing controls, they seem to be more intuitive.
I also got the spikes to start working, they aren't super great but they work.

### What is not working as I intend it (Challenges to be solved?) 
Needed:
- I need to make a more robust system for generating springs in relation to spikes.   
- Have yet to implement the ramps
- Have yet to implement the platforms to jump onto
- Have yet to implement the platforms to jump onto
Wanted:
- Have yet to implement a coin system
- Still want to add Parallax scrolling

### What will I try next? 
- i'm going to make a more robust system for generating spikes, I think I'll also 
- I want to work on expanding on the points system, I'll look at something like tetris in how it scores it's points based on it's moves. 

## Playtest Picture
![playtest_picture](20240219_ring_runner.png)


