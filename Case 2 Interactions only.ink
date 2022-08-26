-> location_description

LIST locationsVisited = home, bankvisit, jobvisit, ftvisit
LIST fortune_teller_state = decline, wary
LIST evidence_found = pills, cash, ID, business_card, tarot_card
LIST clues_found = cash_clue, pills_clue, card_clue, job_clue, coroner_clue, ft_clue
// LIST case_state


=== location_description

    {What should I do? How I am supposed to find out about our victim if no one in the neighborhood has spoken to her once. You will think that such a wealthy neighborhood will be more aware of things. | One place down and couple more to go. Its going to be another long day at work. | The sun is still shining lets keep going. | Man! That took way longer than it needed to be.}
    
    *[Bank] You arrive at a large corporate bank.
        ->bank_description
        
    *[Fortune Teller]
        ->fortune_teller_description
        
    *[Victim's Job Site]
        ->job_site
        
    +Start Scene1
        ->scene1
        
    +start scene3
        ->scene3part3
        
    +{ locationsVisited ? bankvisit or locationsVisited ? jobvisit or locationsVisited ? ftvisit} [Department]
    You take a {~long|quiet|slow|serene} ride to the detective department.
        -> department
    
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
            ->department_colleauge
        
            **[Argue]
                "Come on, Howard. We both been in the biz for 10 years. Never had I once thought about quitting this gruesome job. We are doing god's work punishing these criminals and putting them in their place. As long as I live justice will never get old. This job is my dogma.
            -> department_colleauge
        *[Leave]
        ->department
        
=== case2_deduce
    +[No idea] I did not found much about our victim Sarah. This case will be rule as a suicide if I don't have any clues to present.
    ->suicide_loop
    
    +[Murder]
    I have feeling that this is murder, but I do not have any trails to follow. I do not want to leave this case cold without any justice brought to the perpetrator.
    ->murder_loop
    
    +[Not right now]
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
        ->case2_close
        
        ++[Go Back]
        ->case2_deduce
        
===case2_close
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
   
   "Its going to be a long day bud [ Insert Branch Dialogue for Case 1 Ending]", he grimaces. His eyes glimmers a mysterious yellow hue.
   
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
"I could't get an ounce of sleep" Nothing makes sense. The robbery seemed facilitated. The case proceeded suspicious smoothly. [Clue Check Fingerprints] 
- "All that matter is we caught the dude. He admitted to his crimes, just let the higher ups deal with him. "
*[Ask question back]


*[Sip coffee]
    You sip the cheap coffee and the bitterness hits the tongue. You feel a small wake up call and a small pain in your head. Your sleep deprivation is clouding your focus. You try to grab onto something to steady yourself.

    -"Tony... you ain't looking so well. You should take the day off. I don't want you putting yourself in an unfit situation. You've been doing this god dam job forever. It won't matter if another person dies, you done a lot of justice already."

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
            ->wallet
            
        * * *{wallet > 1}[Put back wallet]
            You set the wallet back down
            ->belongings
            
    * * {belongings > 1 }[That's all]
        ->evidence
