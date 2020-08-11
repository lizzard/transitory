"Transitory" by lizzard


Include Basic Screen Effects by Emily Short.

Use scoring.


Part 1 - Setup

Chapter 1 - Miscellaneous

Section 1 - Display

When play begins: 
	now the command prompt is "[time of day] >" ;

Rule for constructing the status line:
	fill status bar with Table of Fancy Status; 
	rule succeeds.
	
Table of Fancy Status
left	right 
" [location]"	"Score: [score]"
" Exits: [short exit list]"	"[number of visited rooms]/[number of rooms] locations"

Section 2 - Exits

Listing exits is an action applying to nothing.
Understand "exits" as listing exits.

Carry out listing exits: say "You can go [exit list] from here.".

To say exit list:
	let place be location;
	let count be 0;
	repeat with way running through directions:
		let place be the room way from the location;
		if place is a room:
			increment count;
			say "[if count is greater than 1] or [end if][bold type][way][roman type] ([place])". 


To say short exit list:
	let place be location;
	let count be 0;
	repeat with way running through directions:
		let place be the room way from the location;
		if place is a room:
			increment count;
			say "[if count is greater than 1] or [end if][bold type][way][roman type]". 

Rule for printing the name of a direction (called the way) while constructing the status line:      choose row with a heading of the way in the Table of Abbreviation;      say "[shortcut entry]". 

Table of Abbreviation 
heading	shortcut
north	"N"
northeast	"NE"
northwest	"NW"
east	"E"
southeast	"SE"
south	"S"
southwest	"SW"
west	"W"
up	"U"
down	"D"
inside	"IN"
outside	"OUT"

Section 3 - Surfaces

A surface is a kind of value. A room has a surface. 
The surfaces are smooth, bumpy, sidewalk, brick, cracked, gravel, sand, grassy, and mud. A room is usually smooth. 


Section 4 - Examining

The description of yourself is "As fantabulous as ever. [line break]";


[Adds taglines to your inventory for particular things] 		
The print standard inventory rule is not listed in any rulebook. 		
Carry out taking inventory (this is the new print inventory rule):
	say "You are carrying: [line break]";
	list the contents of the player, with newlines, indented, including contents, with extra indentation. 

After printing the name of something (called target) while taking inventory:
    follow the property-aggregation rules for the target. 

The property-aggregation rules are an object-based rulebook.
The property-aggregation rulebook has a list of text called the tagline. 

A first property-aggregation rule for an openable open thing (this is the mention open openables rule):
        add "open" to the tagline. 

A first property-aggregation rule for an openable closed thing (this is the mention closed openables rule):
        add "closed" to the tagline. 

A property-aggregation rule for a closed transparent container which contains nothing (this is the mention empty transparent containers rule):
        add "empty" to the tagline. 

A property-aggregation rule for an open container which contains nothing (this is the mention empty open containers rule):
        add "empty" to the tagline. 

A property-aggregation rule for a lit thing (this is the mention lit objects rule):
        add "providing light" to the tagline. 

A property-aggregation rule for a switched on device (this is the mention devices rule):
        add "switched on" to the tagline. 

A property-aggregation rule for a wheelchair worn by the player (this is the mention worn wheelchairs rule):
	add "sitting in it" to the tagline;

A property-aggregation rule for an object that is not a wheelchair worn by the player (this is the mention other worn objects rule):
	add "being worn" to the tagline.
	
A property-aggregation rule for a magic marker:
	if the magic marker is magical:
		add "fizzing gently" to the tagline.
		
A property-aggregation rule for a transit card that is switched on:
	add "sparkling" to the tagline.
	
[A property-aggregation rule for a cat:
	add "purring" to the tagline.]

The last property-aggregation rule (this is the print aggregated properties rule):
	if the number of entries in the tagline is greater than 0:
		say " ([tagline])";
		rule succeeds;
	rule fails. 


Chapter 2 - Devices

Section 1 - Marker

A writing utensil is a kind of thing. A magic marker is a writing utensil. 
A writing utensil can be magical or mundane. A writing utensil is usually mundane.

The magic marker is an object. The description of the magic marker is "A [if the marker is not magical]plain old [end if]magic marker. [if the marker is magical]It tingles with energy.[end if]" 

Section 2 - Card

A transit card is a kind of device. 

