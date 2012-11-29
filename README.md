AlienDev's iOS Calculator
=========================

This calculator is being created for a project assignment that I had during class. However, I would really like to continue with it and create more then just the addition function. I have put some of my thoughts in my code as comments and will begin to move some of those to this README and also write some notes about what is going on, etc. 


-Thank you
Michael Youngblood




RESOURCES
=========

Dominic Chang - GitHub Repo: docchang/Calculator.iOS
https://github.com/docchang/Calculator.iOS

Dominic used some ways to pass information from the buttons to the functions using (UIButton *)sender in place of (id)sender in which I wanted to impliment. 

He also used an NSString to keep track if the user is still pressing numbers in which I am not sure I need, but I am sure he had written it for a reason. I am going to try to write it without it, with the assumption it is because of the many other functions he has versus the assignment calling for only addition that I have. I also took from this isEqual when comparing strings, I find this to be more readable then ==. 
