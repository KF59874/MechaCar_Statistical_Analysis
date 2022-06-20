# Deliverable 1 
# 3. Load the dplyr package
library(dplyr)

# 4. Import and read in the MechaCar_mpg.csv file as a dataframe.
library(tidyverse)
mechacar_mpg <- read.csv(file='./resources/MechaCar_mpg.csv',check.names=F,stringsAsFactors = F) 

# 5. Perform linear regression using the lm() function
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechacar_mpg)

#6. Using the summary() function, determine the p-value and the r-squared value for the linear regression model.
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechacar_mpg)) 


# Deliverable 2
# 2. Import and read in the Suspension_Coil.csv file as a table
suspensioncoil <- read.csv(file='./resources/Suspension_Coil.csv',check.names=F,stringsAsFactors = F) 

# 3. Write an RScript that creaes a total_summary dataframe using the summarize() function 
total_summary <- suspensioncoil %>% summarize(Mean_PSI=mean(PSI), 
                                              Median_PSI=median(PSI),
                                              Var_PSI=var(PSI),Std_Dev_PSI=sd(PSI),
                                              Num_Coil=n(), .groups = 'keep') 

# 4. Write an RScript that creates a lot_summary dataframe using the group_by() and the summarize() functions
lot_summary <- suspensioncoil %>% group_by(Manufacturing_Lot) %>% summarize(Mean_PSI=mean(PSI),
                                                                         Median_PSI=median(PSI),
                                                                         Var_PSI=var(PSI),
                                                                         Std_Dev_PSI=sd(PSI),
                                                                         Num_Coil=n(), .groups = 'keep')


# Deliverable 3

# Using the t.test() function determine if the PSI across all manufacturing lots is statistically different from the population mean of 1,500 pounds per square inch
t.test(suspensioncoil$PSI,mu=1500)


#2. Use t.test() function to write 3 more RScripts using the t.test() and using subset() to determine if PSI for each manufacturing lot is statistically different from the population mean of 1,500 PSI
lot1 <- subset(suspensioncoil, Manufacturing_Lot=="Lot1")
lot2 <- subset(suspensioncoil, Manufacturing_Lot=="Lot2")
lot3 <- subset(suspensioncoil, Manufacturing_Lot=="Lot3")

t.test(lot1$PSI,mu=1500)
t.test(lot2$PSI,mu=1500)
t.test(lot3$PSI,mu=1500)