An ART card is a transit card. The description of an ART card is "A plastic card with space for four letters. They currently read _ART."

The player is carrying an ART card and a magic marker.

Section 3 - Powerchair

A wheelchair is a kind of wearable thing. A powerchair is a wheelchair. A manual chair is a wheelchair. A scooter is a wheelchair. 

The description of a powerchair is "It's shiny black, it's powerful, and it's from the future."
Understand "chair" as a wheelchair.

Section 4 - Ticket reader

[the reader itself]

A ticket reader is a thing.  "A ticket reader machine is here in a little kiosk."
A ticket reader is fixed in place.
Understand "machine" as a ticket reader.  
The description of the ticket reader is "Its labels, both printed and Braille, are somewhat worn by time. A sign on the machine says 'Swipe *ART card for entry and exit.";  



Chapter 3 - Mobility

Ambulation is a kind of value. The ambulations are wheeling, walking, limping, flying, hopping, and mobile. Understand “wheeled” as wheeling. Understand “walking” as walking. Understand "limping" as limping. Understand "hopping" as hopping.
 
A person has an ambulation. The ambulation of a person is usually walking. 
The ambulation of the player is walking.

Before going to any room:
	if the ambulation of the player is flying:
		say "You flap your wings vigorously.";
	if the ambulation of the player is wheeling:
		if the player is not wearing a wheelchair:
			say "You have some trouble getting around.";
			stop the action;
		otherwise:
			if the surface of the location is bumpy:
				say "[one of]Bumpy ground, but still navigable.[or]It's annoyingly bumpy ground here.[or]Something on your chair is rattling as you go over this jolting surface.[or]You bump and careen across the uneven ground.[or]You carefully pick your way across the uneven ground.[or]Your joints ache with every bump you roll over.[or]The bumps jar your spine.[at random]";
			if the surface of the location is brick:
				say "[one of]Your wheels judder across the blocky floor.[or]Every brick and tile jostles you a little.[or]You can feel the bricks bumping under your tires.[at random]";
			if the surface of the location is grassy:
				say "[one of]The ground is a little soft. Luckily, your wheels can handle it.[or]You trundle determinedly over the uneven grass.[or]Paying special attention to the ground to look for holes or stones, you make your way across the grass[at random]";
			if the surface of the location is mud:
				say "You stick in the mud briefly, then wrench free.";
			if the surface of the location is sand:
				say "Your wheels sink into the sand. It's difficult to get across it.";
			if the surface of the location is gravel:
				say "[one of]Your wheels skid around in the gravel in the deep spots. Embarassing. [or]Ugh, gravel.[or]Little stones are sticking in your tires. Hope this gravel won't get too deep.[at random]";
			if the surface of the location is smooth:
				say "[one of] [or]You zoom on over.[or]You wheel across pleasantly flat ground.[or]Silently, with minimal effort, you traverse the smooth floor.[or]This is such a nice, zippy chair.Smooth![or]Ahhh. Level ground. Feels great.[or]Swanlike, you sail across the smooth ground.[or]You glide over gracefully, feeling suave.[or]Pirouetting smoothly in place, you wheel on over.[then at random]";
	if the ambulation of the player is walking:
		if the player is carrying a wheelchair:
			say "You have some trouble going anywhere while carrying something that big. Maybe if you put it down and sit in it, things will be easier.";
			stop the action;
		
After wearing a wheelchair:
	say "You sit in [the noun]. It's comfy and responsive to your touch.";
	now the ambulation of the player is wheeling;
	stop the action.
	
After taking off a wheelchair:
	say "You get out of [the noun].";
	now the ambulation of the player is mobile;
	stop the action.
	
Understand the command "sit" and "stand" as something new. 
Understand "sit on [something]" as sitting in.
Understand "sit in [something]" as sitting in.
Understand "stand up" or "stand" as standing up.
Sitting in is an action applying to one thing. 
Standing up is an action applying to nothing.

Carry out an actor sitting in a wheelchair:
	if the noun is not worn by the actor:
		silently try the actor taking the noun;
		silently try the actor wearing the noun;
	otherwise:
		say "You're already in it.";

Before standing up:
	if the player is wearing a wheelchair (called the chair): 
		silently try taking off the chair;		
		silently try dropping the chair;
		continue the action;
	otherwise:
		say "You're already up.";
		continue the action.



