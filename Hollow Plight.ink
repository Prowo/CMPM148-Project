//Made by Steven Au, Ashley Perez, and Will Tate
// For CPMP 148 Interactive Narrative Game Project 8/27/2022

->start_screen

//global variables
LIST ending = good

LIST cult_clues = knife, relic, tarot

LIST deduce_success = c1, c2, c3

VAR relationship = 30

LIST C1_evidence = moneyIssues, ToD1, ToD2, ledger, lawyer, ToD3, kid, tarotDeck, tarotCard, alley, cult_knife

LIST loc1 = (crimeSceneloc), (officeloc), kidsHouseloc, lawfirmLoc

LIST misc = knowName, reviewedCase



//  Case 2 Variables
LIST locationsVisited = home, bankvisit, jobvisit, ftvisit
LIST fortune_teller_state = decline, wary
LIST evidence_found = pills, cash, ID, business_card, tarot_card
LIST clues_found = cash_clue, pills_clue, card_clue, job_clue, coroner_clue, ft_clue
// LIST case_state

// local variables to this case 3
VAR know_about_case = false
VAR convowithHoward = false
VAR convowithFirefighter = false
VAR loneSurvivor = false
VAR truthlieshow = 0
VAR broughtHoward = false
VAR giveSafe = false
VAR callHoward = false
VAR kniferelictarot = 0

//Functions
//returns boolean if items in LIST
 // x == list, y == item 
=== function has (x,y)
    ~ return x ? y

//Start_Screen

===function increaseRelationship(x)
~relationship+=x
~return
===start_screen

<center><h1> Hollow Plight <h1>
    *[START]
-<center><h2> Case 1 <h2>

    +[Begin Case 1]
    ->crimeScene1
   
    +[Case 2]
     <center>Note: Cases must be played in order to obtain the true ending. 
     ++[Skip to Case 2]
        ->location_description
    ++[Begin Case 1]
    ->crimeScene1
    +[Case 3]
    <center>Note: Cases must be played in order to obtain the true ending. 
     ++[Skip to Case 3]
        ->->bank_description
    ++[Begin Case 1]
    ->crimeScene1
    
    


===crimeScene1===
The wind howls between the tall skyscrapers, crows cawing in the early fog filled hours. Shivering, you tighten your grip on your coat.
*   “Why did you call me this early?”
        You mutter, glaring at the man beside you as you struggle to contain another yawn.
        ->Smalltalk
*   “I hate the cold”
        You clutch your coffee mug tightly, the sole warmth you have right now.
        ->Smalltalk

===Smalltalk
The man next to you chuckles sheepishly. His name is Howard, and yours is Anthony, but you only let people call you Tony. You're both detectives at Dunwich PD, who been partnered for. As much as Howard can be a bit shameless with giving you work, he's a good man, and a better friend.

Howard, attempting to justify calling you out, explained that "since it’s a murder, the protocol is for two of us to be on the scene. And you’re the only one I know would get out of bed at 5 am for me on a Monday."
"You know I'm going to stop doing that if you keep abusing the fact I'm willing to do this for you."

"Anyways," Howard continued as we approached the scene, “Here we are. Welcome to my, now former, favorite breakfast joint.” A sour look dredged across his face, taking in the grisly scene. Well, time to get to work.

*[Take a look around]
-->investigateScene
===investigateScene
	You take a look at the scene, the sleepy dark gray cityscape smirched with the blood oozing down into the gutter. {Where to start…|What next…}
	*(body)[The body]
		{You crouch down taking a look at the corpse. Male, middle aged, slumped over on the sidewalk from an injury to their chest. Bloodstains coat the sidewalk and down into the gutter. It’s a lot of blood.|} 
		**[Examine the clothes]
			The man is wearing a simple white undershirt with vertical light gray stripes under a nice green overcoat, although upon looking closely you can see spots where it has been sewn up to fix holes. The yellow scarf around his neck is stained with blood in places, a shame as it appears to be handmade. The man is wearing simple blue jeans, well worn at the knees, and warm winter shoes, stuffed with cotton for extra warmth.
			***[DEDUCE]
				This feels noteworthy. Looking at these clothes I feel like the victim was 
				****[extremely well off]
				"Hmm maybe. Anyways enough musing, gotta get back to work." ->body
				//->body
				****[struggling financially]
				    ~C1_evidence+=moneyIssues
				    Yeah, that makes sense. But why would this guy have money issues if the cafe is doing so well? ->body
				****[in a secret relationship]
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
                
			     ++[Back]->investigateScene
	*(street)[The street]
		Glancing around the street you see at both ends an officer keeping out any potential passersby. Not that they really need to worry, as things are dead quiet right now. This street winds its way, eventually, through most districts of the city. Yet it tends to serve as a detour route, as there’s almost always a more direct route to wherever you need to go. As such, businesses here tend to attract a small strange mix of clients, where you’ll find a judge in line with a dock worker or a cop a table over from an accountant. 
		**[Check your watch]
            It's 5 : 41, you booked it, albeit begrudgingly, right when you got the call 30 minutes ago. It’s a bit unsettling, you know just how sleepy this city can be but you would have thought there would be some activity by now. But aside from fellow officers, not a creature is in sight. 
            +++[Back]->investigateScene
+[Sip your coffee]
	Damn it’s {cold |really cold|empty... You notice Howard chuckle as he sees you groan at your empty mug{increaseRelationship(10)}|still empty}.
    ->investigateScene
