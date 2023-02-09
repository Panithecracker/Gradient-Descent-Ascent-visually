# Gradient-Descent-Ascent-visually
Animation of N random points named "explorers" that move over any surface to find its extrema through the implementation of the Gradient Ascent and Descent algortihms.

I have always been fascinated about the specific math field of calculus. Now, feeling like I had a considerable understanding on most of it (differential,integral and vector calculus) together with the ability to porgram animations in Matlab, I embarked on this project with the following idea...
I badly want to learn machine learning and I specially love optimization of functions. It turns out that the most fundamental mathematical idea underlying machine learning models, is based on defining a cost function and during the training process, redefine the concrete values of its parameters in order to minimize the cost. This is an optimization problem and it consists on looking for the minimum of the funtion. Sometimes (not as usual) this is done similarly but looking to maximize the function in each iteration of the training stage. 

#Program utility:
With no restrictions at all you may define a function of two variables inside the script. Then, during the program execution you will be asked to enter the sides length of the square over which the optimization animation will take place. Next and finally, you will be asked to enter the amount of "explorers" you´d like to see in action over the greaph of the previously defined function. After this, you will be able to see N red and N blue points called explorers, sliding accross the 3d surface and suspiciously approaching and if they are right enough, stopping at local extrema. This points are called "explorers"
* There will be N blue explorers looking separaately for places where f(x,y) is minimized.
* There will be N red explorers looking separately for places where f(x,y) is maximized.
* In the end of the animation, when all of them are static, you will be able to know their coordinates by moving the mouse towards them
* If your given function is not pathological (realy weird) then you shoukd expect to see that the animation will succesfully reveal valid extrema of the function and if you animate many explorers (300 is more than enough usually), you may even find the global minimum and maximum over the specified squared region.
# EXAMPLES FOR DIFFERENT FUNCTIONS:

![GradOptimal__1__AdobeExpress](https://user-images.githubusercontent.com/97905110/217942320-e8f5aad0-1c3b-4420-9544-45d204b7ba33.gif)
![GradOptimal_AdobeExpress](https://user-images.githubusercontent.com/97905110/217937837-8acf3932-c4d9-4406-9a74-6ef2fb9b8993.gif) 
