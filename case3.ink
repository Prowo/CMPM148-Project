// only "global" variables I use
VAR relationship = 20
VAR suspicion = 0    // possible variable idk

// local variables to this case
VAR know_about_case = false
VAR convowithHoward = false
VAR convowithFirefighter = false
VAR loneSurvivor = false
VAR truthlieshow = 0
VAR broughtHoward = false
VAR giveSafe = false

// two endings, one good the other bad
// good ending: you don't invite Howard to investigate with you, you find the safe,
//              you open it up, find ancient relic (connected to cult), interrogate suspect
//              learn the cult exists, and Howard goes missing (that part is can be changed lol),
//              the relic is important and they want it back
// bad ending:  you invite Howard to investigate with you, you find the safe,
//              you don't open it bc Howard takes it with him, you find the suspect but that's it
//              you do Not learn the cult exists and you feel like something is gonna happen

->dream_sequence
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
        
            "Thanks for the clarification Johhny," is all you say in response. 
            
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
    “Oh thank god! My name is Sarah. I’ve been friends with Monica since we were little kids. We basically grew up together… Thank you for telling me the truth. Nobody would speak to me.”
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
        "Thank you Sarah. You've been a big help."
        "No problem, detective! Now I've gotta go and see Monica."
        You walk away and all you can think of is <i>I'm sorry.</i>
    - else:
        "Thank you..." You pause after realzing you haven't learned her name.
        "Sarah, I'm Sarah."
        "Thank you Sarah. You've been a big help... I promise I'll get to the bottom of this."
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

*[Interrogate Carl]->good_ending
->DONE

=== good_ending ===
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
    
- "Please they forced me to do it... please I'll be safer here. Please just lock me up." He says between sobs. It's clear to you that he is very scared... of what you're still not sure.

// not sure if we want it to be this obvious... 
"It's a group... a cult. They worship ◻◻◻’ ◻◻" He states. He looks more manic.
<i>What did he just say?</i> It's as though your mind was protecting you from a sinister force.
"What?? Who do they worship?" You ask in almost a whisper.
"I can't say it again... they'll know."
"And this... cult told you to kill Monica?" You ask inquisitively. Carl nods his head vigorously as confirmation.
He starts to whisper again. You lean in order to hear him.
"with her gone they'll control the whole city..." He says. A pit starts to form in your stomach as upon hearing this. You look at Carl, who's now repeatedly muttering something under his breathe. He's not all there anymore, but your gut tells you to believe him. Whoever these people are they have connections... and they did something to break this man.

I have to stop them.
// -> "case 4/good ending
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

