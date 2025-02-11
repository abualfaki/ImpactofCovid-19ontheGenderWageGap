# The Impact of COVID-19 on the Gender Wage Gap: A Comparative Analysis Between Canadian Citizens and Immigrants

![image](https://github.com/user-attachments/assets/55aefbb2-0f60-481e-8547-ff418dab53b9)

## 📌 Overview
This project investigates how the COVID-19 pandemic affected the gender wage gap among Canadian-born citizens and immigrants. Using Labour Force Survey data from November 2019 to November 2022, we quantify changes in wage disparities across different demographic groups, particularly short-term and long-term immigrants.

## 🔍 Research Findings
[![Image from Gyazo](https://i.gyazo.com/39e10eb32e41bf9e885dcce5c8f07d5e.png)](https://gyazo.com/39e10eb32e41bf9e885dcce5c8f07d5e)
- **Canadian-born gender wage gap**: Decreased from **11.84% in November 2019** to **10.08% in November 2022** (↓ 1.76%).
- **Short-term immigrant gender wage gap**: Increased from **12.90% in November 2019** to **13.68% in November 2022** (↑ 0.78%).
- **Long-term immigrant gender wage gap**: Decreased from **12.59% in November 2019** to **11.73% in November 2022** (↓ 0.86%).
- **Public sector employees** earned **~10.4% more** than private sector employees post-COVID.
- **Higher education levels** significantly correlated with **higher wages** across all demographics.
- **Alberta** had the highest wages compared to Ontario, with an **11% wage premium** pre-COVID and **3.7% post-COVID**.
- The **mining, quarrying, and oil and gas industry** had the highest wages across all sectors.

## 📂 Project Structure
```
Impact of Covid-19 on the Gender Wage Gap/
│── Data/               # Contains datasets used for analysis
│── Scripts/            # Code scripts for data processing and analysis
│── Results/            # Output files, figures, and final results
│── Reports/            # Summary reports and research findings
│── README.md           # Project documentation
```

## 📊 Data Sources
This study utilizes:
- **Labour Force Survey (LFS) data** (2019-2022).
- **Industry-specific employment statistics** highlighting gender wage trends.
- **Regional and sectoral breakdowns** of wage disparities pre- and post-COVID.

## 🛠️ Methodology
- **Log-Linear Regression Model**: Estimates the gender wage gap by controlling for education, industry, occupation, and work experience.
- **Interaction Effects**: Captures the additional impact of gender on wages among short-term and long-term immigrants.
- **Statistical Significance Testing**: Ensures robustness of findings at 1%, 5%, and 10% significance levels.

## 🚀 How to Run the Project
### 1️⃣ Clone the Repository
```bash
git clone https://github.com/abualfaki/ImpactofCovid-19ontheGenderWageGap.git
cd ImpactofCovid-19ontheGenderWageGap
```
### 2️⃣ Install Required Dependencies
Ensure you have Stata installed for running `.do` files.

### 3️⃣ Run the Stata Script
```stata
do "Scripts/gen wage gap.do"
```

## 🔗 Repository
[GitHub Project Link](https://github.com/abualfaki/ImpactofCovid-19ontheGenderWageGap)

## 📩 Contact
For inquiries or collaborations, reach out to [Abubakar Al-faki](https://github.com/abualfaki).
