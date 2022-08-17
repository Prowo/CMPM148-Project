// For Failbetter-style storylets where a list of possible storylets is 
// made available to the player. 

->top_loop
=== top_loop ===
{DescribeLocation()}
<- storylets(->top_loop)
<- travel_actions(->top_loop)
-> DONE

/*
 * Managing the player's location
 */
LIST locations = home, carnival, riverside, dream
VAR currentLocation = home
VAR locationsAvailable = (carnival)

// Returns true if location is somewhere the player can currently travel to. 
== function CanTravel(location) ==
~return locationsAvailable ? location && currentLocation != location

// Travel menu
=== travel_actions(->ret)
+ {CanTravel(carnival)} [Go to the carnival.]
  People whisper that there's something strange about the carnival in town...
  ~ currentLocation = carnival
+ {CanTravel(riverside)} [Go to the riverside.]
  Ah, a lazy day on the banks of the river.
  ~ currentLocation = riverside
+ {CanTravel(dream)} [Go to sleep.]
  To sleep, perchance to dream...
  ~ currentLocation = dream
- -> ret

== function DescribeLocation() ==
{ currentLocation:
    - home: 
        Home. They say there's no place like it. 
    - carnival:
        The forced gaiety of music and raucous laughter drifts through the air in the endless dusk. The workers running the side shows and attractions glance sidelong with knowing smiles.
    - riverside:
        The river drifts slowly past its sundrenched banks as the sound of birdsong fills the air. 
    - dream: 
        Half formed shapes and shifting colors swirl and billow in the land of dream. 
}
    
/* 
 * Storylets
 */

LIST replayableProps = replayable, oneShot
LIST replayableFrequency = immediate, threeTurns, fiveTurns
LIST storyProgression = beginning, middle, end

// Add choices for all the possible storylets player could pursue. 
=== storylets(->ret) ===
<- fortune_teller_storylet_description(ret)
<- river_of_life_begining_storylet_description(ret)
<- river_of_life_middle_build_storylet_description(ret)
<- river_of_life_middle_rest_storylet_description(ret)
<- dream_romance_beginning_storylet_description(ret)
<- dream_romance_middle_storylet_description(ret)
-> DONE


/*
 * Uses storylet properties to test availability 
 */
== function StoryletPropTest(propList, storylet_body_count, ->storylet_body_divert) ==
~ temp playable = not storylet_body_count
// First figure out if replayable frequency conditions met
{
    - not playable && propList ? replayable:
        {
            - propList ? immediate:
                ~ playable = true
            - propList ? threeTurns:
                ~ playable = TURNS_SINCE(storylet_body_divert) >= 3
            - propList ? fiveTurns:
                ~ playable = TURNS_SINCE(storylet_body_divert) >= 5
        }
}

// Then figure out if location conditions met
~ return propList ? currentLocation && playable
 
/*
 * Storylet: fortune teller opens new storylets
 */
 
VAR fortuneTellerStoryletProps = (replayable, immediate, carnival)

=== fortune_teller_storylet_description(->ret) ===
{ StoryletPropTest(fortuneTellerStoryletProps, fortune_teller_storylet_body, ->fortune_teller_storylet_body):
    + [Vist the fortune teller.]
      -> fortune_teller_storylet_body ->
    -> ret
}
-> DONE

=== fortune_teller_storylet_body ===
The fortune teller, whose facial features, age and gender kaleidoscopically shift and melt, sits before their crystal ball. "What would you like to know of your future?"
* "Tell me about my love life?"
  They peer deeply into your eyes, and then into their crystal ball. "You will meet your love in the land of dreams."
  ~ locationsAvailable += dream
  ~ dreamRomanceProgression = beginning
* "Tell me about my death." 
  "Many think they want to hear about this, but aren't ready for it." After a long pause, they continue. "In your last moments, you will be traveling down a great river."
  ~ locationsAvailable += riverside
  ~ riverOfLifeProgression = beginning
  
+ ->
  The fortune teller has nothing more to say.
- ->->

/*
 * River as metaphore for life storylets.
 */
VAR riverOfLifeProgression = ()

/* 
 * Beginning the river of life.
 */
 VAR riverOfLifeBeginningStoryletProps = (oneShot, riverside)
 
