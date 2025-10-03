# Name of the course: Data Science 1

# Study
The study performs standard regression analysis within OLS method after preliminary preprocessing dataset with the given variables. The study question implies the following: how financial satisfactory affects hapiness? To evaluate this effect, the study includes several control variables such that age, gender and religion.

# Structure
- In folder Data-and-Analysis you find two csv files with raw and preprocessed/clean datasets. In addition the directory includes two ipynb files with data cleaning and main analysis. Before running the code **please be sure** that you are inside the project environment within YAML file (*aka project_environment.yml*) (read more in the chapter **Project Environment** in this README).
- file *script.sh* is shell script that allows to automate the process of change transfering between Git and GitHub. By default it hat commit message 'Update'.

# Documentation
DataScience1/
├─ Data-and-Analysis/
│  ├─ data_raw.csv
│  ├─ clean_data.csv         
│  ├─ cleaning.ipynb
│  └─ Analysis.ipynb
├─ project_environment.yml   
├─ run_script.sh
└─ README.md

# Data Source
### [World Values Survey Wave 7 (2017-2022) Variables Report V6.0](https://www.worldvaluessurvey.org/WVSDocumentationWV7.jsp) 
The World Values Survey (WVS) is a global research project that explores people's values and beliefs, how they change over time, and what social and political impact they have. Since 1981 a worldwide network of social scientists have conducted representative national surveys as part of WVS in almost 100 countries.

# Project Environment
! Please familiarize yourself with the following project space: libraries & pips that should be installed before the running code. Note: the environment is defined for more complex data analysis projects that the following, due to this the uploading time varies around 3 minutes. 
Instruction *How to activate the kernel*: 
* after moving to the *main* git folder within Anaconda Prompt, run the following command: *Conda activate data-analysis*. P.S be sure that your main directory contains YML file. Aftet that register the kernel within the command: *Python -m ipykernel install –user –name=myproject –display-name “python (myproject)”. Finally, run *jupyter notebook* and the whole code inside ipynb files. 
dependencies:
  - python=3.11
  - numpy
  - pandas
  - scikit-learn
  - matplotlib
  - seaborn
  - jupyterlab
  - notebook
  - ipywidgets
  - statsmodels
  - scipy
  - sympy
  - dask
  - sqlalchemy
  - requests
  - beautifulsoup4
  - pip
  - pip:
      - pyarrow           # parquet/feather support
      - openpyxl          # Excel support
      - xlrd              # legacy Excel support
      - pyjanitor         # data cleaning helpers
      - plotly            # interactive plotting
      - xgboost           # gradient boosting
      - lightgbm          # faster gradient boosting
      - catboost          # categorical boosting
      - shap              # model explainability
      - mlflow            # experiment tracking
      - hydra-core        # config management
      - streamlit         # quick dashboards
      - dash              # alternative dashboards
      - pytest            # testing
      - black             # code formatting
      - flake8            # linting

# Data Description and References

Files constitute the final (6.0) version of the World Values Survey (WVS) wave 7 data release comprising data for 66 countries/territories. Majority of surveys were completed in 2018-2020 with only about a dozen of countries conducting their fieldwork since the pandemic outbreak in 2021-2022. The last included survey comes from India and was completed in July 2023.

As per the WVS rules, every country is surveyed once per wave. All countries employed random probability representative samples of the adult population. Vast majority of surveys were conducted using face-to-face interview (PAPI/CAPI) as the data collection mode.

Data can be downloaded in formats for SPSS, Stata, SAS, R and csv. The data can be used freely for non-commercial purposes such as research, publication, teaching. Data redistribution is prohibited: publication of the original WVS datasets at other online platforms is against the WVSA Constitution.

When using the WVS data in any publication, please, make sure to include a relevant citation into the reference list:

Haerpfer, C., Inglehart, R., Moreno, A., Welzel, C., Kizilova, K., Diez-Medrano J., M. Lagos, P. Norris, E. Ponarin & B. Puranen (eds.). 2022. World Values Survey: Round Seven – Country-Pooled Datafile Version 6.0. Madrid, Spain & Vienna, Austria: JD Systems Institute & WVSA Secretariat. doi:10.14281/18241.24
For publications in social media, please, cite @WVS_Survey, #WVS, #WorldValuesSurvey.

In case of repeated problems with the data download, try using an alternative Internet browser. In case of any questions or problems with the data (or in case of suspected errors with scales or variables), please, get in contact with the WVSA Secretariat: wvsa.secretariat@gmail.com.

# Variable Description

* Happiness (Q46 – “Feeling of happiness”)
Question wording: “Taking all things together, would you say you are…”

Response scale:
- 1 = Very happy
- 2 = Quite happy
- 3 = Not very happy
- 4 = Not at all happy
- Special codes: (-1 = Don’t know, -2 = No answer, -4 = Not asked, -5 = Missing)

* Financial satisfaction (Q50 – “Satisfaction with financial situation of household”)
Question wording: “How satisfied are you with the financial situation of your household?”