Chapter 4 - Elevator

Chapter 5 - Money

Chapter 6 - Interactions

Chapter 7 - Time

Chapter 8 - Help

A thing can be examined or unexamined. A thing is usually unexamined. Carry out examining something: now the noun is examined. 

Taking inventory is acting confused. Looking is acting confused. Examining an examined thing is acting confused. 

After acting confused for four turns:
        say "(If you are feeling lost, try typing 'help' for suggestions or 'hint' for a list of hints.)" 

Understand "help [text]" or "help about [text]" as getting help about. Understand the commands "instructions" or "menu" or "info" or "about" as "help". 

Getting help about is an action applying to one topic. 

Carry out getting help about:
	if the topic understood is a topic listed in the Table of Standard Help:
		say "[explanation entry][paragraph break]";
	otherwise:
		say "You're out of ideas." 

Understand "help" as summoning help. Summoning help is an action applying to nothing. 

Carry out summoning help:
	say "Type HELP followed by the name of a topic.[paragraph break] Topic            Description[line break]";
	say "---------------------------------------[line break]";
	repeat through the Table of Standard Help:
		say " [title entry]:		[summary entry][line break]". 

Table of Standard Help
topic	title	summary	explanation
"commands"	"commands"	"A list of basic commands in the game"	"You can 'go' in all 8 directions (north, northeast, etc) as well as up and down. [line break]
You can also take things, open things, sit on things, and stand up. [paragraph break]
look: shows you the description of the room you're in [line break]
i:  lists what you are carrying or wearing. Short for 'inventory'  [line break]
n: shorthand for 'go north' [line break]
x: lets you examine something more closely [line break]
x self: look at yourself [line break]
talk to (person): converse with a character in the game [line break]
wear: put on a wearable object [line break]
exits: shows you a list of possible exits from a room[line break]
friends: lists the people you know in the game [line break]
works: lists the artworks you've experienced [line break]
score: shows your current score [line break]"
"marker"	"marker"	"Hints about the magic marker"	"Try writing on things that seem a little bit magical."
"card"	"card"	"Big hints about the (B)ART card"	"Take it to the concourse levels of the stations and swipe. Depending on the current state of your card, there may be different and perhaps unusual effects."
"exits"	"exits"	"Using the EXITS command"	"Type 'exits' if you want a list of possible exits and where they lead. [line break] At the top of your status bar, there's always a list of available exits."
"murals"	"murals"	"The art and murals"	"It's worth examining the local art. It provides context for the local puzzles and mysteries. There may be times (obvious once you encounter them) when you can interact more with the art."
"score"	"score"	"Things that make your score go up"	"One point for each new room visited. 5 for each Artifact you pick up. 5 more points when you place the 20 Artifacts where they need to go (You'll know it when you see it.)"
"bugs"	"bugs"	"How to report bugs"	"Please report anything you think is wrong, or could use improvement, at https://github.com/lizzard/transitory/issues. You can also email lizhenry@gmail.com with 'TRANSITORY BUG' in the subject line."



[put rules for conversation here]

Part 2 - Works and Friends

Chapter 1 - Works

Chapter 2 - Friends

Part 3 - Locations

A room can be a platform. 
A room can be a concourse. 
A room can be a street level station. 

Chapter 1 - Home

Home of the Traveller is north of Osage Alley.  The surface of Home of the Traveller is smooth. "You recognize the familiar surroundings of your home. A hallway leads north. [if the player is in the Home of the Traveller for more than one time]Though you're comfortable in these small rooms, the world outside calls to you from the door to the south.[end if]"

A welcome sign is in Home of the Traveller. The description of a welcome sign is "Welcome, traveller! Thank you for playtesting. [paragraph break]To start with: You should look at your inventory (type 'i' to see it).[paragraph break]Examine each object you're carrying (type 'x'' to examine)." 

The Bedroom is north of Home of the Traveller. It is smooth. The description is "A room meant for sleeping. To the west, there's another, more spacious room. A pocket door opens south to a bare living room. On the wall, there's a little sign that says 'HELP'."

A battered table is a supporter in The Bedroom. It is fixed in place. 

A help sign is scenery in The Bedroom. The description is "Type 'help' for some basic commands and beginning hints."

