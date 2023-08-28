#Initiating a vector variable to the initial population 
N0 = c(75, 15, 5, 5)
N0 = matrix(N0, nrow = 4,ncol=1)

#Importing the first schema to analyze
#This script should be copied and pasted three times for 
#three separate schema analysis' an each time, the source file
#for each scheme should be selected at this point of the script
source(choose.files())

#storing a constant variable 
mvp = 80 

#producing a matrix to store the data 
runs_stores = matrix(NA, nrow=102, ncol=100)

#constructing the matrix containing the 100 growth interval
#total population values for each of the 100 runs
for (j in 1: 100) {
  current_pop = N0
  runs_stores[1,j] = sum(N0)
  for (i in 2: 101){
    L = generateL()
    current_pop = L%*%current_pop
    run_sum = sum(current_pop)
    runs_stores[i, j] = run_sum
    if (run_sum < mvp) {
      break
    } 
  }
}

#Producing the cumulative plot representative
#of the 100 runs and there change in total population
#over 100 growth intervals 
matplot(runs_stores, type="l", lwd=2, lty=1, xlab = "Growth Interval", ylab="Total Population")

#Calculating and storing the cumulative probability 
#of extinction over 100 years under this test schema 
extinct_prob = matrix(0, nrow=101, ncol=1)

for (j in 1:101) {
  count = 0
  for (i in 1:100) {
    if ((is.na(runs_stores[j, i])) | (runs_stores[j, i] < mvp)) {
      count = count + 1
    } 
  }
  extinct_prob[j,1] = count/100
}

#Plotting the cumulative probability of extinction
#Over 100 years after analyzing the 100 simulations
plot(seq(0, 100, by=1), extinct_prob[,1], type = "l", ylim = c(0, 1), xlim = c(0, 101), xlab = "Years", ylab = "Cumulative Probability of Extinction")

#Producing a 10 by 10 plot of plots depicting each individual run seperately
par(mfrow = c(10,10), mar=c(0,0,0,0), xaxt="n", yaxt="n")
y_max = max(runs_stores, na.rm = TRUE) + 1

for (k in 1:100) {
  x_count = 0
  for (n in 1:101)
    if (is.na(runs_stores[n,k])) {
      plot(seq(0, x_count-1, by =1),runs_stores[1:x_count,k], type="l", xlim=c(0, 100), ylim = c(0, y_max), lwd=2, col="gray")
      break
    } else {
      x_count = x_count + 1
      if (n == 101) {
        plot(seq(0, x_count-1, by =1),runs_stores[1:x_count,k], type="l", xlim=c(0, 100), ylim = c(0, y_max), lwd=2, col=rep(1:6, 100)[k])
      }
    }
}
