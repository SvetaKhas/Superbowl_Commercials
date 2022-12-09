/*This data set called "Super Bowl Commercials" comes from Maven Analytics: https://www.mavenanalytics.io/data-playground
-- It looks at Super Bowl commercials for 10 popular brands from 2000 to 2021, including links to each and additional information
about the length, estimated cost, YouTube statistics, TV viewers, and defining characteristics. */

SELECT *
FROM [PortfolioProject].[dbo].[SuperBowlAds] 

--1a) Can you identify any patterns for the most successful commercials on YouTube? 
--I decided to define a successful commercial as average Youtube likes. By that definition, attributes common to top commercials tended to be funny, show product quickly and use a celebrity.

SELECT Year, Brand, Superbowl_Ads_link, Youtube_Likes, 
  CASE WHEN Year=2021 THEN Youtube_Likes
	   ELSE Youtube_Likes/(2021-Year+1) END AS Annual_avg_likes,
	   Length, Estimated_Cost,
	   Funny, Shows_Product_Quickly,Celebrity, Uses_sex, Danger, Patriotic, Animals
FROM [PortfolioProject].[dbo].[SuperBowlAds]
ORDER BY Annual_avg_likes DESC
OFFSET 0 ROWS FETCH FIRST 10 ROWS ONLY

-- 1b) Top 3 brands that produced most successful commercials. 
-- Defined as the ones with the highest number of successful commericials, the top 3 brands are Doritos, NFL and Coca-Cola.
WITH successful_ads AS(
SELECT Year, Brand, Superbowl_Ads_link, Youtube_Likes,
  CASE WHEN Year=2021 THEN Youtube_Likes
	   ELSE Youtube_Likes/(2021-Year+1) END AS Annual_avg_likes,
Funny, Shows_Product_Quickly,Celebrity, Uses_sex, Danger, Patriotic, Animals
FROM [PortfolioProject].[dbo].[SuperBowlAds]
ORDER BY Annual_avg_likes DESC
OFFSET 0 ROWS FETCH FIRST 10 ROWS ONLY
)
SELECT Brand, COUNT(Brand) as ad_count
FROM successful_ads
GROUP BY Brand
ORDER BY ad_count DESC;

/*
2a) Name top 3 brands that made the most commercials, got most Youtube views, Youtube likes and TV views.
   Bud Light, Budweiser and Doritos are dominating in number of ads they produced over 21 years as well as number of TV viewers. 
   Doritos, Coca-Cola and NFL got the most total Youtube Views and Youtube likes. These are the same as our top 3 from previous question.
*/

SELECT Brand, COUNT(*) AS ad_count,SUM(Youtube_Views) AS total_youtube_views, SUM(Youtube_Likes) AS total_youtube_likes, SUM(TV_Viewers) AS total_tv_viewers
FROM [PortfolioProject].[dbo].[SuperBowlAds]
GROUP BY Brand
ORDER BY total_youtube_likes DESC   --Change to total_youtube_views, total_youtube_likes or total_tv_viewers in order to answer other parts of the question

/*
3) Do all/any of the top 3 brands as found in 1b) do things differently than other brands on average?
One standout is who NFL spends the most and whose ads are longer than other brands. That makes sense as they use a lot of celebrities and longer airtime equates to more cost.
Coca Cola tends to use animals and show product quickly.
Doritos doesn't spend a ton on their ads and keep them fairly short, they are almost always funny and often contain danger attribute.
*/
SELECT Brand, 
  ROUND(AVG(Estimated_Cost),2) AS avg_cost, 
  ROUND(AVG(Length),2) AS avg_length,
  CONCAT(100*SUM(CASE WHEN Shows_Product_Quickly='TRUE' THEN 1 ELSE 0 END)/COUNT(*),'%') as showsquickly, 
  CONCAT(100*SUM(CASE WHEN Funny='TRUE' THEN 1 ELSE 0 END)/COUNT(*),'%') as funny,
  CONCAT(100*SUM(CASE WHEN Patriotic='TRUE' THEN 1 ELSE 0 END)/COUNT(*),'%') as patriotic,
  CONCAT(100*SUM(CASE WHEN Celebrity='TRUE' THEN 1 ELSE 0 END)/COUNT(*),'%') as celebrity,
  CONCAT(100*SUM(CASE WHEN Danger='TRUE' THEN 1 ELSE 0 END)/COUNT(*),'%') as danger,
  CONCAT(100*SUM(CASE WHEN Animals='TRUE' THEN 1 ELSE 0 END)/COUNT(*),'%') as animals,
  CONCAT(100*SUM(CASE WHEN Uses_Sex='TRUE' THEN 1 ELSE 0 END)/COUNT(*),'%') as usessex
FROM [PortfolioProject].[dbo].[SuperBowlAds]
GROUP BY Brand;

/* 
4) For the top commercials of each year, are there any trends in the last 6 years? 
Use of sex stopped completely while having celebrities in the ad is more prominent. Funny is slightly less popular
but there is an increased use of patriotism in its place. Having a danger attribute like violence, threats of violence,
injuries, fighting or guns is on the rise as well. */

WITH Ranked_views AS
  (SELECT Year, Brand,
	   CASE WHEN Year=2021 THEN Youtube_Views
	   ELSE Youtube_Views/(2021-Year+1) END AS Annual_avg_views,
	   RANK() OVER(PARTITION BY Year ORDER BY Youtube_Views DESC) AS top_views_oftheyear,
	   Funny, Shows_Product_Quickly,Celebrity, Uses_sex, Danger, Patriotic, Animals
  FROM [PortfolioProject].[dbo].[SuperBowlAds]
  )
SELECT *
FROM Ranked_views
WHERE top_views_oftheyear=1
ORDER BY Year, Brand

/*Different spin on seeing commercial characteristics trend across time is by looking at attribute as a percentage of total ads for the year.
Use of celebrity has spiked  while use of sex dipped in recent years. Funny commercials though used fairly consistently throughout the years experienced
a big dip in 2017 offset by patriotic ads.*/

SELECT Year, COUNT(*) AS total_commercials,
	   CONCAT(100*SUM(CASE WHEN Shows_Product_Quickly='TRUE' THEN 1 ELSE 0 END)/COUNT(*),'%') as showsquickly,
	   CONCAT(100*SUM(CASE WHEN Funny='TRUE' THEN 1 ELSE 0 END)/COUNT(*),'%') as funny,
       CONCAT(100*SUM(CASE WHEN Patriotic='TRUE' THEN 1 ELSE 0 END)/COUNT(*),'%') as patriotic,
       CONCAT(100*SUM(CASE WHEN Celebrity='TRUE' THEN 1 ELSE 0 END)/COUNT(*),'%') as celebrity,
       CONCAT(100*SUM(CASE WHEN Danger='TRUE' THEN 1 ELSE 0 END)/COUNT(*),'%') as danger,
       CONCAT(100*SUM(CASE WHEN Animals='TRUE' THEN 1 ELSE 0 END)/COUNT(*),'%') as animals,
       CONCAT(100*SUM(CASE WHEN Uses_Sex='TRUE' THEN 1 ELSE 0 END)/COUNT(*),'%') as usessex
FROM [PortfolioProject].[dbo].[SuperBowlAds]
GROUP BY Year



