# Gradient-Descent-Ascent-visually
Animation of N random points named "explorers" that move over any surface to find its extrema through the implementation of the Gradient Ascent and Descent algorithms.

I have always been fascinated about the specific math field of calculus. Now, feeling like I have a considerable understanding on most of it (differential,integral and vector calculus) together with the skill to make animations in Matlab, I embarked on this project with the following idea...
I badly want to learn machine learning and I specially love optimization of functions. It turns out that the most fundamental mathematical idea underlying machine learning models, is based on defining a cost function and during the training process, redefine the concrete values of its parameters in order to minimize the cost. This is an optimization problem and it consists on looking for the minimum of the function. Sometimes (not as usual) this is done analogously but looking to maximize the function in each iteration of the training stage.**Both methods involve using the geometric meaning of the gradient;"the direction of steepest ascent" and are known by the names of Gradient Descent and Gradient Ascent respectively.**

# Program functionality:
With no restrictions at all you may define a function of two variables inside the script. Then, during the program execution you will be asked to enter the side´s length of the square over which the optimization animation will take place. Secondly, you will have to enter the amount of "explorers" you´d like to see in action over the graph of the previously defined function. After this, you will be able to see N red and N blue points called explorers, sliding accross the 3d surface and suspiciously approaching local extrema. I gave this points the name :"explorers"
* There will be N blue explorers looking separately for places where f(x,y) is minimized.
* There will be N red explorers looking separately for places where f(x,y) is maximized.
* In the end of the animation, when all of them are static, you will be able to know their coordinates by moving the mouse towards them
* If your given function is not pathological (realy weird) then you should expect to see that the animation will succesfully reveal valid extrema of the function and if you animate many explorers (300 is more than enough usually), you may even find the global minimum and maximum over the specified squared region.
# EXAMPLES FOR DIFFERENT FUNCTIONS:
* $f(x,y) = ysin(x)-xcos(y)$

![GradOptimal__1__AdobeExpress (1)](https://user-images.githubusercontent.com/97905110/217944532-a67a2034-7c87-4301-b14d-9f01a6288866.gif)
![GradOptimal_AdobeExpress (1)](https://user-images.githubusercontent.com/97905110/217944289-62272cbb-3c30-4c98-8782-7454ceb5e002.gif)


* $f(x,y) = sin(x)*cos(y)$

![GradOptimal__2__AdobeExpress](https://user-images.githubusercontent.com/97905110/217946315-1de7b388-f47b-489a-a36a-ddd5505b944f.gif)
![GradOptimal__3__AdobeExpress](https://user-images.githubusercontent.com/97905110/217947039-c3dd4ca8-106f-4333-b5b3-3c6c0f4554ed.gif)


