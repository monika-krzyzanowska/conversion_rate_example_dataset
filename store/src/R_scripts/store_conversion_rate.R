#This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
#To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/.

#defining campaigns
campaign1 = "street"  
campaign2 = "flyer"


#uploading data
data = read.csv("store conversion rate dataset.csv", sep=";")

SUBSET1 = subset(data,SOURCE==campaign1)
SUBSET2 = subset(data,SOURCE==campaign2)
SUBSET_MALE = subset(data,GENDER=="male")
SUBSET_FEMALE = subset(data,GENDER=="female")


#defining sample size
SIZE_CAMPAIGN1 = sum(data$SOURCE==campaign1)
SIZE_CAMPAIGN2 = sum(data$SOURCE==campaign2)
MALE = sum(data$GENDER=="male")
FEMALE = sum(data$GENDER=="female")

###

###

######### PRECOMPUTATION #########



## demographic data of visitants

VISITS_MALE = sum(subset(data,ENTER==1)$GENDER=="male")
VISITS_FEMALE = sum(subset(data,ENTER==1)$GENDER=="female")
VISITS_AV_AGE = mean(subset(data,ENTER==1)$AGE)

VISITS_AV_AGE_MALE = mean(subset(SUBSET_MALE,ENTER==1)$AGE)
VISITS_AV_AGE_FEMALE = mean(subset(SUBSET_FEMALE,ENTER==1)$AGE)

VISITS_AV_AGE_C1 = mean(subset(SUBSET1,ENTER==1)$AGE)
VISITS_AV_AGE_C2 = mean(subset(SUBSET2,ENTER==1)$AGE)

VISITS_AV_AGE_C1_MALE = mean(subset(subset(SUBSET1,ENTER==1),GENDER=="male")$AGE)
VISITS_AV_AGE_C2_MALE = mean(subset(subset(SUBSET2,ENTER==1),GENDER=="male")$AGE)

VISITS_AV_AGE_C1_FEMALE = mean(subset(subset(SUBSET1,ENTER==1),GENDER=="female")$AGE)
VISITS_AV_AGE_C2_FEMALE = mean(subset(subset(SUBSET2,ENTER==1),GENDER=="female")$AGE)


## demographic data of people that made a transaction (buy or lead)

TRANS_MALE = sum(data$BUY==1 & data$GENDER=="male")
TRANS_FEMALE = sum(subset(data,BUY==1)$GENDER=="female")
TRANS_AV_AGE = mean(subset(data,BUY==1)$AGE)

TRANS_AV_AGE_MALE = mean(subset(SUBSET_MALE,BUY==1)$AGE)
TRANS_AV_AGE_FEMALE = mean(subset(SUBSET_FEMALE,BUY==1)$AGE)

TRANS_AV_AGE_C1 = mean(subset(SUBSET1,BUY==1)$AGE)
TRANS_AV_AGE_C2 = mean(subset(SUBSET2,BUY==1)$AGE)

TRANS_AV_AGE_C1_MALE = mean(subset(subset(SUBSET1,BUY==1),GENDER=="male")$AGE)
TRANS_AV_AGE_C2_MALE = mean(subset(subset(SUBSET2,BUY==1),GENDER=="male")$AGE)

TRANS_AV_AGE_C1_FEMALE = mean(subset(subset(SUBSET1,BUY==1),GENDER=="female")$AGE)
TRANS_AV_AGE_C2_FEMALE = mean(subset(subset(SUBSET2,BUY==1),GENDER=="female")$AGE)



#total number of visits
VISITS = sum(data$ENTER==1)

#total number of transactions
TRANSACTIONS = sum(data$BUY==1)

#average profit per transaction
AV_PROFIT = (sum(data$EXPENSE) + sum(data$COST)) / (sum(data$BUY==1))
AV_PROFIT_C1 = (sum(SUBSET1$EXPENSE) + sum(SUBSET1$COST)) / (sum(SUBSET1$BUY==1))
AV_PROFIT_C2 = (sum(SUBSET2$EXPENSE) + sum(SUBSET2$COST)) / (sum(SUBSET2$BUY==1))
AV_PROFIT_MALE = (sum(SUBSET_MALE$EXPENSE) + sum(SUBSET_MALE$COST)) / (sum(SUBSET_MALE$BUY==1))
AV_PROFIT_FEMALE = (sum(SUBSET_FEMALE$EXPENSE) + sum(SUBSET_FEMALE$COST)) / (sum(SUBSET_FEMALE$BUY==1))
AV_PROFIT_C1_MALE = (sum(subset(SUBSET1, GENDER=="male")$EXPENSE) + sum(subset(SUBSET1, GENDER=="male")$COST)) / (sum(subset(SUBSET1, GENDER=="male")$BUY==1))                              
AV_PROFIT_C1_FEMALE = (sum(subset(SUBSET1, GENDER=="female")$EXPENSE) + sum(subset(SUBSET1, GENDER=="female")$COST)) / (sum(subset(SUBSET1, GENDER=="female")$BUY==1))
AV_PROFIT_C2_MALE = (sum(subset(SUBSET2, GENDER=="male")$EXPENSE) + sum(subset(SUBSET2, GENDER=="male")$COST)) / (sum(subset(SUBSET2, GENDER=="male")$BUY==1))
AV_PROFIT_C2_FEMALE = (sum(subset(SUBSET2, GENDER=="female")$EXPENSE) + sum(subset(SUBSET2, GENDER=="female")$COST)) / (sum(subset(SUBSET2, GENDER=="female")$BUY==1))

