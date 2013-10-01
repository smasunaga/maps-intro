setwd("~/dataviz-fall-2013/maps-intro")
data <- read.delim("merged-multirace.txt")
head(data)
county totalpop  pctwhite    pctblack    pctamind    pctasian   pctother pcthispanic year fips
1   Alameda  1510271 0.3407064 0.121915868 0.002773674 0.266478665 0.04307373  0.22505166 2010 6001
2    Alpine     1175 0.7251064 0.000000000 0.178723404 0.005957447 0.01872340  0.07148936 2010 6003
3    Amador    38091 0.7961198 0.024625240 0.014360348 0.012050091 0.02798561  0.12485889 2010 6005
4     Butte   220000 0.7518909 0.014240909 0.015431818 0.042372727 0.03462727  0.14143636 2010 6007
5 Calaveras    45578 0.8353592 0.007788845 0.011540656 0.013164246 0.02896134  0.10318575 2010 6009
6    Colusa    21419 0.3979644 0.007843503 0.013819506 0.015220132 0.01405294  0.55109949 2010 6011

dim(data)
290 10
unique(data$year)
[1] 2010 2000 1990 1980 2020

data[order(data$pctwhite),]
subset(data, pctwhite == max(data$pctwhite))
subset(y2020, pctwhite == max(y2020$pctwhite))
> subset(y2020, pctblack == min(y2020$pctblack))

> y2010 <- subset(data, year == 2010)
> subset(y2010, hispanic_pop == max(y2010$hispanic_pop))
> y1980 <-subset(data, year == 1980)
> subset(y1980, pctasian == max(y1980$pctasian))
-- finding most asian county in CA

sf <- sf[order(sf$year), ] --> this makes sure that your data doesn / 't come out strangely

> plot(sf$year, sf$pcthispanic, type="l", ylim=c(0, max(data$pcthispanic)))
> data$hispanic_pop <- data$pcthispanic * data$totalpop
head(data)

data$asian_pop <- data$pctasian * data$totalpop
> head(data)
county totalpop  pctwhite    pctblack    pctamind    pctasian   pctother pcthispanic year fips hispanic_pop
1   Alameda  1510271 0.3407064 0.121915868 0.002773674 0.266478665 0.04307373  0.22505166 2010 6001       339889
2    Alpine     1175 0.7251064 0.000000000 0.178723404 0.005957447 0.01872340  0.07148936 2010 6003           84
3    Amador    38091 0.7961198 0.024625240 0.014360348 0.012050091 0.02798561  0.12485889 2010 6005         4756
4     Butte   220000 0.7518909 0.014240909 0.015431818 0.042372727 0.03462727  0.14143636 2010 6007        31116
5 Calaveras    45578 0.8353592 0.007788845 0.011540656 0.013164246 0.02896134  0.10318575 2010 6009         4703
6    Colusa    21419 0.3979644 0.007843503 0.013819506 0.015220132 0.01405294  0.55109949 2010 6011        11804
asian_pop
1    402455
2         7
3       459
4      9322
5       600

> data$white_pop <- data$pctwhite * data$totalpop
> head(data)
county totalpop  pctwhite    pctblack    pctamind    pctasian   pctother pcthispanic year fips hispanic_pop
1   Alameda  1510271 0.3407064 0.121915868 0.002773674 0.266478665 0.04307373  0.22505166 2010 6001       339889
2    Alpine     1175 0.7251064 0.000000000 0.178723404 0.005957447 0.01872340  0.07148936 2010 6003           84
3    Amador    38091 0.7961198 0.024625240 0.014360348 0.012050091 0.02798561  0.12485889 2010 6005         4756
4     Butte   220000 0.7518909 0.014240909 0.015431818 0.042372727 0.03462727  0.14143636 2010 6007        31116
5 Calaveras    45578 0.8353592 0.007788845 0.011540656 0.013164246 0.02896134  0.10318575 2010 6009         4703
6    Colusa    21419 0.3979644 0.007843503 0.013819506 0.015220132 0.01405294  0.55109949 2010 6011        11804
asian_pop white_pop
1    402455    514559
2         7       852
3       459     30325
4      9322    165416
5       600     38074
6       326      8524

data$amind_pop <-data$pctamind * data$totalpop
> head(data)
county totalpop  pctwhite    pctblack    pctamind    pctasian   pctother pcthispanic year fips hispanic_pop
1   Alameda  1510271 0.3407064 0.121915868 0.002773674 0.266478665 0.04307373  0.22505166 2010 6001       339889
2    Alpine     1175 0.7251064 0.000000000 0.178723404 0.005957447 0.01872340  0.07148936 2010 6003           84
3    Amador    38091 0.7961198 0.024625240 0.014360348 0.012050091 0.02798561  0.12485889 2010 6005         4756
4     Butte   220000 0.7518909 0.014240909 0.015431818 0.042372727 0.03462727  0.14143636 2010 6007        31116
5 Calaveras    45578 0.8353592 0.007788845 0.011540656 0.013164246 0.02896134  0.10318575 2010 6009         4703
6    Colusa    21419 0.3979644 0.007843503 0.013819506 0.015220132 0.01405294  0.55109949 2010 6011        11804
asian_pop white_pop amind_pop
1    402455    514559  4188.999
2         7       852   210.000
3       459     30325   547.000
4      9322    165416  3395.000
5       600     38074   526.000
6       326      8524   296.000
6       326

?aggregate
> aggregate(data$hispanic_pop, list(data$year), sum)

> names(total_ca_pop) <- c("year", "tot_ca_pop")
> head(total_ca_pop)
  year tot_ca_pop
1 1980   23667902
2 1990   29760021
3 2000   33871648
4 2010   37253956
5 2020   40643643

> hispanics_by_year <- aggregate(data$hispanic_pop, list(data$year), sum)
> head(hispanics_by_year)

> merge(hispanics_by_year, total_ca_pop, by="year")
