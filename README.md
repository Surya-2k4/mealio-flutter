# mealio

A new Flutter project.


Issues faced,

In Authentication
    - initially created project for android and tries to run in the chrome
    - then again addded the web app in the project console and added the api key's inside the main.dart file (it works like, after checking the running platform like web or andorid it initialize the firebase)
    - forget to enable the authentication in the project firebase console 

In Cloud firestore
    - created firestore collection called food-list
    - manually inserted the one collection and tries to retreive, at first attemp it gives permission denied error
    - for this issue i have changed the rule permissions in the firestore (read:write if true)

    