LIST C1_evidence = moneyIssues, ToD1, ToD2, ledger, lawyer, ToD3, kid
LIST misc = knowName, reviewedCase 
VAR eldritch =0
VAR relationship =50
-> crimeScene
===crimeScene===
The wind howls between the tall skyscrapers, crows cawing in the early fog filled hours. Shivering, you tighten your grip on your coat.
*   “Why did you call me this early?”
*   “I hate the cold”
Small talk

-This is my colleague X, talk about them
Since it’s a murder, protocal is for two of us to be on the scene. And you’re the only one I know would get out of bed at 5 am for me on a Monday.

Small talk

Anyways, [C] continued as we approached the scene, “Here we are. Welcome to my, now former, favorite breakfast joint.” A sour look dredged across his face, taking in the grisly scene. Well, time to get to work.

*[Take a look around]
-->investigateScene
===investigateScene
	You take a look at the scene, the sleepy dark gray cityscape smirched with the blood oozing down into the gutter. {Where to start…|What next…}
	+(body)[The body]
		You crouch down taking a look at the corpse. Looks to be a male, middle aged, slumped over on the sidewalk from an injury to their chest. Bloodstains coat the sidewalk and down into the gutter. It’s a lot of blood. 
		**[Examine the clothes]
			The man is wearing a simple white undershirt with vertical light gray stripes under a nice green overcoat, although upon looking closely you can see spots where it has been sewn up to fix holes. The yellow scarf around his neck is stained with blood in places, a shame as it appears to be handmade. The man is wearing simple blue jeans, well worn at the knees, and warm winter shoes, stuffed with cotton for extra warmth.
			***[DEDUCE]
				This feels noteworthy. Looking at these clothes I feel like the victim was 
				****extremely well off
				->body
				****struggling financially
				    ~C1_evidence+=moneyIssues
				    Yeah, that makes sense. But why would this guy have money issues if the cafe is doing so well? ->body
				****in a secret relationship
				"Hmm maybe. Anyways enough musing, gotta get back to work." ->body
				
			//-->body
		**”Howard, any info on the victim?”
		    Howard takes out the preliminary autopsy report, flipping through it as you keep examining the body. “Name is Francis Thurston, 41 years old, unmarried owner of this cafe, Yellow King Delights. Has a brother, George Thurston, 37, who is married with two children.
			***”That’s a pretty detailed autopsy report Howard”
				“I’ve eaten here every Saturday since I started working at the department, and any time I have to pull an all-nighter. Let’s just say I know him well, hell, I’ve met his nephews.”
				****”Sorry.”
					“Eh, it happens," Howard shrugs.
					~relationship-=5
					->HContinue
			***(HContinue)[let Howard continue]
				---"So death was due to blood loss, seems like it wasn’t quick either. Poor sod bled out slowly, with no one around to notice. Oh yeah, judging by the injury it looks like it was due to a knife, a long one too. Almost hit Francie’s heart, but looks like he wasn’t that lucky. Time of death was a bit before 4AM, according to Doc’s early estimate, and probably was stabbed 20 minutes prior.
				~C1_evidence += ToD1
			{C1_evidence ? (ToD1, ToD2):
			    ++++”Wait, you said 4 AM?”
				“I mean, that’s what Doc told me, and they’re usually right on the money with their TOD’s. Why?”
				*****[Back off]
                ”Oh, no reason, just wanted to confirm.”
                ->body
				*****[Press]
                ”That doesn’t make sense. If TOD is 4, and they died slowly due to blood loss, they would have to have been here absurdly early”
                “I mean, they had to open up shop. This place opens at 4:30 after all. Only makes sense they’d be here at least an hour beforehand.” Howard remarks, not quite seeing the thread you’re following. 
                    
                    ******“Oh, right. Whoops.” 
                    ->investigateScene
                    ******”That’s exactly my point.” 
                    With a tilt of your head you point to the hours on the window. “It makes sense to be an hour early, but they open at 5:30 on Monday’s, it makes no sense to be here at 3:30.”
                    Howard scratches his chin in confusion, "Huh, you're right Tony. That's definitely something to look into."
                    ~C1_evidence+=ToD3
                    ->body
                    }
                ---"Got it, thanks."
                ->body
                
			         --->investigateScene
	+(street)[The street]
		Glancing around the street you see at both ends an officer keeping out any potential passersby. Not that they really need to worry, as things are dead quiet right now. This street winds its way, eventually, through most districts of the city. Yet it tends to serve as a detour route, as there’s almost always a more direct route to wherever you need to go. As such, businesses here tend to attract a small strange mix of clients, where you’ll find a judge in line with a dock worker or a cop a table over from an accountant. 
		**[Check your watch]
            5:41, you booked it, albeit begrudgingly, right when you got the call 30 minutes ago. It’s a bit unsettling, you know just how sleepy this city can be but you would have thought there would be some activity by now. But aside from fellow officers, not a creature is in sight. ~ELDRITCH +=1
            --->investigateScene
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
			***(Richy)[Ask a question]
			****”Any witnesses?”
				“There’s only one, and uh, they don’t seem to be a reliable one. Homeless man was in a nearby alley and tells one hell of a story about what happened. They’re questioning him back at the station but I doubt anything will come of it.”
				->Richy
			****”How much was taken?”
				{misc ? knowName: Richard| The officer} flips through the notes on his clipboard, “Looks like about 5000? Well, that plus however much was in the register. The victim tracked how much was in the safe and register at opening and closing each day but looks like they didn’t enter anything for the register before they got killed.”
				->Richy
			****”Mind giving me a copy of those logs?”
					{misc ? knowName: Rich| the officer} hands you a copy of the logs.
					~C1_evidence +=ledger
					->Richy
			****”What’s your name?”
				“Oh, right! Name’s Richard, I just started working here last spring.”
				~misc += knowName
				->Richy
			{C1_evidence ? ledger:
			++++”Thank you for your time.”
					->store
					}
	*[Your shoes]
		Staring at your feet, you admire your new black Luther shoes. It’s a new brand, and boy are you glad you gave it a shot. With all the walking you have to do it’s important to have good heel support…

	{C1_evidence ? (ledger, ToD1):
	+(wrap)[Wrap up]
		Howard turns to you, a somber smile flashing your way. “Looks like you’re all done? Gotta say I’ve missed seeing you in action.”
		++"Not yet."
		    "Well, take your time."
		    ->investigateScene
		++”Yeah, I’m all finished here.”
		Howard smiles, "Well, I have to go interview the officers here so I'll see you back at the office."
                    "Good luck."
                    +++ [Head to the Station]
                    ->PoliceStation
		{C1_evidence ? (ToD1, ToD2):
		** ”I do have a question first[."],”
		You said he died at 4 AM?”
				“I mean, that’s what Doc told me, and they’re usually right on the money with their TOD’s. Why?”
				+++[Back off]
                ”Oh, no reason, just wanted to confirm.”
                ->wrap
				***[Press]
                ”That doesn’t make sense. If TOD is 4, and they died slowly due to blood loss, they would have to have been here absurdly early”
                “I mean, they had to open up shop. This place opens at 4:30 after all. Only makes sense they’d be here at least an hour beforehand.” Howard remarks, not quite seeing the thread you’re following. 
                    
                    ++++“Oh, right. Whoops.” 
                    ->PoliceStation
                    ****”That’s exactly my point.” 
                    With a tilt of your head you point to the hours on the window. “It makes sense to be an hour early, but they open at 5:30 on Monday’s, it makes no sense to be here at 3:30.”
                    Howard scratches his chin in confusion, "Huh, you're right Tony. That's definitely something to look into." 
                    Howard smiles, "Well, I have to go interview the officers here so I'll see you back at the office."
                    "Good luck."
                    ***** [Head to the Station]
                    ->PoliceStation
                    }
                    }
	-->investigateScene

===PoliceStation
Dunwich Police Station
->DONE