<h1 align='center'> Basketball </h1> 

<img src="https://unsplash.com/photos/EsDKfKpalK4/download?force=true">

<h2 align='center'> Contents </h2>

---
## Overview

While reviewing my [NBA Game Attendance Prediction Tool Project](https://github.com/wyattowalsh/NBA-attendance-prediction), I happened upon an amazing data source for NBA related data. Although many ideas for analysis are on the table (including revisiting attendance prediction), my efforts thus far have focused on utilizing the [***nba_api***](https://github.com/swar/nba_api) in an attempt to collect as much viable NBA data as possible and exhaust the historical data found amongst the different endpoints available. 

## Data Collection

The paradigm being leveraged throughout my data collection process is that of a data lake with an integrated SQL database. Since one goal of mine is to keep this project open-source, I have been using the [***Kaggle*** platform](https://www.kaggle.com). I plan on collecting both structured and unstructured data, thus Kaggle's dataset platform has served a good match and data lake of sorts. The platform supports the storage of any file type, and also supports ***SQLite*** database files. Thus, I have been loading all the structured, relational data into the SQLite database (`basketball.sqlite`), which enables greater information density and seems to be the optimal open-source offering to support my goals. 

#### You can find the related *Kaggle* dataset [***here***](https://www.kaggle.com/wyattowalsh/basketball)

So far, I have successfully extracted:

- **60,000+** games (every game since the first NBA season in 1946-47) including for the games in which the statistics were recorded:
  - Box scores
  - Game summaries
  - Officials
  - Inactive players
  - Linescores
  - Last face-off stats
  - Season series information
  - Game video availability
- **30** teams with information including:
  - General team details (stadium, head coach, general manager, social media links, etc)
  - Franchise history information (name changes, location changes, etc)
- **4500** players with:
  - Basic draft data
  - Prior affiliations
  - Career statistics
  - Anatomical data (height & weight)
  - And more!
