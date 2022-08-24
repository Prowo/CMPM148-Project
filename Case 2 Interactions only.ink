LIST locationsVisited = home, bankvisit, jobvisit, ftvisit
LIST fortune_teller_state = decline, wary
LIST evidence_found = pills, cash, ID, business_card, tarot_card
// LIST evidence_state

-(location)
What should I do?
+[Bank] You arrive at a large corporate bank.
    ->bank
+[Fortune Teller]
    ->fortune_teller_description
+[Victim's Job Site]
    ->job_site
+Start Scene1
    ->scene1
+start scene3
    ->scene3part3
*{ locationsVisited ? bankvisit} [Home sweet home]
Hello world
    -> bank
    
+department
    ->department
    
===department
The day is getting late and you decide to return back at the bureau to gather the evidence to see the whole picture.

*[See coroner]
->department_coroner
*[Talk to Colleauge]
->deparment_colleauge

=department_coroner
    *[Ask about body]
     "Whats up Doc, did you find anything about the body."
    
     " Good news or bad news?"
     
        ** "Good news[."], you reply."
            ->department_coroner
        
        Doc: " I did find something about the body, that may help with the case. The body had no signs of assault, but I did find traces of drugs in her system. Some kind of sedation. Bad news, she must of been drugged since her dissapearance.
        
        ** [Bad news] 
            " Bad news is I don't cause of death was suicide. Good new is I found some traces of drugs in her system. I won't know the type til tonight.
            -> department_coroner
    *[Ask about the pills]

        The pills are an antidepressant. Its a generic treatment for symptoms of depression. Its a relativly safe drug that wouldn't lead to a suicide.
        -> department_coroner
    *[Ask about the pills being found in the body]

        Doc: "After running additionals test, I can confrim that no antidepressants were found in her system. The drug test show positive for sedatives.
            -> department_coroner

=deparment_colleauge

Jim: "Hey how's it going? Any luck on the case."

   ** [Tell him about your findings]
   //{check flags} 
        Howard: " I have found that she has been withdrawing a large amount of cash. Something must of have happened recently since her job secretary descirbed her as "on edge."  I found out that she might of possible been part of a cult as the last eye witness was a fortune teller. She must have been searching for something."
        -> deparment_colleauge
   ** [No Luck] 
            Howard: "Most trails lead to a deadend. Have you finding anything on your end?"
            Jim:  " I tried contacting distant family memeber to ask about any information.  They said they have no contact from her in years. I tried checking local records to see if she there was any paper trail. No luck on my end either."
        -> deparment_colleauge

*[Call it a day]

It's been a long day. You find yourself restless. The case can not be concluded any further, but you may have found a possible lead.


->location
=== bank

*[Talk to teller.]
   You walk to the teller and show her your badge. Asking about the banking information of our suicide victim of Sarah Rasha. She pulls up a the banking information and shows you the monitor.
   ~locationsVisited += bankvisit
   ->bank
*{ locationsVisited ? bankvisit} [Home sweet home]
Hello world
    -> bank
+[Leave]
"Thank you for taking your time, do let me know if there's any more activity in her card."
-> location

===fortune_teller_description
Fortune Teller "Hello, how may I help you?"
->fortune_teller_body

===fortune_teller_body

*[Tell me my fortune]

