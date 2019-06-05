# PlantsvsZombies

How to Play the Game:  
You have to defend each of he five lanes by placing down plants to defeat incoming zombies. Once a zombie reaches the end of a lane, the lawnmower will trigger and kill any zombie in its way. However, if a zombie manages to get to the end of a lane without a lawnmower, the player loses. You can place the sunflower, which generates currency over time, the peashooter, which damages the zombies, and the wallnut, which you use to tank the damage from incoming zombies. There are two types of zombies: normal, and buckethead zombies. Buckethead zombies are harder to kill and deal more damage. This is an infinite game, kill as many zombies as possible without losing.   

Note: Game currently has no currency cost for demonstration purposes  

Development Log     

5/20/19   
Started project:  
Hong Wei: made plants and zombies class, found image for zombie, added test display and move functions   
Jack: made grid, found image for plant and the map   

5/21/19  
Jack: Created bullets, added bullet display, plants can shoot, sunflower can produce sunlight, added temporary menu    
Hong Wei:fixed zombie display      

5/22/19  
Jack: Sunlight can be collected, sunflower available for selection & placement    
Hong Wei: working on wave spawning for zombie, zombies can now take damage, zombie death works   

5/23/19    
Jack: Peashooter available for selection   
Hong Wei: fixed zombie spawning to be random, zombies now stop and deal damage to plants, plants can die    

5/24/19  
Jack: Plant placement for entire map works plants "die" but there was a bug where you cannot place a plant over a tile in which a "dead" plant was already placed, bug fixed, plants now cost money, player starts with 200 currency   
Hong Wei: bullets are deleted when leaving the screen, Adding wallnut    

5/26/19   
Hong Wei: Added wallnut class, sunflowers no longer spawn suns in synch, all spawn randomly, zombies spawn slower, zombies each have random speed     

5/27/19  
Hong Wei: Now displays amount of zombies killed and wave number, added lawnmower class, added some lawnmower methods     

5/28/19   
Together:Fixed bug where zombie had array out of bounds error when removed  
Jack: fixed bug where mouseClick plants an object but doesnt display it when its not supposed to  
Hong Wei: added more lawnmower functions like trigger and move, added draw and display for lawnmower, added spawning lawnmower function    

5/29/19  
Hong Wei: Lawnmowers now run over zombies, fixed bug where there is array out of bounds when lawnmower is removed, fixed coordinate check for where to kill zombies when they go off the screen and adjusted distance check for when lawnmower is triggered  
JacK: started on removing plants button and functions    

5/30/19     
Together: implemented working end/gameover screen, sunlight now falls randomly on map   
Jack: fixed bug where player cant collect falling sunlight  
Hong Wei: started to add buckethead zombie, added image    

5/31/19    
Hong Wei: zombies now stagger  
JacK: fixed peashooter bug, endgame screen works 

6/2/19    
Hong Wei: Added buckethead class, added buckethead draw, display, and spawn, fixed hitboxes for buckethead zombie for bullets  

6/4/19   
Hong Wei: Transferred trigger methods to zombie, fixed buckethead zombie checkbox for plants to deal damage, fixed hitbox to trigger lawnmowers for buckethead, reduced zombie spawning, restart screen now works  
Jack: added zombie spawn timer for delay, removed all text used for testing  






