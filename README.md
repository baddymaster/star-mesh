# star-mesh
Analysis of the RED AQM algorithm by studying the ActualQueueSize and the AverageQueueSize for various simulated networks.

Steps to generate a graph after simulation :
1. Execute "grep a red-queue1.tr > ave1.tr && grep Q red-queue1.tr > cur1.tr && grep a red-queue2.tr > ave2.tr && grep Q red-queue2.tr > cur2.tr && grep a red-queue3.tr > ave3.tr && grep Q red-queue3.tr > cur3.tr"
2. 2. Run 'gnuplot' on the command line
3. 3. Within gnuplot, generate graphs from the cur*.tr or ave*.tr tracefiles
4. eg. plot "cur1.tr" using 2:3 t "Current Qlength" w lines;
5.     plot "ave1.tr" using 2:3 t "Average Qlength" w lines;
