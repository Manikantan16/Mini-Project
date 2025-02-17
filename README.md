### Evaluation of Data Analytics Course Sessions - MiniCapstone Project
- Its a Mini Capstone Project to Analyse the Data Analytics Classes.
- Classes commenced on 16th October and ended on 15 Feb so took the insights and visualized the data using different tools such as:<br/> 
  - **MySql**<br/> 
  - **PowerBi Desktop** <br/> 
  - **Python (Jupyter Notebook)** <br/> 
 - Created an excel and drilled down / categorized the classes based on various factors such as:<br/>
     - **Working Days (W)**  - Classes held on regular week days.<br/>
     - **Class Test  (CT)** - Online Tests conducted during the course.<br/>
     - **Weekly Off  (WO)** - Week Ends (2nd,4th Saturday) and all sundays, during which no classes were held.<br/>
     - **Public Holiday (PH)** - Days designated as Public Holidays (Deepawali,Christmas,New Year eve, Pongal).<br/>
     - **Sick Leave  (SL)**  - Instances where classes were cancelled due to trainers illness.<br/>
  - The first 2 categories (W,CT) are considered as **Classes/Class Days**, while the last 3 (WO,PH,SL) are categorized as **No Classes / Non-Class Days**. 
 - **MYSQL**:
      - Created an excel file with 6 sheets and converted it to csv and imported the csv data to Mysql table and wrote query for the displaying the results
      - Log in to Mysql Workbench and Select the Desired Database
      - In the Navigator panel on the left, locate your database and the table into which you want to import the data.
      - Right click tables and select **Table Data Import Wizard**
   
        ![image](https://github.com/user-attachments/assets/1f53b8be-e2c3-4c47-8cd2-25a8082efaa3)

      - Choose Your Excel (or CSV) File
      - In the Import Wizard, a window will pop up asking you to select the file you want to import

        ![image](https://github.com/user-attachments/assets/a19a0e10-d985-4f02-9c25-8c4ba4176962)

      - Select your Excel file (saved as .csv format) and click Open
      - In the Import Wizard, a window will pop up asking you to select the file you want to import
      ![image](https://github.com/user-attachments/assets/3c6daced-4a8b-4990-aec2-dd43cda89e90)
      - Map Columns (if needed)
      - You can match the columns from the CSV to the columns in your MySQL table. Usually, it will auto-detect the columns, but you can manually adjust them if              needed
      - Once you’ve set everything up, click Next and then Finish to start the import process.
      - Once done you can check by executing the below query:<br/>
        SELECT * FROM table_name;
      - In my Case the selected queries are:<br/>
        select * from nit.Da_classes<br/>
        Select * from nit.Day_Type<br/>
        Select distinct Day_Type from  nit.Da_classes<br/>
  
        - Evaluate or Review the Classes held in October 2024. 
        ![image](https://github.com/user-attachments/assets/4baad950-4a0f-4895-affe-01d2380662db)

        - Review/Evaluate the Classes from Oct 16 2024 to 11 Feb 2025
          
        ![image](https://github.com/user-attachments/assets/dfe75bd4-0408-4e63-947b-aa76144b0256)

        - Summarize the classes Based on No Days and Day Types

        ![image](https://github.com/user-attachments/assets/78b29e61-7a72-4cf6-bd05-f7b85db0d382)

        - For example, if we want to view the Class details from 01-Jan-2025 wards, we can use the stored procedure to filter the data accordingly.<br/>
          CALL GetClassDetailsByParams('2025-01-01','','');
          
        ![image](https://github.com/user-attachments/assets/a37db78e-2b40-4356-8102-f5176e08effe)
         
    - **Power-BI**:
      - Imported the csv file and created the insights using measures, cards etc
      - Implemented the Demographics i.e Day Type distribution for the Entire class duration using Clustered Column Chart.
      - Day Type Count by Month wise (Oct - Feb) using Stacked bar chart
      - Breakup of days by Month for entire class using Donut Charts.

        ![DaClass_Analysis](https://github.com/user-attachments/assets/77d408b9-c593-4307-943f-6889da8f0ba9)

      - **Python(Pandas and Matplotlib in JupyterNotebook)**:
        -  using pandas imported the various sheets of excel and used merge functions and showed the results.
        -  using matplotlib implemented few graphs.

- To Conclude, The Data Analytics Class Analysis has been implemented across various applications viz MySQL, Python, and Power BI.


      