=== river_of_life_begining_storylet_description(->ret) ===
{ StoryletPropTest(riverOfLifeBeginningStoryletProps, river_of_life_beginning_storylet_body, ->river_of_life_beginning_storylet_body) && riverOfLifeProgression == beginning:
    + [Play on the river.]
      -> river_of_life_beginning_storylet_body ->
    -> ret
}
-> DONE

=== river_of_life_beginning_storylet_body ===
There's a tire swing hanging from a tree, set up perfectly to take flying jumps into the river. A fishing pole lies waiting for the adventurous angler. You feel like a kid again.
+ [Use the tire swing to jump into the river.] 
  With a mighty swing you fly out into the middle of the river, landing with a refreshing splash.
+ [Use the fishing rod.]
  You sit comfortably in the warm sun, watching the line bob around in the water.
- Ah, the pleasures of youth. 
~ riverOfLifeProgression++
->->

/*
 * The middle of the river of life.
 */
VAR riverOfLifeMiddleBuildStoryletProps = (oneShot, riverside)

// River of life middle: build
=== river_of_life_middle_build_storylet_description(->ret) ===
{ StoryletPropTest(riverOfLifeMiddleBuildStoryletProps, river_of_life_middle_build_storylet_body, ->river_of_life_middle_build_storylet_body) && riverOfLifeProgression == middle:
    + [Build on the river.]
      -> river_of_life_middle_build_storylet_body ->
    -> ret
}
-> DONE

=== river_of_life_middle_build_storylet_body ===
Staring at the river, you see opportunities for capitalist gain. This is a landscape that must be conquered and molded to human needs.
+ [Dam the river]
  The dam provides a steady source of hydroelectric power for your bitcoin farm, in addition to a source of water you can charge farmer's a pretty penny for.
+ [Build a factory]
  The convenient source of water provides both cooling and a waste disposal mechanism for the factory's industrial byproducts.
- 
~riverOfLifeProgression++
->->

// River of life middle: rest
VAR riverOfLifeMiddleRestStoryletProps = (oneShot, riverside)

=== river_of_life_middle_rest_storylet_description(->ret) ===
{ StoryletPropTest(riverOfLifeMiddleRestStoryletProps, river_of_life_middle_rest_storylet_body, ->river_of_life_middle_rest_storylet_body) && riverOfLifeProgression == middle:
    + [Rest by the river.]
      -> river_of_life_middle_rest_storylet_body -> 

    -> ret
}
-> DONE

=== river_of_life_middle_rest_storylet_body ===
Taking a break from the stress of your overworked life, you rest by the river. The healing gurgle of the water and warm rays of the sun are like balm to your soul. 
-
~riverOfLifeProgression++
->->

/*
 * Dream romance storylets.
 */
VAR dreamRomanceProgression = ()

/* 
 * Beginning the dream romance.
 */
 VAR dreamRomanceBeginningStoryletProps = (oneShot, dream)

=== dream_romance_beginning_storylet_description(->ret) ===
{ StoryletPropTest(dreamRomanceBeginningStoryletProps, dream_romance_beginning_storylet_body, ->dream_romance_beginning_storylet_body) && dreamRomanceProgression == beginning:
    + [Find your soulmate.]
      -> dream_romance_beginning_storylet_body ->

    -> ret
}
-> DONE

=== dream_romance_beginning_storylet_body === 
You see a figure beginning to take shape in the distance. Though their features are not yet clear, your heart begins to pound. With a strange certainty, you know that if you can ever meet them, your fates will be forever intertwined. 
-
~dreamRomanceProgression++
->->

VAR dreamRomanceMiddleStoryletProps = (oneShot, dream)

=== dream_romance_middle_storylet_description(->ret) ===
{ StoryletPropTest(dreamRomanceMiddleStoryletProps, dream_romance_middle_storylet_body, ->dream_romance_middle_storylet_body) && dreamRomanceProgression == middle:
+ [Continue searching for your soulmate.]
-> dream_romance_middle_storylet_body ->

-> ret
}
-> DONE

=== dream_romance_middle_storylet_body === 
Having seen that brief glimpse of the love of your life, you know you must find this person again. If you just concentrate hard enough, perhaps you can force the dream to take you where you want to go. Yes, there, it seems to be working...
-
~dreamRomanceProgression++
->->
