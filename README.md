# Superbowl_Commercials
<b> Analysis of Superbowl Commercials using SQL </b>

  This data set called "Super Bowl Commercials" comes from Maven Analytics: https://www.mavenanalytics.io/data-playground. <br>
It looks at Super Bowl commercials for 10 popular brands from 2000 to 2021, including links to each and additional information about 
the length, estimated cost, YouTube statistics, TV viewers, and defining characteristics. I came up with my own questions that I wanted to answer.

Looking at all the data first:

![image](https://user-images.githubusercontent.com/85653222/206768612-513ea5a7-935d-4627-a7b8-a333f2164a8c.png)

<b> 1a) Can you identify any patterns for the most successful commercials on YouTube? </b>
I decided to define a successful commercial as average Youtube likes. By that definition, attributes common to top commercials tended
to be funny, show product quickly and use a celebrity. 

![image](https://user-images.githubusercontent.com/85653222/206768645-458c1e37-6647-4145-b5bf-6e2709db8eb0.png)


<b> 1b) Top 3 brands that produced most successful commercials. </b>
Defined as the ones with the highest number of successful commericials, the top 3 brands are Doritos, NFL and Coca-Cola. 

![image](https://user-images.githubusercontent.com/85653222/206768688-c0ebcf9a-6b14-431a-b9dd-48abd070f04e.png)


<b>  2) Name top 3 brands that made the most commercials, got most Youtube views, Youtube likes and TV views. </b>
   Bud Light, Budweiser and Doritos are dominating in number of ads they produced over 21 years as well as number of TV viewers. 
   Doritos, Coca-Cola and NFL got the most total Youtube Views and Youtube likes. These are the same as our top 3 from previous question. 

![image](https://user-images.githubusercontent.com/85653222/206768747-d5767fb2-a264-4da2-a3e4-946fbd90e316.png)


<b> 3) Do all/any of the top 3 brands as found in 1b) do things differently than other brands on average? </b>
One standout is who NFL spends the most and whose ads are longer than other brands. That makes sense as they use a lot of 
celebrities and longer airtime equates to more cost.
Coca Cola tends to use animals and show product quickly.
Doritos doesn't spend a ton on their ads and keep them fairly short, they are almost always funny and often contain danger attribute. 

![image](https://user-images.githubusercontent.com/85653222/206768765-d38c1aab-f704-41ef-87d5-a8d007d56038.png)

<b> 4) For the top commercials of each year, are there any trends in the last 6 years? </b>
Use of sex stopped completely while having celebrities in the ad is more prominent. Funny is slightly less popular but there is an increased 
use of patriotism in its place. Having a danger attribute like violence, threats of violence, injuries, fighting or guns is on the rise as well. 

![image](https://user-images.githubusercontent.com/85653222/206769001-e5afa344-9c62-4a0a-ae54-eb4f668021bd.png)

Different spin on seeing commercial characteristics trend across time is by looking at attribute as a percentage of total ads for the year.

![image](https://user-images.githubusercontent.com/85653222/206769048-1ab8fab5-b23a-4fe3-9de1-7748d1532c41.png)

This is better seen as trendlines in Tableau. Use of celebrity has spiked  while use of sex dipped in recent years. 
Funny commercials though used fairly consistently throughout the years experienced a big dip in 2017 offset by patriotic ads. 

![image](https://user-images.githubusercontent.com/85653222/206768541-1a545a7c-2a4c-4b16-b3db-b066088201c0.png)