###

###

###

######### SALES NUMBER CONVERSION RATE #########

###


###### ENTRANCE RATE

## TOTAL ENTRANCE RATE

CR_ENTER = VISITS/(SIZE_CAMPAIGN1+SIZE_CAMPAIGN2)
CR_ENTER_MALE = VISITS_MALE/MALE
CR_ENTER_FEMALE = VISITS_FEMALE/FEMALE

## CAMPAIGN 1

CR_ENTER_C1 = sum(data$ENTER==1 & data$SOURCE==campaign1) / SIZE_CAMPAIGN1
CR_ENTER_C1_MALE = sum(SUBSET1$ENTER==1 & SUBSET1$GENDER=="male") / sum(SUBSET1$GENDER=="male")
CR_ENTER_C1_FEMALE = sum(SUBSET1$ENTER==1 & SUBSET1$GENDER=="female") / sum(SUBSET1$GENDER=="female")




## CAMPAIGN 2

CR_ENTER_C2 = sum(data$ENTER==1 & data$SOURCE==campaign2) / SIZE_CAMPAIGN2
CR_ENTER_C2_MALE = sum(SUBSET2$ENTER==1 & SUBSET2$GENDER=="male") / sum(SUBSET2$GENDER=="male")
CR_ENTER_C2_FEMALE = sum(SUBSET2$ENTER==1 & SUBSET2$GENDER=="female") / sum(SUBSET2$GENDER=="female")


###

###### STORE RATE

CR_STORE = TRANSACTIONS/VISITS
CR_STORE_MALE = TRANS_MALE/VISITS_MALE
CR_STORE_FEMALE = TRANS_FEMALE/VISITS_FEMALE



##### CAMPAIGN CONVERSION RATE 1 (if the origin of the buyer is unknown)
#   entrance CR * store CR

## CAMPAIGN 1
CR1_C1 = CR_ENTER_C1*CR_STORE
CR1_C1_MALE = CR_ENTER_C1_MALE*CR_STORE_MALE
CR1_C1_FEMALE = CR_ENTER_C1_FEMALE*CR_STORE_FEMALE

## CAMPAIGN 2
CR1_C2 = CR_ENTER_C2*CR_STORE
CR1_C2_MALE = CR_ENTER_C2_MALE*CR_STORE_MALE
CR1_C2_FEMALE = CR_ENTER_C2_FEMALE*CR_STORE_FEMALE



##### CAMPAIGN CONVERSION RATE 2 (if the origin of the buyer is known)
# transactions of the campaign / entrances from the campaign

## CAMPAIGN 1

CR2_C1 = sum(data$BUY==1 & data$SOURCE==campaign1) / sum(data$ENTER==1 & data$SOURCE==campaign1)
CR2_C1_MALE = sum(SUBSET1$BUY==1 & SUBSET1$GENDER=="male") / sum(SUBSET1$ENTER==1 & SUBSET1$GENDER=="male")
CR2_C1_FEMALE = sum(SUBSET1$BUY==1 & SUBSET1$GENDER=="female") / sum(SUBSET1$ENTER==1 & SUBSET1$GENDER=="female")

## CAMPAIGN 2

CR2_C2 = sum(data$BUY==1 & data$SOURCE==campaign2) / sum(data$ENTER==1 & data$SOURCE==campaign2)
CR2_C2_MALE = sum(SUBSET2$BUY==1 & SUBSET2$GENDER=="male") / sum(SUBSET2$ENTER==1 & SUBSET2$GENDER=="male")
CR2_C2_FEMALE = sum(SUBSET2$BUY==1 & SUBSET2$GENDER=="female") / sum(SUBSET2$ENTER==1 & SUBSET2$GENDER=="female")



###

######### SALES REVENUE CONVERSION RATE #########


### EQUILIBRIUM INVESTMENT PER VISITOR