*(store)[The store]
	{The store appears to be a small breakfast café. You can see 5 tables for outside eating, and 5 more plus a bar area inside. The glass is shattered, but the sign showing the hours is still attached to what glass remains. You see a few beat cops examining the inside.|You walk back outside.}
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
			
			++++{C1_evidence ? ledger}”Thank you for your time.”
					->store
					
	    ++[Back]->investigateScene
	*[Your shoes]
		Staring at your feet, you admire your new black Luther shoes. It’s a new brand, and boy are you glad you gave it a shot. With all the walking you have to do it’s important to have good heel support…
		->investigateScene

	
	+(wrap){C1_evidence ? (ledger, ToD1)}[Wrap up]
		Howard turns to you, a somber smile flashing your way. “Looks like you’re all done? Gotta say I’ve missed seeing you in action.”
		++"Not yet."
		    "Well, take your time."
		    ->investigateScene
		++”Yeah, I’m all finished here.”
		Howard smiles, "Well, I have to go interview the officers here so I'll see you back at the office."
                    "Good luck."
                    +++ [Head to the Station]
                    ->PoliceStation
		
		** {C1_evidence ? (ToD1, ToD2)}”I do have a question first[."],”
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
                    
                    
	-->investigateScene

===PoliceStation
Dunwich Police Station
7 : {00|10|15|20} AM

Slumping back in your chair{, you take a quick breather. It’s already been a long day, and if your gut is anything to go by, it’s only going to get worse from here.| once again, you collect your thoughts}
*[Look around your office]
	It's simple, but it's nice to have an office of your own. You're able to keep some photos around and it lets you have some quiet space to think. Turning to gaze out the window, you notice a light drizzle is starting, a typical occurance in Dunwich.
	->PoliceStation
*[Miss your wife]
	You pick up the picture you keep hidden in a drawer, taken of you and your wife on a vacation you took a few years back. You smile, before putting it back
	->PoliceStation
*[Don’t think about how much you wish you could have a smoke]
You realize that thinking about not thinking about something isn’t really helpful. 
    ->PoliceStation
+(Review)[Review the case]
	"Lets see what{| else} we've got."
	~misc+=reviewedCase
	
	**{C1_evidence ? (ToD1, ToD2)}Doc said he died at 4 AM?
				They’re usually right on the money with their TOD’s, but this one feels wrong... What evidence explains this feeling?”
				***{C1_evidence ? moneyIssues}[The victim's money issues]
				    ...Hmm nope. Oh well, I'll think on it some more later.
				    ->Review
				***{C1_evidence ? ToD2}[The store hours]
				”The hours don't make sense. If TOD is 4, and they died slowly due to blood loss, they would have to have been here absurdly early. After all, while it opens at 4:30 normally, today is Monday. That means they open an hour later. Why on earth would he be there so early?”
				~C1_evidence+=ToD3
				->Review
				***{C1_evidence ? ledger}[The financial records]
				...Hmm nope. Oh well, I'll think on it some more later.
				->Review
	**[Victim]
	    Francis Thurston, 41 years old, unmarried owner of the cafe Yellow King Delights. Has a brother, George Thurston, 37, who is married with two children. Well liked by the community, but not the most social person outside of working hours.
	    ->Review
	**[Autopsy Report]
	    Death was due to bloodloss caused by a deep stab wound to the chest, approximately at 4 AM. Due to the wound, it seems like it took at least half an hour for him to bleed out.
	    ->Review
	**[Witness]
	    Ammity Pierce, male, 42. A homeless man who is well known in the area.
	    ->Review
	++[That's enough for now]
	->PoliceStation
+{misc ? reviewedCase}[Talk to Howard]
->Howard
	


+(witnessQ){misc ? reviewedCase}[Interview witness]
	You decide it’s time to interview your witness, even if it ends up fruitless, it is your job after all. Making your way to the interrogation room, you wave at {misc ? knowName: Rich| the officer} as they {let you in.|stammer nervously.->failWitness} Quietly you take a seat at the plain white table, opposite the man you’re here to see. Looking him over, he looks to be in his 30’s, with a scraggly brown beard and frayed eyebrows. He’s wearing department clothes for shock victims, blanket included. But you do notice one thing right away…
	**[His eyes]
		Darting around the room, looking for something. You’ve seen insane people before, but the odd thing is the glances don’t appear random. There’s a rational behind them. 
		VAR eyes = true
	**[His hand]
		While its a bit faded, you can make out certain rough callouses, like those you find on dock workers. Interesting.
		VAR job = true
	**[His smell]
		You regret focusing on that, and can’t think of anything else now.
--“Good morning, my name is Tony, a detective for the Dunwich PD. What’s your name?”
The man’s eyes shoot towards you, boring a hole into your being. “I have no name, I killed it. You should too, if you don’t want to…” He trails off, gazing off into the ether. Looks like it’s going to be one of those days, the question is how to approach this.
	
	***{eyes == true}[Buy in, this man isn’t insane]
		You take a deep breath, leaning in close. “I believe you. You’re not insane are you? Please help me, tell me exactly what you saw.”
The man stares deep into your eyes, and says, perfectly calmly, “I saw a man in a suit, i think it was a lawyer, go in around 2:30. They… they had an argument. Then suddenly the stranger pulled out this weird knife and stabbed him! And and, there was this strange light! And oh god, fuck, the eyes. THE EYES! EVERYWHERE, ALL OH GOD PLEASE NO!”
~loc1+=lawfirmLoc

	***[Stay cool, stick to the facts]
	//[You don’t have time for this crazy shit, be aggressive!]
		Calmly you ask, “Tell me what you saw.” The man collects himself slightly, “You wouldn’t believe me but… I saw a man in a suit, I think it was a lawyer, go in around 2:30. They… they had an argument. Then suddenly the stranger pulled out this weird knife and stabbed him! And and, there was this strange light! And oh god, fuck, the eyes. THE EYES! EVERYWHERE, ALL OH GOD PLEASE NO!”
	~loc1+=lawfirmLoc	
-->Howard

=failWitness
"S-Sorry Tony, but the witness has left!"
"Wait, why is that?!"
"Well, we didn't have any reason to keep him, as he wasn't a suspect and we already got some tesimony from him. So when he asked to leave we kinda had to let him."
With a sigh, you pinch the bridge of your nose. "God damn it. I'll head back to my office and think on what to do next then."
->Office
=Howard
 As you leave, you bump into Howard. “Oh hey Tony, I’ve been looking for you! I’ve got a lead on the case. Apparently our vic’s nephew is a known delinquent and has been known to ask him for money in the past, I’ve pulled up his address if you’re free to follow up on it.” He smiles, holding out a notecard with an address.
	*”Thanks, I'll look into it.”
		You give Howard a nod, taking the card as you head back to your office.
		~C1_evidence+=kid
		~loc1+=kidsHouseloc
	*{C1_evidence ? lawyer}”Actually, it looks like our perp is some lawyer, or at least an adult.”
		“Oh?” Howard raises an eyebrow, “What do you mean?”
		“I talked to the witness, and they said they saw a man in a suit stab our vic. Gonna be following that up.” With a quick pat on the shoulder, you thank Howard anyways and head back to your office. {~Relationship-=5}
		-{C1_evidence ? lawyer}->Office
		-->witnessQ

===Office
{You close the door to your office, flopping into your chair. On your desk, you splay out all the evidence and notes of leads you’ve gotten so far.|What else...} 
	*[Time of Death]
	    "Time of death was 4 Am. {C1_evidence ? ToD3: It's strange though, since the cafe wasn't to open for almost two hours. ->Office}
	    ->Office
	*[Transaction logs]
	    {C1_evidence ? lawyer:
	    You scan through the records, most of it is mondain but eventually you notice something. The first weekend of every month there is a payment to a...
	    "Fredrick Doss of Craftson and Smith? I think that's a law firm a few blocks away. And looking at this, there was supposed to be a payment this weekend. But the logs show no such payment. Better note this down."
	    ->Office
	    }
	 -You’re missing something. No matter how hard you look you can’t find any clue tying anyone in particular to the scene. Guess you should follow up Howard's lead.
        ->chooseLoc

===kidsHouse
After a long drive to the outskirts of the city, you finally arrive at the address Howard gave you.
~loc1-=kidsHouseloc
It's a simple house, in an average neighborhood. A bit on the small side, but it looks well cared for. With a sigh, you gather yourself and approach the front door.
*[Knock]
Knock Knock
You hear the shuffling of feet as someone makes their way to the door. After a minute, it opens.
"...What." A kid asks, as they open the door. Wearing a black hoodie a size too large, jeans, and with an embarrassing amount of hair gel, just looking at them makes you cringe at your past self. But fortunately, this looks like the person Howard was talking about.

"Are you," you glance at your notepad, "Johnathan Thurston?"

"Yeah, but it's Johnny. Why? Did someone complain about my art again?" Johnny grumbles.

**"Your art?"
"Oh, it's not about that? Sweet!" Johnny visibly relaxes, scratching the back of his neck bashfully. "Yeah, I like to make graffiti. Uncle Francy lets me paint the alleyway by his store. And when I'm done he pays me in some of the leftover cookies!"

Oh. 

Well fuck. 
Guess he hasn't had the news broken to him yet. Better be careful to not slip up, or the kid might clam up.
~C1_evidence+=alley

***"That's sweet. Did you go over and paint anytime recently?"
    Johnny grumbles, "Nah. I was originally supposed to come paint tonight but last week he told me a friend would be visiting. I didn't get why that'd be an issue but apparently they're going to be talking about some uh, confidential things? Was really serious, which was kinda weird. But eh, I'm willing to wait a few days."
    
    "Confidential? That's interesting. Do you know who this friend was?"
    
    "Uhm," Johnny takes a minute to think, "Some lawyer guy? I think his name was Fredrick?"
        You think on that, and remember seeing that name in the paper a few days ago, if you recall correctly he is at Craftson and Smith, a relatively new law firm. "Gotcha, thank you Johnny, I'm going to go follow up with him."
        Johnny waves, watching as you leave.
        ~C1_evidence +=lawyer
        ~loc1-=kidsHouseloc
        ****[To Craftson and Smith]
        ->Lawfirm
**"No, I need to ask you a few questions."
        "Okay, what?"
        "Where were you last night? Specifically from the time 3 to 5 AM."
        "Uh, I was asleep? I was planning on going to my Uncle's cafe but he said a friend would be visiting. I didn't get why that'd be an issue but apparently they're going to be talking about some uh, confidential things? Was really serious, which was kinda weird. But eh, I don't mind.
        
        "Confidential? That's interesting. Do you know who this friend was?"
    "Uhm," Johnny takes a minute to think, "Some lawyer guy? I think his name was Fredrick?"
        You think on that, and remember seeing that name in the paper a few days ago, if you recall correctly he is at Craftson and Smith, a relatively new law firm. "Gotcha, thank you Johnny, I'm going to go follow up with him."
        Johnny waves, watching as you leave.
        ~C1_evidence +=lawyer
        ~loc1-=kidsHouseloc
        ***[To Craftson and Smith]
        ->Lawfirm
//        ***
->chooseLoc

===Lawfirm
You arrive at the law offices of Craftson and Smith. Walking inside, you see a secretary typing away at a desk.
+(secretary)[Talk to secretary]
    **[Make small talk]
    "Hello Miss. Fine weather today isn't it? Just the best kind of gloomy gray."
    She smirks, "Mhm, if you squint hard enough you can even fool yourself into thinking the sun is peaking through the fog."
    ->secretary
    **[Ask about Fredrick]
	"Hello Miss, I'm here for a man named Fredrick?"
	"Oh, Freddy? He should be in momentarily, he left for lunch 40 minutes ago. Feel free to take a seat."
	"Will do, and thanks."
    //**[Ask about her]
	//Reveals she got yesterday off


After waiting for some time, you see a tall, lanky man in a deep purple suit and pristine white gloves walk in. He flashes the secretary a grin as she gestures to you.
"You have a visitor Mr. Doss. Mr. uh, I'm sorry, I didn't catch your name?"

You stand up, brushing yourself off. "Tony. Officer Tony, Dunwich PD. I have a few questions for you Mr. Doss."
As you flash your badge, you just barely notice Fredrick's grin slowly melt away.
"Ask away officer, what do you want to know?"
->Fredrick
===Fredrick
"{To start, I want to ask if..."|Next, "}
*"Where were you last night?"
    "Last night? Well I took the night off and relaxed at home, I had just closed a big deal on Friday see. Can't be all work and no play if you know what I'm saying?"
    **"Mhm sure."
        ->Fredrick
    **"Anyone able to corroborate that?"
        "My cat, Nigel. Other than him no, unfortunately."
        ->Fredrick
*[Do you know victim] Has done some trademarking work for him, but hasn’t worked for him in awhile
->Fredrick
*"Do you have any hobbies?"
    "I uh, is this really necessary?"
    "I find questions like these help me understand people better, plus it tends to help them relax. So yes."
    Fredrick smiles, chuckling softly. "Unfortunately I don't have much time for hobbies. I do however enjoy Tarot readings. Find them fascinating."
    "Isn't that interesting?" You smile, "My friend, Howard, also is really into those Tarot things. I can't quite understand them. By the way,
	**"Mind giving me a reading?"
	    Fredrick nods, pulling out a deck from his briefcase. The back of the cards is intricate, the strange spiral patterns entrancing. But right as he goes to set them on the counter, he sighs. "Shoot, I forgot, I actually lost some of my cards recently. If you end up finding it though I'd be happy to give you a reading!"
	    "Oh, I'll keep an eye out then."
	~C1_evidence+=tarotDeck
	->Fredrick
	**"Mind letting me see them?"
	 Fredrick nods, pulling out a deck from his briefcase. The back of the cards is intricate, the strange spiral patterns entrancing. But right as he goes to hand them to you, he sighs, "Tragically, I actually lost some of my cards recently. If you end up finding it though I'd be happy to give you a reading sometime."
	 "Will do, Mr. Doss."
	 ~C1_evidence+=tarotDeck
	->Fredrick
*{C1_evidence ? tarotDeck}[Leave]
"Well I've kept you long enough, have a nice day Mr. Doss. I'll keep an eye out for those cards of yours!"
"Appreciated officer. Have a nice day."
~loc1-=lawfirmLoc
->chooseLoc
===chooseLoc
You head out. Where to next...
+{loc1 ? kidsHouseloc}[Follow up on Howard's lead]
->kidsHouse
+{loc1 ? lawfirmLoc}[Investigate the law firm]
->Lawfirm
+{loc1 ? crimeSceneloc}[Return to the crime scene]
->crimeScene2
+{loc1 ? officeloc}[Head back to your office]
->Office2

===crimeScene2
Yellow King Delights

5 : 30 PM

You drive back over to the scene of the crime. It's been taped off, but there isn't any foot traffic here to worry about. Odd.
Collecting your thoughts, you think about anything you might have missed.
Let's get to work.
->inv2
===inv2
*[check register]
You head inside and double check the register. You just barely make out a slip of paper wedged underneath the drawer.
"Hm? What is this?"
Pulling it out, you realize it is a tarot card, The Fool{C1_evidence ? tarotDeck: and the marks on the back are identical to the deck Fredrick had}. While the back is normal, the front of the card has a bloodstain on it.
~C1_evidence += tarotCard
->inv2
//[check safe] gives payment log clue if not gotten earlier, finds membership card to some club
*{C1_evidence ? alley}[check alley]
    Taking a peak down the alley Johnny mentioned, you can see the graffiti he mentioned. Honestly, it's pretty good. However your attention is drawn towards something glittering in the trash. As you pull it out, you find in your hand a strange knife, coated in carvings and covered in blood.
    ~C1_evidence += cult_knife
    ~cult_clues += knife
    ->inv2
-That seems to be it, time to head on out.
->chooseLoc

===Office2
You head back to your office, {C1_evidence ?(tarotDeck, tarotCard):this bloody Fool will be the Ace up your sleeve, so to speak|for a quick breather. Okay, back to investigating. ->chooseLoc}
Quickly, you fill out the paperwork for Fredrick Doss's arrest. After handing it off to {misc ? knowName: Richy|an officer}, you wait for him to be brought into the interrogation room.
->interrogation

===interrogation
Quickly adjusting your collar, you walk into the interrogation room. “Hello again Mr. Doss. I assume you know why we called you in?”
Fredrick scoffs, “No, I really don’t. Is this about the case you asked me about earlier?”

“Got it in one. You’re being charged with murder, the murder of Francis Thurston. You remember him right? One of your clients?”

“Frankly I couldn’t tell you. If he was, he certainly wasn’t a regular one as the name doesn’t ring a bell. You’d get further asking my secretary, but I really don’t believe I had much interaction with him.”
->c1End1
===c1End1
“{Oh? Then how do you explain|Uh, sorry I meant}…”
*[show Time of Death]
    "...Please stop wasting my time."
    ->c1End1
*[show witness testimony]
    "This just says he saw a 'man in a suit,' you do know that describes every man at our firm, right?"
    ->c1End1
*[show ledger]
“This ledger shows repeated transactions between the two of you, always during the weekend at the start of the month. Except for last weekend, the weekend right before Mr. Thurston’s murder.”
“O-oh right, I forgot about those! Uhm, that’s simply my fee for maintaining the trademark and uhm, advertising paperwork. Nothing major I assure you, plus I never actually went there in person.”->c1End2
===c1End2
“{Let me show you something real quick|Uh, sorry I actually wanted to show you}…”
*[show knife]
    "While that is certainly a grisly knife, it won't have my prints on it officer."
    "I'm not so sure-"
    "I am." Fredrick smirks, showing his gloved hands, "I wear them everywhere, bit of a germaphobe."
    "Noted."
    ->c1End2
*[show autopsy report]
    "As you can see, Mr. Thurston died from bloodloss due to a stab wound."
    "I see. What about that?"
    "Uhm, I just thought that was interesting."
    ->c1End2
*[show Tarot Card]
“If I recall correctly, you’re a fan of Tarot, Freddy?”
“Fredrick. But yes.”
“Right right, sorry old habit." 
You wave it off as Fredrick grimaces as he reminds you, "Unfortunately I’m still missing one of my cards, so I haven’t been able to do any readings lately.”
“Well then today is your lucky day!” You smile, holding back the urge to reveal the trick as you slide the Fool card onto the table. “I believe this matches your deck?”
Fredrick’s eyes light up, “Oh! Yes, where did you find it?”
And with that, the jaws of your trap snap shut, and you flip it over to reveal the bloodstain on the back. “At the scene of the crime, Freddy. At the scene of the crime.”
With that, Fredrick’s eyes go wide, as you see the last shred of confidence and bravado leave him. Slumping in his chair, he devolves into babbling nonsense to himself.
**[Head on out]

Closing the door behind you, Howard walks up. “Well done Tony! Never would have figured that connection to the lawyer myself. But I gotta ask, while we definitely can nail him for the crime, I still don’t understand what motive he had?”
{-C1_evidence ? ToD3:
You smile, and pull out your notes on the case.
"The first clue was..."
    ***"The shattered glass"
    ->badEnd1
    ***"That log showing his payments"
    ->goodEnd1
    ***"The fact I don't know"
    ->badEnd1
    
    -else:
    "To be honest, I'm not quite sure myself."
    ->badEnd1
    }
===badEnd1
    "So you were just guessing?"
    "...yeah."
    Howard sighs, muttering to himself as he walks off, leaving you to finish the paperwork.
    ~relationship-=10
    ->case1_close
    
===goodEnd1
“My guess is that despite how things looked, Mr. Thurston wasn’t doing so hot financially. When we checked out the body I noticed his clothes were old and a bit patchwork in places. Probably couldn’t keep making the payments and when Fredrick showed up in person to ask why he hadn’t been paid he decided to make sure he got his due. Only thing I haven’t figured out is why Thurston was paying in the first place.”
“Eh, don’t worry too much about it. Good work, Tony. I’ll handle the paperwork, as a thank you.”
You smile, walking off happy at a successful case.

~deduce_success += c1
->case1_close

//Case 1 to 2 Transition        
===case1_close

<center><h2> Case 1: { -has(deduce_success,c1): 
                            <>Fool in Yellow
                        -else:
                            <>Fool in Blue (You)
                    }
                      <> Ends <h2>
    +[Continue]
    
<center><h2> Case 2: Begins <h2>
    ->scene1
    ->DONE
 

//-------------------------CASE 2 ----------------------------



//Location Menu
=== location_description

    {What should I do? How I am supposed to find out about our victim if no one in the neighborhood has spoken to her once. You will think that such a wealthy neighborhood will be more aware of things. | One place down and couple more to go. Its going to be another long day at work. | The sun is still shining lets keep going. | Man! That took way longer than it needed to be.}
    
    *[Bank] You arrive at a large corporate bank.
        ->bank_description
        
    *[Fortune Teller]
        ->fortune_teller_description
        
    *[Victim's Job Site]
        ->job_site
        
    +{ locationsVisited ? bankvisit or locationsVisited ? jobvisit or locationsVisited ? ftvisit} [Department]
    You take a {~long|quiet|slow|serene} ride to the police station.
        -> department

//Station    
===department

    *[See coroner]
        ->department_coroner
    
    *[Talk to colleauge]
        ->department_colleauge
        
    *[Write Report]
      The day is getting late as you settle down into your desk. 
      ->case2_deduce
    
    *[Call it a day]
    
        It's been a long day. You find yourself restless. The case can not be concluded any further, but you may have found a possible lead.
        ->case2_close
        
    +[Leave]
        ->location_description

    =department_coroner
        *{location_description < 3 }[Ask about body]
         With a charsimatic cheer, you say. "Whats up Doc, did you find anything about the body."
         
         "Hey Tony," he bellows with his large gut. "How's my favorite friend doing."
         
         "I am doing alright Doc. Just that these cases lately have been pulling my ass lately."
         
         "Thats how the job is. At least I'm not pulling this person's ass for drugs. That drug ring last week was another level of drug smuggling. This poor lady, she was quite a looker if you ask me."
         
         "You and your wierd habit of rating the victims."
         
         "Hey, it gets boring here, if you cut up dead bodies as a living? Anyway come back to me later tonight. I will have a better analysis on our pretty little Sarah."
        
        ->department_coroner
        
        *{location_description > 3 }[Ask about body]
         With a charsimatic cheer, you say. "Whats up Doc, did you find anything about the body."
        
         "Good news or bad news?"
         
            **[Good news]
            "Good news."
                
            
             "I did find something about the body, that may help with the case. The body had no signs of assault, but I did find traces of drugs in her system.
             
             "Whats the bad news?"
             
             "Ohh," they mumble under their breath. "I would of said the same thing regardless. I thought it will help lighten the mood."
            ->department_coroner
             
            ** [Bad news] 
                " Bad news is I got more work to do. Good new is I found some traces of drugs in her system. I won't know till tomorrow for sure what it was.
                -> department_coroner
        
        
        *{evidence_found ? pills} [Ask about the pills]
            "The pills are an antidepressant. Its a generic treatment for symptoms of depression. Its a relativly safe drug that wouldn't lead to a suicidal tendecies," they said.
            ~clues_found += pills_clue
            -> department_coroner
            
        *{evidence_found ? pills && clues_found ? pills_clue} [Ask about the pills being found in the body]
             "After looking at test results, I can confirm the pills don't match with what was in the body."
             ~clues_found +=coroner_clue
                -> department_coroner
    
        +[Leave coroner's office]
            ->department
            
    =department_colleauge
    
        "Hey how's it going? Any luck on the case," he chuckles.
    
       * [Tell him about your findings]
       //{check flags} 
            " I have found that she has been withdrawing a large amount of cash. Something must of have happened recently since her job secretary descirbed her as "on edge."  I found out that she might of possible been part of a cult as the last eye witness was a fortune teller. She must have been searching for something."
            -> department_colleauge
            
       * "No luck.["]"Most trails lead to a deadend. Have you finding anything on your end?"
             
            " I tried contacting distant family member to ask about any information.  They said they have no contact from her in years. I tried checking local records to see if she there was any paper trail. No luck on my end either."
            -> department_colleauge
            
        *"How are you?[,"] you ask in a tired manner.
        
            "Same old same. Just trying to solve this endless cases. Doesn't this job get old too quick. No one wants to be detectives in this day and age. You are better off living your life than dealing with the deaths and killings of society. What do you think, Tony?"
            
            **[Console]
            "That's why we are the best at what we do. Whether that be because of the shit we've seen or had little no one cares for justice. We both are trying to make the world a better place. One fucking case at a time. I feel the same thing everyday, Howard. Yet, as long as I can make my wife and kids from leaving a crime-induced world, I'll be happy."
            ~relationship +=10
            ->department_colleauge
        
            **[Argue]
                "Come on, Howard. We both been in the biz for 10 years. Never had I once thought about quitting this gruesome job. We are doing god's work punishing these criminals and putting them in their place. As long as I live justice will never get old. This job is my dogma.
                ~relationship -=10
            -> department_colleauge
        *[Leave]
            "Talk to you later, Howard."
        ->department
        
=== case2_deduce
    +[No idea] I did not found much about our victim Sarah. This case will be rule as a suicide if I don't have any clues to present.
    ->suicide_loop
    
    +[Murder]
    I have feeling that this is murder, but I do not have any trails to follow. I do not want to leave this case cold without any justice brought to the perpetrator.
    ->murder_loop
    
    +[Not right now]
    You set the report aside.
    ->department
    
    -(suicide_loop)
        ++{evidence_found ? pills} [Pills]
         Its possible that she was struggling with depression. Given how she didn't  communicate with anyone, she must have dealt with  serious anxiety issues..
        ->suicide_loop
        ++{clues_found ? coroner_clue}[Unmotivated suicide]
            Doc confirmed that suicide was not caused by the pills. Could she have possible taken her own death out of monotony.
        ->suicide_loop
        
        ++[Close Case]
        ->case2_close
        
        ++[Go Back]
        ->case2_deduce
    
    +[Murder]
    I have feeling that this is murder, but I do not have any trails to follow. I do not want to leave this case cold without any justice brought to the perpetrator.
    -(murder_loop)
        ++{ clues_found? (cash_clue, job_clue)}[Suspicion]
        Sarah was definitely involved in something, but what could it be?
        ->murder_loop
        
        ++{ clues_found ? (coroner_clue, cash_clue, job_clue)}[Motive]
        From all the clues I found, I suspect this case is a murder.  The victim must of have gotten involved into the something terriblet. Once they have gotten their funds, they decided to silence their witnesses. But why did they leave a tarot card as a clue? Did the killer have an M.O. ? They did leave pills to mislead me into a suicide case. This killer must be very methodical. 
        
            +++ { clues_found ? card_clue or clues_found ? ft_clue}[Cult?]
        
        -> murder_loop
    
       ++[Close Case]
            ~deduce_success += c2
        ->case2_close
        
        ++[Go Back]
        ->case2_deduce

//Case 2 to 3 Transition        
===case2_close

<center><h2> Case 2: Facade Ends <h2>
    +[Continue]
    
<center><h2> Case 3 Begins <h2>
    ->dream_sequence
    ->DONE
 
===bank_description

The bank is clean and exceptionally well-ordained with greek deco. It is surprising busy despiteite how many tellers there are. You see a young beutiful lady that is open at the counter.

-(bank)

*[Talk to teller.]
   You walk to the teller and show her your badge. Suddenly her face becomes more serious. You ask about the victim's banking information and she clicks away on the computer. She pulls up a the banking information and turns the monitor to face you.
   
    "I can forward the banking information and she has been withdrawing large sums of cash recently. A total of 50k. She still has 200k in her account, but she has been withdrawing money these past two weeks."

    <i>What could she be possibly be spending thousands of dollars on? and there's no paper trail to follow. <i>
    ~clues_found += cash_clue
   ->bank
   
*{ locationsVisited ? ftvisit} [Ask about charges from Ronda's shop]
    "Are there any charges from Ronda's Shop?"
    
    "Hold on. Give me a moment. ... She visited the shop a couple times a month ago"
    -> bank

*{ locationsVisited ? jobvisit} [Ask about money deposited to her account] 
    "How much money was being deposited to her account."
    
    "Let's see. It says that she only recieved money from her employer. She gets around $5,000 biweekly."
    
    <i> Guess Sarah was the hard worker that saved up and made it big. There was no way she got involved in any shady business.<i>
    ->bank
    
+{bank > 0}[Leave]
    "Thank you for taking your time, do let me know if there's any more activity in her card," he says as he waves his hand in farewell.
   ~locationsVisited += bankvisit
    -> location_description

===fortune_teller_description
You walk into a daintly picturesque shop. The shop gives you goosebumps as there barey lit candles and strange objects lying about. You peer ove to the counter and see a lady in her 50's that is puffing smoke from an antiquated pipe. She looks up and gives you a bright smile.

 "Hello, how may I help you?" She said with a mellow tone.
->fortune_teller_body

===fortune_teller_body

* "Tell me my fortune[."], I want to know more.
    ->ft_reading

*{ evidence_found ? ID}[Show her victim's id]

    { 
     - fortune_teller_state ? decline:
        <>  "I am not interested in talking someone who does not know sincerity. I have seen her, but that is all. You reap what you sow. For my blessings do not solve stupidity."
    - else:
        <> "Yes, I have seen her. She was quite a peculiar one. She seemed very interested into the occult. She keeped pestering me about tarot meanings and ask if new any groups she could join. She visited a couple times a month ago and all of sudden she stop coming. I fear that something has happened for the worst."
        ~ clues_found +=  ft_clue
        ~ fortune_teller_state += wary
    }
    ->fortune_teller_body
    
*{ evidence_found ? tarot_card}[Show her card]
    ->ft_show_card


+[Leave]
    ~locationsVisited += ftvisit
    ->location_description

===ft_show_card  
*{ evidence_found ? tarot_card}[Show her card]
"Yes, you can. I was wondering if you can tell me more about this. You pull out the card labeled  "X" "Wheel of Judgment."

- "This card is from Tarot.  I use these cards to guide you with any problem that you may have."

*[Ask More] "Does this particular card mean anything?" 

    -"It depends who I am reading as everyone has a different aura. This card is about undergoing a change that is necessary to move forward.  A destiny that can not be changed, the world will continue to move on without you. Perhaps, I can read your destiny if there is anything that troubles you.
    
*[Accept] <i> My gut has never failed me, maybe this can give me a clue about this case. <i>

    "Sure, I'm excited to see what foresight you can provide me with."
    ->ft_reading      
    
*[Decline]
    "The fact that you brought the wheel of fortune shows that our fate was meant to be, but if you don't follow these changes you will lose control of the life around you and fall in to despair.

        * *[Accept]<i> It woudn't hurt to take her up on her offer. Not the biggest fan of the occult, but there's been so much strange events happening.<i>

              "Tell more about how I could prevent this problem."

              "I can offer my guidance, the more you work with me, the more I can understand your journey."
             ->ft_reading

        * *[Decline] I don't believe in the occult.
            
            She gives a perplexed gaze as why you came here in the first place.
                            
            "I like to use my reading as a way to guide my patronages on their own journeys. My words are not simply a sham to trick simple minded people. I will give you one piece of advice. I do not give reversed cards often, but I feel an ominous energy exuding you. If you continue to ignore these changes around you, the cost will be tragic," she grumbles.
           ~fortune_teller_state += decline
           ->fortune_teller_body
           
===ft_reading
  ~clues_found += card_clue
    "I will do a three card reading. One for the past, the present, and the future. Tell me if you suspect something that relate, I will read your destiny to offer a final card of guidance," she said.

    She mixes the cards up as she sings a chant for guidance and safety. She cuts the deck into three parts and puts a card from each pile on to the table and then she closes her eyes as spread the remaining card and prays for the world to judge our fate. She hovers over a card and sets it aside.
    
    She stares right at you like how a eagle stalks her prey. Her eyes focus in, making a long uncomfortable eye contact. 

    -{ fortune_teller_state ? wary:
            <> "I know you are investigating a string of deaths. I foresaw a ominious prenominition that will could this city."
        
        - else:
            <> "I know you have come here because of your work. You are under great stress that involves the likelihood of the common people."
    }

    She turns over the first card without even looking at it. Revealing the "Moon". 
    
    With a clear ominous voice,"Something has happened recently and they are not what they seem to be. You judgment is being clouded by an external force that even I would shudder at.  It seeps into your mind at night and disrupts your sleep.  Right now you are dealing with a needless sacrifice. A stalling of time  for what is to come ahead."
    
    She reveals the next card showing the "The Hanged Man".  A slight lick of the lips, she continues with a soothing tenor, "A sacrifice has been made in order to progress their goals. This was a pointless sacrifice, but a calculated one for the upcoming future."
    
    She reveals the third card and her hands are shivering with a strange coolness.  Your hairs stand up giving you chills as the "Tower" appears.
    
    "A foreboding disaster will shaken the likelihood of the city. It will rush a wave of pride and crime," she grasped.
    
    "You are definitely no sham.  My work has taken a turn that not I even I can described. There is a strangeness going on that i'm not sure know how to handle"
    
    "What does this mean, none of this makes sense," you say flabbergasted.

*"You are definitely no sham.["] My work has taken a turn that not I even I can described. There is a strangeness going on that i'm not sure know how to handle"

      "Your problems will be solved if you deal with..." and she flips the last card revealing the "Hierophant ." She whispers, "Find this person and it will solve all your fears."
    
     Puzzled by her answer, you respond back "Who is this hierophant?"
    
    "I am not sure, but he is the one behind yours problems. A person that is religious but deformed by his pride."
    
    "I can not see anymore than I already have."
      ~clues_found += ft_clue
    ->fortune_teller_body

===job_site
 
You drive through the financial district passing  multiple business firms. You arrive at a wealthy establishment that our victim worked at.

*[Talk to Secretary] "I am the investigating the death of Sarah Rasha, can I talk to someone that knew her at work."

 "Well, you are talking to the only person that actually spoke with her and  the one who called the welfare check," she replies with a small gusto.
-(ask_secretary)

* {ask_secretary == 1} [Ask about Sarah] 
"Thank you for calling the welfare check. Unfortunatly, she is dead. We discovered her body this morning at her house. I am sorry for your lost, if it is ok, I am going to ask you some questions. "

 "Its tragic news to hear about Sarah's death, but we were not close. Sarah was... a... person who keep to themselves. She just said hello every time she clocked in for work. She rarely spoke to anyone during work."
 -> ask_secretary

*[Ask if anyone had motives]
"Do you know anyone that didn't like Sarah or that might want to hurt her?"

"No, not that I can think of.  She was a bright young worker and did a wonderful job as a financial adviser.  She handled the whole job over reports so she sees very little people in her office.
->ask_secretary

*[Ask about any changes]
    "Did anything happen recently?"

She was acting different last week. I do not know how to describe it. I... guess... you can call it paranoid. She seemed on edge last week, before I last saw her.
~clues_found += job_clue
-> ask_secretary

*{locationsVisited ? bankvisit} [Ask about her finances?]
 "Do you know why she was withdrawing large amounts of cash the past weeks?"
 
 "Sorry, Sarah never spoke about stuff outside of work. I have no idea why she would need the cash for. If she needed money urgently, I'm sure should would of let us know. She's been at this job for a few years and never complained about her salary.
 
 <i>There must be of been something that happened recently that lead her to "suicide," but for her to commit suicide will still having a lot of money in the bank doesn't make any sense. She was still well off financially so what made her feel on edge. <i>
 
 -> ask_secretary
 
 

*{ask_secretary > 1}[Leave]
Thank you very much, you have been very helpful. I will inform the company once we solve the case.
~locationsVisited += jobvisit

->location_description

=== scene1
"KNOCK KNOCK KNOCK"

You awaken to a loud banging on the door followed by a low voice.

*[Get up]
    -"TONY, we got another case."
    
*[Go to the door]
    - You get up in a rush and make your way to the door in a half stupor manner. Opening the door you see Howard all suited up and ready to work. He gives a big smile as hes glance at your half naked body and proceeds to chuckle. 
    
    "Get dress and I fill you in on the details. We got another case on our hands," he snickers.
    
*[Respond]
   - You peer off to the distance, and notice the looming darkness as the sun stretches it rays amidst the horizon. You take a look at the watch you forgot to take off last night and see its 5 o'clock sharp.
   "You look as sharp as ever" you snide back
   
   "Its going to be a long day bud", he grimaces. His eyes glimmers a mysterious yellow hue.
   
 *[Get dressed]
    You return back inside and get dressed.
    
->scene2

=== scene2
*[Meet Howard at the car.]
-You open the car door as Jim hands you a cup of coffee.

"If you took any minute over 10, I would left on your own" as Jim chuckles.

The car gives a loud vroom as he starts his classy 80's roadster. He sets off to the crime scene and peers over while he's drivinging on the road, "Did you get any good sleep?"

*[Little]
"Not much, the robbery case doesn't make any sense. His motive doesn't match a typical bank robbery. The person was well off and had no prior history of assault. Person is basically your average Joe."

*[None]
"I could't get an ounce of sleep" Nothing makes sense. The robbery seemed facilitated. The case proceeded suspicious smoothly.
- "All that matter is we caught the dude. He admitted to his crimes, just let the higher ups deal with him. "

*[Ask question back]
"How much did you get? Since you had to pick me up so early. I guess we have a long drive to the crime scene."

-" I had to take some pills to even get sleep. I almost arrived late to get you to be honest. But, we got a job to do. Thank for asking," he replies wholeheartedly with a bright smile.
    ~relationship += 5


*[Sip coffee]
    You sip the cheap coffee and the bitterness hits the tongue. You feel a small wake up call and a small pain in your head. Your sleep deprivation is clouding your focus. You try to grab onto something to steady yourself.

    -"Tony... you ain't looking so well. You should take the day off. I don't want you putting yourself in an unfit situation. You've been doing this god dam job forever. It won't matter if another person dies, you done a lot of justice already."

* "I'm doing this case even if it kills me. I got nothing to live for. After all the shit I've seen for."

* It's this fucking headache, I've been having. I ought to see a doctor from how much crime I've seen.

* "I'll manage. Whats the details on this"

-"We got a suicide of a young woman in the Upper East side. Her job called a welfare check after not seeing her at work for a few days, we discovered the body last night. Coronary thinks the body been there for a few days. Cause of death was a good ole noose. The weird part was there was no sign of hesitation.  She hang the noose where her feet were barely off the ground. Most people panic and regret their suicide plan when its too late. She must of slowly suffocated knowing she could of let herself down."
->scene3part2

// Crime Scene
=== scene3part2

    (Comment on the details of the case)
-(comment)
    * [ Strangeness ]
    "Not our typical suicide case. Don't get much suicide up in the affluent East Side. Most of them experience some kind of tragic incident to commit suicide. Heartbreak. Death of a family. You know the ones worth dying over."
    "That's the thing, no immediate family in the area. Checked her file, she moved far away from her home a couple years ago. No criminal history, nothing. 
    "Great a nobody!"
        ->scene3part2
    
    * [ Suicide Note ]
    "Any memento or notes lefts?"
    "Nope her place is pretty much empty, in the sense of an austere lifestyle.  Just a few furniture. We do have all her personal belonging."
    "Definitely strange to not have any point of interests"
        ->scene3part2
        
    * [ Victim's Profile ]
    " Are you saying she calculated her suicide."
    "Considering her minimal lifestyle, I wouldn't rule it out. Maybe she felt trapped in her life having nothing worth living."
    
    "Yea, but death by asphyxiation isn't the prettiest"
    
    "I'm not judging, but its good ole reliable or maybe she needed some pain in her plan." 

        ->scene3part2
        
    *{comment == 1}[Nope]
        ->scene3part3
        
    *{comment > 1} [Thats all]
        ->scene3part3
    

    
===scene3part3
 You are rapidly approaching a wealthy neighborhood. There are police cars lined up around the block. Polce are asking neigbors for information. There are caution tape wrapped around a large white house. You walk in with Howard to see a white cloth draped over 
 -> evidence
 
-(evidence)

*[Inspect the body]
Surprising the body doesn't stink as much as you expected. You see a pale Caucasian woman. late 20's. No signs of any altercations or bruises besides her neck.
    ->evidence

*[Inspect the room]
The room had few furniture. There wasn't even a T.V or painting to cover up these giant walls. You can see the noose still suspended up on the light fixture.
    ->evidence


*[Inspect belongings]
There's only a purse, with a few items. You found a bottle of pills, wallet, and some makeup. 
-> belongings

*{evidence > 1}[Leave]
    -> location_description
    
-(belongings)
    * *[Inspect pills]
        The bottle is full. Lets give this to forensics to check the substance
        ~evidence_found += pills
    
        ->belongings
        
    * * [Inspect makeup]
        The makeup shows sign of use, despite the victim not wearing at time death. Quite peculiar for an austere woman to have makeup. Is it work related?
        ->belongings
        

    * * (wallet)[Inspect  wallet]
        {The wallet is leather and of high quality. You find some cash, a single credit card, her ID, a business card, and  a large card. | You set the item aside }

        * * *[Inspect cash]
            There's a few thousand dollars in here. Why was she carry so much cash for?
            ~evidence_found += cash
            ->wallet
            
        * * *[Inspect credit card]
            Card is still in use. Lets stop by the bank later to check for any activity.
            { evidence_found ? cash:
            
            <> <i>
            <i>There might be some clues on why she has so much cash on hand. <i>
            }
            
            ->wallet
            
        * * *[Inspect ID]
            Sarah Rasha D.O.B June 10th, 2050.  Height 5'5" You see a shy smile in her picture. She is wearing makeup and still keeps the same hairstyle
            ~evidence_found += ID
            ->wallet
            
        * * * [Inspect  business card]
            Ronda's Miracle Fortune Telling, Tarot - Psychic - Palm Reading - Healing Crystals, "100% Satisfaction" Why would she have some cheesy card? Its worth stopping by.
            ~evidence_found += business_card
            ->wallet
            
        * * *[Inspect large card]
            Seems to be a Tarot card. "X The Wheel of Fortune"
            
            { evidence_found ? business_card:
            
            <> <i>
            <i>I need to find out more of this Tarot stuff, there seems to be something happening behind the scenes. <i>
            }
             ~evidence_found += tarot_card
             ~cult_clues += tarot
            ->wallet
            
        * * *{wallet > 1}[Put back wallet]
            You set the wallet back down
            ->belongings
            
    * * {belongings > 1 }[That's all]
        ->evidence


//------------------------------CASE 3 -----------------------

// two endings, one good the other bad
// good ending: you don't invite Howard to investigate with you, you find the safe,
//              you open it up, find ancient relic (connected to cult), interrogate suspect
//              learn the cult exists, and Howard goes missing (that part is can be changed lol),
//              the relic is important and they want it back
// bad ending:  you invite Howard to investigate with you, you find the safe,
//              you don't open it bc Howard takes it with him, you find the suspect but that's it
//              you do Not learn the cult exists and you feel like something is gonna happen


=== dream_sequence ===
It's... cold.


* [...] 
    You look around but it seems as though you're in a dimly lit room. You can barely make out your hand right in front of your face.

- This sense of dread grips you as it slowly becomes darker and darker. You can feel your heart begin to beat faster in your chest. It’s almost deafening until…

Something inside you is screaming to not turn around. It’s pitch black at this point but you can hear something moving behind you.

You try to move but you can’t. You're completely and utterly helpless. You want to scream but you can’t even do that.

* [Turn around]
   You go against your better judgement and slowly turn your head. It’s as if your body is fighting against you. It takes all of your strength but you finally turn... you see it. 
   YOU WANT TO SCREAM. IT COMES CLOSER TOWARDS YOU. YOU TRY TO-
    ->awake_from_dream
     // can possibly lower sanity
* [Don't Turn Around]
  Even though it’s pitch black you squeeze your eyes shut and don’t dare to turn around. It’s as though your a child, hoping the monster under your bed won’t come out to get you. Suddenly you feel something on your neck, almost like breathing…
    ->awake_from_dream
    
-> DONE

// maybe mention his wife here???
=== awake_from_dream ===
* [Phone Ringing]

- You jolt upright and quickly scan your surroundings. You're in bed… safe.

You're completely drenched in sweat. It's been a long time since you've felt like that. It reminds you of…

Your phone brings you back to reality and you reach for it.

It’s Howard.

{
    - relationship < 50: 
        ~ know_about_case = false
        You hesitate for a moment before answering. The last conversation you had with him still lingering in your head.

        "Come quick, a fire broke out," he says coldly.
    
        Your foggy mind tries to catch up to what he said.
    
        "Why are we investigating this?" You ask but he’s already hung up the phone.
        ->crime_scene

    - else:
        ~ know_about_case = true
        You answer the phone anticipating what grim case you have to investigate next…

        "Rise and shine sleeping beauty, a huge apartment fire is calling your name." He let's out a small chuckle at his stupid greeting.

        "Why are we investigating this?" You ask.

        There’s a brief pause before he responds.
        
        * [...]
            "Monica's dead, she was in the building. The chief doesn't want to rule out foul play..."

            Howard keeps talking but you're not listening. 

            You can feel the lump in your throat forming. There’s only so much you can do in this godforsaken city. Things were actually looking like they would turn around…

            You gather your wits and respond, "Be right there."
            ->crime_scene
}

=== crime_scene ===

It’s complete chaos when you arrive. While the firefighters have mostly put out the fire the building is charred and smoke billows out of it. It’s seen better days.

* [Talk to Firefighters]->firefighters

* [Look for Howard]
    You look around and see Howard. You walk up to him and have to raise your voice to be heard amongst all the yelling and screaming.
    {
        - know_about_case == true:
             “Where’s the body?” You ask. 
             
             “Wow straight to the point huh?” He says with a small grin as he turns and walks off. 
             
             It kinda pisses you off, but you brush this thought aside and follow him.
             
             * [Follow Him]->community_center
        - know_about_case == false: 
            “Why are we investigating this fire?” You ask. 
            
            “Monica's dead, she was in the building when the fire started. The chief doesn't want to rule out foul play...” he says. 
            
             You can feel the lump in your throat begin to form. There’s only so much you can do in this godforsaken city. Things were actually looking like they would turn around… 
             
             You could barely hear what Howard muttered under his breath.
            
            * "A fucking waste of time..." // howard is messed up lmao
                ~ relationship -= 10
                ~ convowithHoward = true
                Did he seriously just...
                "What did you just say?!" You can tell Howard's a bit surprised you heard him.
                "I'm sorry Tony but I'm just calling it how I see it. This was an accident and she was just caught up in it."
                With that he walks towards a building nearby. He's such an asshole sometimes it's unbelievable. You follow him inside. ->community_center
            
           // * [Follow Him]->community_center

    }
    

->DONE

=== firefighters ===
~ convowithFirefighter = true
 You walk to a nearby fire truck where several firefighters are huddled amongst themselves. 
 
 It strikes you as odd, why are they all right here? As you approach, one of them catches sight of you and the group dissipates. Something is going on here… 
 
 "What happened here?" You ask the now lone firefighter, he's just a kid. He avoids your gaze and says, “An illegal gas hookup led to a gas leak anddddd you know the rest… sir.” 
 
 After he says that he finally looks up at you. You can tell he's lying but why? //(add to the clue counter maybe/suspicion ??) 
 
 “How sure are you?” You say making sure to look him right in the eye. He squirms for a bit and you can see him trying to come up with something to say. 
 
 “I don’t have all fucking day,” You say with more assertiveness. Suddenly you feel a hand on your shoulder. You quickly turn around to see Howard.
 
 {
    - relationship < 50:
        "Lay off the kid," he says rather harshly.
        
        His gaze was unwavering and devoid of emotion. You can't help but wonder if this is the real him. It scares you a bit...
        
        You brush the thought aside.
        
        "I was just asking him a question. Why are you defending him?" you ask.
        
        He turns around and gestures to follow him.
        
        You take one last look at the kid before following after Howard.
        
        * [Follow Howard] ->community_center
    - else:
        "Hey partner. We gotta go."
        
        Before you have time to protest he walks away.
        
        You quickly glance back at the kid you were just talking to but he makes his way towards the burnt complex.
        
        * [Follow Howard] ->community_center
 }

->DONE

=== community_center ===
It’s the community center. Going in you're instantly hit with the smell of ash and burnt meat. You grit your teeth to stay composed. You never quite get used to this job.

You follow his lead as you both navigate around all the paramedics and firefighters running around. You stop in front of a body bag. As he lowers to unzip it you find myself holding your breath. 

The body is burnt to a crisp.

“How can we be sure it’s her?” You ask, still a bit hopeful.

“Her mother lived in that building. They were found together. We’re gonna have Doc confirm it but we’re pretty sure it’s her…” He says. He continues, “Take a look at her neck.”

A necklace, while mostly charred specks of silver shined through. You take a closer look at it and see it’s in the shape of a small cross. It was Monica’s staple piece. She wore it through all of her speeches and public appearances. 

// You feel your hand tighten into a fist.
Your hand instinctively tightens into a fist from anger. <i> Why her of all people? </i> This thought is all you can think.

“If word gets out, there’ll be an uproar”, you say. <i>The whole community supported her…</i>

“Since we can’t say definitively if it's her, we have to stay quiet until the results come out. Let’s hope we’re wrong,” you say.

* Time to get to work.
    -> learn_stuff

->DONE

=== learn_stuff ===
"We need to interview as many people as we can to get to the bottom of this," you tell Howard.

{ 
    - convowithHoward == false:
        Upon hearing this, he lets out a sigh.
        
        "I'm sorry but is there someplace you'd rather be?!" You retort.
        
        "Well it's pretty clear that this was an accident, c'mon! All the buildings in this area aren't up to code. That's Dunwitch for ya."
        
        "Just shut up and get to work. The election is next week, the timing of this is just too coincidental..."
        
        "Whatever Tony, let's just hurry up and get this over with."
    
}

 You both exit the building. You look at the crowd of chaos in front of you.

 * [Investigate Burnt Building]
    “What floor was she found on?” You ask Howard. 
    
    “The top floor... why?” He asks with a bit of worry in his voice. 
    
    “Well I have to go and see what I can fi-” 
    
    “NO!” He says, cutting you off. 
    
    His response catches you off gaurd. As if he could read your mind he regains his composure and continues. 
    
    “It’s too dangerous… you can't just risk your life over an accident.” 
    
    His response angers you a bit. 
    
    “You know how many threats she would get. They knew she was going to change things…” You say. 
    
    “Enough with that shit, you’re always looking for something that isn’t there!” You can hear the anger in his voice now. It only makes you angrier but there isn’t time for this. 
    
    You walk away towards the apartment. As you approach it, you're met with several firefighters and police officers. You can’t help but let out a sigh, these bastards always get in your way. 
    
    “I'm Tony," You quickly flash your badge. "I just want to poke around a bit, don’t mind me.” 
    
    With that you try to slip through but of course it’s never that simple. You're forcefully pushed back. 
    
    “We can’t let you through.” Guess you'll just have to come back when these guys are gone.
    
    You should try to get some information from survivors…
    ->interview_people
 * [Interview People]->interview_people
  

->DONE

=== interview_people ===
// Now who to interview...
 
 * [Firefighter]->interrogate_firefighter
 
 * [Survivor]->interrogate_survivor
     
 + ->
    You try to assess who else you should interview when suddenly a woman's scream cuts through the air.
   -> ruckus
->DONE

=== interrogate_firefighter ===
{
        - convowithFirefighter == false:
            You walk to a nearby fire truck where several firefighters are huddled amongst themselves. 
 
            It strikes me as odd, why are they all right here? As you approach, one of them catches sight of you and the group dissipates. Something is going on here… 
 
            "What happened here?" You ask the now lone firefighter, he's just a kid. He avoids your gaze and says, “An illegal gas hookup led to a gas leak anddddd you know the rest… sir.” 
 
            After that he finally looks up at you. You can tell he's lying but why? //(add to the clue counter maybe/suspicion ??) 
 
            “How sure are you?” You say, making sure to look him right in the eye. He squirms for a bit and you can see him trying to come up with something to say.
            
            "I- I'm sorry sir but I have to... I have to get back to work!"
            
            You don't waste your time trying to stop him as he scampers off.
            -> interview_people
        - else:
            The timid firefighter from earlier spots you looking at his direction and acts pretends to act busy.
            
            You decide against talking to him again. He looks as slippery as a weasel and would probably avoid giving you a straight answer. Instead you set your sights on a nearby firefighter to talk to.
    }
    You walk up to him confidently. "I'm Detective Tony. Is it alright to ask you a few questions."
    
    "Sure but we've already given our report," the firefighter replies. 
    
    "So I've heard but I'd like to hear it for myself if you don't mind. Can I get your name?" You ask.
    
    "You can call me Johnny," he states plainly.
    
    "Ok Johnny can you tell me what happened here." You gesture towards the burnt apartment building.
    
    "Somebody must have forgotten to check their stove and boom. Simple as that," he says nonchalantly.
    
    {
        - convowithFirefighter == true:
            //The kid from earlier said something different...
            You notice the discrepency between Johnny's explanation and the kid from earlier.
        
            "That's not what the kid told me. He said there was an illegal gas hook up. Sure they're common here but its not the same as somebody leaving the stove on," you say.
        
            "What are you talking about... who said that?!" He asks quickly.
        
            You point in the kid's direction. He notices this and pretends to get back to work. You can't help but think he's a terrible actor.
        
            Johnny looks frustrated as he gives his response. "He's new here. Doesn't know what he's talking about."
        
            You try to hide your skepticism.
        
            "Thanks for the clarification Johnny," is all you say in response. 
            
            //They can't even bother to get their story straight... // add points to suspicion or something???
            <i>What a big miscommunication...</i>
        - else:
            You pretend to scribble something in your notepad.
    
            "Well thanks for the info Johnny. Maybe I'll see you around." With that you walk off.
    }
-> interview_people

=== interrogate_survivor ===
    You look around at those who mangaged to escape the fire. Their faces covered in soot, their eyes blank.
    
    You struggle to decide who to talk to when...
    
    A woman shakily approaches you. You didn't notice her before. She's wrapped up in a blanket. Her clothes are in rough shape.
    "Excuse me? Are you police?" She asks you.
    
    "I'm a detective. You can call me Tony." You reply.
    
    "Oh thank goodness. I tried talking to the police but they wouldn't listen to me."
    
    "I'm all ears ma'am." You take out your notepad, ready to write down what she says.
    
    - She takes a deep breath. "I live right below where the fire started. I didn't know anything was wrong until I heard the screams..."
    
    * "Take your time."
        <> You try your best to give her a reassuring look. It takes her a few moments before she continues.
        
    * "You didn't hear anything else?"
        <> You ask. "No explosion or loud bang before the screams?"
            "No I didn't hear anything like that..."
            
    
    * ...

    - "Before the screams there were so many footsteps. I thought they were from the kids upstairs but-"
    
    * [Is that it?]
        "Is that it? If so that could have been from people trying to escape."
            “You’re probably right. I’m probably just being paranoid from the fire. Sorry for wasting your time.” She walks off.
    * [Was that something unusual?]
    // learn there was a lone survivor...
        ~ loneSurvivor = true
        "Was that an unusual occurence?"
        "Yes, it was. It was like someone was running around. I don't know what they were doing but it's like they knew something was going to happen."
            "What gives you that impression?" Her astute observations keep you interested. There's more to this.
            "Well I kept pestering the police until one of them budged. They told me that everybody on that floor died except one person who was unaccounted for. They wouldn't tell me who but somebody made it out! No one else on that floor did..."
            "Thank you... I don't think I got your name."
            "Amanda. Amanda Carter."
            "Well thank you Amanda. You helped me learn a lot."
            She smiles and walks off.
    // clue
    - {
        - loneSurvivor == true:
            <i>The fire started on the top floor and only one person was lucky enough to miss it...</i>
        - else:
            You rub your temple as you try to think. Maybe Howard was right...
    }
    
->interview_people

=== ruckus ===
“WHERE IS SHE?! WHERE'S MONICA?” 

Immediately you turn to the source of the scream. Two police officers are holding back a woman. You run to her as quickly as you can, and  place your hand on her shoulder. She doesn’t seem to notice you. 

“I’m Tony, the lead detective. Who are you?” She stops struggling to your surprise. “They won’t- they won’t tell me if… she’s okay…” Her voice trembled as she spoke.

* [Tell her the truth]
   ~ truthlieshow = 1
    “I’m sorry, she didn’t make it. She was on the same floor where the fire started.” 
    She collapses to the floor and begins to sob. You signal for the officers to leave as you kneel down towards her. She’s whispering to herself, “I tried to go up there, I tried to save her…” 
    The only thing you can do now is reassure her. 
    “It’s not your fault, there wasn’t anything you could have done.”
    This is always the hardest part of the job but you try not to dwell on this fact.

* [Lie to her]
  ~ truthlieshow = 2
    “She’s safe. The paramedics took her to the hospital. You can check on her later, but can you tell me who you are?” 
    //Her eyes brighten a bit and I feel my self conscious nagging me, but I have to get to the bottom of this. 
    “Oh thank god! My name is Sasha. I’ve been friends with Monica since we were little kids. We basically grew up together… Thank you for telling me the truth. Nobody would speak to me.”
    You're hit with remorse. After this she will go to the hospital and ask for her friend that isn't there. You lied to her for my own convenience. <i>What's done is done.</i>
    //I want to walk away from her and never see her again. But this is a choice I'll have to live with. 

* [Show her]
    ~ truthlieshow = 3
    While she didn’t directly answer your question you trust her. It's very clear she cared deeply for Monica. 
    “Follow me,” You say it in almost a whisper. A small part of you hoped that if you didn’t say it loud enough she wouldn’t follow you, but she does. 
    You both slowly walk inside. While there are some survivors here the abundance of body bags makes it clear what you are about to show her. You stop in front of the body bag that holds what would’ve been the mayor had this taken place after the election. The woman next to you kneels closer to the bag and simply says, "Show me..."
    "Are you sure you want to see?"
    "... yes."
    You slowly unzip the bag. Her attention immediately turns to the charred necklace on the victim.
    You can barely hear her as she says, "Its her..."
    This is always the hardest part of the job but you try not to dwell on this fact. <i>I'll get to the bottom of this for both of our sakes.</i> This thought give you strength.
    

- You clear your throat a bit before continuing.

“I think that this was a targeted attack against her. It’s just too much of a coincidence that this happens so close to the election… I need you to tell me everything you know, every little detail that’s happened recently.”

She looks up at you and then down at the floor before she starts speaking.

"Monica would always act so tough. Even as a kid. That's why I didn't know about the death threats until recently. I mean I knew people didn't like her and would say mean things but I never knew..." 

* "Did she ever mention anybody specific?"
    <> You ask.

- "No she didn't mention any names. My God, had I known this was happening I would've made her stop running for mayor, but I think that's why she never said anything..."

She continues... "Later I learned that she was getting 'pranked' a lot. I don't even know how they found out her address but they somehow did. It started off with letters telling her to stop running, but then they started vandalizing her home. She didn't even tell me all of this, her mom did. That's why she was here in the first place. She moved back in with her mom to let things settle down..."

* [Anything else?]
    "Anything else? You can tell me anything at all. No matter how small." You have to make sure you know everything before proceeding.
    
- "ummmmm I'm not sure hold on..."

She fidgets with her hair as she tries to remember anything helpful.
    
"YES!" She suddenly exclaims.

You're both a bit taken aback by her response, but you quickly regain composure and gesture for her to continue.

"Sorry I just remembered something. Everything has been happening so fast I completely forgot for a second... Monica's mom recently told me this... She said that Monica thought she was being followed everywhere."

* [Stalking]
    "Somebody was stalking Monica?" You ask.
    
- "Yes. I didn't believe her mom when she told me that, but now I think it's true. A couple of days ago I was with Monica. Somebody was moving into an apartment on her floor. I didn't think anything of it but she caught a glimpse of him and... I've never seen her like that. I tried to ask her what was wrong but she wouldn't tell me."

"I didn't connect the dots until now but it had to have been him. No... I'm sure it was him. He found her again."

You jot down your final notes as quickly as you can. You weren't expecting to learn this much from her. 

{
    - truthlieshow == 2:
        "Thank you Sasha. You've been a big help."
        "No problem, detective! Now I've gotta go and see Monica."
        You walk away and all you can think of is <i>I'm sorry.</i>
    - else:
        "Thank you..." You pause after realzing you haven't learned her name.
        "Sasha, I'm Sasha."
        "Thank you Sasha. You've been a big help... I promise I'll get to the bottom of this."
        She nods dejectedly. With one final look at her, you walk off.
}
// clue
{
    - loneSurvivor == true:
        Only one person on that floor survived or completely missed the fire. Monica had a stalker. Somebody moves in not only the same building as her but the same floor. Monica was scared of him.
        
        It has to be him...
    - else:
        Monica had a stalker. Somebody moves in, not only the same building as her but the same floor... Monica was scared of him.
}
You glance at the burnt building standing before you. There has to be something inside. The firefighters here didn’t inspire much confidence in you. <i>They had to have missed something...</i>

You'll be back...

* [Head home]->back_home
->DONE

=== back_home ===
You couldn’t get much sleep after coming home. The events from last night still fresh in your mind. Doc called earlier in the day confirming the body found was Monica...

<i>If I’m going to go back and investigate I’ll have to wait until nightfall. It’ll be easier to sneak inside then.</i>

* [Wait until nightfall]

- The moon makes an appearance in the night sky. <i>It's beautiful...</i>

* [Focus]

- You scold yourself. You can admire the moon any other night. Tonight you have to stay focused.

 <i>I’ll be damned if I don’t get to the bottom of this.</i>
 
  As you start to gather your things your phone rings. It’s Howard. You answer. 
  “Hey Tony, I’m sorry about how I acted last night… I’m guessing you’re gonna want to head to the crime scene. Let me go with you, I’ll make sure you don’t end up getting youself killed.” He lets out a guttural laugh. 
  
  * [Invite him]
    ~ broughtHoward = true
    He's been acting strange lately but he's still your partner. Maybe it'll do you some good having backup.
    “You caught me, I’m heading there now. I guess I’ll see you.” You say.
    ->burnt_building

  * [Go solo]
    ~ broughtHoward = false
    ~ relationship -= 10
    He's been acting strangle lately. You'll get more done if you just go yourself. You quickly come up with a lie.
    "You were right last night… I was just trying to find what I wanted to see. I’m leaving the case alone.” You say dejectedly.
    ... 
    “Wow, I wasn’t expecting that!” He lets out a dry chuckle. 
    You tighten your grip on your phone. 
    “I guess I’ll just leave you alone then. See ya Tony.” 
    You grab your car keys and head out.
    ->burnt_building

->DONE

=== burnt_building ===
<i>Its a quiet night tonight, a bit unusual for Dunwitch.</i>

You find yourself standing in front of the building once again. The smell of ash still lingering. It's an almost familar scent now.

{
    - broughtHoward == true:
        Howard's running late as usual. You text him to meet you inside the building. You step under the yellow caution tape and enter the building.
    - else:
        You step under the yellow caution tape and enter the building.
}
You make your way up the stairs and find yourself a bit winded. A reminder that you're not as nimble as you used to be… Nearing the top of the building the fire damage is noticeably worse. You almost fell through the charred stairs a couple of times on your way up here. After some time you make it to the top floor.
{
    -broughtHoward == true: 
        <> <i>Hopefully Howard can make it up here.</i>
} 

A door used to separates the staircase from the hallway, but it looks like the firefighters bashed right through it. You turn on your flashlight and-

* [You kicked something...]
    Inadvertently, you ended up kicking something on the floor. You reach down for it. Rubbing the ash away reveals it to be... a padlock?

// add to clues?? padlock = locked exit 
- You almost drop it in shock. <i>Did somebody use this to block the exit? That explains why nobody on this floor could escape, this building doesn't have a fire escape. God, how could they have missed this?!</i>
You gently put the padlock in your pocket and continue onwards.

{
    -broughtHoward == true: 
        A buzz from your phone interrupts your thoughts.
        
        "Sorry I'm almost there," Howard writes. <i>I might as well have come alone at this point.</i>
        
        "I'll be in Monica's apartment. Top floor, second door on the left." You text back in response.
        
        Howard quickly replies, "Got it boss, I'll see ya there :)"
        
    - else:
        You head towards the only place I can think of, Monica's apartment.
} 
-> monicas_apartment

=== monicas_apartment ===
As you walk towards Monica's apartment a sudden crash stops you in your tracks. Instinctively you reach for your gun. You try to find the source of the noise. It's completely silent and then...
You hear footsteps inside an apartment near you. You open the door as slowly as you can… 

* [CRASH]->altercation
//as soon as I open the door I’m knocked to the floor

//-> DONE

=== altercation ===
You're knocked to the floor by somebody!

{
    - broughtHoward == true:
        ->brought_howard_altercation
}

* [Throw a punch]
    You struggle for a moment to get free and manage to land a punch on your attacker. It dazes him for a moment. Quickly, you seize the opportunity to take control. 
    “You’re under arrest and have the right to remain silent…” You give your spiel but you're on autopilot as you handcuff him. It takes you a moment to understand what just happened…

* [Reach for gun]
    You reach for your gun but your attacker anticipates this and kicks it out of reach. You try to push him off me but he’s stronger than he looks. 
    Your vision blurs and you desperately reach for something… ANYTHING! Some higher power must have taken pity on you as your hand finally comes into contact with… something. With it you land a blow to his head. He lets out a yelp and backs off of you. 
    <i>This is my chance.</i> You tackle him. Realizing his defeat, he doesn’t put up much of a fight anymore. You let out a sigh of relief and quickly handcuff him.

* [Talk to attacker]
    <i> Maybe I can talk some sense into him... </i>
    “You best get off me, I’m a detective. I’ll forget about all of th-”
    His response is clear as he tightens his grip around your throat. Your vision blurs slightly and you realize you don’t have much time left. You desperately reach for something… ANYTHING! Some higher power must have taken pity you as your hand finally comes into contact with… something. With it you land a blow to his head. 
    Instantly he collapses on top of you. You check his pulse… and let out a sigh of relief. He’s unconscious. You push him off of you and quickly handcuff him.

- You sit down next to your attacker and catch your breath. <i>I guess I should look around… he was here for a reason.</i>
->investigate_apartment

=== brought_howard_altercation ===
* [Throw a punch]
     You ball your hand into a fist and struggle to muster up enough strength to throw a punch. <i>Here goes nothing...</i>

* [Reach for gun]
     You reach for your gun but your attacker kicks it out of reach. His grip around your throat tightens, and your vision begins to blur. <i>I have to-</i>

* [Talk to attacker]
     <i> Maybe I can talk some sense into him... </i>
    “STOP, I’m a detective. Get off me and we can talk this through thi-”

- ... 

* [BANG]
    At that moment everything is still, you’ve both stopped moving. The man collapses on top of you. 
    You quickly push him off and get up to see Howard standing at the door. His gun still raised. 
    “WHY DID YOU FUCKING SHOOT HIM?!” You exclaim. It takes everything in you to not throttle him that second. 
    “It looked like he was going to kill you! What do you want me to do? Stand by and do nothing!” He retorts.
    “Are you completely stupid! You could have just pushed him off me and arrested him.”
    You’re both silent. After a long pause you speak again.
    “We could’ve gotten some information out of this guy.”
    “Sorry,” is all he could muster.
    You try not to dwell on it, but that was a rookie mistake.
    “We should take a look around, he was in here for a reason. Let's split up.” You tell Howard.
    He nods in agreement.
->investigate_apartment

=== investigate_apartment ===
The apartment is barren. Little to no remnants of burnt furniture. Whoever lived here cared little for decor.  You walk into the bedroom. 

{
    - broughtHoward == true:
        You can hear Howard rummaging around elsewhere.
}

 A destroyed twin mattress lies in the corner of the room. The closest is barren, there’s nothing here. <i>I guess its time to get out of here.</i> You walk back-
 
 * [CRACK]
    You can feel the ground beneath your foot give way. In an attempt to not completely fall through the floor you launch yourself forward. You look back at the gaping hole but it... it doesn't go all the way through. Instead there's a hidden compartment.
    
{
    - broughtHoward == true:
        Howard comes rushing in after hearing all the commotion.
         "Jesus are you alright?" He exclaims.
         You ignore him.
}

- You peer down and see something. Taking a better look it looks like whoever lived here had stuff hidden under the floorboards… It’s a small safe.

{
    - broughtHoward == true:
        Howard comes closer, and takes a look at the safe.
        "I told you something was here!" You exclaim with excitement.
        "Don't start celebratin' now Tony. For all we know it's just valuables but we’ll see back at the office." He stands up and extends his hand towards me. "Here I’ll take it back. I’ve already called for backup after… you know. I’ll clean up this mess alright, it's the least I can do. Go home.” ->safe_and_howard
        
            // ~ giveSafe = true 
            //->safe_and_howard
  
}

- While it's small it's still a bit hefty.

Your gut is telling you, you can't trust anybody else with this... 
With the safe and attacker in tow, you make a quick pit stop at your place. Making sure to leave the safe somewhere hidden. You’ll come back for it later.

*[Police Station]
    You arrive at the station. Lugging your attacker along side you. You've asked him for his name several times but he doesn't respond. You then realize that this is the first time you've actually gotten a good look at him. He looks like he's in his mid 40s, tall, well built, dirtly blonde hair.
    
- Once inside you process him through all the usual procedures and leave him in a holding cell. Throughout all of this he's quiet, hopefully some time here will break him. I need him to tell me everything.

* [Police Chief]->talking_to_chief

->DONE

=== safe_and_howard ===
* [Give safe to Howard]
        I want to protest but these past couple of days have left me exhausted.
        I extend the safe in order to hand over it over to Howard. He practically snatches it out of my hands, his eyes gleaming. It startles me a bit.
        “Call me immediately when you get that safe open, ok!” Is all I can manage to say.
        “Of course.” He gleefully walks away.->bad_ending

->DONE

=== talking_to_chief ===
 You decide to talk to the chief. After years of working with him you know he always follows his moral compass. One reason you admire him. You knock on his office door befor letting yourself in.
 
 "Hey chief, can I talk to you for a minute?" You ask a bit tentatively.
 
 He looks up from the stack of paperwork on his desk and says, "What is it Tony?"
 
 "I just checked in a guy who attacked me and I think he's connected to Monica's death. I ran his info and we got a hit. Carl Lumin."
 
 The chief doesn't say anything but his attention is solely on you. He gestures for you to continue.
 
 "I know I can get him to crack but I need to do something first... I need a favor chief. You cannot under any circumstance let anyone see him, talk to him, even think about him. Not even Howard..."
 
 This piques the chief's attention and he finally says something, "Not even Howard?"
 
 "Not even Howard," you say with more conviction.
 
 Silence permeates the room.
 
 "Ok, I don't know what's going on with you and Howard but it's none of my business. I'll make sure nobody sees your man. Good job Tony. Find out why the bastard did it, ok?"
 
 You can't help but let out a small smile and response, "Of course, sir."
 
 You exit his office... there's only one thing left to do.
 
 *[Open the safe]->open_safe
->DONE

=== open_safe ===
You go back home as quickly as you can. The contents of the safe is the only thing in your mind. You retrieve it from the depths of your closet. Luckliy the missus didn't find it.
* Gloves
    <>... check!
    ** Tools
        <>... check!
- With everything in place you attempt to open the safe.

* [Crowbar]
    You grab your trusty crowbar... After several attempts, and several hours, it finally opens! Sweat drips down your face as you smile in triumph.
* [Lock pick]
    It's been a while since you've used this but it seems like the quickest option. After several minutes you hear the satisfying click and the safe pops open. You smile in triumph.
* [Gun]
    You grab your... gun. <i> Maybe I can just shoot the lock and it'll open.</i> You take aim and... you can't do it. <i> That was such a stupid idea.</i> Your better judgement seemingly returns as you put down your gun and pick up the lock pick.
    It's been a while since you've used this but it seems like the quickest option. After several minutes you hear the satisfying click and the safe pops open. You smile in triumph.
- Your curiousity finally subsiding as you gently begin to lay out the contents of the safe. 

* [Money]
    A huge wad of cash. You make note to turn this in.
    ** [Photos]
        There are so many pictures of... Monica. They all look like candid photos. A chill runs down your spine as this confirms Monica was being stalked.
        *** [Note]
            A piece of paper. It's crumpled up. Opening it reveals... manic scribbling. It's hard to make out words but it's clear whoever wrote this was not in the right state of mind. You flip over the note to find a drawing. It looks like a shadowing creature. Even though it's a crude drawing it feels you with fear for some reason.
            You put the note down. Not wanting to touch it anymore.
            // add to eldritch counter???
            **** [<i>What's this?</i>]
                There's something wrapped in cloth. You gently unwrap it. You hands sweating inside their gloves.
                It's a carved humanoid figure. The wood it's carved out of revealing it to be quite old. There are inscriptions on it but they don't make much sense. 
                 After staring at the relic for a bit longer you can feel a burning sensation in your chest. Your heart begins to beat faster as you try not to drop the figure. You place the relic down before being engulfed in fear. You cover your mouth, your hand trembling. 
                 <i>WHY AM I SO SCARED?</i> Is the only thought you can think of. Repeating over and over and over...
                 Quickly you wrap the figure with the cloth and you feel as though a weight has been lifted off of your shoulders. <i>What the fuck just happened?! What is that thing?</i> // lower sanity???
            
        
- After the terror has fully subsided you begin to think. <i>Was Carl looking for this?</i>

You place everything back into the safe and head back to the station.

*[Interrogate Carl]->possible_to_go_to_good_ending
->DONE

=== possible_to_go_to_good_ending ===
Carl sits in the interrogation room. The chief kept his end of the bargain. <i>Now to keep mine.</i>

You sit across from him and place the safe onto the metal table. His eyes are instantly drawn to it.

"Hey Carl, hope you've enjoyed your stay." You say tauntingly. He continues to stare at the safe.
"Earth to Carl, are you even listening to me?"
...
Still no response.

*[Threaten]
    You do the only thing you can think of. Slam your fist on the table. This finally gets Carl's attention.
    "Do you want to spend the rest of your miserable life behind bars? I know it was you who started the fire?" You say, hoping he won't call your bluff.
    "I did start the fire..." He responds.
    It catches you off gaurd. He just fully admitted to causing the fire. <i>Why???</i>
*[Sympathize]
    "If you cooperate, I can personally make sure they lessen your sentence. Just tell me the truth. Did you start the fire?" You ask.
    "Yes... please just lock me up."
    <i>Did I just hear him correctly? He fully admitted to his crime and he wants to be locked up? What's going on here?</i>

- "What were you doing at the crime scene? Why did you attack me?" You ask.

...

No response.

*[Relic]
    You take out the relic from the safe and begin to unwrap it-
    Carl doesn't let you proceed as he begins to shout profusely, "NO PLEASE STOP! I'LL TELL YOU EVERYTHING JUST DON'T UNWRAP IT."
    You let out a sigh of relief. You didn't want to reveal the figure. The events from last time still lingering in your memory.
    ~cult_clues += relic
    
- "Please they forced me to do it... please I'll be safer here. Please just lock me up." He says between sobs. It's clear to you that he is very scared... of what you're still not sure.

// not sure if we want it to be this obvious...
"It's a group... a cult. They worship ◻◻◻’ ◻◻" He states. He looks more manic.
<i>What did he just say?</i> It's as though your mind was protecting you from a sinister force.
"What?? Who do they worship?" You ask in almost a whisper.
"I can't say it again... they'll know."
"And this... cult told you to kill Monica?" You ask inquisitively. Carl nods his head vigorously as confirmation.
He starts to whisper again. You lean in order to hear him.
"with her gone they'll control the whole city..." He says. A pit starts to form in your stomach as upon hearing this. You look at Carl, who's now repeatedly muttering something under his breathe. He's not all there anymore... 
->case3_close

//Case 3 to Ending Transition
===case3_close

<center><h2> Case 3: From the Ashes Ends <h2>
    +[Continue]
    
<center><h2> Ending Begins <h2>
    ->dream_sequence
    ->DONE
 

===case3_deduce
    "These motherfuckers. Why do they make no fucking GOD DAM sense. Would it hurt for the love of god for things to make some sense. I'm about to lose to my mind. He's spewing some shit thats not even english. He could be high as the sky. Let me run down the facts first."
    ->case1
    
=case1
    *[Doubt]
    {~There's no way that robbery was connnected. | I seen plenty of crazies commit crimes for the thrill. | Theres no coincidence unless I see hard facts.}
        **[Yes]
            
        ->case2
        
        **[No]
        {~Let me think again. | SHIT! SHIT! | This is so frustrating. One more time. Think Tony Think. | Use your fucking brain. I am the GOAT for a reason.| FUCK YOU! Howard. Why do you have to be so caculating? | Maybe I caught the crazies. | Howard, you wouldn't fucking dare! } 
        ->case1
        
    *[Confer]
    {~Maybe I have to think crazy to know crazy. | I seen holy swords in fantasy games, maybe that dagger was possessed with bad juju. | No one accidently kills someone in a robbery unless they are a fucking psycho and this guy is cracked. | That knife wasn't missing, it was stolen from the inside. He messed up and the cult was forced to push their plan.}
        **[Yes]
        ->case2
        
        **[No]
        {~Let me think again. | SHIT! SHIT! | This is so frustrating. One more time. Think Tony Think. | Use your fucking brain. I am the GOAT for a reason.| FUCK YOU! Howard. Why do you have to be so caculating? | Maybe I caught the crazies. | Howard, you wouldn't fucking dare! } 
        ->case1
        
=case2
    *[Doubt]
    { ~ It could of been a tragic suicide. | Theres no hard evidence she joined a cult. | Her suicide plan was set in stone and she exhausted her money for who knows what. | These youngins just commit suicide without reach thirty. It's so fucking sad. | It's not a new case where a no name commits suicide.}
        **[Yes]
        
        ->end
        
        **[No]
        {~Let me think again. | SHIT! SHIT! | This is so frustrating. One more time. Think Tony Think. | Use your fucking brain. I am the GOAT for a reason.| FUCK YOU! Howard. Why do you have to be so caculating? | Maybe I caught the crazies. | Howard, you wouldn't fucking dare! } 
        ->case2
    
    *[Confer]
    { ~ Sarah did not kill herself. She was murdered. | She had good luck to be wealthy, but the worst luck to dabble in the occult. Couldn't she just pick up something a little normal. | She was definitively manipulated into something and then silenced. | Nobody commits suicide in their prime.}
        **[Yes]
        ~ending += good
        ~deduce_success += c3
        ->end
        
        **[No]
        {~Let me think again. | SHIT! SHIT! | This is so frustrating. One more time. Think Tony Think. | Use your fucking brain. I am the GOAT for a reason.| FUCK YOU! Howard. Why do you have to be so caculating? | Maybe I caught the crazies. | Howard, you wouldn't fucking dare! } 
        ->case2

=end
{ ending ? good}
<>  "I always wondered, Howard. What type of person you are? I am going to settle this by my own hands."
    ->begining_of_good_ending

{ending !? good}
<> "Howard, you better have a good dam reason. We been partners through thick and thin. Thats trust I won't fucking betray."
    ->dont_believe



// DO A DEDUCE HERE and look at all clues found so far... if enough clues are found then you believe him and go to the true ending of finding out Howard is in the cult.
//<>, but your gut tells you to believe him. Whoever these people are they have connections... and they did something to break this man.
// I have to stop them.
// ->good ending
// if there isn't time for that it's ok, its totally my fault for writing an awful case.

// ELSE if DEDUCE isn't successful because you didn't find all the clues and information
// then it goes to the don't believe and you get a not good ending since you think it's too outlandish
// ->dont believe

->DONE

=== dont_believe ===
// after DEDUCE
// this is a bad ending
<i>Carl is clearly sick and needs help. To fabricate such an organization...</i>
With a heavy heart you exit the interrogation room, leaving your attacker behind.

The case has been solved and you've brought some justice to Monica. You call it a day, heading home with one thought on your mind.

<i>I’m not sure if anything I’ll do will ever change Dunwitch. No matter how many cases I solve it’s not enough...</i>
->DONE

=== bad_ending ===
You later learned that the attacker lived in the apartment too, his name was Carl Lumin.

{
    - loneSurvivor == true:
        He was the lone survivor of the floor Amanda was talking about.
}

Howard opened the safe. There wasn't much but some money and... pictures. So many photos of Monica. He was obsessed with her. That obsession led to her death and countless others. Carl confessed to starting the fire and locking the only exit.

While some part of you is happy that the case has been solved, a creeping thought nags at you.

<i>I’m not sure if anything I’ll do will ever change Dunwitch. No matter how many cases I solve it’s not enough...</i>

->DONE

=== begining_of_good_ending ===
<> but your gut tells you to believe him. 
<i>Whoever these people are they have connections... and they did something to break this man. I have to stop them.</i>

"Can you tell me more Carl?" You ask, but it appears to not have reached him. He's seemingly in his own world now.

With a sigh you leave the interrogation room, grabbing the safe and it's contents. There's nothing more you can get out of him.

<i>Where do I start to catch a fucking cult?!</i> Reluctantly you pull out your phone and call Howard.

It rings several times but straight to voice mail...

As you walk back to your desk Janet, the secretary, calls out to you.

"Tony have you heard from Howard?" She asks with sincerity in her voice.
"No I haven't... why?"
"Well he was supposed to come in today but he hasn't. I called him but he didn't pick up. I'm worried about him, this isn't like him..." She trails off.

You can't help but laugh a little. Janet's always had a bit of a crush on Howard. <i>If only he knew... but she's right. This isn't like him, he would have told me.</i>

*[Find Howard]
    "I'll go find him Janet, don't worry about it." You reply.
    You've already made your way to the exit before she's had a chance to respond.
    
    In your haste to leave you realize you still have the safe in hand. You toss it in the backseat of your car, leaving your future self to deal with it later.
    
- <i>Where could he be?<i>

*[Bar]
    It's early in the day but a thought pops into your head.
    
    <i>Maybe he's at the bar??? It doesn't hurt to check I guess...</i>
    The place you and Howard would always go to after long and tedious cases.
    
    ** [...]
        You enter the bar. Unsurprisingly it's practically empty. Just a few sad souls drinking their problems away.
        
        You walk up to the bartender, Vince, a long time friend.
        
        "TONY! What are you doin' here so early? Trouble in paradise?" He says mockingly.
        "Shut up Vince. I don't know where Howard is. I thought he'd maybe be here."
        "Sorry but he hasn't shown his face here."
        "Thanks Vince. I'll see ya later."
        "Hold on a sec Tony... here a shot for the road. Its on the house!" Vince places a shot in front of you.
            ***[Accept]
                <i>What the heck, why not?!</i>
                You take a swig of the amber colored liquid. It tastes awful but you let out no grimace of disgust. Having long ago adjusted to it.
                "Thanks again Vince."
                You exit the bar.
                <i>Where are you Howard?<i>
                You drive to Howard's place.
                ->howards_house
            ***[Reject]
                "Thanks Vince but I can't. I'm on the clock ya'know!"
                "You're no fun!" Vince scoffs as he takes the shot himself.
                You exit the bar.
                <i>Where are you Howard?<i>
                You drive to Howard's place.
                ->howards_house
*[Home]
    <i>He's probably at home. I should check on him...</i>
    
    You drive to Howard's place. Even though you've been there countless times before you're a bit nervous. Your clammy hands grip the steering wheel a bit tighter.
    ->howards_house

->DONE

=== howards_house ===
*[Knock]
    You knock loudly on the door.
    "HOWARD! You there? It's me Tony!" You exclaim.
    
- No response.

<i>Dammit!</i>

You pace back and forth on his porch. Thinking of what you should do next.

*[Enter Howard's house]->inside_howards_house
*[Call Howard]
    ~ callHoward = true
    You pull out your phone and call Howard again. 
    He doesn't pick you up but...
    You can hear ringing coming from inside.
    ->inside_howards_house

*[Leave it alone]
    You can't come up with anything else to do. No other clues point to where he could be.
    All you can do is hope he's alright...
    You drive back to the station when you recieve a text.
    "Sorry Tony. I'll be back tomorrow. Promise. Tell Janet not to worry ;)"
    You feel comforted by the fact he's ok.
    **[...]
        The case from the past several days linger in your mind.
        
        One thought speaking louder than the rest. 
        
        <i>I’m not sure if anything I’ll do will ever change Dunwitch. No matter how many cases I solve it’s seemingly not enough...</i>
        You push this thought aside. You're ready for the next case, whatever it may be. Protecting Dunwitch is your top priority.
        Little do you know the danger that awaits, the danger you could have stopped.
    
->DONE

=== inside_howards_house ===
You know where Howard keeps his spare key. Under the doormat.
You've told him countless times to move it somewhere else. It's a major hazard! But with key in hand, your grateful he hasn't taken your advice just yet.

*[Enter]
    It looks like nobody's home.
{
    - callHoward == true:
        You find Howard's phone on the coffee table. He has several missed calls.
        <i>Why'd he leave his phone here?</i>
}

- You look around. Many wouldn't guess it but Howard's very tidy. Today is no exception. Everything looks like it's placed with purpose and precision.

*[Howard's Room]
    You enter Howard's room. 
    "Howard, you there?"
    
- Nothing. Completely empty.

While you really shouldn't you can't help but take a look around.

// find ritual knife
*[Closet]
    ~ kniferelictarot = 1 // 1 == knife
    You open his closet. It's full of dress shirts and blazers.
    <i> God what am I doing?</i> You say to yourself as guilt begins to bubble inside you.
    You begin to close the closet when you catch a glimpse of a box.
    **[Box]
        It's made of walnut. The wooden grooves are almost hypnotizing, but what really caught your attention were...
            ***[Carvings]
                There are several intricate symbols carved onto the box. You open it...
                    ****[Open]
                        Inside, the box is lined with a velvet like material. A knife with strange carvings...
                        You drop the wooden box in shock. It's the exact same knife that killed Francis Thurston. <i>Why the fuck does Howard have this? Is it a replica???</i>
// find image of relic
*[Nighstand]
    ~ kniferelictarot = 2 // 2 == relic picture
    Beside his neatly made bed is a nightstand. A framed picture of the two of you in your early days sits on top.
        **[Open nightstand drawer]
            Curiousity gets the better of you as you open the drawer. A lone journal is all that's in there.
                ***[Journal]
                    It's a leather bound journal. It seems heavily used.
                    You try to not to thoroughly read its contents. 
                    As you quickly flip through it a photo stops you in your tracks.
                    ****[Photo]
                        It's... the relic. Just looking at it you begin to feel the fear that previously gripped you.
// find tarot card
*[Bookshelf]
    ~ kniferelictarot = 3 // 3 == tarot card: Wheel of Fortune
    You didn't realize how big of a reader Howard is. A grand bookshelf stands tall in his room. It's filled with them. 
    <i>When does he have the time to read them?<i>
    You quickly scan them. He has lots of the classics like <i> The Odyssey</i>, <i>Frankenstien</i>, and those are the only ones you recognize. <i>Maybe I should get into reading...</i>
    // One thing you notice is there are several
    Certain words catch your eye: deception, conjuring, symbolism, magic, phantasms...
        **[Book]
            <i>I guess Howard is interested in some weird stuff.</i>
            You pick one out randomly.
            It's old, weatherd and smells of mildew.
            You fip through the pages slowly, the old pages crinkling loudly in protest.
            Symbols and charts cover the pages along with annotations from Howard or God knows whoelse.
            ***[Annotations]
                Much of the book doesn't make sense to you but you stop reading at a page where the annotations become seemingly more chaotic. 
                Circled heavily is the... Wheel of Fortune.
                Immediately you remember the tarot card you found while investigating Sarah Rasha's death. There are "words" written in symbols but you can't interpret them.
    

- The sound of footsteps grabs your attention.

You look to see Howard. You notice his disheveled appearance and that his shirt is covered in blood.

"Tony, what the fuck are you doing in my house?"

*[Tell Truth]
    "I was worred about you, you didn't show up for work? Is that your blood? Are you ok?!" You say.
    "Get out Tony." Howard says calmly.
*[Deflect]
    "Why are you covered in blood?!" You yell back.
    "Just get out Tony." Howard says.
*["Are you ok?"]
    "Jesus Christ Howard! ARE YOU OK? You're bleeding!" You say with exasperation.
    "It's not mine." Howard says calmly.
    A chill runs down your spine.
    
- "I can't go Howard."
"Why not?" Is all Howard says in response.

{
    - kniferelictarot == 1:
        "Because I found it... I found the exact same knife from Thurston case. Howard please just tell me why you have it? Is it a replica?" You say pleadingly.
    - kniferelictarot == 2:
        "Why do you have a picture of... <i>it</i>? Of the figure or relic or whatever the hell you want to call it?" You say. You struggle mentioning the relic as it fills you with unease.
    - kniferelictarot == 3:
        "... I- I read some of your books here. You really like the occult huh?" You clear your throat before continuing. "Why was the Wheel of Fortune circled? I remember it from the Rasha case..."
}

"Don't tell me Howard, don't tell me you're a part of this... this <i>cult</i> that Carl was talking about!!" You struggle to get the words out.

{
    - kniferelictarot == 2:
        "Wait, how do you know about the relic Tony? DID CARL HAVE IT?" He yells.
        You flinch at his response. It only confirms the worse.
        Howard composes himself before he continues.
        "Tony.. do you have it? Do you have the relic? Please just give it to me."
    - else:
        "Then you should just leave Tony... and pretend this never happened."
        You flinch at his response. It only confirms the worse.
}

*[<i>WHY?</i>]
    "WHY ARE YOU A PART OF THIS MESS HOWARD?!" You yell at Howard.
    
- So many emotions swirl through your head. Anger, betrayal, sadness, curiousity...

<i>No wonder he's been acting so strange, so dismissive</i>

This thought only makes you angrier.

<i> Wait... </i>

"The Rasha and Thurston case... that was you?" You ask praying he wil say no.

"Well I didn't do it myself but yes. A 'cult' needs funding too!" Howard says with a sigh.

"And... and Monica. Did you know they were going to kill her?" You say in almost a whisper.

"Did I know?! Hell, I was the one who told them to do it! Frank is apart of this too ya'know. We're trying to expand our organization to new heights!" Howard says nonchalantly.

{
    // evil Howard
    // can only kill or "catch" howard
    - relationship < 20:
        Abruptly Howard starts laughing. This catches you by surprise even though it shouldn't.
        "What's so funny?" You ask.
        Wiping the tears in his eyes Howard responds.
        "Haven't you ever thought about it Tony? C'mon you hadddd to have thought about it at leastttt once."
        "What are you talking about?"
        Howards expression changes to one of annoyance.
        "Don't act coy with me! KILLING! After all of this time on the force... seeing so much violence hasn't it broken you too?" He says.
        Before you can think of a response he continues.
        "Everyday theres a new <i>case</i>. Everyday somebody does something horrible. I'm tired of it Tony. Everything just needs to restart."
        *[Restart]
            "What do you mean... restart?"
            ->confront_howard
    // right intentions wrong execution Howard
    // can catch Howard
    - else:
        Howard begins to speak again.
        "Aren't you tire of this job?? Seeing so much violence and crime everysingle day? It doesn't look like its going to end anytime soon..."
        You don't know what to say in response. Howard just continues.
        "No matter HOW MUCH we work its never enough Tony. We can't catch all the bad guys." Howard says with sadness.
        "I know that Howard. I KNOW THAT. But we can't just give up!"
        "I'm not giving up, Tony. This is why I'm doing all of this. Things can finally change now!! Yes, we <i>did</i> have to make some sacrifices but its for the greater good."
            *[<i> You're delusional...</i>]
                "Cut the utilitarian crap. You're delusional Howard... how is killing people going to solve things?!" You say.
                ->spare_howard
            *[<i>This isn't the way...</i>]
                "Howard... this isn't the way to solve things! You know that..." You say.
                ->spare_howard

}

->DONE

=== spare_howard ===
You've known the man in front of you for years.

<i>Howard please let me help you.</i>

"Howard it's not too late."

*[Convince Howard]
    "Sometimes I hate this job too sometimes."
        **"We've seen people do heinous things."
            ***"Trust me Howard, sometimes I feel completely hopeless sometimes."
                ****[You're not alone]
                    "You're not alone Howard. Remember, we're partners! You can talk to me. We can get through this!"
                    You find yourself holding your breath after your statement. Hoping that Howard will see your sincerity.
                    ->bestest_ending
                ****[It's just part of the job]
                    "It's just part of the job Howard. You can't let it blind you to good and evil."
                    Howard just lets out a sigh in response.
                    ->good_arrest_howard
        **"More and more crime happens and it's like[...]
            <> it will never stop, but..."
            ***[We're in this together]
                "Howard... we're in this together. Remember our first case together. I knew we'd be friends. Don't you trust me?"
                You find yourself holding your breath after your statement. Hoping that Howard will snap out of it.
                ->bestest_ending
            ***[We're only human.]
                "We're only human. We signed up for this job knowing we can't stop all crime."
                "Tony..." Howard says with a sigh.
                ->good_arrest_howard
*[Arrest Howard]
    ->good_arrest_howard
->DONE

=== bestest_ending ===
Suddenly a knife clatters to the floor. You look in shock as Howard has seemingly let go of his hidden weapon. You look back up at Howard and he's...

He's crying.
You smile. You have your partner back.

*[Station]
    You bring in Howard. Everybody looking at you in shock. It looks like Janet is about to faint.

Howard tells you everything. There are several times during the "interrogation" you almost spit your coffee out. The relic was indeed <i>demonic</i> of somesort which is why it struck so much fear in you. Had the cult been successful Dunwitch would be...
<i>God I don't even want to thnk about it.</i>
For now your focus is eradicating the cult.

You let out a sigh of relief. Although you're a bit sad that you'll have to do all of this alone. While Howard did cooperate, he too must face justice. Both of you have accepted this fact.

By the time he's out of prison. The cult will all be a distant memory.

You head back home after a long day.
Tomorrow you're back to work, a lot has to be done before Howard's back.
->end_screen

=== good_arrest_howard ===
"I don't want to kill you Tony."
"I don't want you to kill me either!"

You both laugh a bit and it hits you how bizarre this situation is.

Suddenly a knife clatters to the floor. You look in shock as Howard has seemingly let go of his hidden weapon. He raises his arms together, signalling you to handcuff him.

"I admit defeat, but you won't get anything out of me."

You handcuff your partner. <i>Can I even call him that anymore?</i>

*[Station]

- You bring in Howard. Everybody looking at you in shock. Howard sticks to his word. He only admits to murder. The blood on his shirt was the only evidence of this crime.

He makes no comments on the cult or organization or whatever you want to call it.

You know by now that many more people are a part of this. Pretending to be everyday citizens, officers, lawyers...

But you make a promise to yourself that you'll uncover the truth.

One day Howard will talk, after all he's your partner.
->end_screen

=== confront_howard ===
"We have to start from scratch Tony. ◻◻◻’ ◻◻ will change everything!" Howard says, he's calm once again.

<i>It's just like that time with Carl. I don't understand what he just said...</i>

"Who will change everything?" You ask with some hesitancy.
Howard just lets out a chuckle.

You just realize that throughout this conversation Howard's been slowly making his way towards you. He's an arms length away from you now.

"Who's blood is that on your shirt?" You say as you point at Howard.
He looks down at it.
"Oh, just a little lamb. A sacrifice to-" He says with a smile.
"ENOUGH HOWARD! Please just come with me and I can get you help." You say. You extend your hand out to him as a gesture of kindness.

In reponse Howard brandishes a knife he's had on him this whole time.

*[Kill Howard]
    Your feel your heart break a bit.
    <i>He's too far gone.</i>
    You instinctively reach for your gun and pull the trigger.
    **[BANG]
    { -has(cult_clues, (knife, relic, tarot)):
        Howard falls to the floor. Blood begins to pool around him.
        You also fall to the floor and begin to sob.
        ->aftermath
        
        -else:
        BANG! BANG!
        You feel a sharp pain in your chest. You stare down to see blood coming out your chest. Your adrenaline is haywired and staring back up you see the smoke still coming of barrel of Howard's gun. His mouth is moving but my head keeps ringing. He's slowly appoaching me and try to reach out to him, but I feel myself giving out and hitting the floor. I see Howard's face close to mine. He whispers, "I'm sorry."  I can see a tear run down his eye.
        
        "I'm sorry, Tony. I did't want this to be like this, but you pulled the gun. It's not my first time killing people, but you hesitated and I shot on reflex. Don't worry I will take care of your family, but the cult will live on. You died valiantly supporting the cult."
        ->end_screen
        
            
        
    }
*[Arrest Howard]->arrest_howard
   
->DONE

=== arrest_howard ===
 Howard lunges towards you with the knife.
    You, mostly, dodge it as he scratches the side of your arm.
    *[Punch]
        You throw a punch at him, but he blocks it and lands one of his own. You quickly stumble back to avoid another slash.
    *[Kick]
        You decide to switch things up a bit and attempt to kick Howard. You land a hit but it's not as effective as you thought it would be. You jump back to avoid another slash.
    *[Grab Knife]
        Howard holds the knife with his right hand. As he attempts another slash you grab hold of his hand. Trying to pry the knife from him is unsuccessful as he leaves a gash on your hand.
- In a last ditch effort you tackle Howard. You feel a sharp pain in your shoulder as the knife plunges into you. You manage to subdue Howard but the pain in your shoulder is severe. 
"You're under arre-"
"Cut the crap Tony!" Howard yells, cutting you off.
You pause and in that moment Howard notices.
With one swift motion, as if he's practiced this hundreds of times, Howard bucks you off and he reaches for your-

*"HOWARD!"
    He wrests your gun from your body and...
    **[BANG]
    { - has(cult_clues, (knife, relic, tarot)) :
        You instinctively close your eyes but after several moments you realize that you're alive.
        You open your eyes to see Howard's lifeless body. He shot himeself...
        <i>Why didn't he shoot me?</i>
        You back away from Howard and begin to sob.
        ->aftermath
        
        -else:
        Howard jumps back, holding the gun upright. "I won't be needing this," he states and throws the gun to side away from you. " I'm sorry Tony, but this is the end." You feel your head throbbing and the room starts shaking profusely. Howard's eye start glowing yellow. "Every since you came into my domain, you were already trapped. You know I don't make mistakes. I just wanted to play with my prey. They are best served filled with regret and despair." He starts laughing manically and your heart starts beating faster. "You will make a great sacrifice, you have been doing constant cases and your fatigue has caught up to you. "How do you think I have the energy to wake up so early and be behind the cult? Because my god lets me siphons emotions from my prey and fuels me with power. HAHAHHAHA. He stares right into my eyes and I feel my heart stop. "You will be my fattest feast, as he growls while he likes his lips in a circular motion. This is then end, partner." You faint and hit the floor with a thud.
        ->end_screen
        
            
        
    }
    

=== aftermath ===
After some time you compose yourself and call the only person you trust.

*[Police Chief]

You explain the whole mess to him in between sobs. Some small sliver of you hopes he doesn't believe you so that you'll go to jail. Unfortunately for you, he believes you.

The chief soon arrrives along with several squadrons of police.
"Go home son. We can take care of this." The chief says, hoping to offer some comfort. But you refuse. 
They tear the house apart and find several things suggesting an <i>organization</i>. Though nothing to locate where this group is or who is a part of it. Howard made if painfully clear that many, many people are not who they seem to be.

You finally go home.

Tomorrow you're back to work.
->end_screen

===end_screen
<h2> The End <h2>

<b>Play the game again to find different endings. <b>

Case 1 Clues Found: { LIST_COUNT(clues_found)} / ?
Major Relic Found: { - has(cult_clues, knife) :
                        <> Knife: A weapon that has been stained by countless victims. It is said that anyone that wields the knife will be filled with bloodlust losing any reason they have.
                    -else:
                        <> None
                    }
Deduce: { - has(deduce_success, c1) :
                        <> Success
                    -else:
                        <> Failed
                    }


Case 2 Clues Found: {LIST_COUNT(clues_found)} / 6
Major Relic Found: {  - has(cult_clues, tarot):
                       <> "Wheel of Fortune:" A tarot card that draws the will of those around them and twist their fates togther.
                    -else:
                        <> None
                    }
Deduce: { - has(deduce_success, c2) :
                        <> Success
                    -else:
                        <> Failed
                    }


Case 3 Clues Found: {LIST_COUNT(clues_found) }/
Major Relic Found:{ - has(cult_clues, relic):
                        <> Picture: A strange relic that inflict sanity for those around it. If reacts to fresh human blood and gives off a glow yellow light.
                    -else:
                        <> None
                    }
Deduce: { - has(deduce_success, c2) :
                        <> Success
                    -else:
                        <> Failed
                    }

                    
<h4>Made by Steven Au, Ashley Perez, and Will Tate<h4>
->END
