LIST C1_evidence = moneyIssues, ToD1, ToD2, ledger, lawyer, ToD3
LIST misc = knowName, reviewedCase 
VAR eldritch =0
VAR relationship =50
-> crimeScene
===crimeScene===
The wind howls between the tall skyscrapers, crows cawing in the early fog filled hours. Shivering, you tighten your grip on your coat.
*   “Why did you call me this early?”
*   “I hate the cold”
Small talk

This is my colleague X, talk about them

Since it’s a murder, protocal is for two of us to be on the scene. And you’re the only one I know would get out of bed at 5 am for me on a Monday.

Small talk

Anyways, [C] continued as we approached the scene, “Here we are. Welcome to my, now former, favorite breakfast joint.” A sour look dredged across his face, taking in the grisly scene. Well, time to get to work.

*[Take a look around]
->investigateScene
===investigateScene
	You take a look at the scene, the sleepy dark gray cityscape smirched with the blood oozing down into the gutter. {Where to start…|What next…}
	+(body)[The body]
		You crouch down taking a look at the corpse. Looks to be a male, middle aged, slumped over on the sidewalk from an injury to their chest. Bloodstains coat the sidewalk and down into the gutter. It’s a lot of blood. 
		*[Examine the clothes]
			The man is wearing a simple white undershirt with vertical light gray stripes under a nice green overcoat, although upon looking closely you can see spots where it has been sewn up to fix holes. The yellow scarf around his neck is stained with blood in places, a shame as it appears to be handmade. The man is wearing simple blue jeans, well worn at the knees, and warm winter shoes, stuffed with cotton for extra warmth.
			**[DEDUCE]
				This feels noteworthy. Looking at these clothes I feel like the victim was 
				***extremely well off
				***struggling financially
				    ~C1_evidence+=moneyIssues
				    Yeah, that makes sense. But why would this guy have money issues if the cafe is doing so well? ->body
				***in a secret relationship
				---"Hmm maybe. Anyways enough musing, gotta get back to work." ->body
				
			-->body
		*”Howard, any info on the victim?”
		    Howard takes out the preliminary autopsy report, flipping through it as you keep examining the body. “Name is Francis Thurston, 41 years old, unmarried owner of this cafe, Yellow King Delights. Has a brother, George Thurston, 37, who is married with two children.
			**”That’s a pretty detailed autopsy report Howard”
				“I’ve eaten here every Saturday since I started working at the department, and any time I have to pull an all-nighter. Let’s just say I know him well, hell, I’ve met his nephews.”
				*”Sorry.”
					“Eh, it happens," Howard shrugs.
					~relationship-=5
					->HContinue
			**(HContinue)[let Howard continue]
				-"So death was due to blood loss, seems like it wasn’t quick either. Poor sod bled out slowly, with no one around to notice. Oh yeah, judging by the injury it looks like it was due to a knife, a long one too. Almost hit Francie’s heart, but looks like he wasn’t that lucky. Time of death was a bit before 4AM, according to Doc’s early estimate, and probably was stabbed 20 minutes prior.
				~C1_evidence += ToD1
			{C1_evidence ? (ToD1, ToD2):
			    +++”Wait, you said 4 AM?”
				“I mean, that’s what Doc told me, and they’re usually right on the money with their TOD’s. Why?”
				****[Back off]
                ”Oh, no reason, just wanted to confirm.”
				****[Press]
                ”That doesn’t make sense. If TOD is 4, and they died slowly due to blood loss, they would have to have been here absurdly early”
                “I mean, they had to open up shop. This place opens at 4:30 after all. Only makes sense they’d be here at least an hour beforehand.” Howard remarks, not quite seeing the thread you’re following. 
                    
                    ****“Oh, right. Whoops.” 
                    ->investigateScene
                    ****”That’s exactly my point.” 
                    With a tilt of your head you point to the hours on the window. “It makes sense to be an hour early, but they open at 5:30 on Monday’s, it makes no sense to be here at 3:30.”
                    }
                --"Got it, thanks."
                ->body
                
			        - ->investigateScene
	+[The street]
		Glancing around the street you see at both ends an officer keeping out any potential passersby. Not that they really need to worry, as things are dead quiet right now. This street winds its way, eventually, through most districts of the city. Yet it tends to serve as a detour route, as there’s almost always a more direct route to wherever you need to go. As such, businesses here tend to attract a small strange mix of clients, where you’ll find a judge in line with a dock worker or a cop a table over from an accountant. 
		**[Check your watch]
            5:41, you booked it, albeit begrudgingly, right when you got the call 30 minutes ago. It’s a bit unsettling, you know just how sleepy this city can be but you would have thought there would be some activity by now. But aside from fellow officers, not a creature is in sight. ~ELDRITCH +=1
            -->investigateScene
