# tskaty

A new Flutter project.

![addtask](https://github.com/OsamaElsaadany/tskati/blob/main/assets/images/output/addtask.png)
![splash](https://github.com/OsamaElsaadany/tskati/blob/main/assets/images/output/splash.jpg)
![userupload](https://github.com/OsamaElsaadany/tskati/blob/main/assets/images/output/userupload.jpg)
![homescreencashed.png](https://github.com/OsamaElsaadany/tskati/blob/main/assets/images/output/homescreencashed.png)

cashing in flutter means that saving the data locally in the device instead of downloading it using internet so it is save battery and make the app more fast.

there are some types for cashing:
1-In-Memory Cache
-save data in memory like a variables
-very fast
-after closing app the values deleted so it is temporary

2-Local Storage Cache
-saving data even after closing the app
-there are more than choice for that
a-SharedPreferences
-simple
-suitable for key-value like primitive datatypes
b-SQLite / Drift / ObjectBox
-complex
-suitable for great projects that have tables,relations and data structure
c-Hive
-the fastest type in flutter
-suitable for objects
-nosql data
d-flutter_cache_manager
-it is a package for images and files
-you can detect the expiry date for cashing

                            ******************************

By default Hive knows how to store simple data (int,double,String,List,Map)
-But for our class (like User, Todo, Product),
-Hive doesn’t know how to save it so we the need of TypeAdapter comes in

- A TypeAdapter is like a translator that tells Hive how to convert your object into bytes (so it can save it) and how to rebuild your object back when you read it
- make you can store custom objects
- Keep your data structured
- Faster than shared_preferences or SQLite for small/medium data.
