# Identify Unfinished Parts in Tesla's Assembly Process

## **Problem Statement**
Tesla is investigating production bottlenecks and needs to determine which **parts have begun the assembly process but are not yet finished**. A part is considered **unfinished** if it **lacks a `finish_date`**.

## **Table Schema**
### **`parts_assembly` Table:**
| Column Name    | Type      |
|---------------|----------|
| part          | string   |
| finish_date   | datetime |
| assembly_step | integer  |

## **Example Input**
| part   | finish_date         | assembly_step |
|--------|---------------------|--------------|
| battery | 01/22/2022 00:00:00 | 1            |
| battery | 02/22/2022 00:00:00 | 2            |
| battery | 03/22/2022 00:00:00 | 3            |
| bumper  | 01/22/2022 00:00:00 | 1            |
| bumper  | 02/22/2022 00:00:00 | 2            |
| bumper  | NULL                | 3            |
| bumper  | NULL                | 4            |

## **Expected Output**
| part   | assembly_step |
|--------|--------------|
| bumper | 3            |
| bumper | 4            |

## **Explanation**
- The **battery** has finish dates recorded for all its steps, meaning it is **fully assembled**.
- The **bumper** has missing (`NULL`) finish dates for **steps 3 and 4**, meaning those steps are still in progress and **unfinished**.
- Only **unfinished** parts are included in the result.

## **Edge Cases Considered**
- **All parts are finished** → The query should return an **empty result**.
- **Some parts have multiple unfinished steps** → The query should return **all unfinished steps**.
- **New parts entering the assembly process** → These should be included **only if they lack a finish date**.

## **Use Case**
This query helps Tesla identify which parts are stuck in production, enabling **real-time monitoring of assembly progress** and **early identification of bottlenecks**. 🚀
