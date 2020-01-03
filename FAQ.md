# Frequently Asked Questions
MBA 6273
Spring 2020

## What Excel tutorials do you recommend?

The following resources are helpful:

- [Excel Training from Microsoft](https://support.office.com/en-us/article/Excel-training-9bc05390-e94c-46af-a5b3-d7c22f6990bb)
- [GCF LearnFree](https://www.gcflearnfree.org/excel2016/)
- [Excel Exposure](https://excelexposure.com)
- [Contextures](http://www.contextures.com/index.html).

The last two resources offer videos on narrow topics (e.g., using the `AVERAGE` function or using the `VLOOKUP` function).

## How do I move to the top of a selected range in Excel?

After selecting a range (for example, with `Ctrl+Shift+Down`), press `Enter` to move to the top of the range.

## How do I clear the contents of a range in Excel for Mac?

Select the range, then press `fn+Delete`.

## Can you recommend authors to follow for the topic of technology and organization design?

Each of these authors regularly publishes interesting articles or books on the topic:

- [Erik Brynjolfsson](http://ebusiness.mit.edu/erik/)
- [Tom Davenport](http://www.tomdavenport.com/)
- [Lorin Hitt](http://iecon.net/)
- [Andrew McAfee](http://andrewmcafee.org/).

## How can I run the Windows version of Excel on my Mac? 

The macOS version of Excel provides the features the course requires. However, the interface of the Mac version differs from that of the Windows version. If you have trouble following in-class examples while using a Mac, you may wish to run the Windows version of Excel.

To run Excel for Windows on your Mac, you have two broad options. First, you can run Windows within macOS using a virtualization tool. Second, you can use Apple's Boot Camp tool to run Windows directly on your Mac.

Virtualization allows you to access Windows applications without restarting your computer. Modern virtualization packages include Oracle VirtualBox, VMWare Fusion, and Parallels. I recommend starting with VirtualBox since it is free.

In contrast to virtualization, Boot Camp requires you to reboot your Mac before accessing Windows. Running Windows directly (i.e., not as a virtual machine within a host operating system) offers higher performance. However, the inconvenience of rebooting your computer to switch between macOS and Windows, coupled with the excellent performance of modern virtual machines, makes virtualization the better route for most users.

To run Windows and Excel within VirtualBox, follow the steps below.

1.  Download [VirtualBox](https://www.virtualbox.org) and run the VirtualBox installer.

2.  Download Microsoft Windows 10 via [Microsoft Imagine](https://e5.onthehub.com/WebStore/ProductsByMajorVersionList.aspx?cmi_cs=1&cmi_mnuMain=bdba23cf-e05e-e011-971f-0030487d8897&ws=f2f4cf67-44b9-e511-9414-b8ca3a5db7a1&vsro=8&pc=0dafd5cd-4c09-e011-bed1-0030487d8897).

3.  Follow [these directions](https://www.extremetech.com/computing/198427-how-to-install-windows-10-in-a-virtual-machine) to setup Windows 10 within VirtualBox.

4.  Use BuckeyeMail to [download Microsoft Office](https://osuitsm.service-now.com/selfservice/kb_view.do?sysparm_article=kb04733) and run the Office installer.

## How can I access Tableau?

Tableau Software provides a free license to students. Sign up via the form at the bottom of [this page](https://www.tableau.com/academic/students).

## How can I get started with Python?

The [Anaconda Platform](https://www.anaconda.com/what-is-anaconda/) provides a comprehensive solution for analyzing data with Python. The [standard version of Anaconda](https://www.anaconda.com/download/) includes common tools such as *NumPy*, *pandas*, *StatsModels*, and *scikit-learn*. In addition [*Jupyter Notebook*](http://jupyter.org), included with Anaconda, provides one of the best environments for working with data in Python.

There are many resources online for learning Python. [Automate the Boring Stuff with Python](https://automatetheboringstuff.com/) is an excellent general introduction to Python. The following sites are useful for learning data analysis with Python.

-   [Coursera](https://www.coursera.org/learn/python-data-analysis)
-   [Introduction to Pandas](http://nbviewer.jupyter.org/github/fonnesbeck/Bios8366/blob/master/notebooks/Section2_1-Introduction-to-Pandas.ipynb)
-   [Data Wrangling with Pandas](http://nbviewer.jupyter.org/github/fonnesbeck/Bios8366/blob/master/notebooks/Section2_2-Data-Wrangling-with-Pandas.ipynb)
-   [Python for Data Analysis](http://shop.oreilly.com/product/0636920023784.do)

For Coursera, choose the "audit" option to view course materials. Note that you need a Coursera account to select the audit option. The site offers a paid service, but you can access course materials for free by auditing.

## How can I get started with R?

I recommend using [RStudio](https://rstudio.com/products/rstudio/#rstudio-desktop) and the `tidyverse` approach. `Tidyverse` is a group of packages that add useful data manipulation and visualization tools. Please see the *Resources* module on Carmen for directions for installing R, RStudio (an integrated development environment for R), and `tidyverse`.

`Tidyverse` includes a package, `dplyr`, that simplifies the syntax for most common data manipulations. As an example, suppose we have a dataset called `dat` that describes products a retailer sells. The dataset has two variables: `price` and `category`. To calculate the average price for each product category in base R:

```R
with(dat, aggregate(price, list(category), mean))
```

The `with` function specifies that we use variables from the `dat` dataset. The aggregate function groups the dataset by the values of `category` and applies the function `mean` to each group.

Using `dplyr`, the code is:

```R
dat %>%
  group_by(category) %>%
  summarize(mean(price))
```

The pipe operator `%>%` feeds the output of the expression on its left to the function on its right. We read this as "take the `dat` dataset, group it by product category, and produce a summary of the mean price by group." The `dplyr` syntax is easier to read and write than base R for most users.

The best resource for learning R with *tidyverse* is *R for Data Science* by Grolemund and Wickham. The book is available [online for free](http://r4ds.had.co.nz). Wickham created the `dplyr` package as well as other prevalent packages, such as the `ggplot2` package for data visualization.

Two sources for learning base R are:

- [DataCamp](https://www.datacamp.com/courses/free-introduction-to-r)
- [Coursera](https://www.coursera.org/learn/r-programming).

For Coursera, choose the "audit" option if you enroll. The site pushes the 7-day trial of the paid service, but you can access all course materials for free by auditing.

My advice for learning R is to begin with a basic introduction. *R for Data Science* chapters 1 through 6, the DataCamp course, or the first two weeks of the Coursera course would each fit the bill. After the introduction, you will be able to implement MBA 6273 exercises using R. It's hard to learn a programming language in isolation, and a moving target (i.e., exercises of increasing difficulty) helps. I'm happy to discuss any specific questions you have while learning R.

## Should I Learn SQL?

I recommend starting with Python or R. The `Blaze` package for Python and the `dplyr` package for R implement core database operations using terms reminiscent of SQL. Once you are comfortable with data manipulation in Python or R, it is straightforward to translate your ideas to SQL.

For example, the `dplyr` database backend, `dbplyr`, communicates directly with standard data stores so you can take advantage of the speed and storage of a database. Specifically, `dbplyr` translates your R code to the appropriate database query. The interface supports all common databases (MySQL, SQLite, PostgreSQL, Oracle, general ODBC) and distributed storage and processing platforms like Hadoop and Spark.

Suppose we run a service business. We have a database with two data tables: `sales` and `staff`. `Sales` contains four variables: `location`, `date`, `hour`, and `revenue`. `Staff` includes three variables: `location`, `date`, and `headcount`.

We want to calculate labor productivity as daily revenue divided by headcount for each location and day. We must:

1.  Group revenue observations in the `sales` table by `location` and `date`, then total `revenue` within each group. E.g., for the group defined by location A and date 1/1/2018, daily revenue is the sum of all hourly revenues within the group

2.  Merge the two tables according to location and date

3.  Calculate labor productivity.

In R:

```R
sales %>% 
  group_by(location, date) %>%
  summarize(dailyRevenue = sum(revenue)) %>%
  left_join(staff) %>%
  mutate(laborProductivity = dailyRevenue / headcount)
```

In SQL:

```SQL
SELECT *,
       dailyRevenue / headcount AS laborProductivity
FROM staff
  NATURAL LEFT JOIN (
    SELECT location, date, hour,
           SUM(revenue) AS dailyRevenue
    FROM sales
    GROUP BY location, date
  );
```

In both cases, the grouping and merging (left join) verbs are similar. The R code is easier to read since it follows the logic of the operations. We select the `sales` table, group the `sales` table by `location` and `date`, summarize each group by taking the sum of `revenue`, merge the result with the `staff` table, and calculate labor productivity.


