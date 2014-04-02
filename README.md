CONVERSION RATE
===============

Description
-----------

Conversion rate refers to the act of converting potential users into actual users (buy or “lead” activity).
The objective of computing the conversion rate of an establishment or item is to determine the effectiveness of different campaigns that aim to convert the traffic into sales or other desirable activity (download, newsletter subscription, watch a video, etc.).
This project’s purpose it to create a script in R software for an automatic calculation of the conversion rate.

Conversion rate types
---------------------
It covers three types of the conversion rate calculation:

### Entrance rate of a target ###

	CONVERSION_RATE_ENTRANCE = VISITS/TRAFFIC
	
### Transaction rate of a target 

	SALES: CONVERSION_RATE_STORE = TRANSACTIONS/VISITS
	LEAD GENERATION: #_LEAD_COLLECTED/TOTAL_TRAFFIC
	
### Monetary rate of a target ###
It is an equilibrium investment in advertising to encourage one more visitant to the establishment. To types of calculus:

	EQUILIBRIUM_INVESTMENT = AVERAGE_PROFIT_PER_TRANSACTION*CONVERSION_RATE_STORE
	EQUILIBRIUM_INVESTMENT = (SUM(DATASET$PROFIT))/VISITS
	
STORE CONVERSION RATE
=====================
For visualizing the calculation of the conversion rate it was used an example of a physical store, with parameters of two entrance campaigns: street traffic and flyer. The objective is to calculate automatically the effectiveness of each one.

Format
------
The data set consists of a 200x7 matrix and contains the following columns, where each of them represents the occurrence of a particular individual. There are three types of variables: categorical, binary and numerical. 
The variables used for the calculus of conversion rate are:

* gender - categorical variable that takes values "man" or "woman"
* age - discrete numerical variable that specifies the age of each individual
* source - categorical variable that specifies the type of shop entry ("street" or "flyer")
* enter - identifies the number of individuals that enters the store using binary values (0=doesn’t enter, 1=enters)
* buy - specifies whether the customer purchased a product in the store (0=doesn’t purchase, 1=purchase)
* expense - if the customer has purchased a product, specifies how much money he spent
* cost - the cost conditioned by the type of the entrance (cost per campaign per person)
