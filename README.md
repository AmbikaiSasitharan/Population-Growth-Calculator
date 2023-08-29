# Population-Growth-Calculator
 This simple script of R uses statistical analysis to produce three interoperable graphs that estimates a population's growth trend given the population's current statistics such as its initial population, its Leslie matrix, and its age group probabilities.

The three graphs that will be produced will look like the following: 

(i)<img width="230" alt="100_Growth_Simulation_Plot" src="https://github.com/AmbikaiSasitharan/Population-Growth-Calculator/assets/140208293/1aae5d41-c453-4880-b716-0a372fe37826"> (ii)<img width="230" alt="Extinction_Proability_Change_Plot" src="https://github.com/AmbikaiSasitharan/Population-Growth-Calculator/assets/140208293/c050c6fa-7aa5-43a6-b840-d57b2c063339"> (iii)<img width="230" alt="10_by_10_All_Plots_In_One_Grid" src="https://github.com/AmbikaiSasitharan/Population-Growth-Calculator/assets/140208293/b8beb06d-e594-44f0-9c42-c39dedd2284f"> 

i) 100 simulations depicting the potential change in population density over 100 years based off of the given populations information superimposed on top of one another, to give a general depiction of what the growth trend may be.

ii) A graph depicting the change in probability of extinction over 100 years based off of the number of calculated graphs that go extinct every year from graph (i). 

iii) All the graphs from graph (i) put into a 10 by 10 grid, seperately, so that viewers can see each simulation in specific.

There are two main inputs required in order for this script to function properly: N0 and a formatted file one chooses from their file explorer: 
The initial population (N0): 
This is a vector that stores the initial population of each age group of the population. In the order of this vector the first number is the first age groups (the youngest) population density, the second number is the second age groups population density, and so forth. 

The File to choose: 
I have provided sample files (Sample_Schemas) that one can download and select when running the R script which are formatted a specific way that the script can be read. This text file you choose will generate a Leslie Matrix that is multiplied to the current population density at a given time during the calculations, to estimate what the population density will be for the following year. This calculation is based off of the principles applied by the Leslie Matrix which was designed to consider age group density and fertility probability when calculating the future of a population. one can read about the format of a Leslie Matrix and how it works in the reference link: 
https://bio.libretexts.org/Courses/Gettysburg_College/02%3A_Principles_of_Ecology_-_Gettysburg_College_ES_211/07%3A_A_Quantitative_Approach_to_Population_Ecology/7.03%3A_Leslie_Matrix_Models#:~:text=The%20Leslie%20matrix%20(also%20called,usually%20the%20female%2C%20is%20considered.

This produced Leslie Matrix is what is used to generate the simulations that produced the 3 graphs provided by the script by calculating the population estimates after the initial population.  

If you would like to customize what population you want to analyze based off of these principles you can:
1. Change the initali population values within the R script (N0).
2. Create your own text file in the same format as one of the Sample_Schemas provided and adjust specific elements:
-    You can change the coreL variable in your text file to the Leslie Matrix portrayed in your population
-    You can adjust the noiseMat[2, 1]<-runif(1, .05, .12) components in your text file to provide limits for random adjustments to be made on your Leslie Matrix to consider the probability of random adjustments based off of unpredicatble variable such as environmental changes, natural disasters, etc. This element is the cause for so many simulations to vary so differently during their calculations. you can make as many noiseMat components as there are cells in your Leslie matrix, and this is how you can customize them:
- - xdasdasd    

Rules to follow for this to work if you customize the code: 
1. Ensure that only one noiseMat component references a specific cell in your Leslie Matrix (more then one noiseMat component adjusting the same cell may cause an error)
2. Ensure that the number of coloums in your Leslie matrix is the same number of values in your N0 vector
3. If you change the number of coloums (aka age classes (x)) ensure to also adjust the second line in the R script so that it reads: N0 = matrix(N0, nrow = x,ncol=1)

