# Yandex Afisha: Seasonal Demand & User Behavior Analysis

## Goal
Conduct an exploratory and statistical analysis of ticket booking data from Yandex Afisha, an event discovery and ticketing service, in order to identify seasonal changes in user behavior and event demand in autumn 2024 and support planning for promotional campaigns.

## Tools & Stack
- **Languages:** SQL (PostgreSQL), Python
- **Python Libraries:** pandas, numpy, matplotlib, seaborn, scipy, statsmodels  
- **BI tool:** Yandex DataLens  
- **Format:** SQL scripts + interactive dashboard, Jupyter Notebook

## Data
Anonymized order-level and event-level datasets from Yandex Afisha covering the period from June 1 to October 31, 2024.

## Key Steps
### SQL & dashboarding
1. Aggregation of key product metrics
2. Revenue structure analysis by event type, device, region, partner
3. Weekly dynamics of key business metrics
4. Identification of top regions, events, venues, and partners
5. Dashboard creation in Yandex DataLens: [Key business metrics of Yandex Afisha (June–October 2024)](https://datalens.yandex/tlresw6dxsg2d)

### EDA & hypothesis testing in Python
1. Data preprocessing and feature engineering
2. Exploratory analysis:
     - seasonal dynamics of order volume;
     - distribution of orders by event type, device, and age rating;
     - pricing dynamics (average ticket revenue);
     - daily and weekly user activity patterns;
     - concentration across regions and ticketing partners.
3. Statistical hypothesis testing: comparison of mobile vs. desktop user behavior

## Main Findings

- **Strong seasonality:** Order volume and active users increase steadily from summer to autumn, driven by seasonal demand.
- **Category stability with minor shifts:** Concerts dominate in both seasons (~42% of orders in summer, ~36% in autumn). Theater ranks second and increases its share in autumn, likely reflecting increased demand for indoor events.  
- **Mobile-first behavior:** ~80% of all orders are placed via mobile devices, with no significant seasonal variation.
- **Pricing dynamics:** Average ticket revenue declines across most categories in autumn, while exhibitions and stand-up see price growth, indicating differences in price sensitivity by category.
- **Price-driven order spikes:** Sharp increases in order volume and orders per user occur at the beginning and end of the month, accompanied by lower average ticket prices, suggesting the impact of discounts and promotions.
- **Weekday activity:** Tuesdays show the highest order volume and the lowest average ticket prices, suggesting that demand is largely driven by discounts.
- **High concentration by regions and partners:** Two regions account for ~44% of events and 46% of orders, while six ticketing partners generate ~ 74% of total revenue.
- **Device-related behavioral differences:** Mobile users place more orders on average, with no significant difference in purchase frequency compared to desktop users.

## Recommendations
- **Prioritize mobile:** ~80% of orders and higher per-user activity make mobile the main growth lever.
- **Use concerts and theater as growth drivers:** These categories dominate demand in autumn, but declining prices require careful balance between volume growth and revenue efficiency.
- **Apply category-specific promotion strategies:** Preserve and scale monetization for exhibitions and stand-up; use volume-driven tactics for price-sensitive mass categories.
- **Focus on core regions and partners:** Concentration of demand and revenue makes them the most effective targets for capacity planning and campaign execution.
