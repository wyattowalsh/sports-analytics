### The ***Basketball Dataset*** is an attempt to assemble a `robust`, *organized* dataset that can grow to as ***large of a scale*** as possible, concentrated within the domain of basketball. See the related project repository [**here**](https://github.com/wyattowalsh/sports-analytics/tree/main/basketball)

---

## Motivation 🏆 🥇 💪 

Sports analytics is an awesome field, and to derive superior analysis requires the best data. 

This project is an attempt to collect basketball data in an organized, useful manner.

---

## Dataset Architecture 🏗

***Kaggle*** offers many formats of which one can save files to a dataset, which include: `CSV`, `JSON`, `SQLite`, and `Archives`, among others. The platform essentially acts similarly to industrial cloud solutions like *Google Cloud Platform's* (**GCP**) ***Cloud Storage*** or *Amazon Web Service's* (**AWS**) ***S3*** albeit with a **100GB** storage capacity. ***Kaggle*** datasets as well as these industrial solutions can be considered as broad object/file storage and in certain data engineering paradigms can serve as data lakes. 

It seems that many state-of-the-art (SOTA) data storage solutions pivot around an organizational-wide data lake (of which itself allows for general object storage) that has multiple inputs (*"tributaries"*) both streaming into and routinely added to the overall lake. One benefit of this paradigm is that the lake facilitates the storage of both structured (tabular) and unstructured (image, video, audio, text, etc) data. This can prove useful because, as time progresses, new techniques for extracting useful information from unstructured data can be utilized. Thus it also seems like a good idea to hold onto all extracted data, if possible. 

***Kaggle*** datasets can serve as data lakes through the archival process or simply by storing data files in their raw file format. This certainly serves as a strong foundation for building a — one day in the future — <b><i>"big data"</i></b> collection. 

However, there is further work that can be done in configuring ***Kaggle*** datasets to enable additional platform functionality as well as improved storage efficiency. Structured data, whether structured upon extraction or structured through some pre-processing, can be stored in a ***SQLite*** database (`.sqlite` file type) as opposed to storing individual files such as `CSVs` or `JSONs` within the dataset.

As this project moves forward, I hope to collect a large collection of both structured and unstructured data. I hope that the ***SQLite*** database (`basketball.sqlite`) can serve to house the structured data in an efficient, useful format, similarly to the [***European Soccer Database***](https://www.kaggle.com/hugomathien/soccer)

### Update Pipeline

![](https://i.ibb.co/hLNVBW2/Basketball-Dataset-Update-Pipelines-1.png)

All the necessary parts are included on the Kaggle Dataset's page sans the aspects involving GitHub. Only open-source tools were utilized.

Some of my goals for the project included: 
1. Keep any monetary costs of the project out of the story ( cost = $0 ) 
2. Maximize testing and deployment abilities as well as future expansion
3. Acquire robust, reliable statistics (i.e. [stats.nba.com](https://www.stats.nba.com))
4. Utilize something along the lines of a database integrated within a data lake for storage
5. Utilize cloud computing end-to-end (I didn't want my local rig running regularly)

---

The current solution involves using [***GitHub Actions***](https://docs.github.com/en/actions) within the project's repository to activate [***Kaggle Kernels***](https://www.kaggle.com/docs/notebooks) (Notebooks) as pipelines via the [***KernelPipes*** Package](https://github.com/neuml/kernelpipes). Efficiency boosts were found by considering that not all data needs to be updated daily. Thus, there are two pipelines right now, one for daily updates (Game & Player data) and one for monthly updates (Player & Team data). For each pipeline, an executor script is activated via a ***GitHub Action***. This executor script is then used to orchestrate the rest of its corresponding pipeline, also using ***KernelPipes***. I used this method because it allowed me to execute pipeline segments in parallel while avoiding data asyncronicty issues -- each pipeline segment only executes the necssary statements to build the SQL queries as strings, then returns these strings to the executor script for database processing and [Kaggle Dataset](https://www.kaggle.com/docs/datasets) updating. Furthermore, ***GitHub Action*** minutes were saved by having the Action only activate the executor, and then let the ***Kaggle Kernels*** do the rest of the work. Actions were used since Kaggle Kernels do not support `cron` scheduling. Finally, Pandas, [the Kaggle API](https://github.com/Kaggle/kaggle-api), the [nba_api](https://github.com/swar/nba_api) and other popular data science tools, were used within each pipeline segment in order to extract data from [stats.nba.com](https://www.stats.nba.com), process, clean, and transform the data, and store the data within an `SQLite` database.

> Feel free to reach out if I can be of any assistance!