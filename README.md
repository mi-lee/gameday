Homework 10: Gameday Package

=======

Michelle Lee
STAT 547M


# How to install gameday

These are the commands to install my package Gameday:

```
library(devtools)
install_github("mi-lee/gameday")
library(gameday)
```

# How it works
`gameday` has two functions: `gday(team, date)` and `scores(date)`. For example, you can ask whether a specific NHL team plays at a date 2014-03-11:

```
gday("canucks", "2014-03-11")
```

or if a team plays today:

```
gday("canucks")
```

or if the Canucks plays today:

```
gday()
```

You can also see the scores for a certain date:

```
scores("2014-11-03")
```

Or for today:

```
scores()
```


To find the vignette associated with this package, you can look it up on the R command line like so:

```
browseVignettes(package = "gameday")
```

You can also find the vignette for this package [here].