Response scale:
- 1 = Completely dissatisfied
- 2, 3, … up to
- 10 = Completely satisfied

* Age
Question wording: Standard demographic item: “How old are you?” (in years).

* Gender
Question wording: “Sex of respondent”.

Response scale:
- 1 = Male
- 2 = Female

* Religion (Religious denomination)
Question wording: “Do you belong to a religious denomination? If yes, which one?”

Response categories: Varies by country, but usually includes major world religions and a “None” option. Typical codes include:
- 1 = Roman Catholic
- 2 = Protestant
- 3 = Orthodox
- 4 = Muslim
- 5 = Hindu
- 6 = Buddhist
- 7 = Jewish
- 8 = Other
- 9 = None

# Analysis Content
The following section is explanation of addidng each control: 
* Age. Happiness is known to vary with age — some studies find a U-shaped curve: higher happiness in youth and older age, lower in middle age. If you omit age, you might overestimate or underestimate the financial satisfaction effect, because income/financial security usually increases with age, and age also independently affects happiness
* Gender. Gender differences exist in both financial situation and reported happiness. For example: Women may report lower financial satisfaction (due to wage gaps) but sometimes equal or higher happiness levels compared to men. Omitting gender would risk confounding: we might falsely attribute gender-driven differences in happiness to financial satisfaction.
* Religion. Religion influences values, coping mechanisms, and social support — all linked to happiness. Religious affiliation may also affect financial attitudes (e.g., materialism vs. spiritual satisfaction). If not controlled, differences in happiness by religion could bias the financial satisfaction coefficient.

The results of regression are shown below: 

**Dependent variable:** Happiness (Q46, 1 = very happy → 4 = not at all happy)

| Variable | Coef. | Std. Err. | t | P>\|t\| | 95% CI Lower | 95% CI Upper | Interpretation |
|---|---:|---:|---:|---:|---:|---:|---|
| Intercept | 2.849 | 0.055 | 52.13 | 0.000 | 2.742 | 2.956 | Baseline predicted happiness |
| **Financial satisfaction (ref = 1: completely dissatisfied)** | | | | | | | |
| Satisfaction = 2 | -0.178 | 0.070 | -2.54 | 0.011 | -0.315 | -0.040 | Slightly higher financial satisfaction → happier |
| Satisfaction = 3 | -0.448 | 0.061 | -7.37 | 0.000 | -0.567 | -0.328 | Effect grows stronger |
| Satisfaction = 4 | -0.575 | 0.058 | -9.92 | 0.000 | -0.688 | -0.461 | — |
| Satisfaction = 5 | -0.684 | 0.054 | -12.64 | 0.000 | -0.790 | -0.578 | — |
| Satisfaction = 6 | -0.747 | 0.053 | -14.15 | 0.000 | -0.851 | -0.644 | — |
| Satisfaction = 7 | -0.839 | 0.051 | -16.50 | 0.000 | -0.939 | -0.739 | — |
| Satisfaction = 8 | -0.988 | 0.051 | -19.30 | 0.000 | -1.089 | -0.888 | — |
| Satisfaction = 9 | -1.100 | 0.054 | -20.39 | 0.000 | -1.205 | -0.994 | — |
| Satisfaction = 10 | -1.307 | 0.058 | -22.37 | 0.000 | -1.421 | -1.192 | Very strong effect: very satisfied → much happier |
| **Gender (ref = Male)** | | | | | | | |
| Female | 0.001 | 0.018 | 0.05 | 0.964 | -0.034 | 0.035 | No significant gender difference |
| **Religion (ref = None)** | | | | | | | |
| Catholic | -0.095 | 0.021 | -4.49 | 0.000 | -0.137 | -0.054 | Catholics slightly less happy |
| Protestant | -0.087 | 0.027 | -3.22 | 0.001 | -0.141 | -0.034 | Protestants slightly less happy |
| Orthodox | 0.036 | 0.065 | 0.56 | 0.576 | -0.091 | 0.164 | No significant difference |
| Muslim | -0.052 | 0.065 | -0.80 | 0.425 | -0.180 | 0.076 | No significant difference |
| Hindu | 0.038 | 0.061 | 0.61 | 0.540 | -0.083 | 0.158 | No significant difference |
| Buddhist | 0.017 | 0.087 | 0.20 | 0.842 | -0.154 | 0.189 | No significant difference |
| Jewish | 0.062 | 0.082 | 0.76 | 0.451 | -0.099 | 0.223 | No significant difference |
| Other | 0.039 | 0.074 | 0.53 | 0.598 | -0.105 | 0.183 | No significant difference |
| Missing/Unspecified | -0.043 | 0.048 | -0.90 | 0.370 | -0.137 | 0.051 | No significant difference |
| **Age (years)** | -0.001 | 0.001 | -1.94 | 0.053 | -0.002 | 0.000 | Marginal: older respondents slightly less happy |