#equilibrium amount to spent in advertising effort (if you spend that money for acquiring one more visitor for a store, you will break even) (average profit per visit)

## TOTAL
EQ_INVST = AV_PROFIT*CR_STORE         # = ((sum(data$PROFIT)) / VISITS)
EQ_INVST_MALE = AV_PROFIT_MALE*CR_STORE_MALE
EQ_INVST_FEMALE = AV_PROFIT_FEMALE*CR_STORE_FEMALE

## CAMPAIGN 1
EQ_INVST_C1 = AV_PROFIT_C1*CR2_C1
EQ_INVST_C1_MALE = AV_PROFIT_C1_MALE*CR2_C1_MALE
EQ_INVST_C1_FEMALE = AV_PROFIT_C1_FEMALE*CR2_C1_FEMALE

## CAMPAIGN 2
EQ_INVST_C2 = AV_PROFIT_C2*CR2_C2
EQ_INVST_C2_MALE = AV_PROFIT_C2_MALE*CR2_C2_MALE
EQ_INVST_C2_FEMALE = AV_PROFIT_C2_FEMALE*CR2_C2_FEMALE

###

###

######### SUMMARY TABLES ######### 

### GENERAL INFORMATION ABOUT CONVERSION RATE

store_cr = matrix(c(CR_ENTER_C1,CR_ENTER_C2,CR_ENTER,CR2_C1,CR2_C2,CR_STORE,CR1_C1,CR1_C2,CR_STORE,EQ_INVST_C1,EQ_INVST_C2,EQ_INVST,VISITS_AV_AGE_C1,VISITS_AV_AGE_C2,VISITS_AV_AGE,TRANS_AV_AGE_C1,TRANS_AV_AGE_C2,TRANS_AV_AGE),ncol=3,byrow=TRUE)
colnames(store_cr) = c("Campaign 1","Campaign 2","Total")
rownames(store_cr) = c("CR OF VISITS","CR OF TRANSACTIONS","CR ORIGIN UNKNOWN","EQUILIBRIUM INVESTMENT FOR NEW VISITOR","AVERAGE AGE ENTER","AVERAGE AGE BUY")
store_table = round(as.table(store_cr),2)
store_table

### SPECIFIC INFORMATION ABOUT CONVERSION RATE

## CAMPAIGN 1

camp1_demogr = matrix(c(CR_ENTER_C1_MALE,CR_ENTER_C1_FEMALE,CR_ENTER_C1,CR2_C1_MALE,CR2_C1_FEMALE,CR2_C1,CR1_C1_MALE,CR1_C1_FEMALE,CR1_C1,EQ_INVST_C1_MALE,EQ_INVST_C1_FEMALE,EQ_INVST_C1,VISITS_AV_AGE_C1_MALE,VISITS_AV_AGE_C1_FEMALE,VISITS_AV_AGE_C1,TRANS_AV_AGE_C1_MALE,TRANS_AV_AGE_C1_FEMALE,TRANS_AV_AGE_C1),ncol=3,byrow=TRUE)
colnames(camp1_demogr) = c("Male","Female","Total")
rownames(camp1_demogr) = c("CR OF VISITS","CR OF TRANSACTIONS","CR ORIGIN UNKNOWN","EQUILIBRIUM INVESTMENT FOR NEW VISITOR","AVERAGE AGE ENTER","AVERAGE AGE BUY")
camp1_table = round(as.table(camp1_demogr),2)
camp1_table

## CAMPAIGN 2

camp2_demogr = matrix(c(CR_ENTER_C2_MALE,CR_ENTER_C2_FEMALE,CR_ENTER_C2,CR2_C2_MALE,CR2_C2_FEMALE,CR2_C2,CR1_C2_MALE,CR1_C2_FEMALE,CR1_C2,EQ_INVST_C2_MALE,EQ_INVST_C2_FEMALE,EQ_INVST_C2,VISITS_AV_AGE_C2_MALE,VISITS_AV_AGE_C2_FEMALE,VISITS_AV_AGE_C2,TRANS_AV_AGE_C2_MALE,TRANS_AV_AGE_C2_FEMALE,TRANS_AV_AGE_C2),ncol=3,byrow=TRUE)
colnames(camp2_demogr) = c("Male","Female","Total")
rownames(camp2_demogr) = c("CR OF VISITS","CR OF TRANSACTIONS","CR ORIGIN UNKNOWN","EQUILIBRIUM INVESTMENT FOR NEW VISITOR","AVERAGE AGE ENTER","AVERAGE AGE BUY")
camp2_table = round(as.table(camp2_demogr),2)
camp2_table


write(file="summary_st.txt", x=store_table)

write(file="summary_c1.txt", x=camp1_table)

write(file="summary_c2.txt", x=camp2_table)

