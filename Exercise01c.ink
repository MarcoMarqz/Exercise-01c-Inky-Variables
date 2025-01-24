/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
 
 
 Variable Checking!
 
 Equality == 
 Not equality: 1 != 2 
 Greater: >
 Less: <
 Great or equal: >=
 Less or equal: <=
 
*/



VAR pet_name = ""
VAR torches = 0 

// Two New Variables
VAR health = 100
VAR coins = 0

-> memory

== memory ==
Before you stands the cavern of Josh. You wish your childhood pet was with you now. The cave might be less intimidating then. What was your pet's name?
 * [Charlie] 
    ~ pet_name = "Charlie" 
    -> cave_mouth
*[Susan]
    ~ pet_name = "Susan"
    -> cave_mouth
*[Spot]
    ~ pet_name = "Spot"
    -> cave_mouth


== cave_mouth ==
You are at the enterance to a cave. {not torch_pickup:There is a torch on the floor.} {coins == 100: You already explored the east tunnel.|The cave extends to the east and west.}

{coins == 100: |You made it to the cave. If only {pet_name} could see you now!}

STATS:
torches: {torches}
health: {health}
coins: {coins}




+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup

== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.
* {torches > 0} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west
{pet_name == "Spot": Spot would love it here in the west|}

Suddenly, You see a monster in the distance! What Will You Do!
* {coins >= 50} [Use 50 magic coins for a sword] -> sword_fight
* {coins >= 20}[Use 20 magic coins for a bow] ->bow_fight
+ {coins == 0} [Run Back!] -> cave_mouth
+ {coins > 0} [Go Back] -> cave_mouth


-> END

== sword_fight ==
Nice! You granted yourself a sword for a brief moment.
~coins = coins - 50
STATS:
torches: {torches}
health: {health}
coins: {coins} 

How will you fight?
*[Charge forward with all your might and swing fiercly] -> sword_success
+[Circle the monster, waiting for the perfect moment] -> sword_fail
-> END


== bow_fight==
Nice Choice! you granted yourself a bow for a brief moment.
~ coins = coins - 20
STATS:
torches: {torches}
health: {health}
coins: {coins}

How will you aim?
*[Take a deep breath and aim for the monster's head] -> bow_success
+[Steady your hand and aim for the monster's chest] -> bow_fail
-> END

==sword_success==
Your aggressive attack catches the monster off guard! You defeat it and find a hidden chest behind it.
~coins = coins + 200
Inside the chest is 200 coins! You collect 200 coins!

STATS:
torches: {torches}
health: {health}
coins: {coins}
->END

==sword_fail ==
Your cautious approach makes you miss a critical opening. The monster strikes you but you use your sword for a small amount of protection
~health = health -30
Your health drops -30.
STATS:
torches: {torches}
health: {health}
coins: {coins}
+ [Go Back] -> west_tunnel
->END

== bow_success == 
Your precision is perfect! The arrow strikes the monster down!
~ coins = coins + 150
You gain 150 magic coins! 
STATS:
torches: {torches}
health: {health}
coins: {coins}
->END

==bow_fail==
Your shot misses the critical spot, allowing the monster to strike you wide open.
~health = health - 50

health drops -50
STATS:
torches: {torches}
health: {health}
coins: {coins}
+ [Go Back] -> west_tunnel
->END




=== torch_pickup ===
~ torches = torches + 1
You now have a torch. May it light the way.
* [Go Back] -> cave_mouth
-> END

== east_tunnel_lit ==
The light of your torch glints off of the thousands of magic coins in the room.
You collected 100 coins!

~ coins = coins + 100
+ [Go Back] -> cave_mouth



-> END