+[Sip your coffee]
	Damn it’s {cold |really cold|empty... You notice Howard chuckle as he sees you groan at your empty mug |still empty}.
	->investigateScene
+(store)[The store]
	The store appears to be a small breakfast café. You can see 5 tables for outside eating, and 5 more plus a bar area inside. The glass is shattered, but the sign showing the hours is still attached to what glass remains. You see a few beat cops examining the inside.
	**[Check the glass]
		You examine the glass, or what’s left of it. You hear the crunch of it under your new shoes, gritting your teeth slightly as you hope you didn’t deal any damage to them. Taking a look at the part still holding firm, you examine the sign.

					Hours: 
                        Weekdays 5:30 AM - 11:00 AM
						Saturday   4:30 AM - 12:30 PM
						Sunday      CLOSED
            ~C1_evidence += ToD2
			Noting that down, you look at the glass at your feet. Most of the glass fell on the outside, rather than in the cafe. Odd, that’d imply that it was broken by someone coming from inside, rather than from outside. 
				->store
	**[Talk to the cops]
			“Morning, Detective Tony here, I’ve been assigned this case. Mind filling me in?”
			One of the beat cops jumps slightly, nearly dropping their pen. “O-oh mornin’ to you too sir! Well it seems like a standard robbery gone wrong, the vault in the back is busted open and the register is as empty as my coffee mug. Unfortunately.” They gaze solemnly at their mug, every beat cop’s closest companion. Poor sod. With a sigh, they straighten their cap and jot something on their clipboard, returning to a more serious tone. “Apparently the owner was getting ready to open and the perp took advantage of that.”
			--(Richy)
			***”Any witnesses?”
				“There’s only one, and uh, they don’t seem to be a reliable one. Homeless man was in a nearby alley and tells one hell of a story about what happened. They’re questioning him back at the station but I doubt anything will come of it.”
				->Richy
			***”How much was taken?”
				{misc ? knowName: Richard| The officer} flips through the notes on his clipboard, “Looks like about 5000? Well, that plus however much was in the register. The victim tracked how much was in the safe and register at opening and closing each day but looks like they didn’t enter anything for the register before they got killed.”
				->Richy
			***”Mind giving me a copy of those logs?”
					{misc ? knowName: Rich| the officer} hands you a copy of the logs.
					~C1_evidence +=ledger
					->Richy
			***”What’s your name?”
				“Oh, right! Name’s Richard, I just started working here last spring.”
				~misc += knowName
				->Richy
			{C1_evidence ? ledger:
			+++”Thank you for your time.”
					->store
					}
	*[Your shoes]
		Staring at your feet, you admire your new black Luther shoes. It’s a new brand, and boy are you glad you gave it a shot. With all the walking you have to do it’s important to have good heel support…

	{C1_evidence ? (ledger, ToD1):
	+[Wrap up]
		Howard turns to you, a somber smile flashing your way. “Looks like you’re all done? Gotta say I’ve missed seeing you in action.”
		**”Yeah, I’m all finished here.”
		Howard smiles, "Well, I have to go interview the officers here so I'll see you back at the office."
                    "Good luck."
                    *** [Head to the Station]
                    ->PoliceStation
		{C1_evidence ? (ToD1, ToD2):
		** ”I do have a question first[."],”
		"you said he died at 4 AM?”
				“I mean, that’s what Doc told me, and they’re usually right on the money with their TOD’s. Why?”
				+++[Back off]
                ”Oh, no reason, just wanted to confirm.”
				***[Press]
                ”That doesn’t make sense. If TOD is 4, and they died slowly due to blood loss, they would have to have been here absurdly early”
                “I mean, they had to open up shop. This place opens at 4:30 after all. Only makes sense they’d be here at least an hour beforehand.” Howard remarks, not quite seeing the thread you’re following. 
                    
                    ++++“Oh, right. Whoops.” 
                    ->investigateScene
                    ****”That’s exactly my point.” 
                    With a tilt of your head you point to the hours on the window. “It makes sense to be an hour early, but they open at 5:30 on Monday’s, it makes no sense to be here at 3:30.”
                    Howard scratches his chin in confusion, "Huh, you're right Tony. That's definitely something to look into." 
                    Howard smiles, "Well, I have to go interview the officers here so I'll see you back at the office."
                    "Good luck."
                    *** [Head to the Station]
                    ->PoliceStation
                    }
                    }
	-->investigateScene

===PoliceStation
Dunwich Police Station
7:{00|10|15|20} AM

Slumping back in your chair, you take a quick breather. It’s already been a long day, and if your gut is anything to go by, it’s only going to get worse from here.
*[Look around your office]
	Describe office, look out window, its raining now.
	->PoliceStation
*[Miss your wife]
	You pick up the picture you keep hidden in a drawer, taken of you and your wife on a vacation you took a few years back. 
	->PoliceStation
*[Don’t think about how much you wish you could have a smoke]
You realize that thinking about not thinking about something isn’t really helpful. 
    ->PoliceStation
+[Review the case]
	"Lets see what we've got."
	{C1_evidence ? (ToD1, ToD2):
-[Talk to Tony]
	“Oh hey Tony, I’ve been looking for you! I’ve got a lead on the case. Apparently our vic’s nephew is a known delinquent and has been known to ask him for money in the past, I’ve pulled up his address if you’re free to follow up on it.” He smiles, holding out a notecard with an address.
	-”Thanks, will do.”
	Walk to the door, and knock
	Answered by a seemingly 18 year old kid
	[Are you John Thurston?]
		“Yeah, what’s it to you? I’ve got things to do.”
		[Ask to come in] just flavor that leads into the questioning
		[Are you aware that your uncle was killed earlier this morning?]
			Shocked, and shaken a bit but puts on a rebellious face.
			[Push aggressively]
			[push gently] choice just affects flavor of the interaction, where Tony will ask about if John visited Francis and asked for money, John admits yes but not yesterday. Has no alibi. Brings up that last time he asked for money Francis couldn’t give him as much because some lawyer dude was coming for something that day. Gives his name. Unlocks the law firm to go to 


-{C}[Interview witness],
	You decide it’s time to interview your witness, even if it ends up fruitless, it is your job after all. Making your way to the interrogation room, you wave at {misc ? knowName: Rich| the officer} as they let you in. Quietly you take a seat at the plain white table, opposite the man you’re here to see. Looking him over, he looks to be in his 30’s, with a scraggly brown beard and frayed eyebrows. He’s wearing department clothes for shock victims, blanket included. But you do notice one thing right away…
	*His eyes
		Darting around the room, looking for something. You’ve seen insane people before, but the odd thing is the glances don’t appear random. There’s a rational behind them.{e}
	*His hand
		While its a bit faded, you can make out certain rough callouses, like those you find on dock workers. Interesting.{d}
	*His smell
		You regret focusing on that, and can’t think of anything else now.
“Good morning, my name is Tony, a detective for the Dunwich PD. What’s your name?”
The man’s eyes shoot towards you, boring a hole into your being. “I have no name, I killed it. You should too, if you don’t want to…” He trails off, gazing off into the ether. Looks like it’s going to be one of those days, the question is how to approach this.
	{E or ELDRITCH}[Buy in, this man isn’t insane]
		You take a deep breath, leaning in close. “I believe you. You’re not insane are you? Please help me, tell me exactly what you saw.”
The man stares deep into your eyes, and says, perfectly calmly, “I saw a man in a suit, i think it was a lawyer, go in around 2:30. They… they had an argument. Then suddenly the stranger pulled out this weird knife and stabbed him! And and, there was this strange light! And oh god, fuck, the eyes. THE EYES! EVERYWHERE, ALL OH GOD PLEASE NO!”

	[Stay cool, stick to the facts]
	[You don’t have time for this crazy shit, be aggressive!]
		{Calmly, You angrily slam your fist on the table. “I don’t have time for this! A man died, and we know you were there”} you ask, “Tell me what you saw.” The man {collects himself slightly/jumps back screaming}, {vary tone of text} “You wouldn’t believe me but… I saw a man in a suit, I think it was a lawyer, go in around 2:30. They… they had an argument. Then suddenly the stranger pulled out this weird knife and stabbed him! And and, there was this strange light! And oh god, fuck, the eyes. THE EYES! EVERYWHERE, ALL OH GOD PLEASE NO!”
…
As you leave, you bump into Howard. “Oh hey Tony, I’ve been looking for you! I’ve got a lead on the case. Apparently our vic’s nephew is a known delinquent and has been known to ask him for money in the past, I’ve pulled up his address if you’re free to follow up on it.” He smiles, holding out a notecard with an address.
	-”Thanks, will do.”
		You give Howard a nod, taking the card as you head back to your office.{f}
	-”Actually, it looks like our perp is some lawyer, or at least an adult.”
		“Oh?” Howard raises an eyebrow, “What do you mean?”
		“I talked to the witness, and they said they saw a man in a suit stab our vic. Gonna be following that up.” With a quick pat on the shoulder, you thank Howard anyways and head back to your office. {Relationship--1}

Still gotta write for if you talk to howard instead

You close the door to your office, flopping into your chair. On your desk, you splay out all the evidence and notes of leads you’ve gotten so far. 
	List of available clues. If didn’t get list of transactions at scene, goes to the catch
	->You’re missing something. No matter how hard you look you can’t find any clue tying anyone in particular to the scene. Leads into asking Howard for his lead
Deduce from the transaction record that the payment was made to Fredrick Doss. Look up, find law firm.
-[Go to law firm]

You arrive at the law offices of Craftson and Smith. Walking inside
-[Talk to secretary]
-[Make small talk]
-[Ask about Fredrick]
	Says hes a bit odd and will be in shortly. Member of this strange club
-[Ask about her]
	Reveals she got yesterday off
After picking one leads into Fredrick showing up
-[Where were you last night?] Finishing up some work at home, no one can corroborate
-[Do you know victim] Has done some trademarking work for him, but hasn’t worked for him in awhile
-[Ask about hobbies] (reoccurring choice) reveals tarot interest, but lost some of the cards
	-[Mind giving me a reading?] clue get
-[Leave]

[go follow up Howard’s lead]
or
[return to the crime scene] return, go inside
[check register] find bloody tarot card
[check safe] gives payment log clue if not gotten earlier, finds membership card to some club
[check alley] find knife in dumpster, it has strange carvings, blood 


[call in for questioning]
Chain of events for deduce. Each retort presents every piece of evidence
Flow of conversation:
Quickly adjusting your collar, you walk into the interrogation room. “Hello again Mr. Doss. I assume you know why we called you in?”
Frederick scoffs, “No, I really don’t. Is this about the case you asked me about earlier?”
“Got it in one. You’re being charged with murder, the murder of Francis Thurston. You remember him right? One of your clients?”
“Frankly I couldn’t tell you. If he was, he certainly wasn’t a regular one as the name doesn’t ring a bell. You’d get further asking my secretary, but I really don’t believe I had much interaction with him.”
“Oh? Then how do you explain…”
Show ledger
“This ledger shows repeated transactions between the two of you, always during the weekend at the start of the month. Except for last weekend, the weekend right before Mr. Thurston’s murder.”
“O-oh right, I forgot about those! Uhm, that’s simply my fee for maintaining the trademark and uhm, advertising paperwork. Nothing major I assure you, plus I never actually went there in person.”
Show tarot card
“If I recall correctly, you’re a fan of Tarot, Freddy?”
“Frederick. But yes.”
“Right right, sorry old habit. Unfortunately I’m still missing one of my cards, so I haven’t been able to do any readings lately.”
“Well then today is your lucky day!” You smile, holding back the urge to reveal the trick as you slide the Fool card onto the table. “I believe this matches your deck?”
Frederick’s eyes light up, “Oh! Yes, where did you find it?”
And with that, the jaws of your trap snap shut, and you flip it over to reveal the bloodstain on the back. “At the scene of the crime, Freddy. At the scene of the crime.”
With that, Fredrick’s eyes go wide, as you see the last shred of confidence and bravado leave him. Slumping in his chair, he devolves into babbling nonsense to himself.

Closing the door behind you, Howard walks up. “Well done Tony! Never would have figured that connection to the lawyer myself. But I gotta ask, while we definitely can nail him for the crime, I still don’t understand what motive he had?”
Ledger + early deduction of poor clothes 
“My guess is that despite how things looked, Mr. Thurston wasn’t doing so hot financially. When we checked out the body I noticed his clothes were old and a bit patchwork in places. Probably couldn’t keep making the payments and when Fredrick showed up in person to ask why he hadn’t been paid he decided to make sure he got his due. Only thing I haven’t figured out is why Thurston was paying in the first place.”
“Eh, don’t worry too much about it. Good work, Tony. I’ll handle the paperwork, as a thank you.”
You smile, walking off happy at a successful case.
