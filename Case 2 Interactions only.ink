LIST locationsVisited = home, bankvisit

-(location)
What should I do?
+[Bank] <i> You arrive at a large corporate bank. <i>
    ->bank
+[Fortune Teller]
    ->fortune_teller
+[Victim's Job Site]
    ->job_site
+Start Scene1
    ->scene1
+start scene3
    ->scene3part3

=== bank

*[Talk to teller.]
   You walk to the teller and show her your badge. Asking about the banking information of our suicide victim of Sarah Rasha. She pulls up a the banking information and shows you the monito.
   ~locationsVisited += bankvisit
   ->bank
*{ locationsVisited ? bankvisit} [Home sweet home]
Hello world
    -> bank
+[Leave]
"Thank you for taking your time, do let me know if there's any more activity in her card."
-> location

===fortune_teller
-> location

===job_site
 
You drive through the financial district passing  multiple business firms. You arrive at a wealthy establishment that our victim worked at. 

*[Talk to Secretary] Howard "I am the investigating the death of Sarah Rasha, can I talk to someone that knew her at work.

 "Well, you are talking to the only person that actually spoke with her and wa the one who called the welfare check."
-(ask_secretary)

* {ask_secretary == 1} [Ask about Sarah] 
"Thank you for calling the welfare check. Unfortunatly, she is dead. We discovered her body this morning at her house. I am sorry for your lost, if it is ok, I am going to ask you some questions. "

 " Its tragic news to hear about Sarah's death, but we were not close. Sarah was... a... person who keep to themselves. She just said hello every time she clocked in for work. She rarely spoke to anyone during work."
 -> ask_secretary

*[Ask if anyone had motives]
"Do you know anyone that didn't like Sarah or that might want to hurt her?
"No, not that I can think of.  She was a bright young worker and did a wonderful job as a financial adviser.  She handled the whole job over reports so she sees very little people in her office.
->ask_secretary

*[Ask about any changes]
did anything happen recently?"

She was acting different last week. I do not know how to describe it. I... guess... you can call it paranoid. She seemed on edge last week, before I last saw her.
-> ask_secretary

*
*{ask_secretary > 1}[Leave]

->location
=== scene1
"KNOCK KNOCK KNOCK"

You awaken to a loud banging on the door followed by a low voice.

*[Get up]
    -"Howard, we got another case."
*[Go to the door]
    - You get up in a rush and make your way to the door in a half stupor manner. Opening the door you see, Jim all suited up and ready to work. He gives a big smile as hes glance at your half naked body and proceeds to chuckle. 
    
    "Get dress and I fill you in on the details. We got another case on our hands"
*[Respond]
   - You peer off to the distance, and notice the looming darkness as the sun stretches it rays amidst the horizon. You take a look at the watch you forgot to take off last night and see its 5 o'clock sharp.
   'You look as sharp as ever' you snide.
   
   "Its going to be a long day, bud [ Insert Branch Dialogue for Case 1 Ending], he grimaces. His eyes glimmers a mysterious yellow hue.
 *[Get dressed]
    You return back inside and get dressed.
    
->scene2

=== scene2
*[Meet Howard at the car.]
-You open the car door as Jim hands you a cup of coffee.

"If you took any minute over 10, I would left on your own" as Jim chuckles.

The car gives a loud vroom as he starts his classy 80's roadster. He sets off to the crime scene and peers over while he's drivinging on the road, "Did you get any good sleep?"

*[Little]
Not much, the robbery case doesn't make any sense. His motive doesn't match a typical bank robbery. The person was well off and had no prior history of assault. Person is basically your average Joe."
*[None]
"I could't get an ounce of sleep" Nothing makes sense. The robbery seemed facilitated. The case proceeded suspicious smoothly. [Clue Check Fingerprints ] 
- "All that matter is we caught the dude. He admitted to his crimes, just let the higher ups deal with him. 


*[Sip coffee]
    You sip the cheap coffee and the bitterness hits the tongue. You feel a small wake up call and a small pain in your head. Your sleep deprivation  is clouding your focus. You try to grab onto something to steady yourself.

    -"Howard you ain't looking so well. You should take the day off. I don't want you putting yourself in an unfit situation. You've been doing this god dam job forever. It won't matter if another person dies, you done a lot of justice already."

* "I'm doing this case even if it kills me. I got nothing to live for. After all the shit I've seen for."
* It's this fucking headache, i've been having. I ought to see a doctor from how much crime I've seen,
* "I'll manage. Whats the details on this"
-"We got a suicide of a young woman in the Upper East side. Her job called a welfare check after not seeing her at work for a few days, we discovered the body last night. Coronary thinks the body been there for a few days. Cause of death was a good ole noose. The weird part was there was no sign of hesitation.  She hang the noose where her feet were barely off the ground. Most people panic and regret their suicide plan when its too late. She must of slowly suffocated knowing she could of let herself down."
->scene3part2

// Crime Scene
=== scene3part2

    (Comment on the details of the case)
-(comment)
    * [ Strangeness ]
        Howard: " Not our typical suicide case. Don't get much suicide up in the affluent East Side. Most of them experience some kind of tragic incident to commit suicide. Heartbreak. Death of a family"
        Jim: "That's the thing, no immediate family in the area. Checked her file, she moved far away from her home a couple years ago. No criminal history, nothing. 
        Howard: "Great a dead trail"
        ->scene3part2
    
    * [ Suicide Note ]
    Howard: "Any memento or notes lefts?"
    Jim: "Nope her place is pretty much empty, in the sense of an austere lifestyle.  Just a few furniture. We do have all her personal belonging."
    Howard: "Definitely  strange to not have any point of interests"

        ->scene3part2
    * [ Victim's Profile ]
    " Are you saying she calculated her suicide"
    Jim: "Considering her minimal lifestyle, I wouldn't rule it out. Maybe she felt trapped in her life having nothing worth living"
    Howard: "Yea, but death by asphyxiation isn't the prettiest"
    Jim: "I'm not judging, but its good ole reliable or maybe she needed some pain in her plan." 

        ->scene3part2
        
    *{comment == 1}[Nope]
        ->scene3part3
    *{comment > 1} [Thats all]
        ->scene3part3
    

    
===scene3part3
 You arrive at a large white house. You see a large white cloth over a body.
 -> evidence
 
-(evidence)
*[Inspect the body]
Surprising the body doesn't stink as much as you expected. You see a pale Caucasian woman. late 20's . No signs of any altercations, bruises. except along her neck.
->evidence
*[Inspect the room]
The room had few furniture. There wasn't even a T.V or painting. 
    No Evidence Found
    ->evidence


*[Inspect belongings]
There's only a purse, with a few items. You found a bottle of pills, wallet, and some makeup. 
-(belongings)
    * *[Inspect pills]
        The bottle is full. Lets give this to forensics to check the substance
    
        ->belongings
        
    * * [Inspect makeup]
        The makeup shows sign of use, despite the victim not wearing at time death. Quite peculiar for an austere woman to have makeup. Is it work related?
        ->belongings
        

    * * (wallet)[Inspect  wallet]
        You continue  to rummage through her wallet. You find some cash, a single credit card, her ID, a business card, and  a large card.

        * * *[Inspect cash]
            There's several hundred dollars in here. Why was she carry so much cash for?
            ->wallet
            
        * * *[Inspect credit card]
            Card is still in use. Lets stop by the bank later to check for any activity.  [Cash Flag] There might be some clues on why she has so much cash on hand.
            ->wallet
        * * *[Inspect ID]
            Sarah Rasha D.O.B June 10th, 2050.  Height 5'5" You see a shy smile in her picture. She is wearing makeup and still keeps the same hairstyle
            ->wallet
        * * * [Inspect  business card]
            Ronda's Miracle Fortune Telling, Tarot - Psychic - Palm Reading - Healing Crystals, "100% Satisfaction" Why would she have some cheesy card? Its worth stopping by.
            ->wallet
        * * *[Inspect large card]
            Seems to be a Tarot card. X The Wheel of Fortune. [Business Card Flag]I need to find out more of this Tarot stuff, there seems to be something happening behind the scenes.
            ->wallet
        * * *{wallet > 1}[Put back wallet]
            dsa 
            ->belongings
    * * {belongings > 1 }[That's all]
        ->scene3part3

->DONE