*{ evidence_found ? ID}[Show her victim's id]

    { 
     - fortune_teller_state ? decline:
        <> " I am not interested in talking someone who does not know sincerity. I have seen her, but that is all. You reap what you sow. For my blessings do not solve stupidity.
    - else:
        <> yo
        ~ fortune_teller_state += wary
    }
    ->fortune_teller_body

*{ evidence_found ? tarot_card}[Show her card]
"Yes, you can. I was wondering if you can tell me more about this. ( You pull out the card labeled  "X" "Wheel of Judgment")"

- Fortune Teller: "This card is from Tarot.  I use these cards to guide you with any problem that you may have."

*[Ask More]Howard: "Does this particular card mean anything?" 

- Fortune Teller: "It depends who I am reading as everyone has a different aura. This card is about undergoing a change that is necessary to move forward.  A destiny that can not be changed, the world will continue to move on without you. Perhaps, I can read your destiny if there is anything that troubles you.
    
*[Accept] <i> My gut has never failed me, maybe this can give me a clue about this case. <i>

    Howard: "Sure, I'm excited to see what foresight you can provide me with.
    ->ft_reading        
*[Decline]
    FT: The fact that you brought the wheel of fortune shows that our fate was meant to be, but if you don't follow these changes you will lose control of the life around you and fall in to despair.

        * *[Accept] It woudn't hurt to take her up on her offer. Not the biggest fan of the occult, but there's been so much strange events happening.

              "Tell more about how I could prevent this problem."

               FT: " I can offer my guidance, the more you work with me, the more I can understand your journey."
             ->ft_reading

        * *[Decline] I don't believe in the occult.
                            
           FT: I like to use my reading as a way to guide my patronages on their own journeys. My words are not simply a sham to trick simple minded people. I will give you one piece of advice. I do not give reversed cards often, but I feel an ominous energy exuding you. If you continue to ignore these changes around you, the cost will be tragic.
           ~fortune_teller_state += decline
           ->fortune_teller_body



===ft_reading
FT: I will do a three card reading. One for the past, the present, and the future. Tell me if you suspect something that relate, I will read your destiny to offer a final card of guidance.

She mixes the cards up as she sings a chant for guidance and safety. She cuts the deck into three parts and puts a card from each pile on to the table and then she closes her eyes as spread the remaining card and prays for the world to judge our fate. She hovers over a card and sets it aside.

She stares right at you like how a eagle stalks her prey. Her eyes focus in, making a long uncomfortable eye contact. 

-{ fortune_teller_state ? wary:
        <> "I know you are investigating a string of deaths. I foresaw a ominious prenominition that will could this city."
    
    - else:
        <> "I know you have come here because of your work. You are under great stress that involves the likelihood of the common people."
}

She turns over the first card without even looking at it. Revealing the moon. 

- "Something has happened recently and they are not what they seem to be. You judgment is being clouded by an external force that even I would shudder at.  It seeps into your mind at night and disrupts your sleep.  Right now you are dealing with a needless sacrifice. A stalling of time  for what is to come ahead.

She reveals the last card and my hands are becoming sweaty. The tower appears.

" A foreboding disaster will shaken the likelihood of the city. It will rush a wave of pride and crime."

*"You are definitely no sham[."]  My work has taken a turn that not I even I can described. There is a strangeness going on that i'm not sure know how to handle"

FT: "Your problems will be solved if you deal with..." and she flips the last card revealing the Hierophant "it" Find this person and it will solve all your fears.

Howard: " Who is this hierophant?"

FT: " I am not sure, but he is the one behind yours problems. A person that is religious but deformed by his pride."


-> fortune_teller_body

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

*{locationsVisited ? bankvisit} [Ask about her finances?]
 "Do you know why she was withdrawing large amounts of cash the past weeks?"
 
 " Sorry, Sarah never spoke stuff outside of work. I have no idea why she would need the cash for. If she need money urgently, I'm sure should would of let us know. She's been at this job for a few years and never complained about her salary.
 -> ask_secretary
 
 //where to put?
 *There must be of been something that happened recently that lead her to "suicide," but for her to commit suicide will still having a lot of money in the bank doesn't make any sense. She was still well off financially so what made her feel on edge.
-> ask_secretary

~locationsVisited += jobvisit
 

*{ask_secretary > 1}[Leave]
Thank you very much, you have been very helpful. I will inform the company once we solve the case.

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
        ~evidence_found += pills
    
        ->belongings
        
    * * [Inspect makeup]
        The makeup shows sign of use, despite the victim not wearing at time death. Quite peculiar for an austere woman to have makeup. Is it work related?
        ->belongings
        

    * * (wallet)[Inspect  wallet]
        {You continue  to rummage through her wallet. You find some cash, a single credit card, her ID, a business card, and  a large card. | You set the item aside }

        * * *[Inspect cash]
            There's several hundred dollars in here. Why was she carry so much cash for?
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
            Seems to be a Tarot card. X The Wheel of Fortune.
            
            { evidence_found ? cash:
            
            <> <i>
            <i>I need to find out more of this Tarot stuff, there seems to be something happening behind the scenes. <i>
            }
             ~evidence_found += tarot_card
            ->wallet
            
        * * *{wallet > 1}[Put back wallet]
            dsa 
            ->belongings
            
    * * {belongings > 1 }[That's all]
        ->scene3part3

->DONE